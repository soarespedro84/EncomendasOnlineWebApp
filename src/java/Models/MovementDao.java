/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.UUID;

/**
 *
 * @author psoar
 */
public class MovementDao {
    
    private dbConnection connection;
    
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public String createMovement(OrderBean order) throws Exception{
                 
        String result = null;

        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rSet= null;
        
        try{
            con = dbConnection.createConnection();
            String query = "INSERT INTO movement (`idMovement`, fk_cliente) VALUES(?, ?);";
            prst = con.prepareStatement(query);
            prst.setString(1, order.getIdMovement().toString());
            prst.setString(2, order.getCliente().getIdCompany().toString());
            prst.executeUpdate();
            
            query = "INSERT INTO `order` (`fk_idMovement`, fk_user, `dtDelivery`, `nrCliente`) VALUES(?, ?, ?, ?);";
            prst = con.prepareStatement(query);
            prst.setString(1, order.getIdMovement().toString());
            prst.setString(2, order.getUser().getIdUser().toString());
            prst.setDate(3, java.sql.Date.valueOf(order.getDtDelivery().toString()));
            prst.setString(4, order.getNrCliente());
            prst.executeUpdate();
            
            query = "INSERT INTO item (`fk_idMovement`, `fk_idProduct`, `size`, qtd, `copyName`, `copyDescription`, `copyColor`, `copyPrice`) VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
            
            //Listar Products
            for (ItemBean prod : order.getLstItems()) {
                //Listar tamanhos
                for (SizeQtdBean size : prod._lstSizes) {
                    prst = con.prepareStatement(query);
                    prst.setString(1, order.getIdMovement().toString());
                    prst.setString(2, prod.getProduct().getIdProduct().toString());
                    prst.setInt(3, size.getSize());
                    prst.setInt(4, size.getQtd());
                    prst.setString(5, prod.getProduct().getName());
                    prst.setString(6, prod.getProduct().getDescription());
                    prst.setString(7, prod.getProduct().getColor());
                    prst.setDouble(8, prod.getProduct().getPrice());
                    
                    prst.executeUpdate();
                }
            }                      
        }
        catch(SQLException e){
           result = e.getMessage();
        }
        finally{
            close(con, prst, rSet);
        }  
        
        return result;
        
    }
    
    // Buscar movimento
    public ArrayList<OrderBean> listOrder(CompanyBean company) throws Exception{
        
        ArrayList<OrderBean> listOrders = new ArrayList<OrderBean>();
        
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rSet= null;
        ResultSet prodRset= null;
        ResultSet sizeRset= null;
        
        try{
            con = dbConnection.createConnection();
            
            //Buscar Order
            String query = "SELECT m.`idMovement`, m.`state` as stateM, m.`dtReg` as dtRegM, o.`dtDelivery`, o.`nrCliente`, u.* FROM movement as m \n" +
                            "JOIN `order` as o ON m.`idMovement` = o.`fk_idMovement`\n" +
                            "JOIN `user` as u ON o.`fk_user` = u.`idUser`\n" +
                            "WHERE m.`fk_cliente` = ?;";
            prst = con.prepareStatement(query);
            prst.setString(1, company.getIdCompany().toString());
                   
            rSet=prst.executeQuery();
            
            while (rSet.next()) { // Listar Orders
                               
                //Criar UserBean
                UUID idUserDB = UUID.fromString(rSet.getString("idUser")); 
                String nameDB = rSet.getString("name");
                String emailDB = rSet.getString("email");
                int permissionDB=rSet.getInt("permission");
                int stateDB = rSet.getInt("state");                
                LocalDateTime dtRegDB = LocalDateTime.parse(rSet.getString("dtReg"), formatter);
                String passwordDB = rSet.getString("password");

                UserBean user = new UserBean(idUserDB, nameDB, company, emailDB, permissionDB, stateDB, dtRegDB, passwordDB);
                
                //Crair Order
                LocalDate dtDelivery = LocalDate.parse(rSet.getString("dtDelivery"), formatter2);
                String nrCliente = rSet.getString("nrCliente");
                UUID idMovement = UUID.fromString(rSet.getString("idMovement"));
                int state = rSet.getInt("stateM");                
                LocalDateTime dtReg = LocalDateTime.parse(rSet.getString("dtRegM"), formatter);
                
                OrderBean tempOrder = new OrderBean(user, dtDelivery, nrCliente, idMovement, company, state, dtReg);
                
                ArrayList<ItemBean> tempLstItems = new ArrayList<ItemBean>();
                
                //Buscar Product
                query = "Select distinct p.`idProduct`, p.`ref`, i.`copyName` as name, i.`copyDescription` as description, i.`copyColor` as color, p.`initSize`, p.`finSize`,  i.`copyPrice` as price,  p.foto, p.`state`, p.`dtReg` from item as i Join product as p on i.`fk_idProduct` = p.`idProduct` where i.`fk_idMovement`=(?)";
                prst = con.prepareStatement(query);
                prst.setString(1, tempOrder.getIdMovement().toString());
                
                prodRset = prst.executeQuery();
                
                while (prodRset.next()) {
                    ProductBean tempProduct = new ProductBean(
                        UUID.fromString(prodRset.getString("idProduct")),
                        prodRset.getString("ref"),
                        prodRset.getString("name"),
                        prodRset.getString("description"),
                        prodRset.getString("color"),
                        prodRset.getInt("initSize"),
                        prodRset.getInt("finSize"),
                        prodRset.getDouble("price"),
                        prodRset.getString("foto"),
                        prodRset.getInt("state"),
                        LocalDateTime.parse(prodRset.getString("dtReg"), formatter)
                    );
                    
                    //Buscar SizeQtd
                    ArrayList<SizeQtdBean> tempListSize = new ArrayList<SizeQtdBean>();
                    
                    query = "SELECT `size`, qtd FROM item WHERE `fk_idMovement` = ? AND `fk_idProduct` = ?;";
                    prst = con.prepareStatement(query);
                    prst.setString(1, tempOrder.getIdMovement().toString());
                    prst.setString(2, tempProduct.getIdProduct().toString());

                    sizeRset = prst.executeQuery();
                    
                    while (sizeRset.next()) {
                        SizeQtdBean tempSize = new  SizeQtdBean(
                            sizeRset.getInt("size"),
                            sizeRset.getInt("qtd")
                        );
                        tempListSize.add(tempSize);
                    }
                    
                    ItemBean tempItem = new ItemBean(tempProduct, tempListSize);
                    
                    tempLstItems.add(tempItem);
                }
                
                tempOrder.setLstItems(tempLstItems);
                listOrders.add(tempOrder);
            }            
        }
        catch(SQLException e){
           e.printStackTrace();
        }
        finally{
            close(con, prst, rSet);
        }  
        
        return listOrders;
    }
    
     
    private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
        try {
            if (myRs != null) myRs.close();
            if (myStmt != null) myStmt.close();
            if (myConn != null) myConn.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void close(Connection myConn, PreparedStatement myPrst, ResultSet myRs) {
        try {
            if (myRs != null) myRs.close();
            if (myPrst != null) myPrst.close();
            if (myConn != null) myConn.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
}
