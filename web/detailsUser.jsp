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

    
    <header id="main-header" class="pt-3 mt-5 mb-3 bg-dark text-light">
      <div class="container">
        
          <div class="row my-3">
           <c:if test="${ContaAtiva.permission==5}">
           <div class="col-md-3">
                       <a href="adminDash.jsp" class="btn btn-lg btn-info btn-block d-block"><i class="fas fa-cog"></i> Admin Panel</a>
                </div></c:if>     
           <div class="col-md-3">
                       <a href="user?route=list" class="btn btn-lg btn-info btn-block d-block"><i class="fas fa-users"></i> User List</a>
                </div>
            <c:if test="${ContaAtiva.permission==5}">
                   <div class="col-md-3">
                       <a href="#" class="btn btn-lg btn-info btn-block d-block" data-toggle="modal" data-target="#editUserModal"><i class="fas fa-user-edit"></i> Edit User</a>
                </div>
                <div class="col-md-3">
                       <a href="#" class="btn btn-lg btn-info btn-block d-block" data-toggle="modal" data-target="#deleteUserModal" ><i class="fas fa-user-times"></i> Delete User</a>
                </div></c:if>
               </div>
          <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>${user.name} Details</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- USER INFO -->
    <section id="companyInfo" class="mb-5">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
                <div class="card-body">                 
                    <form action="#" id="editUser" method="get" name="form" >
                  <div class="form-group">
                    <input
                      type="text"
                      name="name"
                      value="${user.name}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="text"
                      name="company"
                      value="${user.company.companyName}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      name="email"
                      value="${user.email}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  
                  <div class="form-group">
                       <c:choose>         
                        <c:when test = "${user.permission==1}">
                           <input type="text" name="permission" value="User" class="form-control form-control-lg text-white bg-dark" disabled/>
                        </c:when>               
                        <c:when test = "${user.permission==2}">
                           <input type="text" name="permission" value="Comercial" class="form-control form-control-lg text-white bg-dark" disabled/>
                        </c:when>         
                        <c:otherwise>
                           <input type="text" name="permission" value="Administrator" class="form-control form-control-lg text-white bg-dark" disabled/>
                        </c:otherwise>
                     </c:choose>
                     
                  </div>
                  <div class="form-group ">
                    <input
                      type="text"
                      name="dtReg"
                      value="${user.dtReg}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">                    
                       <c:choose>         
                        <c:when test = "${user.state==1}">
                           <input type="text" name="state" value="Active" class="form-control form-control-lg text-white bg-dark" disabled/>
                        </c:when>                                      
                        <c:otherwise>
                           <input type="text" name="state" value="Inactive" class="form-control form-control-lg text-white bg-dark" disabled/>
                        </c:otherwise>
                     </c:choose>
                   </div>                      
             </form>                            
           </div>
          </div>
        </div>
      </div>
       
     </div>
    </section>
                      
                      
    <!-- EDIT USER MODAL -->
     <div class="modal fade " id="editUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card ">
              <div class="card-header text-center"> 
                  <h3>Edit ${user.name}</h3>
              </div>
                <div class="card-body">                 
                    <form action="user" method="post">
                    <input type="hidden" name="command" value="UPDATE"/>
                    <input type="hidden" name="userId" value="${user.idUser}"/>
                    <input type="hidden" name="companyId" value="${user.company.idCompany}"/>

                  <div class="form-group">
                    <input
                      type="text"
                      name="name"
                      value="${user.name}"                      
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                        <div class="form-group">
                    <input
                      type="text"
                      name="company"
                      placeholder="${user.company.companyName}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      name="email"
                      value="${user.email}"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                  
                  <div class="form-group">
                     <select class="form-control form-control-lg text-white bg-dark text-muted" id="permission" name="permission" value="${user.permission}" >
                         <c:choose>         
                        <c:when test = "${user.permission==1}">
                        <option selected value="1">User</option>
                        <option value="2">Comercial</option>
                        <option value="5">Administrator</option>

                        </c:when>
                         <c:when test = "${user.permission==2}">
                        <option selected value="2">Comercial</option>
                        <option value="1">User</option>
                        <option value="5">Administrator</option>
                        </c:when>  
                        <c:otherwise>
                        <option selected value="5">Administrator</option>
                        <option value="1">User</option>
                        <option value="2">Comercial</option>
                        </c:otherwise>
                     </c:choose>   
                         
                           
                        </select>
                  </div>
                  <div class="form-group ">
                    <input
                      type="text"
                      name="dtReg"
                      value="${user.dtReg}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">                    
                        <select class="form-control form-control-lg text-white bg-dark text-muted" id="state" name="state" value="${user.state}" >
                            <c:choose>         
                         <c:when test = "${user.state==1}">
                        <option selected value="1">Active</option>
                        <option value="0">Inactive</option>
                        </c:when>
                         <c:when test = "${user.state==0}">
                        <option selected value="0">Inactive</option>
                        <option value="1">Active</option>
                        </c:when>  
                        <c:otherwise>
                        
                        </c:otherwise>
                     </c:choose>   
                        </select>
                   </div>
                      <input
                    type="submit"
                    value="Update"
                    class="btn btn-lg btn-info btn-block"
                  />
                  
               </form>
               </div>
             
           </div>
          </div>
        </div>
      </div>
                            
                            
    <!-- DELETE USER MODAL -->
     <div class="modal fade" id="deleteUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
              <div class="card-header bg-danger text-center text-white"> 
                  <h3>Delete ${user.name}?</h3>
              </div>
                <div class="card-body">                 
                    <form action="user" method="post" >
                    <input type="hidden" name="command" value="DELETE"/>
                    <input type="hidden" name="userId" value="${user.idUser}"/>
                  <div class="row my-3">
                   <div class="col-md-6">
                <input
                    type="submit"
                    name="deleteYes"
                    value="Confirm"
                    class="btn btn-lg btn-outline-success btn-block"
                  />                </div>
                <div class="col-md-6">
                <input
                    type="button"
                    data-dismiss="modal"
                    value="Cancel"
                    class="btn btn-lg btn-outline-danger btn-block"
                  />                </div>
               </div>
               </form>
               </div>             
           </div>
          </div>
        </div>
      </div>

                

        
    
    
    
  
