package Helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {

            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblock", "root", "gotunamdev");
                
            }
        } catch (Exception e) {
             System.out.println("kuch to halt");
            e.printStackTrace();
           
        }
        return con;

    }
   
}