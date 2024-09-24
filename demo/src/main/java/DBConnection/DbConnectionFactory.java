package DBConnection;

public class DbConnectionFactory {
    public static DbInfo createDbInfo(String dbType, String url, String username, String password) {
        try {
            if ("mysql".equalsIgnoreCase(dbType)) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                return new MySqlDataBaseConnection(url, username, password);
            } else if ("oracle".equalsIgnoreCase(dbType)) {
                //예시는 오라클인데 다른 db를 dbtype으로 받으면 이런식으로 만들면될듯
                //드라이버 설정 필요 Class.forName(~~);
                return null;
            } else if ("엠에스에스큐엘".equals(dbType)) {
                //ㅋㅋ
                return null;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return null;
    }
}
