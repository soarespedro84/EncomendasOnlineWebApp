
package Controllers;

import Models.UserBean;
import Models.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
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
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserBean user = new UserBean();
        user.setEmail(email);
        user.setPassword(password);
        
        
        UserDao userDao = new UserDao();
        
        try {
            int userValidation = userDao.authenticateUser(user);
            HttpSession session = request.getSession();
            switch (userValidation) {
                case 5:
                System.out.println("Admin Control Panel");
                
                
                session.setAttribute("admin", "Admin");
                request.setAttribute("admin", email);
                //request.setAttribute("role", login.getRole());
                
                request.getRequestDispatcher("adminDash.jsp").forward(request, response);
                
                break;
                case 2:
                    System.out.println("Comercial Access");
                
                session.setMaxInactiveInterval(600);
                session.setAttribute("user", email);
                request.setAttribute("email", email);
                
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
}


