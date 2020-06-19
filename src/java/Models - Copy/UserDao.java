/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

public class UserDao {
    
    private dbConnection connection;
    
    public UserDao(dbConnection myConn){
        connection=myConn;
    }        
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    public UserBean authenticateUser(String email, String password) throws Exception{
           
        UserBean userDB = new UserBean();
        
        Connection con = null;
        PreparedStatement stat = null;
        ResultSet rSet= null;

        try{
            con = connection.createConnection();
            String sql = "SELECT u.`idUser`, u.`name`, u.email, u.password, u.permission, u.`state` as stateUser, u.`dtReg` as dtRegUser , c.* FROM db_amf_web_platform.`user` as u JOIN company as c ON c.`idCompany` = u.fk_company where u.email=? and u.password = ? ;";
            stat = con.prepareStatement(sql);
            stat.setString(1, email);
            stat.setString(2, password); 
            rSet=stat.executeQuery();
            
            while (rSet.next()) {
                //Criar Company
                String idC = rSet.getString("idCompany");
                UUID idCompany = UUID.fromString(idC);
                String companyName= rSet.getString("companyName");
                String nif=  rSet.getString("nif");
                String address =  rSet.getString("address");
                String phone = rSet.getString("phone");
                int state = rSet.getInt("state");
                LocalDateTime dtReg = LocalDateTime.parse(rSet.getString("dtReg"), formatter);
                
                CompanyBean company = new CompanyBean(idCompany, companyName, nif, address, phone, state, dtReg);
                
                //Criar UserBean
                UUID idUserDB = UUID.fromString(rSet.getString("idUser")); 
                String nameDB = rSet.getString("name");
                CompanyBean companyDB = company;
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("state");                
                LocalDateTime dtRegDB = LocalDateTime.parse(rSet.getString("dtRegUser"), formatter);
                String passwordDB = rSet.getString("password");

                userDB = new UserBean(idUserDB, nameDB, companyDB, emailDB, permissionDB, stateDB, dtRegDB, passwordDB);                
            }
        }
        finally{
            close(con, stat, rSet);
        }
        return userDB;
    }
    
    /*public boolean validatePassword(String idUser, String password) throws Exception{
        Connection con = null;
        PreparedStatement prepStat = null;
        ResultSet rSet= null;
         try{
            con = connection.createConnection();
            String sql = "SELECT * FROM db_amf_web_platform.`user` where idUser=?;";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, idUser);
            rSet=prepStat.executeQuery();
            while (rSet.next()) {
            String passwordDB = rSet.getString("password");
                if (password==passwordDB) {
                    return true;
                }
            }
            
         }finally{
            close(con, prepStat, null);
        }
         return true;
    }*/
    
