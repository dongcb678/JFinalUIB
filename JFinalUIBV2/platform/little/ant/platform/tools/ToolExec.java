package little.ant.platform.tools;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.apache.commons.io.output.ByteArrayOutputStream;

import com.jfinal.log.Logger;

/**
 * aapache-common-exec 示例
 */
public class ToolExec {

    protected static final Logger log = Logger.getLogger(ToolExec.class);

	public static String ping(String ip) {  
		  
        try {  
  
            String command = "ping "+ip;  
  
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();  
  
            ByteArrayOutputStream errorStream = new ByteArrayOutputStream();  
  
            CommandLine commandline = CommandLine.parse(command);  
  
            DefaultExecutor exec = new DefaultExecutor();  
  
            exec.setExitValues(null);  
  
            PumpStreamHandler streamHandler = new PumpStreamHandler(outputStream,errorStream);  
  
            exec.setStreamHandler(streamHandler);  
  
            exec.execute(commandline);  
  
            String out = outputStream.toString("gbk");  
  
            String error = errorStream.toString("gbk");  
  
            return out+error;  
  
        } catch (Exception e) {  
  
            log.error("ping task failed.",e);  
  
            return e.toString();  
  
        }  
  
    }  
	
	public static void main(String[] args) {
		System.out.println(ping("127.0.0.1"));
	}

}
