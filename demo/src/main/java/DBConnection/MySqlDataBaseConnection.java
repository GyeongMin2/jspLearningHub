package DBConnection;

public class MySqlDataBaseConnection implements DbInfo {
    private final String JDBC_URL;
    private final String DBTYPE;
    private final String USERNAME;
    private final String PASSWORD;

    //
//    com.mysql.cj.jdbc.Driver
//    jdbc:mysql://localhost:3306/fullstack7
//    root
//    kgm101
    // db정보는 여기서 입력
    public MySqlDataBaseConnection() {
        this.DBTYPE = "mysql";
        this.JDBC_URL = "jdbc:mysql://localhost:3306/fullstack7";
        this.USERNAME = "root";
        this.PASSWORD = "kgm101";
    }

//    public MySqlDataBaseConnection(ServletContext servletContext) {
//        this.DBTYPE = servletContext.getInitParameter("DBTYPE");
//        this.JDBC_URL = servletContext.getInitParameter("JDBC_URL");
//        this.USERNAME = servletContext.getInitParameter("USERNAME");
//        this.PASSWORD = servletContext.getInitParameter("PASSWORD");
//    }

    @Override
    public String getUrl() {
        return JDBC_URL;
    }

    @Override
    public String getUsername() {
        return USERNAME;
    }

    @Override
    public String getPassword() {
        return PASSWORD;
    }

}