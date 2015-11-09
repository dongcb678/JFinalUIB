package com.platform.tools;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import com.jfinal.log.Logger;
import com.platform.constant.ConstantInit;
import com.platform.plugin.PropertiesPlugin;

/**
 * 类文件检索
 * @author 董华健  dongcb678@163.com
 */
public class ToolClassSearch {

	private static final Logger log = Logger.getLogger(ToolClassSearch.class);

    /**
     * 指定的父类或者接口
     */
    private Class<?> target;

	/**
	 * 验证是否子类或者接口
	 * @param classFileList
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private <T> List<Class<? extends T>> isAssignableFrom(List<String> classFileList) {
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
                
                @SuppressWarnings("unchecked")
				List<String> pkgs = (List<String>) PropertiesPlugin.getParamMapValue(ConstantInit.config_scan_package);
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
    @SuppressWarnings("unchecked")
    private List<String> findJarFiles() {
        List<String> classFiles = new ArrayList<String>();;
        try {
            // jar中文件查找
        	List<String> jarList = (List<String>) PropertiesPlugin.getParamMapValue(ConstantInit.config_scan_jar);
        	int size = jarList.size();
            for (int i = 0; i < size; i++) {
                JarFile jarFile = new JarFile(new File(ToolDirFile.getLibPath() + File.separator + jarList.get(i)));
                Enumeration<JarEntry> entries = jarFile.entries();
                while (entries.hasMoreElements()) {
                    JarEntry jarEntry = entries.nextElement();
                    String entryName = jarEntry.getName();
                    String pkgEntryName = entryName.replaceAll("/", ".");
                    
                    // 去除不需要扫描的包
                    List<String> pkgs = (List<String>) PropertiesPlugin.getParamMapValue(ConstantInit.config_scan_package);
                    boolean pkgResult = false;
                    for (String pkg : pkgs) {
                    	if(pkgEntryName.startsWith(pkg)){
                    		pkgResult = false;
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
     * @param target
     * @return
     */
    public static List<Class<?>> search(Class<?> target){
    	ToolClassSearch cs = new ToolClassSearch();
    	// 1.指定类或者接口
    	cs.target = target;
    	
    	// 2.查找classes目录
    	List<String> classFileList = cs.findFiles(ToolDirFile.getClassesPath());
    	
        // 3.查找lib目录中指定的jar
    	classFileList.addAll(cs.findJarFiles());
    	
    	List<Class<?>> list = cs.isAssignableFrom(classFileList);
    	return list;
    }
    
}
