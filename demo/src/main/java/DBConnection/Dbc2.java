package DBConnection;

import java.sql.*;

public class Dbc2 {
    public Connection con;
    public Statement stmt;
    public PreparedStatement pstm;
    public ResultSet rs;

    public Dbc2() {
        try {
            //JDBC드라이버를 로딩
            Class.forName("org.mariadb.jdbc.Driver");
            //DB에 연결
            String url = "jdbc:mariadb://localhost:3306/fullstack7";
            String id = "root";
            String pwd = "kgm101";
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("db connection established");
        } catch (Exception e) {
            System.out.println("db connection error");
        }

    }
}
