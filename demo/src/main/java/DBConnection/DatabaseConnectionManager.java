package DBConnection;

import java.sql.Connection;

public class DatabaseConnectionManager implements AutoCloseable {
    private static DatabaseConnectionManager instance;
    private Connection connection;
    private DbInfo dbInfo;
    private ConnectionStrategy connectionStrategy;

    private DatabaseConnectionManager(DbInfo dbInfo, ConnectionStrategy connectionStrategy) {
        this.dbInfo = dbInfo;
        this.connectionStrategy = connectionStrategy;
    }

    //인스턴스
    public static DatabaseConnectionManager getInstance(String dbType, boolean useConnectionPool) {
        if (instance == null) {
            DbInfo dbInfo = DbConnectionFactory.createDbInfo(dbType);

            ConnectionStrategy strategy = useConnectionPool ? new ConnectionPoolStrategy() : new ConnectionDirectStrategy(dbInfo);

            instance = new DatabaseConnectionManager(dbInfo, strategy);
        }
        return instance;
    }

    public Connection connect() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = connectionStrategy.connect();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    //자동닫기
    @Override
    public void close() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
