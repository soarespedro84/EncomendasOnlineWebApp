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

// Java Servlet
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

// Ajax+JSON
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.apache.tomcat.jni.SSLContext;

public class ProductController extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        // Route de request GET
        try{
            String route = request.getParameter("route");
            
            if(request.getSession().getAttribute("ContaAtiva") == null && route==null){
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            
            switch (route) {			 
                case "list":
                    listProduct(request, response);
                    break;
                case "ADMINLIST":
                    listAdminProduct(request, response);
                    break;        
                case "GetProduct":
                   getProduct(request, response);
                    break;
                case "SEARCH":
                    searchProduct(request, response);
                default:
                    //listProduct(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            String route = request.getParameter("route");
            
        if(request.getSession().getAttribute("ContaAtiva") == null){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
          switch (route) {			 
                case "addProduct":
                    addProduct(request, response);
                    break;
               
                default:
                    //listProduct(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
    
    //LIST
    private void listProduct(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        ProductDao pd = new ProductDao();
        List<ProductBean> lstProduct = pd.listProduct(1);
        
       
        request.setAttribute("lstProduct", lstProduct);
        request.getRequestDispatcher("/products.jsp").forward(request, response);   
                
    }
    //LIST ADMIN
    private void listAdminProduct(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        ProductDao pd = new ProductDao();
        List<ProductBean> lstProduct = pd.listProduct(1);
        
       
        request.setAttribute("lstProduct", lstProduct);
        request.getRequestDispatcher("/adminProduct.jsp").forward(request, response);   
                
    }
    
    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
        String str = request.getParameter("productSearch");
        ProductDao pd=new ProductDao();
        List<ProductBean> lstProduct = pd.search(str);
        request.setAttribute("lstProduct", lstProduct);
        UserBean userInSession = (UserBean)request.getSession().getAttribute("ContaAtiva");
        if (userInSession == null) {
            request.getRequestDispatcher("/products.jsp").forward(request, response);       

        }else if (userInSession.getPermission() == 5) {
                request.getRequestDispatcher("/adminProduct.jsp").forward(request, response);
            }else{                    
                request.getRequestDispatcher("/products.jsp").forward(request, response);       
            }
    }
    
    //GET PRODUCT BY JSON
    private void getProduct(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
        
        String idProduct = request.getParameter("idProduct");
        String processData = request.getParameter("processData");
        
        // Caregar produto
        ProductDao pd = new ProductDao ();
        ProductBean responseBean = pd.getProductById(idProduct);
        
        // Preparar JSON
        response.setContentType("application/json");
        response.setHeader("Cache-Control", "no-cache");
        
        Map<String, String> personMap = new HashMap<String, String>();
        
        personMap.put("idProduct", responseBean.getIdProduct().toString());
        personMap.put("ref", responseBean.getRef());
        personMap.put("name", responseBean.getName());
        personMap.put("desc", responseBean.getDescription());
        personMap.put("color", responseBean.getColor());
        personMap.put("init", ""+responseBean.getInitSize());
        personMap.put("fin", ""+responseBean.getFinSize());
        personMap.put("price", ""+responseBean.getPrice());
        personMap.put("foto", responseBean.getFoto());
        

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(personMap);
        response.getWriter().write(json);             
    }
    
       //REGISTER
    private void addProduct(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
        
        ProductDao _productDao = new ProductDao();
        
        String ref = request.getParameter("ref");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price=Double.parseDouble(request.getParameter("price"));
        String color = request.getParameter("color");
        int initSize = Integer.parseInt(request.getParameter("initSize"));
        int finSize = Integer.parseInt(request.getParameter("finSize"));
        String photo = request.getParameter("photo");
        
	ProductBean product = new ProductBean();
    
        product.setRef(ref);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setColor(color);
        product.setInitSize(initSize);
        product.setFinSize(finSize);
        product.setFoto(photo);
                
        _productDao.addProduct(product);
        listProduct(request, response);

    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
