package little.ant.platform.plugin;

import little.ant.platform.tools.ToolSqlXml;

import com.jfinal.plugin.IPlugin;

public class SqlXmlPlugin implements IPlugin {

    public SqlXmlPlugin() {
    }

    @Override
    public boolean start() {
        ToolSqlXml.init(true);
        return true;
    }

    @Override
    public boolean stop() {
        ToolSqlXml.destory();
        return true;
    }

}
