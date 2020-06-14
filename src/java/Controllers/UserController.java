
package Controllers;

import Models.UserBean;
import Models.UserDao;
import Models.dbConnection;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserController extends HttpServlet {

    private UserDao _userDao;    
    private dbConnection dbConn;
    
    public void init() throws ServletException{
        super.init();
        try {
            _userDao = new UserDao(dbConn);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        try{
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
		theCommand = "LIST";
            }			
            switch (theCommand) {			 
                case "LOGIN":
                    loginUser(request, response);
                    break;                                                
                case "REGISTER":
                    registerUser(request, response);
                    break;
                case "LIST":
                    listUser(request, response);
                    break;
                case "UPDATE":
                    //updateUser(request, response);
                    break;
                case "DELETE":
                    //updateUser(request, response);
                    break;
                    case "SEARCH":
                    searchUser(request, response);
                    break;
                default:
                    //listUsers(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
        
        
        if (session != null) {
            session.invalidate();
            request.setAttribute("errMsg", "Logout successfull");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            System.out.println("Logged Out");
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        try{
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
		theCommand = "LIST";
            }			
            switch (theCommand) {			 
                case "LOGIN":
                    loginUser(request, response);
                    break;                                                
                case "REGISTER":
                    registerUser(request, response);
                    break;
                case "LIST":
                    listUser(request, response);
                    break;
                case "UPDATE":
                    //updateUser(request, response);
                    break;
                case "DELETE":
                    //updateUser(request, response);
                    break;
                case "SEARCH":
                    searchUser(request, response);
                    break;
                default:
                    //listUsers(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
        
    //LOGIN
    private void loginUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
        
        HttpSession session = request.getSession();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
                
        UserBean theUserBean = _userDao.authenticateUser(email, password);      
        
        if (theUserBean.getName()!= null) {
            session.setAttribute("ContaAtiva", theUserBean);
            session.setMaxInactiveInterval(600);
            if (theUserBean.getPermission()!=5) {
                request.getRequestDispatcher("products.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("adminDash.jsp").forward(request, response);
            }           
        }
    }
        
        
    //REGISTO
    private void registerUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        String nameReg = request.getParameter("nameReg");
        String companyReg = request.getParameter("companyReg");
        String emailReg = request.getParameter("emailReg");
        String passwordReg=request.getParameter("passwordReg");
        int permissionReg = Integer.parseInt(request.getParameter("permissionReg"));
        
        UserBean userReg = new UserBean();
        userReg.setName(nameReg);
        userReg.setCompany(companyReg);
        userReg.setEmail(emailReg);
        userReg.setPassword(passwordReg);
        userReg.setPermission(permissionReg);
       
        _userDao.registerUser(userReg);
        request.setAttribute("user", nameReg);
        request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
                       
    }
    
    //LIST
    private void listUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        List<UserBean> usersToView = _userDao.listUsers();
       

        request.setAttribute("userList", usersToView);
        request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
                       
    }
    
    //SEARCH
    private void searchUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        String name = request.getParameter("userSearch");
        UserBean userToSearch = _userDao.searchUser(name);

        request.setAttribute("userToList", userToSearch);
        request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
                       
    }
    
    
    //DELETE
    
}


