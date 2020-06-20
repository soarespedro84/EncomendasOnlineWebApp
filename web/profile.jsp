<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.dbConnection"%>
<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>
<c:if test="${sessionScope.ContaAtiva == null}"><c:redirect url="index"/></c:if>

    <!-- HEADER  -->

    <header id="main-header" class="pt-3 mt-5 mb-3 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center my-3">
              
              <h2>${ContaAtiva.name} Profile</h2>
              
          </div>
        </div>
      </div>
    </header>
    

      <!-- EDIT USER MODAL -->
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
                      value="${ContaAtiva.name}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="text"
                      name="company"
                      value="${ContaAtiva.company.companyName}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      name="email"
                      value="${ContaAtiva.email}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  
                  <div class="form-group">
                       <c:choose>         
                        <c:when test = "${ContaAtiva.permission==1}">
                           <input type="text" name="permission" value="User" class="form-control form-control-lg text-white bg-dark" disabled/>
                        </c:when>               
                        <c:when test = "${ContaAtiva.permission==2}">
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
                      value="${ContaAtiva.dtReg}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">                    
                       <c:choose>         
                        <c:when test = "${ContaAtiva.state==1}">
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
       <div class="row my-3">

                   <div class="col-md-6">
                       <a href="#" class="btn btn-lg btn-info btn-block d-block" data-toggle="modal" data-target="#editUserModal"><i class="fas fa-user-edit"></i> Edit Info</a>
                </div>
                <div class="col-md-6">
                       <a href="#" class="btn btn-lg btn-info btn-block d-block" data-toggle="modal" data-target="#changePassModal" ><i class="fas fa-user-shield"></i> Change Password</a>
                </div>
               </div>
     </div>
    </section>
                      
                      <!-- EDIT USER MODAL -->
     <div class="modal fade" id="editUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
              <div class="card-header text-center"> 
                  <h3>Edit ${ContaAtiva.name}</h3>
              </div>
                <div class="card-body">                 
                     <form action="user" method="post">
                    <input type="hidden" name="command" value="UPDATE"/>
                    <input type="hidden" name="userId" value="${ContaAtiva.idUser}"/>
                    <input type="hidden" name="companyId" value="${ContaAtiva.company.idCompany}"/>

                  <div class="form-group">
                    <input
                      type="text"
                      name="name"
                      value="${ContaAtiva.name}"                      
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                        <div class="form-group">
                    <input
                      type="text"
                      name="company"
                      value="${ContaAtiva.company.companyName}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      name="email"
                      value="${ContaAtiva.email}"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
<div class="form-group" hidden>
                    <input
                      type="password"
                      name="password"
                      value="${ContaAtiva.password}"
                      class="form-control form-control-lg text-white bg-dark"  
                    />
                  </div>
                  <div class="form-group" hidden>
                     <select class="form-control form-control-lg text-white bg-dark text-muted" id="permission" name="permission" value="${ContaAtiva.permission}" >
                         <c:choose>         
                        <c:when test = "${ContaAtiva.permission==1}">
                        <option selected value="1">User</option>
                        <option value="2">Comercial</option>
                        <option value="5">Administrator</option>
                        
                        </c:when>
                         <c:when test = "${ContaAtiva.permission==2}">
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
                  <div class="form-group " hidden>
                    <input
                      type="text"
                      name="dtReg"
                      value="${ContaAtiva.dtReg}"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                 <div class="form-group" hidden>                    
                        <select class="form-control form-control-lg text-white bg-dark text-muted" id="state" name="state" value="${ContaAtiva.state}" >
                            <c:choose>         
                         <c:when test = "${ContaAtiva.state==1}">
                        <option selected value="1">Active</option>
                        <option value="0">Inactive</option>
                        </c:when>
                         <c:when test = "${ContaAtiva.state==0}">
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
                      
                  <!-- Change Password MODAL -->
     <div class="modal fade" id="changePassModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
              <div class="card-header text-center"> 
                  <h3>Change ${ContaAtiva.name} Password</h3>
              </div>
                <div class="card-body">                 
                   <form action="user" method="post">
                    <input type="hidden" name="command" value="PASSWORD"/>
                    <input type="hidden" name="userId" value="${ContaAtiva.idUser}"/>
                  <div class="form-group">
                    <input
                      type="password"
                      name="passwordOld"
                      placeholder="Current Password"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="password"
                      name="passwordNew"
                      placeholder="New Password"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="password"
                      name="passwordCheck"
                      placeholder="Confirm New Password"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>                                   
                      <input
                    type="submit"
                    value="Change Password"
                    class="btn btn-lg btn-success btn-block"
                  />
                  
               </form>
               </div>
             
           </div>
          </div>
        </div>
      </div>
                    
                     <c:if test="${passOK==true}">
        <script> 
                $(document).ready(function() {
                    $('#successAlert').modal('show');
                    });
                    setTimeout(function() {
    $('#successAlert').modal('hide');
  }, 2000);
  
        </script>
        <c:remove var="passOK"/>
    </c:if>
<div class="modal fade" id="successAlert">
      <div class="modal-dialog modal-lg">
             <div class="alert alert-success text-center">
                <strong>Password Updated</strong>
            </div>
      </div>
</div>
                