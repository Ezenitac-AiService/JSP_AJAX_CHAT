package ezen;

public class DBTest {
    public static void main(String[] args) {
        DBManager db = new DBManager();
        // Overwrite host if needed (though docker-compose uses 3306)
        if (db.DBOpen()) {
            System.out.println("✅ Connection Successful!");
            db.DBClose();
        } else {
            System.out.println("❌ Connection Failed!");
        }
    }
}
