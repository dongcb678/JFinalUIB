package little.ant.platform.plugin;

import java.net.UnknownHostException;

import little.ant.platform.tools.ToolMongo;

import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;
import com.mongodb.MongoClient;

/**
 * 初始化Mongodb连接信息
 * @author 董华健
 */
public class MongodbPlugin implements IPlugin {
    
    protected final Logger logger = Logger.getLogger(getClass());

    private MongoClient client;
    private String host;
    private int port;
    private String database;

    public MongodbPlugin(String host, int port, String database) {
        this.host = host;
        this.port = port;
        this.database = database;
    }

    @Override
    public boolean start() {
        try {
            client = new MongoClient(host, port);
        } catch (UnknownHostException e) {
            throw new RuntimeException("can't connect mongodb, please check the host and port:" + host + "," + port, e);
        }

        ToolMongo.init(client, database);
        return true;
    }

    @Override
    public boolean stop() {
        if (client != null) {
            client.close();
        }
        return true;
    }

}
