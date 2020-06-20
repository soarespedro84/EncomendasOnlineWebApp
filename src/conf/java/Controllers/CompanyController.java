
package Controllers;

import Models.CompanyBean;
import Models.CompanyDao;
import Models.UserBean;
import Models.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CompanyController {
 
  /*  private void registerUser(HttpServletRequest request, HttpServletResponse response)
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
                       
    }*/
    
    
}
