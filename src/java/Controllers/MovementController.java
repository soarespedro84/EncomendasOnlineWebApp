/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;
// Modelos
import Models.CompanyBean;
import Models.CompanyDao;
import Models.ItemBean;
import Models.ProductBean;
import Models.ProductDao;
import Models.UserBean;
import Models.ItemCartBean;
import Models.ItemDao;
import Models.MovementBean;
import Models.MovementDao;
import Models.OrderBean;
import Models.SizeQtdBean;
import Models.dbConnection;

// Java Servlet
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.util.*;

// Ajax+JSON
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MovementController extends HttpServlet {
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    dbConnection dbConn = new dbConnection();
    CompanyDao _companyDao = new CompanyDao(dbConn);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("ContaAtiva") == null){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        // Route de request GET
        try{
            String route = request.getParameter("route");
            		
            switch (route) {			 
                case "cart":
                    getCart(request, response);
                    break;
                case "getItemsCart":
                    getItemsCart(request, response);
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
        
        if(request.getSession().getAttribute("ContaAtiva") == null){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
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
            
            //Preencher tamanhos do jsonObj
            for (int i = item.getProduct().getInitSize(); i <= item.getProduct().getFinSize(); i++) {               
                try {
                    int qtd = Integer.parseInt(request.getParameter(""+i));
                    SizeQtdBean tempSizeQtdBean = new SizeQtdBean(i, qtd);
                    item.addSize(tempSizeQtdBean);
                } catch (Exception e) { }                
            }
            
            //Guardar jsonObj em Cart
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
    
    // Página Cart
    private void getCart(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        UserBean user = (UserBean)request.getSession().getAttribute("ContaAtiva");
        ItemDao itd = new ItemDao();
        ArrayList<ItemCartBean> lstItems = itd.listCart(user);
         
        List<CompanyBean> companyList = _companyDao.listCompanies();     
        request.setAttribute("companyList", companyList);

        request.setAttribute("lstItems", lstItems);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
        
    }
    
    // GET ITEMS BY JSON
    private void getItemsCart(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        UserBean user = (UserBean)request.getSession().getAttribute("ContaAtiva");
        ItemDao itd = new ItemDao();
        ArrayList<ItemCartBean> lstItems = itd.listCart(user);
        
        // Preparar JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        //response.setHeader("Cache-Control", "no-cache");
        
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
                
        //Map<String, String> outLst = new HashMap<String, String>();
        JsonArray outLst = new JsonArray();
        
        for (ItemCartBean item : lstItems) {
            JsonObject jsonObj = new JsonObject();
            
            jsonObj.addProperty("foto", item.getProduct().getFoto());
            jsonObj.addProperty("name", item.getProduct().getName());
            jsonObj.addProperty("ref", item.getProduct().getRef());
            jsonObj.addProperty("totalAmount", item.getAmountTotal());
            jsonObj.addProperty("totalQtd", item.getQtdTotal());
            
            outLst.add(jsonObj);
        }
          
        //Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = new Gson().toJson(outLst);
        response.getWriter().write(json);
        
       
        //Gson gson = new GsonBuilder().setPrettyPrinting().create();
        //String json = "Teste";
        //response.getWriter().write(json); 
    }
    
    // Update jsonObj em cart
    private void updateItemCart(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
        
        //Eliminar jsonObj antifo
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
            
            //Preencher tamanhos do jsonObj
            for (int i = item.getProduct().getInitSize(); i <= item.getProduct().getFinSize(); i++) {               
                try {
                    int qtd = Integer.parseInt(request.getParameter(""+i));
                    SizeQtdBean tempSizeQtdBean = new SizeQtdBean(i, qtd);
                    item.addSize(tempSizeQtdBean);
                } catch (Exception e) { }                
            }
            
            //Guardar jsonObj em Cart
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
        
  
        ArrayList<ItemCartBean> lstItems = itd.listCart(user);
        ArrayList<ItemBean> lst = new ArrayList<ItemBean>(lstItems);
        
        String idCompany= request.getParameter("idCompany");
        LocalDateTime dtDelivery=LocalDateTime.parse(request.getParameter("dtDelivery"), formatter);
        String nrCliente= request.getParameter("nrCliente");
       
       
        CompanyBean company = new CompanyDao(dbConn).getCompanyByID(idCompany);
        OrderBean order = new OrderBean(user, dtDelivery, nrCliente, company, lst);
       
        MovementDao movement = new MovementDao();
        movement.createMovement(company); 
        movement.placeOrder(order);
        
       
        //passar dentro do movimentoDAO e gravar na tabela Movimento
        //cada elemento item list -> 
            //for each item lista de tamanhos -> gravar id order + id produto + tamanho +  (ver tabela item)
        
        itd.deliteAllItemFromCart(user);
       
       
        
        request.getRequestDispatcher("/movement?route=cart").forward(request, response);
        
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
