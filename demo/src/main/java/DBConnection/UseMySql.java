package DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UseMySql {
    private DbConnection db = DbConnection.getInstance(
            "mysql",
            "jdbc:mysql://localhost:3306/fullstack7",
            "root",
            "kgm101");
    private Connection con = db.connect();

    public Connection getCon() {
        return con;
    }
}
