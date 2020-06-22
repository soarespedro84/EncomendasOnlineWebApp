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

<c:if test="${sessionScope.ContaAtiva == null}"><c:redirect url="index"/></c:if>
    <header id="main-header" class="py-3 mt-5 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>User Manager</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- ACTIONS -->

    <section id="actions" class="py-4 mb-2">
      <div class="container">
        <div class="row">
            <div class="col-md-3">
                  <a
              href="adminDash.jsp"
              class="btn btn-info btn-lg btn-block"              
              ><i class="fas fa-cog"></i> Admin Panel</a
                  ></div>
            <div class="col-md-9">
                <form action="user" method="get">
                        <input type="hidden" name="command" value="search"/>
                    <div class="input-group">
                        <input type="text" name="userSearch" class="form-control form-control-lg" placeholder="Search" />
                        <button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
                    </div>
                </form>            
            </div>          
        </div>
      </div>
    </section>
    
    <!-- USERS -->
    <section id="userList" class="mb-5">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <table class="table table-striped text-center">
                <thead class="bg-info text-white">
                  <tr>
                    <th>Name</th>
                    <th>Company</th>
                    <th>Email</th>
                    <th> </th>
                  </tr>
                </thead>               
                <tbody>
                     <c:forEach var="u" items="${userList}">
                         <c:url var="tempLink" value="user">
                            <c:param name="command" value="USER_DETAILS" />
                            <c:param name="idUser" value="${u.idUser}" />
                         </c:url> 
                    <tr>
                        <td class="align-middle">${u.name}</td>
                        <td class="align-middle">${u.company.companyName}</td>
                        <td class="align-middle">${u.email}</td>
                        <td class="align-middle">
                          
                            <a href="${tempLink}" class="btn btn-info">
                               

                                <i class="fas fa-angle-double-right"></i> Details
                            </a>
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
      

    
    
  
