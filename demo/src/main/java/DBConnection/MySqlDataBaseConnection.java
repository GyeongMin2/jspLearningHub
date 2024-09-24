package DBConnection;

public class MySqlDataBaseConnection implements DbInfo {
    //    public DataBaseConnection() {
//    }
    private static String JDBC_URL = null;
    private static String USERNAME = null;
    private static String PASSWORD = null;

    MySqlDataBaseConnection(String url, String username, String password) {
        this.JDBC_URL = url;
        this.USERNAME = username;
        this.PASSWORD = password;
    }

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
