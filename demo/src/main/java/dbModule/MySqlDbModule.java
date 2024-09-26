package dbModule;

import java.sql.*;
import java.util.*;

import DBConnection.DbConnection;

public class MySqlDbModule implements DbModuleInterFace, AutoCloseable {
    private Connection connection;
    private DbConnection dbConnection;

    // 기본 생성자: 커넥션 풀을 사용하는 경우
    public MySqlDbModule() throws SQLException {
        this.dbConnection = DbConnection.getInstance("mysql"); // 싱글톤 인스턴스 가져오기
        this.connection = dbConnection.connectWithConnectionPool();
    }

    // 직접 연결을 사용하는 생성자
    public MySqlDbModule(boolean directConnection) throws SQLException {
        this.dbConnection = DbConnection.getInstance("mysql"); // 싱글톤 인스턴스 가져오기
        if (directConnection) {
            this.connection = dbConnection.connectDirect();
        } else {
            this.connection = dbConnection.connectWithConnectionPool();
        }
    }

    @Override
    public List<Map<String, Object>> getQueryResultList(String sql, String[] parameter) {
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            for (int i = 0; i < parameter.length; i++) {
                pstmt.setString(i + 1, parameter[i]);
            }
            try (ResultSet rs = pstmt.executeQuery()) {
                return getResultList(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> getQueryResultList(String sql) {
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            try (ResultSet rs = pstmt.executeQuery()) {
                return getResultList(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int insertQuery(String sql, String[] parameter) {
        return executeUpdate(sql, parameter);
    }

    @Override
    public int insertQuery(String sql) {
        return executeUpdate(sql);
    }

    @Override
    public int updateQuery(String sql, String[] parameter) {
        return executeUpdate(sql, parameter);
    }

    @Override
    public int updateQuery(String sql) {
        return executeUpdate(sql);
    }

    @Override
    public int deleteQuery(String sql, String[] parameter) {
        return executeUpdate(sql, parameter);
    }

    @Override
    public int deleteQuery(String sql) {
        return executeUpdate(sql);
    }

    private int executeUpdate(String sql, String[] parameter) {
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            if (parameter != null) {
                for (int i = 0; i < parameter.length; i++) {
                    pstmt.setString(i + 1, parameter[i]);
                }
            }
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    private int executeUpdate(String sql) {
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            return pstmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private List<Map<String, Object>> getResultList(ResultSet rs) throws SQLException {
        List<Map<String, Object>> resultList = new ArrayList<>();
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        while (rs.next()) {
            Map<String, Object> rowMap = new LinkedHashMap<>();
            for (int i = 1; i <= columnCount; i++) {
                rowMap.put(metaData.getColumnName(i), rs.getObject(i));
            }
            resultList.add(rowMap);
        }
        return resultList;
    }

    //autoCloseAble 구현
    @Override
    public void close() {
        try {
            if (dbConnection != null) {
                dbConnection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
