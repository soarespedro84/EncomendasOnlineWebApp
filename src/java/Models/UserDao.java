/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.*;

public class UserDao {
    
    public int authenticateUser(UserBean user){
        String email = user.getEmail();
        String password = user.getPassword();
        int permission = user.getPermission();
        
        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        String userEmail = "";
        String userPassword = "";
        int userPermission;
        String userName="";
        
        try{
            con = dbConnection.createConnection();
            stat = con.createStatement();
            rSet=stat.executeQuery("SELECT email, password, permission, name FROM users");
            
            while (rSet.next()) {
                userEmail = rSet.getString(1);
                userPassword = rSet.getString(2);
                userPermission=rSet.getInt(3);
                userName = rSet.getString(4);
                
                if (email.equals(userEmail) && password.equals(userPassword) && (userPermission==5)){
                return userPermission;
                }else if (email.equals(userEmail) && password.equals(userPassword) && (userPermission==2)) {
                return userPermission;    
                }else if (email.equals(userEmail) && password.equals(userPassword) && (userPermission==1)) {
                return userPermission;     
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
