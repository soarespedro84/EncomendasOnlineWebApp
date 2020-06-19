
package Models;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CompanyDao {
    
    private dbConnection connection;
    
    public CompanyDao(dbConnection myConn){
        connection=myConn;
    }
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public void addCompany(CompanyBean company) throws Exception{
        
        Connection con = null;
        PreparedStatement prepStat = null;
        try{
            con = dbConnection.createConnection();
            String sql = "INSERT INTO company (companyName, nif, address, phone) VALUES (?,?,?,?)";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, company.getCompanyName());
            prepStat.setString(2, company.getNif());
            prepStat.setString(3, company.getAddress());
            prepStat.setString(4, company.getPhone());
            prepStat.executeUpdate();                        
        }
        finally{
            close(con, prepStat, null);
        }
        
    } 
    
    public List<CompanyBean> listCompanies() throws Exception{
         
        List<CompanyBean> companiesToList = new ArrayList<>();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            String sql = "SELECT * FROM company ORDER BY companyName;";                                            
           
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

            CompanyBean compToList = new CompanyBean(idCompany, companyName, nif, address, phone, state, dtReg);
            companiesToList.add(compToList);            
            }
            return companiesToList; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }
    
    public CompanyBean getCompanyByID(String idCompany) throws Exception{
        
        CompanyBean companyToShow = new CompanyBean();
        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            String sql = "SELECT * FROM company WHERE idCompany = '"+idCompany+"';";                                            
           
            stat = con.createStatement();            
            rSet=stat.executeQuery(sql); 

            while (rSet.next()) {           
            UUID idComp = UUID.fromString(rSet.getString("idCompany"));
            String companyName= rSet.getString("companyName");
            String nif=  rSet.getString("nif");
            String address =  rSet.getString("address");
            String phone = rSet.getString("phone");
            int state = rSet.getInt("state");
            LocalDateTime dtReg = LocalDateTime.parse(rSet.getString("dtReg"), formatter);

            companyToShow = new CompanyBean(idComp, companyName, nif, address, phone, state, dtReg);
                        
            }
            return companyToShow; 
        }
        finally{
            close(con, stat, rSet);
        }                
    }
    
    //Search
    public List<CompanyBean> search(String company) throws Exception{
         
        List<CompanyBean> companySearch= new ArrayList<>();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = connection.createConnection();
            
            String sql = "SELECT * FROM company WHERE companyName like '%"+company+"%';";
            
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
                
                CompanyBean companyToList = new CompanyBean(idCompany, companyName, nif, address, phone, state, dtReg);                                
                companySearch.add(companyToList);
            }
            return companySearch; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }
    
    //Update
     public void updateCompany(CompanyBean company) throws Exception{

        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "update company set companyName=?, nif=?, address=?, phone=?, state=? where idCompany=?";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, company.getCompanyName());
            prepStat.setString(2, company.getNif());
            prepStat.setString(3, company.getAddress());
            prepStat.setString(4, company.getPhone());
            prepStat.setInt(5, company.getState());
            prepStat.setString(6, company.getIdCompany().toString());

            prepStat.executeUpdate();
            
        }finally{
            close(con, prepStat, null);
        }
    }

     
     //Delete
     
     public String deleteCompany(String companyId) throws Exception{
          
        String res = "";
        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "DELETE FROM company WHERE idCompany=?";
            prepStat = con.prepareStatement(sql);            
            prepStat.setString(1, companyId);

            prepStat.executeUpdate();
            
        }catch (SQLException e){
            res=e.getMessage();
        }
        finally{
            close(con, prepStat, null);
        }
        return res;
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
