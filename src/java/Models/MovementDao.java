/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

/**
 *
 * @author psoar
 */
public class MovementDao {
    
    private dbConnection connection;
    
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");    
    
     public void createMovement(CompanyBean company) throws Exception{
        
        Connection con = null;
        PreparedStatement prepStat = null;
        try{
            con = connection.createConnection();
            String sql = "INSERT INTO movement (fk_cliente) VALUES (?)";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, company.getIdCompany().toString());
                        
            prepStat.executeUpdate();                        
        }
        finally{
            con.close();
            prepStat.close();
        }        
    } 

    public void placeOrder(OrderBean order) throws Exception{
         Connection con = null;
        PreparedStatement prepStat = null;
        try{
            con = connection.createConnection();
            String sql = "INSERT INTO order (fk_idMovement, fk_user, dtDelivery, nrCliente) VALUES (?, ?, ?)";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, sql);
            prepStat.setString(1, order.getUser().getIdUser().toString());
            prepStat.setString(2, order.getDtDelivery().toString());
            prepStat.setString(3, order.getNrCliente());
            
            prepStat.executeUpdate();                        
        }
        finally{
            con.close();
            prepStat.close();
        }
    }
    
    
    
    

}
