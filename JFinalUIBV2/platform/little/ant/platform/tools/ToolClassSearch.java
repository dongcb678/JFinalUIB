package little.ant.platform.tools;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import com.jfinal.kit.PathKit;
import com.jfinal.log.Logger;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.plugin.PropertiesPlugin;

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
     * classes目录
     */
    private String classesPath;
    
    /**
     * lib目录
     */
    private String libPath;
    
	/**
	 * 是否扫描lib目录的jar
	 */
    private boolean scanJars;
    
    /**
     * 扫描指定的jar文件
     */
    private List<String> jarsList;
    
	public void setScanJars(boolean scanJars) {
		this.scanJars = scanJars;
	}

	public void setJarsList(List<String> jarsList) {
		this.jarsList = jarsList;
	}

	public void setClassesPath(String classesPath) {
		this.classesPath = classesPath;
	}

	public void setLibPath(String libPath) {
		this.libPath = libPath;
	}

	public void setTarget(Class<?> target) {
		this.target = target;
	}
	
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
                String classFilePath = ablPath.substring(classesPath.length() + 1, ablPath.indexOf(".class")).replace("/", ".");
                
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
    private List<String> findJarFiles() {
        List<String> classFiles = new ArrayList<String>();;
        try {
            // 判断目录是否存在
            File baseDir = new File(libPath);
            if (!baseDir.exists() || !baseDir.isDirectory()) {
            	log.error("baseDirName");
                return classFiles;
            } 
        
            String[] filelist = baseDir.list(new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    return scanJars || jarsList.contains(name);
                }
            });
            
            for (int i = 0; i < filelist.length; i++) {
                JarFile jarFile = new JarFile(new File(libPath + File.separator + filelist[i]));
                Enumeration<JarEntry> entries = jarFile.entries();
                while (entries.hasMoreElements()) {
                    JarEntry jarEntry = entries.nextElement();
                    String entryName = jarEntry.getName();
                    if (!jarEntry.isDirectory() && entryName.endsWith(".class")) {
                        String className = entryName.replaceAll("/", ".").substring(0, entryName.length() - 6);
                        
                        @SuppressWarnings("unchecked")
                        List<String> pkgs = (List<String>) PropertiesPlugin.getParamMapValue(ConstantInit.config_scan_package);
                        for (String pkg : pkgs) {
                        	if(className.startsWith(pkg)){
                        		classFiles.add(className);
                        		continue;
                        	}
                        }
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
     * 搜索指定类的子类
     * @param target
     * @param jarsList
     * @return
     */
    public static List<Class<?>> search(Class<?> target, List<String> jarsList){
    	ToolClassSearch cs = new ToolClassSearch();
    	cs.setClassesPath(PathKit.getRootClassPath());
    	cs.target = target;

    	List<String> classFileList = cs.findFiles(cs.classesPath);
        
    	if(jarsList != null && jarsList.size() != 0){
        	cs.setLibPath(PathKit.getWebRootPath() + File.separator + "WEB-INF" + File.separator + "lib");
    		cs.scanJars = true;
        	cs.jarsList = jarsList;
        	classFileList.addAll(cs.findJarFiles());
    	}
    	
    	List<Class<?>> list = cs.isAssignableFrom(classFileList);
    	return list;
    }
    
}
