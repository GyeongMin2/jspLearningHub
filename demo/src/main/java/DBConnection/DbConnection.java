package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/fullstack7";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "kgm101";

    //Statement
    //PreparedStatement
    //ResultSet
    //Connection

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // db연결
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            System.out.println("connection established");
        } catch (SQLException | ClassNotFoundException e) {
            //안되면
            System.out.println("connection problem" + e.getMessage());
        }
        return connection;
    }

}
