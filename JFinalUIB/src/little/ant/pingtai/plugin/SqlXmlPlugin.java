package little.ant.pingtai.plugin;

import little.ant.pingtai.tools.ToolSqlXml;

import com.jfinal.plugin.IPlugin;

public class SqlXmlPlugin implements IPlugin {

    public SqlXmlPlugin() {
    }

    @Override
    public boolean start() {
        ToolSqlXml.init();
        return true;
    }

    @Override
    public boolean stop() {
        ToolSqlXml.destory();
        return true;
    }

}
