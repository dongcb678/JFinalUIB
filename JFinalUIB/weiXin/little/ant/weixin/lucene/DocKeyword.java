package little.ant.weixin.lucene;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.lucene.DocBase;
import little.ant.pingtai.tools.ToolOS;
import little.ant.weixin.model.Keyword;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.SortField.Type;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.TopFieldCollector;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.IOContext;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.util.Version;

import com.jfinal.kit.PathKit;

/**
 * 自动回复
 * @author 董华健
 */
public class DocKeyword extends DocBase {

	private static String indexPath;
	
	private static Directory diskDir;
	private static IndexWriter diskIndexWriter;
	
	private static Directory ramDir;
	private static IndexWriter ramIndexWriter;
	
	private static IndexReader reader;
	private static IndexSearcher searcher;
	
	//需要索引的字段
	private static final String[] fieldNames = { 
		"ids", "question", "questionkey", "answer"
	};
	
	@Override
	public void run() {
		indexAllKeyword();
	}

	/**
	 * 索引全部
	 * @author 董华健 
	 */
	private void indexAllKeyword() {
		List<Field> fields = getFields(fieldNames, Keyword.class);
		Document document = new Document();
		
		int batchCount = getBatchCount(" from wx_keyword ", splitDataSize);
		String sql = " select * from wx_keyword limit ? offset ? ";

		for (int i = 0; i < batchCount; i++) {
			IndexWriter ramIndexWriter = getRamIndexWriter();//调用RAM写
			List<Keyword> list = Keyword.dao.find(sql, DocBase.splitDataSize, i * DocBase.splitDataSize);
			for (Keyword keyword : list) {
				addDoc(ramIndexWriter, keyword, document, fields);
			}
			ramToDisk();//把RAM写同步更新到DISK
		}
	}
	
