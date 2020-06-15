<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.dbConnection"%>
<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>

    
    <header id="main-header" class="py-2 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>User Manager</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- ACTIONS -->

    <section id="actions" class="py-4 mb-4">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
                  <a
              href="#"
              class="btn btn-outline-light btn-lg btn-block"
              data-toggle="modal"
              data-target="#registerModal"
              ><i class="fas fa-plus"></i> Add User</a
                  ></div>
            <div class="col-md-9">
                <form action="adminUsers.jsp" method="get">
                <div class="input-group">


    <input type="text" name="userSearch" class="form-control form-control-lg" placeholder="Search" />
<button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
</div></form>            
          </div>
          
        </div>
      </div>
    </section>
    
    <!-- USERS -->
    <section id="movement">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <table class="table table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>Name</th>
                    <th>Company</th>
                    <th>Email</th>
                    <th>Permission</th>
                    <th> </th>
                  </tr>
                </thead>
               
                <tbody>
                     <c:forEach var="u" items="${userList}">
                    <tr>
                        <td>${u.name}</td>
                        <td>${u.company}</td>
                        <td>${u.email}</td>
                        <td>${u.permission}</td>                
                    <td>
                      <c:url var="deleteLink" value="UserControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="userId" value="${tempUser.idUser}" />
					</c:url>
                    </td>
                    </tr>  
                    </c:forEach>
                </tbody>
              </table>
            </div>
          </div>                       
        </div>
      </div>
    </section>
          

    
        <!-- REGISTER MODAL -->

    <div class="modal fade" id="registerModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card bg-light">
              <div class="card-header text-center">
                <h4>Registration Form</h4>
              </div>
              <div class="card-body">
                  <form action="UserController" method="post" name="form" onsubmit="return formValidation()">
                      <input type="hidden" name="command" value="REGISTER" />
                  <div class="form-group">
                    <input
                      type="text"
                      name="nameReg"
                      placeholder="Name"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="text"
                      name="companyReg"
                      placeholder="Company"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      name="emailReg"
                      placeholder="Email"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="password"
                      name="passwordReg"
                      placeholder="Password"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="text"
                      name="permissionReg"
                      placeholder="Permission"                      
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  
                  
                  <input
                    type="submit"
                    value="Register"
                    class="btn btn-lg btn-outline-dark btn-block"
                  />
                </form>
              </div>
              <div class="card-footer text-muted text-center mt-2">
                
              </div>
            </div>
        </div>
      </div>
    </div>

    
  
