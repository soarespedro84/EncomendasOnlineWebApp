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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


public class ItemDao {
    
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    
    // Guardar item no Cart
    public String addItemToCart(ItemCartBean itemCart) throws Exception{
         
        String result = null;

        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rSet= null;
        
        try{
            con = dbConnection.createConnection();
            String query = "INSERT INTO cart(`idCart`, `fk_idUser`, `fk_idProduct`, `size`, `qtd`) VALUES(?, ?, ?, ?, ?);";
            
            for (SizeQtdBean size : itemCart.getLstSizes()) {                
                prst = con.prepareStatement(query);
                prst.setString(1, itemCart.getIdItemCart().toString());
                prst.setString(2, itemCart.getUser().getIdUser().toString());
                prst.setString(3, itemCart.getProduct().getIdProduct().toString());
                prst.setInt(4, size.getSize());
                prst.setInt(5, size.getQtd());

                prst.executeUpdate();
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
    
    public String deliteItemFromCart(String idCart){
        String result = null;

        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rSet= null;
        
        try{
            con = dbConnection.createConnection();
            String query = "DELETE FROM cart WHERE `idCart` =?;";            
                        
            prst = con.prepareStatement(query);
            prst.setString(1, idCart);

            prst.executeUpdate();
        }
        catch(SQLException e){
           result = e.getMessage();
        }
        finally{
            close(con, prst, rSet);
        }  
        
        return result;
    }
    
    public String deliteAllItemFromCart(UserBean user){
        String result = null;

        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rSet= null;
        
        try{
            con = dbConnection.createConnection();
            String query = "DELETE FROM cart WHERE `fk_idUser`= ?;";            
                        
            prst = con.prepareStatement(query);
            prst.setString(1, user.getIdUser().toString());

            prst.executeUpdate();
        }
        catch(SQLException e){
           result = e.getMessage();
        }
        finally{
            close(con, prst, rSet);
        }  
        
        return result;
    }
    
    // Buscar Produto por id
    public ArrayList<ItemCartBean> listCart(UserBean user) throws Exception{
        
        ArrayList<ItemCartBean> listItems = new ArrayList<ItemCartBean>();
        
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rSet= null;
        ResultSet subRset= null;
        
        try{
            con = dbConnection.createConnection();
            
            //Buscar Product
            String query = "SELECT DISTINCT c.`idCart`, p.* FROM cart as c JOIN product as p ON c.`fk_idProduct`=p.`idProduct` WHERE c.`fk_idUser`= ?;";
            prst = con.prepareStatement(query);
            prst.setString(1, user.getIdUser().toString());
                   
            rSet=prst.executeQuery();
            while (rSet.next()) {
                
                UUID idCart = UUID.fromString(rSet.getString("idCart"));
                
                ProductBean tempProduct = new ProductBean(
                    UUID.fromString(rSet.getString("idProduct")),
                    rSet.getString("ref"),
                    rSet.getString("name"),
                    rSet.getString("description"),
                    rSet.getString("color"),
                    rSet.getInt("initSize"),
                    rSet.getInt("finSize"),
                    rSet.getDouble("price"),
                    rSet.getString("foto"),
                    rSet.getInt("state"),
                    LocalDateTime.parse(rSet.getString("dtReg"), formatter)
                );
                
                //Buscar SizeQtd
                ArrayList<SizeQtdBean> tempListSize = new ArrayList<SizeQtdBean>();
                query = "SELECT `size`, qtd FROM cart WHERE `fk_idUser`= ? AND `fk_idProduct` = ?;";
                prst = con.prepareStatement(query);
                prst.setString(1, user.getIdUser().toString());
                prst.setString(2, tempProduct.getIdProduct().toString());
                
                subRset=prst.executeQuery();
                
                while (subRset.next()) {
                    SizeQtdBean tempSize = new  SizeQtdBean(
                        subRset.getInt("size"),
                        subRset.getInt("qtd")
                    );
                    tempListSize.add(tempSize);
                }
                
                ItemCartBean tempItem = new ItemCartBean(idCart, user, tempProduct, tempListSize);
                listItems.add(tempItem);
                
                //tempItem.getProduct()
            }
            
        }
        catch(SQLException e){
           e.printStackTrace();
        }
        finally{
            close(con, prst, rSet);
        }  
        
        return listItems;
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
