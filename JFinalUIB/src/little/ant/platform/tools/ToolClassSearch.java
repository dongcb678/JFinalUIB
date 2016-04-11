package little.ant.platform.tools;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import org.apache.log4j.Logger;

import com.jfinal.kit.PropKit;

import little.ant.platform.common.DictKeys;

/**
 * 类文件检索
 * @author 董华健  dongcb678@163.com
 */
public class ToolClassSearch {

	private static final Logger log = Logger.getLogger(ToolClassSearch.class);

	/**
	 * 验证是否子类或者接口
	 * @param target 指定的父类或者接口
	 * @param classFileList 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private <T> List<Class<? extends T>> isAssignableFrom(Class<?> target, List<String> classFileList) {
        List<Class<? extends T>> classList = new ArrayList<Class<? extends T>>();
        for (String classFile : classFileList) {
            Class<?> classInFile = null;
			try {
				classInFile = Class.forName(classFile);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
            //判断target和classInFile是否相同，或是classInFile的子类或接口
            if (target.isAssignableFrom(classInFile) && target != classInFile) {
                classList.add((Class<? extends T>) classInFile);
            }
        }

        return classList;
    }

    /**
     * 递归查找指定包内的.class文件
     * @param dirPath
     * @return
     */
    private List<String> findFiles(String dirPath) {
        List<String> classFiles = new ArrayList<String>();
        
        // 判断目录是否存在
        File baseDir = new File(dirPath);
        if (!baseDir.exists() || !baseDir.isDirectory()) {
            log.error("baseDirName");
            return classFiles;
        } 

        String tempName = null;
        String[] filelist = baseDir.list();
        for (int i = 0; i < filelist.length; i++) {
            File readfile = new File(dirPath + File.separator + filelist[i]);
            if (readfile.isDirectory()) {
                classFiles.addAll(findFiles(dirPath + File.separator + filelist[i]));
            } else {
                tempName = readfile.getName();
                if(!tempName.endsWith(".class")){
                	continue;
                }
                
                String ablPath = readfile.getAbsoluteFile().getAbsolutePath().replace("\\", "/");
                String classFilePath = ablPath.substring(ToolDirFile.getClassesPath().length() + 1, ablPath.indexOf(".class")).replace("/", ".");
                
				List<String> pkgs = scanPkgList();
                for (String pkg : pkgs) {
                	if(classFilePath.startsWith(pkg)){
                		classFiles.add(classFilePath);
                		continue;
                	}
                }
            }
        }
        return classFiles;
    }
    
    /**
     * 查找jar中指定包内的.class文件
     * @return
     */
    private List<String> findJarFiles() {
        List<String> classFiles = new ArrayList<String>();;
        try {
            // jar中文件查找
        	List<String> jarList = scanJarList();
        	int size = jarList.size();
            for (int i = 0; i < size; i++) {
                JarFile jarFile = new JarFile(new File(ToolDirFile.getLibPath() + File.separator + jarList.get(i)));
                Enumeration<JarEntry> entries = jarFile.entries();
                while (entries.hasMoreElements()) {
                    JarEntry jarEntry = entries.nextElement();
                    String entryName = jarEntry.getName();
                    String pkgEntryName = entryName.replaceAll("/", ".");
                    
                    // 去除不需要扫描的包
                    List<String> pkgs = scanPkgList();
                    boolean pkgResult = false;
                    for (String pkg : pkgs) {
                    	if(pkgEntryName.startsWith(pkg)){
                    		pkgResult = true;
                    		break;
                    	}
                    }
                    
                    // 查找.class文件
                    if (!jarEntry.isDirectory() && pkgResult && entryName.endsWith(".class")) {
                        String className = pkgEntryName.substring(0, entryName.length() - 6);
                        classFiles.add(className);
                    }
                }
                jarFile.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return classFiles;
    }

    /**
     * 搜索指定类或者接口的子类
     * @param target 指定类或者接口
     * @return
     */
    public static List<Class<?>> search(Class<?> target){
    	ToolClassSearch cs = new ToolClassSearch();
    	// 1.查找classes目录
    	List<String> classFileList = cs.findFiles(ToolDirFile.getClassesPath());
    	
        // 2.查找lib目录中指定的jar
    	classFileList.addAll(cs.findJarFiles());

        // 3.比对
    	List<Class<?>> list = cs.isAssignableFrom(target, classFileList);
    	return list;
    }
    
    /**
     * 需要扫描的jar
     * @return
     */
    public static List<String> scanJarList(){
		String scan_jar = PropKit.get(DictKeys.config_scan_jar);
		if(null != scan_jar && !scan_jar.isEmpty()){
			List<String> list = new ArrayList<String>();
			String[] jars = scan_jar.split(",");
			for (String jar : jars) {
				list.add(jar.trim());
			}
			return list;
		}
		return new ArrayList<String>();
    }

    /**
     * 需要扫描的包
     * @return
     */
    public static List<String> scanPkgList(){
		String scan_package = PropKit.get(DictKeys.config_scan_package);
		if(null != scan_package && !scan_package.isEmpty()){
			List<String> list = new ArrayList<String>();
			String[] pkgs = scan_package.split(",");
			for (String pkg : pkgs) {
				list.add(pkg.trim());
			}
			return list;
		}
		return new ArrayList<String>();
    }
    
}
