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

public class ProductDao {
    
//Formatação da Data
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    // Listar produtos por estado
    public List<ProductBean> listProduct(int State) throws Exception{
         
        List<ProductBean> list = new ArrayList<ProductBean>();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = dbConnection.createConnection();
            String sql = "SELECT * FROM product WHERE `state` = " + State + ";";                                            
           
            stat = con.createStatement();            
            rSet=stat.executeQuery(sql);
            while (rSet.next()) {
                ProductBean tempBean = new ProductBean(
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
                
                list.add(tempBean);
            }             
        }
        catch(SQLException e){
           e.printStackTrace();
        }
        finally{
            close(con, stat, rSet);
        }  
        
        return list;
    }
    
     // Buscar Produto por id
    public ProductBean getProductById(String idProuct) throws Exception{
         
        ProductBean tempBean = new ProductBean();

        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rSet= null;
        
        try{
            con = dbConnection.createConnection();            
            String query = "SELECT * FROM product WHERE `idProduct` = ?;";
            prst = con.prepareStatement(query);
            prst.setString(1, idProuct);
                   
            rSet=prst.executeQuery();
            while (rSet.next()) {
                tempBean = new ProductBean(
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
            }             
        }
        catch(SQLException e){
           e.printStackTrace();
        }
        finally{
            close(con, prst, rSet);
        }  
        
        return tempBean;
    }
    
    //Procurar Produto
    public List<ProductBean> search(String str) throws Exception{
         
        List<ProductBean> productSearch= new ArrayList<>();

        Connection con = null;
        Statement stat = null;
        ResultSet rSet= null;
        
        try{
            con = dbConnection.createConnection();
            
            String sql = "SELECT * FROM product WHERE name like '%"+str+"%' OR color like '%"+str+"%' OR ref like '%"+str+"%' OR description like '%"+str+"%' AND state = 1;";
            
            stat = con.createStatement();            
            rSet=stat.executeQuery(sql); 
            while (rSet.next()) {
              
                ProductBean tempBean = new ProductBean(
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
            productSearch.add(tempBean);                
            }             
                
            
            return productSearch; 
        }
        finally{
            close(con, stat, rSet);
        }                
     }

      public void addProduct(ProductBean product) throws Exception{
        Connection con = null;
        PreparedStatement prepStat = null;
        try{
            con = dbConnection.createConnection();
            String sql = "INSERT INTO product (ref, name, description, color, initSize, finSize, price, foto) VALUES (?,?,?,?,?,?,?,?)";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, product.getRef());
            prepStat.setString(2, product.getName());
            prepStat.setString(3, product.getDescription());
            prepStat.setString(4, product.getColor());
            prepStat.setInt(5, product.getInitSize());
            prepStat.setInt(6, product.getFinSize());
            prepStat.setDouble(7, product.getPrice());
            prepStat.setString(8, product.getFoto());                        
            
            prepStat.executeUpdate();                        
        }
        finally{
            close(con, prepStat, null);
        }
        
    } 
      public void updateProduct(ProductBean productToUptate) throws Exception{

        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "UPDATE product SET ref=?, name=?, description=?, color=?, initSize=?, finSize=?, price=? WHERE idProduct=?";
            prepStat = con.prepareStatement(sql);
            prepStat.setString(1, productToUptate.getRef());
            prepStat.setString(2, productToUptate.getName());
            prepStat.setString(3, productToUptate.getDescription());
            prepStat.setString(4, productToUptate.getColor());
            prepStat.setInt(5, productToUptate.getInitSize());
            prepStat.setInt(6, productToUptate.getFinSize());
            prepStat.setDouble(7, productToUptate.getPrice());
            prepStat.setString(8, productToUptate.getIdProduct().toString());
          
            prepStat.executeUpdate();
            
        }finally{
            close(con, prepStat, null);
        }
    }
    
      
    public String deleteProduct(String idProduct) throws Exception{
          
        String res = "";
        Connection con = null;
        PreparedStatement prepStat=null;
        try{
            con = dbConnection.createConnection();
            String sql = "DELETE FROM product WHERE idProduct=?";
            prepStat = con.prepareStatement(sql);            
            prepStat.setString(1, idProduct);

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
