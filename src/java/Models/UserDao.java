/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
            String sql = "SELECT u.`idUser`, u.`name`, u.email, u.password, u.`state` as stateUser, u.`dtReg` as dtRegUser , c.* FROM db_amf_web_platform.`user` as u JOIN company as c ON c.`idCompany` = u.fk_company where u.email=? and u.password = ? ;";
            stat = con.prepareStatement(sql);
            stat.setString(1, email);
            stat.setString(2, password); 
            rSet=stat.executeQuery();
            
            while (rSet.next()) {
                UUID idUserDB = UUID.fromString("idUser");
                String name = rSet.getString("name");
                CompanyBean companyDB = (CompanyBean)rSet.getObject("companyName");
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("state");
                LocalDateTime dtRegDB = LocalDateTime.parse("dtReg");
                String passwordDB = rSet.getString("password");

                userDB = new UserBean(idUserDB, name, companyDB, emailDB, permissionDB, stateDB, dtRegDB, passwordDB);                
            }
        }
        finally{
            close(con, stat, rSet);
        }
        return userDB;
    }
    
     /*public void registerUser(UserBean userRegist) throws Exception{

        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "INSERT INTO user (name, fk_company, email, password, permission) VALUES(?,?,?,?,?)";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, userRegist.getName());
            prepStat.setString(2, userRegist.getCompany());
            prepStat.setString(3, userRegist.getEmail());
            prepStat.setString(4, userRegist.getPassword());
            prepStat.setInt(5, userRegist.getPermission());
            int i = prepStat.executeUpdate();
            
        }finally{
            close(con, prepStat, null);
        }
    }*/
     
     public List<UserBean> listUsers() throws Exception{
         
        List<UserBean> userList = new ArrayList<>();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            String sql = "SELECT u.`idUser`, u.`name`, u.email, u.password, u.`state` as stateUser, u.`dtReg` as dtRegUser , c.* FROM db_amf_web_platform.`user` as u JOIN company as c ON c.`idCompany` = u.fk_company;";                                            
           
                stat = con.createStatement();            
                rSet=stat.executeQuery(sql); 
                while (rSet.next()) {
                    UUID idCompany = UUID.fromString("idCompany");
                    String companyName= rSet.getString("companyName");
                    String nif=  rSet.getString("nif");
                    String address =  rSet.getString("address");
                    String phone = rSet.getString("phone");
                    int state = rSet.getInt("state");
                    CompanyBean company = new CompanyBean(idCompany, companyName, nif, address, phone, state, LocalDateTime.MIN);
                    
                    UUID idUser = UUID.fromString("idUser");
                    String name = rSet.getString("name");
                    String email = rSet.getString("email");
                    
                    int permission=rSet.getInt("permission");
                    int stateU = rSet.getInt("stateUser");
                    LocalDateTime dtRegUser = LocalDateTime.parse("dtRegUser");
                    String password = rSet.getString("password");
                    UserBean userToList = new UserBean(idUser, name, company, email, permission, stateU, dtRegUser, password);
                    userList.add(userToList);
                }
                return userList; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }
     
     
     /*public UserBean searchUser(String userName) throws Exception{
         
        

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            
            UserBean userToList = new UserBean();
            String sql = "SELECT * FROM user WHERE name = '"+userName+"' ;";
            
            stat = con.createStatement();            
                rSet=stat.executeQuery(sql); 
                while (rSet.next()) {
                    userToList.setName(rSet.getString("name"));
                    userToList.setCompany(rSet.getString("fk_company"));         
                    userToList.setEmail(rSet.getString("email"));
                    userToList.setPermission(rSet.getInt("permission"));
                    userToList.setState(rSet.getInt("state"));
                    //LocalDateTime dtRegDB = rSet.("dtReg");
                    userToList.setPassword(rSet.getString("password"));
                }
                return userToList; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }*/
     
     
     private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
                    if (myRs != null) {
                            myRs.close();
                    }
                    if (myStmt != null) {
                            myStmt.close();
                    }			
                    if (myConn != null) {
                            myConn.close();
                    }
                }
		catch (Exception e) {
                    e.printStackTrace();
		}
	}        
    
     
}
