package little.ant.platform.lucene;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.DoubleField;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolHtml;
import little.ant.platform.tools.ToolString;

/**
 * @author 董华健
 * 
 * 公共方法和全局变量
 * 
 * 特别注意：
 * 		在调用读写对象的时候请不要自行关闭对象，多线程安全共享，节省资源
 * 		否则要自行处理锁，且不安全
 */
public abstract class DocBase implements Runnable {
	
	/**
	 * 初始化索引，每批次处理一万行
	 */
	protected static final int splitDataSize = 200;
	
	/**
	 * IKAnalyzer 分词器
	 */
	protected static final Analyzer analyzer = new IKAnalyzer();//分词器
	
	/**
	 * Jcseg 分词器
	 * 
	 * 1.JcsegTaskConfig.COMPLEX_MODE 为复杂模式：
	 * 特点：四种过滤算法。
	 * 
	 * 2.JcsegTaskConfig.SIMPLE_MODE 为简易模式
	 * 特点：只使用了最大化过滤算法，其他的同复杂模式。
	 * 
	*/
	//protected static final Analyzer analyzer = new JcsegAnalyzer5X(JcsegTaskConfig.COMPLEX_MODE);

	/**
	 * 获取索引路径
	 * @return
	 */
	protected abstract String getIndexPath();
	
	/**
	 * 获取索引目录：磁盘
	 * @return
	 */
	protected abstract Directory getDiskDir();
	
	/**
	 * 获取索引读写对象：磁盘
	 * @return
	 */
	protected abstract IndexWriter getDiskIndexWriter();

	/**
	 * 获取索引目录：内存
	 * @return
	 */
	protected abstract Directory getRamDir();

	/**
	 * 获取索引读写对象：内存
	 * @return
	 */
	protected abstract IndexWriter getRamIndexWriter();
	
	/**
	 * 内存索引转磁盘
	 */
	protected abstract void ramToDisk();

	/**
	 * 获取Reader
	 * @return
	 */
	protected abstract IndexReader getReader();

	/**
	 * 获取Searcher
	 * @return
	 */
	protected abstract IndexSearcher getSearcher();
	
	/**
	 * 高亮器
	 * @param query
	 * @return
	 */
	protected Highlighter getHighlighter(Query query) {
		Formatter formatter = new SimpleHTMLFormatter("<font color='red'>", "</font>");
		Scorer scorer = new QueryScorer(query);
		Highlighter highlighter = new Highlighter(formatter, scorer);// 高亮对象
		Fragmenter fragmenter = new SimpleFragmenter(100);// 设置高亮附近的字数
		highlighter.setTextFragmenter(fragmenter);
		return highlighter;
	}

    /**
     * 高亮处理
     * @param analyzer
     * @param highlighter
     * @param doc
     * @param fieldNames
     */
	protected void highlighter(Analyzer analyzer, Highlighter highlighter, Document doc, String[] fieldNames){
    	for (String fieldName : fieldNames) {
    		String fieldNameHig = null;
    		try {
    			fieldNameHig = highlighter.getBestFragment(analyzer, fieldName, doc.get(fieldName));
    		} catch (IOException | InvalidTokenOffsetsException e) {
    			e.printStackTrace();
    		}
    		if(null == fieldNameHig){
    			String fieldNameText = doc.get(fieldName);
    			int max = Math.min(50, fieldNameText.length());
    			fieldNameHig = fieldNameText.substring(0, max);
    		}
    		Field fieldNameField = (Field) doc.getField(fieldName);
    		fieldNameField.setStringValue(fieldNameHig);
		}
    }

