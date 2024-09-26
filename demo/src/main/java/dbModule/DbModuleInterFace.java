package dbModule;

import java.util.List;
import java.util.Map;

public interface DbModuleInterFace {
    List<Map<String, Object>> getQueryResultList(String sql, String[] parameter);

    List<Map<String, Object>> getQueryResultList(String sql);

    //리턴 int임

    int insertQuery(String sql, String[] parameter);

    int insertQuery(String sql);

    int updateQuery(String sql, String[] parameter);

    int updateQuery(String sql);

    int deleteQuery(String sql, String[] parameter);

    int deleteQuery(String sql);
}
