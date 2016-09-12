package com.platform.tools;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import org.apache.log4j.Logger;

import com.jfinal.kit.PropKit;
import com.platform.constant.ConstantInit;

/**
 * 类文件检索
 * @author 董华健  dongcb678@163.com
 */
public abstract class ToolClassSearch {

	private static final Logger log = Logger.getLogger(ToolClassSearch.class);

	/**
	 * 需要扫描的jar
	 */
	private static final List<String> scanJarList = new ArrayList<String>();
	
	/**
	 * 需要扫描的包
	 */
	private static final List<String> scanPkgList = new ArrayList<String>();
	
	static {
		String scan_jar = PropKit.get(ConstantInit.config_scan_jar);
		if(null != scan_jar && !scan_jar.isEmpty()){
			String[] jars = scan_jar.split(",");
			for (String jar : jars) {
				scanJarList.add(jar.trim());
			}
		}
		
		String scan_package = PropKit.get(ConstantInit.config_scan_package);
		if(null != scan_package && !scan_package.isEmpty()){
			String[] pkgs = scan_package.split(",");
			for (String pkg : pkgs) {
				scanPkgList.add(pkg.trim());
			}
		}
	}
	
	/**
	 * 获取需要扫描的jar
	 * @return
	 */
	public static List<String> getScanJarList(){
		return scanJarList;
	}

	/**
	 * 需要扫描的包
	 * @return
	 */
	public static List<String> getScanPkgList(){
		return scanPkgList;
	}

    /**
     * 搜索指定类或者接口的子类
     * @param target 指定类或者接口
     * @return
     */
    public static List<Class<?>> search(Class<?> target){
    	// 1.查找classes目录
    	List<String> classFileList = findFiles(ToolDirFile.getClassesPath());
    	
        // 2.查找lib目录中指定的jar
    	classFileList.addAll(findJarFiles());

        // 3.比对
    	List<Class<?>> list = isAssignableFrom(target, classFileList);
    	
    	return list;
    }
    
	/**
	 * 验证是否子类或者接口
	 * @param target 指定的父类或者接口
	 * @param classFileList 
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	private static <T> List<Class<? extends T>> isAssignableFrom(Class<?> target, List<String> classFileList) {
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
     * 查找classes文件夹内的.class文件
     * @param dirPath
     * @return
     */
    private static List<String> findFiles(String dirPath) {
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
                
                for (String pkg : scanPkgList) {
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
     * 查找lib目录jar中.class文件
     * @return
     */
    private static List<String> findJarFiles() {
        List<String> classFiles = new ArrayList<String>();;
        try {
            // jar中文件查找
        	int size = scanJarList.size();
            for (int i = 0; i < size; i++) {
                JarFile jarFile = new JarFile(new File(ToolDirFile.getLibPath() + File.separator + scanJarList.get(i)));
                Enumeration<JarEntry> entries = jarFile.entries();
                while (entries.hasMoreElements()) {
                    JarEntry jarEntry = entries.nextElement();
                    String entryName = jarEntry.getName();
                    String pkgEntryName = entryName.replaceAll("/", ".");
                    
                    // 去除不需要扫描的包
                    boolean pkgResult = false;
                    for (String pkg : scanPkgList) {
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

}
