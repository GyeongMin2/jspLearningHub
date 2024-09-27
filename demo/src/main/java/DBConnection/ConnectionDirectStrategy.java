package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDirectStrategy implements ConnectionStrategy {
    private DbInfo dbInfo;

    public ConnectionDirectStrategy(DbInfo dbInfo) {
        this.dbInfo = dbInfo;
    }

    @Override
    public Connection connect() throws SQLException {
        return DriverManager.getConnection(dbInfo.getUrl(), dbInfo.getUsername(), dbInfo.getPassword());
    }
}
