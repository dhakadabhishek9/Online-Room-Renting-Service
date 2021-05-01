
package newpackage;

import java.sql.Connection;
import java.sql.DriverManager;

//For connection with DB
public class ConnDao {
    private static Connection conn;
    public static Connection getConnection()
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomrenting","root","");
            //roomrenting is the DB name
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
