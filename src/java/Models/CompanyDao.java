
package Models;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CompanyDao {
    public String registerUser(UserBean regist) throws ClassNotFoundException{
        String name = regist.getName();
        String username=regist.getCompany();
        String email = regist.getEmail();
        String password = regist.getPassword();
        int role=regist.getPermission();
        Connection con = null;
        try{
            con = dbConnection.createConnection();
            
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp001?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","ordepana20Maio2012");            
            String query = "INSERT INTO users VALUES(?,?,?,?,?)";
            PreparedStatement prepStat = con.prepareStatement(query);
            prepStat.setString(1, email);
            prepStat.setString(2, password);
            prepStat.setString(3, username);
            prepStat.setString(4, name);
            prepStat.setInt(5, role);
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
