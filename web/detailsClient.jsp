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
           <div class="row my-4">
                     <div class="col-md-2">
                       <a href="adminDash.jsp" class="btn btn-lg btn-info btn-block d-block"><i class="fas fa-cog m-0"></i> Admin Panel</a>
                </div>    
                    <div class="col-md-2">
                       <a href="company?route=LIST" class="btn btn-lg btn-info btn-block d-block"><i class="fas fa-users"></i> Client List</a>
                </div>     
                    <div class="col-md-2">
           
      <button class="btn btn-lg btn-info btn-block d-block " data-toggle="modal"  data-target="#RegUserModal"><i class="fas fa-user-plus"></i> Add Users</button>
       </div>
                <div class="col-md-2">
                    <button class="btn btn-lg btn-info btn-block d-block " data-toggle="modal" data-target="#ShowUsersModal"><i class="fas fa-users"></i> Show Users</button>
      </div>
       <div class="col-md-2">
                       <a href="#" class="btn btn-lg btn-info btn-block d-block" data-toggle="modal" data-target="#editUserModal" ><i class="fas fa-user-edit"></i> Edit</a>
                </div>
                     
                <div class="col-md-2">
                       <a href="#" class="btn btn-lg btn-info btn-block d-block" data-toggle="modal" data-target="#deleteUserModal" ><i class="fas fa-user-times"></i> Delete</a>
                </div>
      </div>
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>${company.companyName} Details</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- COMPANY INFO -->
    <section id="companyInfo" >
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
                      value="${company.companyName}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="text"
                      name="company"
                      value="${company.nif}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      name="email"
                      value="${company.address}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="password"
                      value="${company.phone}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  
                  <div class="form-group ">
                    <input
                      type="text"
                      name="dtReg"
                      value="${company.dtReg}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">                    
                       <c:choose>         
                        <c:when test = "${company.state==1}">
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
    
 
<!-- Add User Modal-->

     <div class="modal fade" id="RegUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
              <div class="card-header text-center  "> 
                  <h3>Add User to ${company.companyName}</h3>
              </div>
                <div class="card-body">                 
                    <form id="regForm" action="user" method="POST">
                    <input type="hidden" name="command" value="REGISTER"/>
                        <div class="form-group">
                          <input type="text" name="nameReg" placeholder="Name" class="form-control form-control-lg text-white bg-dark" />
                        </div>
                        <div class="form-group">
                          <input
                            type="text"
                            name="companyName"
                            value="${company.companyName}"
                            class="form-control form-control-lg text-white bg-dark" disabled 
                          />
                          <input
                            type="text"
                            name="companyReg"
                            value="${company.idCompany}"
                            hidden
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
                            type="text"
                            name="passwordReg"
                            placeholder="Password"
                            class="form-control form-control-lg text-white bg-dark" 
                          />
                        </div>
                        <div class="form-group">
                     <select class="form-control form-control-lg text-white bg-dark text-muted" id="permission" name="permissionReg" value="${user.permission}" >
                         <option selected >Set Permission</option>                                                
                         <option value="1">User</option>
                        <option value="2">Comercial</option>
                        <option value="5">Administrator</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <button
                    type="submit"
                    value="Add User" 
                    class="btn btn-lg btn-info btn-block"
                    >Add User</button>
                  </div>
               </form>
               </div>
             
           </div>
          </div>
        </div>
      </div>

               
<!-- Client Users List Modal-->
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
<div class="modal fade" id="ShowUsersModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">      
            <div class="card">
                <div class="card-header text-center"> 
                  <h3>${company.companyName} Users</h3>
              </div>
        <div class="card-body">
            
                    <table class="table table-striped text-center ">
                <thead class="bg-secondary text-light">
                  <tr>
                    <th>Name</th>                   
                    <th>Email</th>
                    <th> </th>
                  </tr>
                </thead>               
                <tbody>
                     <c:forEach var="u" items="${companyList}">
                         <c:url var="tempLink" value="user">
                            <c:param name="command" value="USER_DETAILS" />
                            <c:param name="idUser" value="${u.idUser}" />
                    </c:url> 
                    <tr>
                        <td class="align-middle">${u.name}</td>
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
    </div>        
            </div>
    </div> 
            </div> 
</section>
        
                            
    <!-- EDIT Client MODAL -->
     <div class="modal fade" id="editUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
              <div class="card-header text-center"> 
                  <h3>Edit ${company.companyName}</h3>
              </div>
                <div class="card-body">                 
                    <form action="company" method="post">
                    <input type="hidden" name="command" value="UPDATE"/>
                    <input type="hidden" name="idCompany" value="${company.idCompany}"/>

                 <div class="form-group">
                    <input
                      type="text"
                      name="companyName"
                      value="${company.companyName}"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                      <div class="form-group">
                    <input
                      type="text"
                      name="nif"
                      placeholder="${company.nif}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="address"
                      value="${company.address}"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="phone"
                      value="${company.phone}"
                      class="form-control form-control-lg text-white bg-dark" 
                    />
                  </div>
                  
                  <div class="form-group ">
                    <input
                      type="text"
                      name="dtReg"
                      placeholder="${company.dtReg}"
                      class="form-control form-control-lg text-white bg-dark" disabled
                    />
                  </div>
                  <div class="form-group">                    
                        <select class="form-control form-control-lg text-white bg-dark text-muted" id="state" name="state" value="${company.state}" >
                            <c:choose>         
                         <c:when test = "${company.state==1}">
                        <option selected value="1">Active</option>
                        <option value="0">Inactive</option>
                        </c:when>
                         <c:when test = "${company.state==0}">
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
                            
                            
    <!-- DELETE Client  MODAL -->
     <div class="modal fade" id="deleteUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
              <div class="card-header text-center bg-danger text-white"> 
                  <h3>Delete ${company.companyName}?</h3>
              </div>
                <div class="card-body">                 
                    <form action="company" method="post" >
                    <input type="hidden" name="command" value="DELETE"/>
                    <input type="hidden" name="idCompany" value="${company.idCompany}"/>
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

                

    
  
