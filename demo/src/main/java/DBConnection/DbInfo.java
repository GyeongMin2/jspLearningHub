package DBConnection;

public interface DbInfo {
    abstract String getUrl();

    abstract String getUsername();

    abstract String getPassword();
}
