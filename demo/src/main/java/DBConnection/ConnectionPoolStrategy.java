package DBConnection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class ConnectionPoolStrategy implements ConnectionStrategy {
    @Override
    public Connection connect() {
        try {
            Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/fullstack7");
            return ds.getConnection();
        } catch (Exception e) {
            System.out.println("ConnectionPoolStrategy Exception : " + e.getMessage());
            return null;
        }
    }
}