	/**
	 * 根据对象属性名称返回lucene对象的Fields
	 * @param fieldNames
	 * @param modelClass
	 * @return
	 */
	protected <T extends BaseModel<?>> List<Field> getFields(String[] fieldNames, Class<T> modelClass){
		List<Field> fields = new LinkedList<Field>();
		int fieldLength = fieldNames.length;
		for (int i = 0; i < fieldLength; i++) {
			String fieldName = fieldNames[i];
			
			Table table = TableMapping.me().getTable(modelClass);
			Class<?> columnType = table.getColumnType(fieldName);
			
			String fieldType = columnType.getSimpleName();
			if(fieldType.equals("long")){
				fields.add(new LongField(fieldName, 0l, Store.YES));
			
			}else if(fieldType.equals("String")){
				fields.add(new TextField(fieldName, "", Store.YES));
			
			}else if(fieldType.equals("Date")){
				fields.add(new LongField(fieldName, 0l, Store.YES));
			
			}else if(fieldType.equals("BigDecimal")){
				fields.add(new DoubleField(fieldName, 0, Store.YES));
			
			}else{
				throw new RuntimeException("DocBase->getFields方法没有解析到有效字段类型");
			}
		}
		return fields;
	}

	/**
	 * 添加Document
	 * @param indexWriter
	 * @param entity
	 * @param doc
	 * @param fields
	 */
	protected <T extends BaseModel<?>> void addDoc(IndexWriter indexWriter, T entity, Document doc, List<Field> fields) {
		docProcess(entity, doc, fields);//封装Document
		
		try {
			indexWriter.addDocument(doc);// Document写入
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新Document
	 * @param indexWriter
	 * @param entity
	 * @param doc
	 * @param fields
	 */
	protected <T extends BaseModel<?>> void updateDoc(IndexWriter indexWriter, T entity, Document doc, List<Field> fields){
		docProcess(entity, doc, fields);//封装Document
		
		try {
			indexWriter.updateDocument(new Term("ids", entity.getPKValue()), doc);// Document更新
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除Document
	 * @param indexWriter
	 * @param ids
	 */
	protected void deleteDoc(IndexWriter indexWriter, String ids){
		try {
			indexWriter.deleteDocuments(new Term("ids", ids));  // Document删除
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 优化：清空deleteDoc，
	 * @param indexWriter
	 */
	protected void deleteClear(IndexWriter indexWriter){
		try {
			//强制优化，del文件就没了，回收站清空
			indexWriter.forceMergeDeletes();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 封装Document
	 * @param model
	 * @param doc
	 * @param fields
	 * @return
	 */
	protected <T extends BaseModel<?>> Document docProcess(T model, Document doc, List<Field> fields){
		// 1.通过反射往Field填充值
		for (Field field : fields) {
			String fieldName = field.name();
			Object fieldValue = model.get(fieldName);
			if(null == fieldValue){
				continue;
			}
			
			String fieldType = ToolString.beanName(fieldValue);
			if(fieldType.equals("long")){
				field.setLongValue((Long) fieldValue);
			
			}else if(fieldType.equals("String")){
				field.setStringValue(ToolHtml.cleanHtml((String) fieldValue)); // 清除HTML标签
			
			}else if(fieldType.equals("Date")){
				field.setLongValue(((Date) fieldValue).getTime());
			
			}else if(fieldType.equals("BigDecimal")){
				field.setDoubleValue(((BigDecimal) fieldValue).doubleValue());
			
			} else {
				throw new RuntimeException("DocBase->fieldsSetValue没有解析到有效字段类型");
			}
		}
		
		// 2.把Field添加到Document
		for (Field field : fields) {
			doc.add(field);
		}
		
		return doc;
	}

	/**
	 * 根据数据量计算分多少次批处理
	 * @param dataSource
	 * @param sql
	 * @param batchSize 每次数据多少条
	 * @return
	 */
	protected int getBatchCount(String dataSource, String sql, int batchSize){
		int count = 0;
		String db_type = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){
			count = Db.use(dataSource).queryLong(" select count(*) " + sql).intValue();
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){
			count = Db.use(dataSource).queryLong(" select count(*) " + sql).intValue();
		
		}else if(db_type.equals(ConstantInit.db_type_oracle)){
			count = Db.use(dataSource).queryBigDecimal(" select count(*) " + sql).intValue();
		}
		
		int batchCount = 0;
		if(count % batchSize == 0){
			batchCount = count / batchSize;
		}else{
			batchCount = count / batchSize + 1;
		}
		return batchCount;
	}
	
}
