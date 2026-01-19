package ezen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * DBManager 리팩토링 버전 (Java 17 기준)
 * PreparedStatement 도입 및 리소스 관리 강화
 */
public class DBManager {
    private Connection conn = null;
    private String host = "jdbc:mysql://" + System.getenv().getOrDefault("DB_HOST", "127.0.0.1") + ":3306/chatdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
    private String userid = "root";
    private String passwd = "ezen";

    private Statement stmt = null;
    private ResultSet result = null;
    private boolean isMonitoring = true;

    public DBManager() {
    }

    public void setHost(String host) { this.host = host; }
    public void setUserid(String userid) { this.userid = userid; }
    public void setPasswd(String passwd) { this.passwd = passwd; }

    public boolean DBOpen() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(host, userid, passwd);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void DBClose() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 기존 방식 유지 (Statement 사용) - 교육용 하위 호환성
    public boolean RunSQL(String sql) {
        log(sql);
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 신규 방식 (PreparedStatement 사용)
    public boolean RunSQL(String sql, Object... params) {
        log(sql);
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean OpenQuery(String sql) {
        log(sql);
        try {
            stmt = conn.createStatement();
            result = stmt.executeQuery(sql);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean OpenQuery(String sql, Object... params) {
        log(sql);
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            result = pstmt.executeQuery();
            stmt = pstmt; // CloseQuery에서 pstmt도 stmt의 자식이므로 닫힘
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean GetNext() {
        try {
            return result != null && result.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String GetValue(String column) {
        try {
            return result.getString(column);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int GetInt(String column) {
        try {
            return result.getInt(column);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void CloseQuery() {
        try {
            if (result != null) result.close();
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void log(String sql) {
        if (isMonitoring) {
            System.out.println("""
                ----------------------------------
                SQL: %s
                ----------------------------------
                """.formatted(sql));
        }
    }
}
