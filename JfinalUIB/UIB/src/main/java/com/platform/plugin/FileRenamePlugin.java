package com.platform.plugin;

import java.io.File;

import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;
import com.jfinal.upload.OreillyCos;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.platform.tools.ToolRandoms;

/**
 * 配置文件上传命名策略
 */
public class FileRenamePlugin implements IPlugin {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(FileRenamePlugin.class);

	@Override
	public boolean start() {
		OreillyCos.setFileRenamePolicy(new FileRenamePolicy() {
			@Override
			public File rename(File file) {
				String ext = "";   
		        int pot = file.getName().lastIndexOf(".");   
		        if(pot != -1){   
		        	ext = file.getName().substring(pot);   
		        }
		        String newName = ToolRandoms.getUuid(true) + ext;   
		        file = new File(file.getParent(), newName);   
		        return file;
			}
		});
		
		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}
	
}
