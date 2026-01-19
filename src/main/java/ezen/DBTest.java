package ezen;

import java.util.ArrayList;
import java.util.List;

public class DBTest {
    public static void main(String[] args) {
        DBManager db = new DBManager();
        if (db.DBOpen()) {
            System.out.println("✅ Connection Successful!");
            
            // Test PreparedStatement Query
            String sql = "select cno, cdate, cname, cnote from chat where cno > ? order by cno asc";
            if (db.OpenQuery(sql, 0)) {
                List<ChatDTO> list = new ArrayList<>();
                while (db.GetNext()) {
                    ChatDTO dto = new ChatDTO(
                        db.GetInt("cno"),
                        db.GetValue("cdate"),
                        db.GetValue("cname"),
                        db.GetValue("cnote")
                    );
                    list.add(dto);
                }
                db.CloseQuery();
                System.out.println("✅ Query Successful! Found " + list.size() + " messages.");
                list.forEach(m -> System.out.println(" - " + m.getCname() + ": " + m.getCnote()));
            }
            
            db.DBClose();
        } else {
            System.out.println("❌ Connection Failed!");
        }
    }
}
