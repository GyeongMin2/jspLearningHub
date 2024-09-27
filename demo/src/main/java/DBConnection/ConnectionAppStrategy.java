package DBConnection;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionAppStrategy implements ConnectionStrategy {
    ServletContext application;
    String dbType;
    String driver;
    String url;
    String username;
    String password;
//        <context-param>
//        <param-name>MySqlDBType</param-name>
//        <param-value>mysql</param-value>
//    </context-param>
//    <context-param>
//        <param-name>MySqlDriver</param-name>
//        <param-value>com.mysql.cj.jdbc.Driver</param-value>
//    </context-param>
//    <context-param>
//        <param-name>MySqlURL</param-name>
//        <param-value>jdbc:mysql://localhost:3306/fullstack7</param-value>
//    </context-param>
//    <context-param>
//        <param-name>MySqlUserName</param-name>
//        <param-value>root</param-value>
//    </context-param>
//    <context-param>
//        <param-name>MySqlPWD</param-name>
//        <param-value>kgm101</param-value>
//    </context-param>

    public ConnectionAppStrategy(HttpServletRequest request, HttpServletResponse response) {
        String dbType = application.getInitParameter("MySqlDBType");
        String driver = application.getInitParameter("MySqlDriver");
        String url = application.getInitParameter("MySqlURL");
        String username = application.getInitParameter("MySqlUserName");
        String password = application.getInitParameter("MySqlPWD");
    }

    @Override
    public Connection connect() throws SQLException {
        return DriverManager.getConnection("");
    }
}
