
package Controllers;

import Models.CompanyBean;
import Models.CompanyDao;
import Models.UserBean;
import Models.UserDao;
import Models.dbConnection;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Ajax+JSON
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CompanyController extends HttpServlet {

    private CompanyDao _companyDao;
    private dbConnection dbConn;
    
    public void init() throws ServletException{
        super.init();
        try {
            _companyDao = new CompanyDao(dbConn);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            String route = request.getParameter("command");
            if (route == null) {
		route = "LIST";
            }			
            switch (route) {			                                                                             
                case "LIST":
                    listCompanies(request, response);
                    break;               
                 case "search":
                    searchCompany(request, response);
                    break;  
                case "companySsuggestions":
                    companySsuggestions(request, response);
                    break;
                default:
                    //listCompanies(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    //LIST
     private void listCompanies(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        List<CompanyBean> companiesToView = _companyDao.listCompanies();
        
        request.setAttribute("companyList", companiesToView);
        request.getRequestDispatcher("/adminClients.jsp").forward(request, response);
                       
    }
     
     //SEARCH
     private void searchCompany(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
        String company = request.getParameter("companySearch");
        List<CompanyBean> companyList = _companyDao.search(company);
        request.setAttribute("companyList", companyList);
        request.getRequestDispatcher("/adminClients.jsp").forward(request, response);
    }
    //LIST
    private void companySsuggestions(HttpServletRequest request, HttpServletResponse response)
               throws Exception {        

        List<CompanyBean> companiesToView = _companyDao.listCompanies();

        // Preparar JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        //response.setHeader("Cache-Control", "no-cache");
        
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
                
        //Map<String, String> outLst = new HashMap<String, String>();
        JsonArray outLst = new JsonArray();
        
        for (CompanyBean item : companiesToView) {
            JsonObject jsonObj = new JsonObject();
            
            jsonObj.addProperty("id", item.getIdCompany().toString());
            jsonObj.addProperty("name", item.getCompanyName());
            
            outLst.add(jsonObj);
        }
          
        //Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = new Gson().toJson(outLst);
        response.getWriter().write(json);
   }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try{
            String route = request.getParameter("command");
            if (route == null) {
		route = "LIST";
            }			
            switch (route) {			 
                                                             
                case "REGISTER":
                    addCompany(request, response);
                    break;                
                case "UPDATE":
                    updateCompany(request, response);
                    break;
                case "DELETE":
                    deleteCompany(request, response);
                    break;
               
                default:
                    //listCompanies(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }    }

    
   

      //REGISTER
    private void addCompany(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        String companyNameReg = request.getParameter("companyNameReg");
        String nifReg = request.getParameter("nifReg");
        String addressReg = request.getParameter("addressReg");
        String phoneReg=request.getParameter("phoneReg");
        
	CompanyBean companyReg = new CompanyBean();
                
        companyReg.setCompanyName(companyNameReg);
        companyReg.setNif(nifReg);
        companyReg.setAddress(addressReg);
        companyReg.setPhone(phoneReg);
        
       
        _companyDao.addCompany(companyReg);
        listCompanies(request, response);

    }
    
    private void updateCompany(HttpServletRequest request, HttpServletResponse response)
		throws Exception {                
      
        String idCompany = request.getParameter("idCompany");
        String companyName = request.getParameter("companyName");
        String nif = request.getParameter("nif");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        int state = Integer.parseInt(request.getParameter("state"));
                
        CompanyDao cd = new CompanyDao(dbConn);
        CompanyBean company = cd.getCompanyByID(idCompany);
        company.setCompanyName(companyName);
        company.setNif(nif);
        company.setAddress(address);
        company.setPhone(phone);
        company.setState(state);
        cd.updateCompany(company);
               
        request.setAttribute("company", company);
        request.getRequestDispatcher("/detailsClient.jsp").forward(request, response);
    }

private String deleteCompany(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

    String idCompany = request.getParameter("idCompany");
    CompanyDao cd = new CompanyDao(dbConn);
    String estado = cd.deleteCompany(idCompany);
    if (estado == "") {
        System.out.println("Error = "+estado);
        request.setAttribute("errMsg", estado);
        listCompanies(request, response);

    }else{
        System.out.println("Success");
        listCompanies(request, response);
    }
    
    return estado;
}   
}
