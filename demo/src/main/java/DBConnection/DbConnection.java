package DBConnection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DbConnection implements AutoCloseable {
    private static DbConnection instance;
    private Connection connection;
    private DbInfo dbInfo;

    private DbConnection() {
        //커넥션풀 사용
    }

    private DbConnection(DbInfo dbInfo) {
        this.dbInfo = dbInfo;
    }

    //싱글톤연습
    //한개의 인스턴스만 만들 수 있도록 하는거임 위에보면 생성자가 프라이빗이라 이 메서드로만 객체 생성가능
    public static DbConnection getInstance(String dbType) {
        if (instance == null) {
            DbInfo dbInfo = DbConnectionFactory.createDbInfo(dbType);
            instance = new DbConnection(dbInfo);
        }
        return instance;
    }


    //connectionPool 은 지금 설정파일에 mysql만 있어서 그거밖에 못씀 ㅅㄱ
    //리턴타입 connection
    public Connection connectWithConnectionPool() {
        try {
            if (connection == null || connection.isClosed()) {
                Context initContext = new InitialContext();
                DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/fullstack7");
                connection = ds.getConnection();
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //connectDirect 는 dbType 받아서 만들어야함
    //리턴타입 connection
    public Connection connectDirect() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(dbInfo.getUrl(), dbInfo.getUsername(), dbInfo.getPassword());
//                System.out.println(dbInfo.getDbType() + ": dbType");
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
//                System.out.println("connection closed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
