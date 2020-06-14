
package Models;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompanyDao {
    
    private dbConnection connection;
    
    public CompanyDao(dbConnection myConn){
        connection=myConn;
    }
    
    public void addCompany(CompanyBean company, UserBean userC) throws Exception{
        
        Connection con = null;
        PreparedStatement prepStat = null;
        try{
            con = dbConnection.createConnection();
            String sql = "INSERT INTO company (companyName, nif, address, phone, fk_comercial) VALUES(?,?,?,?)";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, company.getCompanyName());
            prepStat.setString(2, company.getNif());
            prepStat.setString(3, company.getAddress());
            prepStat.setString(4, company.getPhone());
            prepStat.setString(5, userC.getName());
            int i = prepStat.executeUpdate();                        
        }
        finally{
        prepStat.close();
            con.close();
        }
        
    } 
    
 
}
