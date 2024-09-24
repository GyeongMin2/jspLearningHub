package DBConnection;

import java.sql.*;

//난 MySql 밖에 없어서 MySql 만 구현함
public class DbConnection {
    private static DbConnection instance;
    private DbInfo dbInfo;

    public Connection con; // Connection 객체
    public Statement stmt; // Statement 객체
    public PreparedStatement pstm; // PreparedStatement 객체
    public ResultSet rs; // ResultSet 객체

    private DbConnection(DbInfo dbInfo) {
        this.dbInfo = dbInfo;
    }

    //싱글톤연습
    public static DbConnection getInstance(String dbType, String url, String username, String password) {
        if (instance == null) {
            DbInfo dbInfo = DbConnectionFactory.createDbInfo(dbType, url, username, password);
            instance = new DbConnection(dbInfo);
        }
        return instance;
    }

    public Connection connect() {
        try {
            con = DriverManager.getConnection(dbInfo.getUrl(), dbInfo.getUsername(), dbInfo.getPassword());
            System.out.println("Connection established");
        } catch (SQLException e) {
            System.out.println("Connection problem: " + e.getMessage());
        }
        return con;
    }

    public Statement createStatement() {
        try {
            if (con != null) {
                stmt = con.createStatement();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }

    public PreparedStatement prepareStatement(String sql) {
        try {
            if (con != null) {
                pstm = con.prepareStatement(sql);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pstm;
    }
}
