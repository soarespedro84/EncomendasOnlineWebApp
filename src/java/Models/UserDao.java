/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.UUID;
import org.eclipse.jdt.internal.compiler.codegen.ConstantPool;

public class UserDao {
    
    private dbConnection connection;
    
    public UserDao(dbConnection myConn){
        connection=myConn;
    }
    
    public UserBean authenticateUser(String email, String password) throws Exception{
           
        UserBean userDB = new UserBean();
        
        Connection con = null;
        PreparedStatement stat = null;
        ResultSet rSet= null;
        
        
        
        try{
            con = connection.createConnection();
            String sql = "SELECT * FROM user WHERE email=? and password=?";
            stat = con.prepareStatement(sql);
            stat.setString(1, email);
            stat.setString(2, password); 
            rSet=stat.executeQuery();
            
            while (rSet.next()) {
                String idUserDB = rSet.getString("idUser");
                String nameDB = rSet.getString("name");
                String companyDB = rSet.getString("company");         
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("state");
                //LocalDateTime dtRegDB = rSet.("dtReg");
                String passwordDB = rSet.getString("password");

                userDB = new UserBean(idUserDB, nameDB, companyDB, emailDB, permissionDB, stateDB, passwordDB);
                
            }
        }
        finally{
            con.close();
            stat.close();
            rSet.close();
        }
        return userDB;
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
