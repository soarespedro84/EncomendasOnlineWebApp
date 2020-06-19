/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;
// Modelos
import Models.ProductBean;
import Models.ProductDao;
import Models.UserBean;
import Models.ItemCartBean;
import Models.ItemDao;
import Models.SizeQtdBean;

// Java Servlet
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Ajax+JSON
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.*;
import java.util.Map;
import java.lang.Integer;
import javax.servlet.http.HttpSession;

public class MovementController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Route de request GET
        try{
            String route = request.getParameter("route");
            		
            switch (route) {			 
                case "cart":
                    getCart(request, response);
                    break;                                                
                case "addToCart":
                    addToCart(request, response);
                    break;
                case "deleteInCart":
                    deleteInCart(request, response);
                break;
                default:
                    getCart(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
    
    
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Route de request GET
        try{
            String route = request.getParameter("route");
            		
            switch (route) {                                           
                case "addToCart":
                    addToCart(request, response);
                    break;
                case "updateItemCart":
                    updateItemCart(request, response);
                break;
                case "saveOrder":
                    saveOrder(request, response);
                break;
                case "cart":
                    getCart(request, response);
                    break;
                default:
                    getCart(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
    
    // Adicionar ao carrinho de compra via JSON
    private void addToCart(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        try {
            // Utilizador
            UserBean user = (UserBean)request.getSession().getAttribute("ContaAtiva");
            
            // Produto
            String idProduct = request.getParameter("idProduct");
            ProductDao pd = new ProductDao ();
            ProductBean product = pd.getProductById(idProduct);
            
            //Criar ItemBean
            ItemCartBean item = new ItemCartBean(user, product);
            
            //Preencher tamanhos do item
            for (int i = item.getProduct().getInitSize(); i <= item.getProduct().getFinSize(); i++) {               
                try {
                    int qtd = Integer.parseInt(request.getParameter(""+i));
                    SizeQtdBean tempSizeQtdBean = new SizeQtdBean(i, qtd);
                    item.addSize(tempSizeQtdBean);
                } catch (Exception e) { }                
            }
            
            //Guardar item em Cart
            ItemDao id = new ItemDao();
            String result = id.addItemToCart(item);
            
            if(result == null) result = product.getName();
            
            response.setContentType("application/json");
            response.setHeader("Cache-Control", "no-cache");
            Map<String, String> personMap = new HashMap<String, String>();
            personMap.put("ok", result);

            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String json = gson.toJson(personMap);
            response.getWriter().write(json);
        } catch (Exception e) {
            response.setContentType("application/json");
            response.setHeader("Cache-Control", "no-cache");
            Map<String, String> personMap = new HashMap<String, String>();
            personMap.put("error", ""+e.getMessage());

            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String json = gson.toJson(personMap);
            response.getWriter().write(json);
        }
        
    }
    
    // Adicionar ao carrinho de compra via JSON
    private void getCart(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        UserBean user = (UserBean)request.getSession().getAttribute("ContaAtiva");
        ItemDao itd = new ItemDao();
        ArrayList<ItemCartBean> lstItems = itd.listCart(user);
        
        request.setAttribute("lstItems", lstItems);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
        
    }
    
    // Update item em cart
    private void updateItemCart(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
        
        //Eliminar item antifo
        String idCart = request.getParameter("idCart");        
        ItemDao id = new ItemDao();        
        String result = id.deliteItemFromCart(idCart);
        
        //Acrescentar novo
        try {
            //idCart
            UUID uuidCart = UUID.fromString(idCart);
            
            // Utilizador
            UserBean user = (UserBean)request.getSession().getAttribute("ContaAtiva");
            
            // Produto
            String idProduct = request.getParameter("idProduct");
            ProductDao pd = new ProductDao ();
            ProductBean product = pd.getProductById(idProduct);
            
            //Criar ItemBean
            ItemCartBean item = new ItemCartBean(uuidCart, user, product);
            
            //Preencher tamanhos do item
            for (int i = item.getProduct().getInitSize(); i <= item.getProduct().getFinSize(); i++) {               
                try {
                    int qtd = Integer.parseInt(request.getParameter(""+i));
                    SizeQtdBean tempSizeQtdBean = new SizeQtdBean(i, qtd);
                    item.addSize(tempSizeQtdBean);
                } catch (Exception e) { }                
            }
            
            //Guardar item em Cart
            result = id.addItemToCart(item);
            
            if(result == null) result = "OK!";
            
        } catch (Exception e) { }
        
        //getCart(request, response);
        request.getRequestDispatcher("/movement?route=cart").forward(request, response);
    }
    
    // Eliminar do Cart
    private void deleteInCart(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        String idCart = request.getParameter("idCart");
        
        ItemDao id = new ItemDao();
        
        String result = id.deliteItemFromCart(idCart);
        
        
        request.getRequestDispatcher("/movement?route=cart").forward(request, response);
    }
    
    // Guardar encomenda
    private void saveOrder(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        UserBean user = (UserBean)request.getSession().getAttribute("ContaAtiva");
        ItemDao itd = new ItemDao();
        
        itd.deliteAllItemFromCart(user);
        
        request.getRequestDispatcher("/movement?route=cart").forward(request, response);
        
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