	/**
	 * 添加
	 * @param keyword
	 */
	public void add(Keyword keyword) {
		IndexWriter diskIndexWriter = getDiskIndexWriter();//调用Disk写
		Document document = new Document();
		List<Field> fields = getFields(fieldNames, Keyword.class);
		addDoc(diskIndexWriter, keyword, document, fields);
		try {
			diskIndexWriter.forceMerge(1);
			diskIndexWriter.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		ramToDisk();//把RAM写同步更新到DISK
	}
	
	/**
	 * 更新
	 * @param keyword
	 */
	public void update(Keyword keyword){
		IndexWriter diskIndexWriter = getDiskIndexWriter();//调用Disk写
		Document document = new Document();
		List<Field> fields = getFields(fieldNames, Keyword.class);
		updateDoc(diskIndexWriter, keyword, document, fields);
		try {
			diskIndexWriter.forceMerge(1);
			diskIndexWriter.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		IndexWriter diskIndexWriter = getDiskIndexWriter();//调用Disk写
		deleteDoc(diskIndexWriter, ids);
	}
	
	/**
	 * 搜索
	 * @param searchKeyWords 查询关键字
	 * @return
	 */
	public Keyword search(String searchKeyWords){
		Keyword keyword = new Keyword();
        try {
    		String[] queryFields = new String[]{"question", "questionkey"};
    		
    		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_4_9, queryFields, analyzer);
            queryParser.setDefaultOperator(QueryParser.AND_OPERATOR);
            
        	Query query = queryParser.parse(searchKeyWords);
            
        	searcher = getSearcher();
			TopDocs topDocs = searcher.search(query, 1);
			
            int length = topDocs.totalHits;//当前页有多少条记录
            if(length > 0){
            	ScoreDoc[] scoreDocs = topDocs.scoreDocs;
            	Document doc = searcher.doc(scoreDocs[0].doc);
            	keyword.set("ids", doc.get("ids"));
            	keyword.set("question", doc.get("question"));
            	keyword.set("questionkey", doc.get("questionkey"));
            	keyword.set("answer", doc.get("answer"));
            }
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
        return keyword;
	}
	
	/**
	 * 分页搜索
	 * @param splitPage
	 */
	public void search(SplitPage splitPage){
        try {
        	Map<String, String> queryParam = splitPage.getQueryParam(); 
    		String searchKeyWords = queryParam.get("searchKeyWords");//查询关键字
    		if(searchKeyWords != null && !searchKeyWords.isEmpty()){
    			String[] queryFields = new String[]{"question", "questionkey", "answer"};
        		
        		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_4_9, queryFields, analyzer);
                queryParser.setDefaultOperator(QueryParser.AND_OPERATOR);
                
            	org.apache.lucene.search.Query query = queryParser.parse(searchKeyWords);
            	
            	Sort sort = new Sort(new SortField("createdDate", Type.LONG, true));//true为降序排列
            	TopFieldCollector results = TopFieldCollector.create(sort, 1000, false, false, false, false);
                //TopScoreDocCollector results = TopScoreDocCollector.create(1000, true);//收集1000条数据，限制查询结果的条目
            	
            	getSearcher().search(query, results);
                //TopDocs topDocs = getSearcher().search(query, 10000, sort);
    			
            	int maxResult = splitPage.getPageSize();// 抓取数
            	int currentPage = splitPage.getPageNumber();// 当前页数
            	int firstResult = (currentPage - 1) == 0 ? 0 : (currentPage - 1) * maxResult;// 开始处
        		
                TopDocs topDocs = results.topDocs(Integer.parseInt(String.valueOf(firstResult)), Integer.parseInt(String.valueOf(maxResult)));//从第几条开始，加载多少条数据
                ScoreDoc[] scoreDocs = topDocs.scoreDocs;//当前页数据 
                int length = scoreDocs.length;//当前页有多少条记录

                Highlighter highlighter = getHighlighter(query);//高亮处理器
            	List<Keyword> keywordList = new ArrayList<Keyword>();
            	
            	Keyword keyword = null;
                for (int i = 0; i < length; i++) {
                	Document doc = searcher.doc(scoreDocs[i].doc);
                	highlighter(analyzer, highlighter, doc, queryFields);
                	
                	keyword = new Keyword();
                	keyword.set("ids", doc.get("ids"));
                	keyword.set("question", doc.get("question"));
                	keyword.set("questionkey", doc.get("questionkey"));
                	keyword.set("answer", doc.get("answer"));
                	
                	keywordList.add(keyword);
                	keyword = null;
                }
                splitPage.setList(keywordList);// 记录集
                
                TopDocs tsCount= searcher.search(query, Integer.MAX_VALUE);
                splitPage.setTotalRow(tsCount.totalHits);// 记录总数
    		}
    		
            splitPage.compute();// 计算
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	protected String getIndexPath(){
		if(null == indexPath){
			String path = ToolOS.getOsPathType();
			StringBuilder sb = new StringBuilder();
			sb.append(PathKit.getWebRootPath()).append(path);
			sb.append("WEB-INF").append(path).append("lucene").append(path);
			sb.append("weiXin").append(path).append("keyword");//索引目录
			indexPath = sb.toString();
		}
		return indexPath;
	}
	
	@Override
	protected Directory getDiskDir() {
		try {
			if (null == diskDir) {
				diskDir = FSDirectory.open(new File(getIndexPath()));
			}
			return diskDir;
		} catch (Exception e) {
			throw new RuntimeException("创建getDiskDir异常!!!" + getIndexPath());
		}
	}

	@Override
	protected IndexWriter getDiskIndexWriter() {
		try {
			if (null == diskDir) {
				getDiskDir();
			}
			if (null == diskIndexWriter) {
				IndexWriterConfig indexWriterConfig = new IndexWriterConfig(Version.LUCENE_4_9, analyzer);// 索引分词配置
				indexWriterConfig.setOpenMode(OpenMode.CREATE);//
				diskIndexWriter = new IndexWriter(diskDir, indexWriterConfig);
			}
			return diskIndexWriter;
		} catch (Exception e) {
			throw new RuntimeException("创建getDiskIndexWriter异常!!!" + getIndexPath());
		}
	}

	@Override
	protected Directory getRamDir() {
		try {
			if (null == diskIndexWriter) {
				getDiskIndexWriter();
			}
			if (null == ramDir){
				ramDir = new RAMDirectory(diskDir, new IOContext());
			}
			return ramDir;
		} catch (Exception e) {
			throw new RuntimeException("创建==getRamDir异常!!!" + getIndexPath());
		}
	}

	@Override
	protected IndexWriter getRamIndexWriter() {
		try {
			if(null == ramDir){
				getRamDir();
			}
			if(null == ramIndexWriter){
				IndexWriterConfig ramConfig = new IndexWriterConfig(Version.LUCENE_4_9, analyzer);
				ramConfig.setOpenMode(OpenMode.CREATE);//
				ramIndexWriter = new IndexWriter(ramDir, ramConfig);
			}
			return ramIndexWriter;
		} catch (Exception e) {
			throw new RuntimeException("创建==getRamIndexWriter异常!!!" + getIndexPath());
		}
	}

	@Override
	protected IndexReader getReader() {
		try {
			if(null == diskDir){
				getDiskDir();
			}
			if(null == reader){
				reader = DirectoryReader.open(diskDir);// 查询目标DISK：diskDir，RAM：ramDir
			}
			return reader;
		} catch (Exception e) {
			throw new RuntimeException("获取==getReader异常!!!");
		}
	}

	@Override
	protected IndexSearcher getSearcher() {
		try {
			if(null == ramDir){
				getRamDir();
			}
			if(null == reader){
				getReader();
			}
			if(null == searcher){
				searcher = new IndexSearcher(reader);
			}
			return searcher;
		} catch (Exception e) {
			throw new RuntimeException("获取==getSearcher异常!!!");
		}
	}

	/**
	 * 将RAM保存到DISK
	 * @author 董华健    2012-11-21 下午8:28:37
	 */
	protected void ramToDisk(){
		try {
			// 1.先关闭内存读写
			ramIndexWriter.close();
			ramIndexWriter = null;
			// 2.添加内存目录内容到磁盘读写
			diskIndexWriter.addIndexes(ramDir);
			// 3.保存提交
			diskIndexWriter.forceMerge(1);//对索引文件进行优化，从而减少IO操作  
			diskIndexWriter.commit();  
		} catch (Exception e) {
			throw new RuntimeException("将==RAM保存到DISK异常!!!");
		}
	}
	
	/**
	 * 释放资源
	 * 
	 * @author 董华健    2012-11-21 下午8:03:50
	 * @param diskIndexWriter
	 * @param diskDir
	 */
	public void close() {
		if(null != searcher){
			searcher = null;
		}
		if(null != reader){
			try {
				reader.close();
				reader = null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(null != ramIndexWriter){
			try {
				ramIndexWriter.close();
				ramIndexWriter = null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(null != ramDir){
			try {
				ramDir.close();
				ramDir = null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (null != diskIndexWriter) {
			try {
				diskIndexWriter.close();
				diskIndexWriter = null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (null != diskDir) {
			try {
				diskDir.close();
				diskDir = null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