     public void registerUser(UserBean userRegist) throws Exception{

        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "INSERT INTO user (name, fk_company, email, password, permission) VALUES(?,?,?,?,?)";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, userRegist.getName());
            prepStat.setString(2, userRegist.getCompany().getIdCompany().toString());
            prepStat.setString(3, userRegist.getEmail());
            prepStat.setString(4, userRegist.getPassword());
            prepStat.setInt(5, userRegist.getPermission());
            prepStat.executeUpdate();
            
        }finally{
            close(con, prepStat, null);
        }
    }
     
    
     
     public List<UserBean> listUsers() throws Exception{
         
        List<UserBean> userList = new ArrayList<>();
        UserBean userToList = new UserBean();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            String sql = "SELECT u.`idUser`, u.`name`, u.email, u.password, u.`permission`, u.`state` as stateUser, u.`dtReg` as dtRegUser , c.* FROM db_amf_web_platform.`user` as u JOIN company as c ON c.`idCompany` = u.fk_company WHERE u.`permission` <> 5 AND u.`state` = 1 ORDER BY u.`name`;";                                            
           
                stat = con.createStatement();            
                rSet=stat.executeQuery(sql); 
                while (rSet.next()) {
                String idC = rSet.getString("idCompany");
                UUID idCompany = UUID.fromString(idC);
                String companyName= rSet.getString("companyName");
                String nif=  rSet.getString("nif");
                String address =  rSet.getString("address");
                String phone = rSet.getString("phone");
                int state = rSet.getInt("state");
                LocalDateTime dtReg = LocalDateTime.parse(rSet.getString("dtReg"), formatter);
                
                CompanyBean companyToList = new CompanyBean(idCompany, companyName, nif, address, phone, state, dtReg);
                
                //Criar UserBean
                UUID idUserDB = UUID.fromString(rSet.getString("idUser")); 
                String nameDB = rSet.getString("name");
                CompanyBean companyDB = companyToList;
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("state");                
                LocalDateTime dtRegDB = LocalDateTime.parse(rSet.getString("dtRegUser"), formatter);
                String passwordDB = rSet.getString("password");

                userToList = new UserBean(idUserDB, nameDB, companyDB, emailDB, permissionDB, stateDB, dtRegDB, passwordDB);  
                userList.add(userToList);
                }
                return userList; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }
     public List<UserBean> listUserByCompany(CompanyBean c) throws Exception{
         
        List<UserBean> userList = new ArrayList<>();
        UserBean userToList = new UserBean();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            String sql = "SELECT * FROM user WHERE fk_company= '"+c.getIdCompany().toString()+"' ORDER BY state DESC, name ASC;";                                            
           
                stat = con.createStatement();            
                rSet=stat.executeQuery(sql); 
                while (rSet.next()) {
                
                UUID idUserDB = UUID.fromString(rSet.getString("idUser")); 
                String nameDB = rSet.getString("name");
                CompanyBean companyDB = c;
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("state");                
                LocalDateTime dtRegDB = LocalDateTime.parse(rSet.getString("dtReg"), formatter);
                String passwordDB = rSet.getString("password");

                userToList = new UserBean(idUserDB, nameDB, companyDB, emailDB, permissionDB, stateDB, dtRegDB, passwordDB);  
                userList.add(userToList);
                }
                return userList; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }
     public UserBean getUserByID(String idUser) throws Exception{
        
        UserBean userToDetail = new UserBean();        

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            String sql = "SELECT u.`idUser`, u.`name`, u.email, u.password, u.`permission`, u.`state` as stateUser, u.`dtReg` as dtRegUser , c.* FROM db_amf_web_platform.`user` as u JOIN company as c ON c.`idCompany` = u.fk_company AND u.`idUser` ='"+idUser+"'";                                            
           
                stat = con.createStatement();
                rSet=stat.executeQuery(sql); 
                
                while (rSet.next()) {
                String idC = rSet.getString("idCompany");
                UUID idCompany = UUID.fromString(idC);
                String companyName= rSet.getString("companyName");
                String nif=  rSet.getString("nif");
                String address =  rSet.getString("address");
                String phone = rSet.getString("phone");
                int state = rSet.getInt("state");
                LocalDateTime dtReg = LocalDateTime.parse(rSet.getString("dtReg"), formatter);
                
                CompanyBean companyToUser = new CompanyBean(idCompany, companyName, nif, address, phone, state, dtReg);
                
                //Criar UserBean
                UUID idUserDB = UUID.fromString(rSet.getString("idUser")); 
                String nameDB = rSet.getString("name");
                CompanyBean companyDB = companyToUser;
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("stateUser");                
                LocalDateTime dtRegDB = LocalDateTime.parse(rSet.getString("dtRegUser"), formatter);
                String passwordDB = rSet.getString("password");

                userToDetail = new UserBean(idUserDB, nameDB, companyDB, emailDB, permissionDB, stateDB, dtRegDB, passwordDB);  
                
                }
                return userToDetail; 
        }
        finally{
            close(con, stat, rSet);
        }                
    }
     
     public void updateUser(UserBean user) throws Exception{

        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "update user set name=?, email=?, password=?, permission=?, state=? where idUser=?";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, user.getName());
            prepStat.setString(2, user.getEmail());
            prepStat.setString(3, user.getPassword());
            prepStat.setInt(4, user.getPermission());
            prepStat.setInt(5, user.getState());
            prepStat.setString(6, user.getIdUser().toString());

            prepStat.executeUpdate();
            
        }finally{
            close(con, prepStat, null);
        }
    }
     
      public String deleteUser(String userId) throws Exception{
          
        String res = "";
        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "DELETE FROM user WHERE idUser=?";
            prepStat = con.prepareStatement(sql);            
            prepStat.setString(1, userId);

            prepStat.executeUpdate();
            
        }catch (SQLException e){
            res=e.getMessage();
        }
        finally{
            close(con, prepStat, null);
        }
        return res;
    }
     
     public List<UserBean> search(String userName) throws Exception{
         
        List<UserBean> userSearch= new ArrayList<>();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            
            String sql = "SELECT u.`idUser`, u.`name`, u.email, u.password, u.`permission`, u.`state` as stateUser, u.`dtReg` as dtRegUser , c.* FROM db_amf_web_platform.`user` as u JOIN db_amf_web_platform.`company` as c ON c.`idCompany` = u.fk_company WHERE u.`name` like '%"+userName+"%' AND u.`state` = 1;";
            
            stat = con.createStatement();            
            rSet=stat.executeQuery(sql); 
            while (rSet.next()) {
                UUID idCompany = UUID.fromString(rSet.getString("idCompany"));
                String companyName= rSet.getString("companyName");
                String nif=  rSet.getString("nif");
                String address =  rSet.getString("address");
                String phone = rSet.getString("phone");
                int state = rSet.getInt("state");
                LocalDateTime dtReg = LocalDateTime.parse(rSet.getString("dtReg"), formatter);
                
                CompanyBean companyToUser = new CompanyBean(idCompany, companyName, nif, address, phone, state, dtReg);
                
                //Criar UserBean
                UUID idUserDB = UUID.fromString(rSet.getString("idUser")); 
                String nameDB = rSet.getString("name");
                CompanyBean companyDB = companyToUser;
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("state");                
                LocalDateTime dtRegDB = LocalDateTime.parse(rSet.getString("dtRegUser"), formatter);
                String passwordDB = rSet.getString("password");

                UserBean userToList = new UserBean(idUserDB, nameDB, companyDB, emailDB, permissionDB, stateDB, dtRegDB, passwordDB);  
                userSearch.add(userToList);
            }
            return userSearch; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }
     
     
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
