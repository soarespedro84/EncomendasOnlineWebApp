
package Controllers;

import Models.UserBean;
import Models.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

                case "UPDATE":
                    //updateUser(request, response);
                    break;

                default:
                    //listUsers(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
        
        //LOGIN
    protected void loginUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
        
        HttpSession session = request.getSession();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
                
        UserBean userLog = new UserBean();
        userLog.setEmail(email);
        userLog.setPassword(password);       
        
        UserDao _userDao = new UserDao();
        
        try {
            int userValidation = _userDao.authenticateUser(userLog);
            
            switch (userValidation) {
                case 5:
                System.out.println("Admin Control Panel");
                session.setAttribute("user", "Admin");
                request.setAttribute("admin", email);
                
                request.getRequestDispatcher("adminDash.jsp").forward(request, response);
                
                break;
                case 2:
                    System.out.println("Comercial Access");
                
                session.setMaxInactiveInterval(600);
                session.setAttribute("user", email);
                request.setAttribute("user", email);
                
                request.getRequestDispatcher("products.jsp").forward(request, response);
                                break;
                case 1:
                    System.out.println("User Access");
                
                session.setMaxInactiveInterval(600);
                session.setAttribute("user", email);
                request.setAttribute("email", email);
                
                request.getRequestDispatcher("products.jsp").forward(request, response);
                                break;
                default:
                    
                System.out.println("Error = "+userValidation);
                request.setAttribute("errMsg", userValidation);
                
                request.getRequestDispatcher("index.jsp").forward(request, response);
                    throw new AssertionError();
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        }catch (Exception e2) {
            e2.printStackTrace();
        }
    }
    
        //REGISTO
    protected void registerUser(HttpServletRequest request, HttpServletResponse response)
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
        
        UserDao _regDao = new UserDao();
        String userIsRegistered=null;
        
        try{
            userIsRegistered = _regDao.registerUser(userReg);
        }catch (ClassNotFoundException ex){
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }        
        if (userIsRegistered.equals("SUCCESS")) {
            request.setAttribute("user", nameReg);
            request.getRequestDispatcher("/products.jsp").forward(request, response);
        }else{
            request.setAttribute("errMessage", userIsRegistered);
            
            request.getRequestDispatcher("/error.html").forward(request, response);
        }               
    }
    
}


