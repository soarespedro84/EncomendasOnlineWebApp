/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnection {
    
    public static Connection createConnection(){
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/jsp001?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String username ="root";//netbeansuser
        String password = "ordepana20Maio2012";//netbeansuser
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {            
            e.printStackTrace();
        }
        return con;
    }    
}
