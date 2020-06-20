
package Controllers;

import Models.CompanyBean;
import Models.CompanyDao;
import Models.ProductBean;
import Models.ProductDao;
import Models.UserBean;
import Models.UserDao;
import Models.dbConnection;
import java.awt.event.ContainerAdapter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;
import javax.accessibility.AccessibleRole;
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
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        try{
            String route = request.getParameter("command");
            if (route == null) {
		route = "LIST";
            }			
            switch (route) {			 
                                                                       
                case "LIST":
                    listUser(request, response);
                    break;
                case "DETAILS":
                    listUsersByCompany(request, response);
                    break;
                case "USER_DETAILS":
                    userDetails(request, response);
                    break;
                case "SEARCH":
                    search(request, response);
                    break;
                case "UPDATE":
                    updateUser(request, response);
                    break;
                default:
                    //listUser(request, response);
                }            
        }catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    
    //LIST
    private void listUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
    
        List<UserBean> usersToView = _userDao.listUsers();
        
        request.setAttribute("userList", usersToView);
        request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
                       
    }
    private void listUsersByCompany(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
        String idCompany=request.getParameter("idCompany");
        CompanyDao cd= new CompanyDao(dbConn);
        CompanyBean c = cd.getCompanyByID(idCompany);
        
        List<UserBean> companyUsersView = _userDao.listUserByCompany(c);

        request.setAttribute("company", c);
        request.setAttribute("companyList", companyUsersView);
        request.getRequestDispatcher("/detailsClient.jsp").forward(request, response);
    }
            
private void userDetails(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        

        String idUser = request.getParameter("idUser");
        UserDao ud = new UserDao(dbConn);
        UserBean userToDetail = ud.getUserByID(idUser);               
        request.setAttribute("user", userToDetail);
        request.getRequestDispatcher("/detailsUser.jsp").forward(request, response);
                       
    }

 private void search(HttpServletRequest request, HttpServletResponse response)
		throws Exception {        
        String name = request.getParameter("userSearch");
        List<UserBean> userSearch = _userDao.search(name);
        request.setAttribute("userList", userSearch);
        request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
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
                case "LOGIN":
                    loginUser(request, response);
                    break;                                                
                case "REGISTER":
                    registerUser(request, response);
                    break;                              
                case "UPDATE":
                    updateUser(request, response);
                    break;                
                case "PASSWORD":
                    updatePassword(request, response);
                    break;
                case "DELETE":
                    deleteUser(request, response);
                    break;
                case "LOGOUT":
                    //logoutUser(request, response);
                    break;
                default:
                    //listUser(request, response);
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
        
        if (theUserBean.getName()!= null && theUserBean.getName()!= "") {
            session.setAttribute("ContaAtiva", theUserBean);
            session.setAttribute("LoginOK", true);
            session.setMaxInactiveInterval(1200);
            if (theUserBean.getPermission()!=5) {
                request.getRequestDispatcher("index.jsp#loginSuccessModal").forward(request, response);
            }else{
                request.getRequestDispatcher("adminDash.jsp").forward(request, response);
            }           
        }else{
           session.setAttribute("LoginOK", "ErrorLOGIN");
           request.getRequestDispatcher("index.jsp#loginErrorModal").forward(request, response);
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
        CompanyDao _companyDao= new CompanyDao(dbConn);
                
        userReg.setName(nameReg);
        userReg.setCompany(_companyDao.getCompanyByID(companyReg));
        userReg.setEmail(emailReg);
        userReg.setPassword(passwordReg);
        userReg.setPermission(permissionReg);
        
       
        _userDao.registerUser(userReg);
        request.getRequestDispatcher("adminDash.jsp").forward(request, response);
       
    }
    
    //UPDATE
    
private void updateUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {                
      
        String idUser = request.getParameter("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int permission = Integer.parseInt(request.getParameter("permission"));
        int state = Integer.parseInt(request.getParameter("state"));
        
        UserDao ud = new UserDao(dbConn);
        UserBean user = ud.getUserByID(idUser);
        user.setName(name);
        user.setEmail(email);
        user.setPermission(permission);
        user.setState(state);
        ud.updateUser(user);
        
        UserBean userInSession = (UserBean)request.getSession().getAttribute("ContaAtiva");
            if (userInSession.getPermission() < 5) {
                    request.setAttribute("ContaAtiva", user);

                request.getRequestDispatcher("/profile.jsp").forward(request, response);

    }else{
                    request.setAttribute("user", user);

        request.getRequestDispatcher("/detailsUser.jsp").forward(request, response);
    }
}

private void updatePassword(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

    String currentPassword=request.getParameter("passwordOld");
    String newPassword=request.getParameter("passwordNew");
    String checkPassword=request.getParameter("passwordCheck");
    String idUser = request.getParameter("userId");
    Boolean validatePass=false;
    
    if (newPassword.equals(checkPassword)) {
        UserDao ud = new UserDao(dbConn);
        validatePass=ud.validatePassword(idUser,currentPassword);
        if (validatePass) {
            ud.updatePassword(newPassword, idUser);
            request.setAttribute("passOK", true);
        }
    }
    request.getRequestDispatcher("/profile.jsp#successAlert").forward(request, response);
}                
      

//DELETE
private String deleteUser(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

    String idUser = request.getParameter("userId");
    UserDao ud = new UserDao(dbConn);
    String estado = ud.deleteUser(idUser);
    if (estado == "") {
        System.out.println("Error = "+estado);
        request.setAttribute("errMsg", estado);
        listUser(request, response);
    }else{
        System.out.println("Success");
        request.getRequestDispatcher("/adminDash.jsp").forward(request, response);
    }
    
    return estado;
}         
 
    
}


