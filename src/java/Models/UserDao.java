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
            rSet=stat.executeQuery("SELECT email, password, permission, name FROM user");
            
            while (rSet.next()) {
                userEmail = rSet.getString(1);
                userPassword = rSet.getString(2);
                userPermission=rSet.getInt(3);
                userName = rSet.getString(4);
                
                if (email.equals(userEmail) && password.equals(userPassword) && userPermission==5){
                return 5;
                }else if (email.equals(userEmail) && password.equals(userPassword) && userPermission==2) {
                return 2;    
                }else if (email.equals(userEmail) && password.equals(userPassword) && userPermission==1) {
                return 1;     
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
     public String registerUser(UserBean userRegist) throws ClassNotFoundException{
        String name = userRegist.getName();
        String company = userRegist.getCompany();
        String email = userRegist.getEmail();
        String password = userRegist.getPassword();
        int permission=userRegist.getPermission();
        Connection con = null;
        try{
            con = dbConnection.createConnection();
            
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp001?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","ordepana20Maio2012");            
            String query = "INSERT INTO user (name, company, email, permission, password) VALUES(?,?,?,?,?)";
            PreparedStatement prepStat = con.prepareStatement(query);
            prepStat.setString(1, name);
            prepStat.setString(2, company);
            prepStat.setString(3, email);
            prepStat.setInt(4, permission);
            prepStat.setString(5, password);
            int i = prepStat.executeUpdate();
            prepStat.close();
            con.close();
            if(i != 0) return "SUCCESS";
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return "Error!";
    }
    
   
}
