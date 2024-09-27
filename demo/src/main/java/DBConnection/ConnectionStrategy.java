package DBConnection;

import java.sql.Connection;

public interface ConnectionStrategy {
    Connection connect() throws Exception;
}
