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

    <!-- HEADER  -->
<c:if test="${sessionScope.ContaAtiva == null}"><c:redirect url="index"/></c:if>

    <header id="main-header" class="py-3 mt-5 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>Client Manager</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- ACTIONS -->

     <section id="actions" class="py-2 mb-3">
      <div class="container">
        <div class="row">
            <div class="col-md-3">
                  <a
              href="adminDash.jsp"
              class="btn btn-info btn-lg btn-block"              
              ><i class="fas fa-cog"></i> Admin Panel</a
                  ></div>
            <div class="col-md-6">
                <form action="company" method="get">
                <input type="hidden" name="command" value="search"/>
                <div class="input-group">
                    <input type="text" name="companySearch" class="form-control form-control-lg" placeholder="Search" />
                    <button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
                </div>
                </form>            
            </div>
            <div class="col-md-3">
                  <a
              href="#"
              class="btn btn-info btn-lg btn-block"
              data-toggle="modal"
              data-target="#RegUserModal"
              ><i class="fas fa-plus"></i> Add Client</a
                  ></div>
        </div>
      </div>
    </section>

    <!-- clients -->
    <section id="clients" class="mb-5">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <table class="table table-striped text-center">
                <thead class="bg-info text-white">
                  <tr>
                    <th>Company</th>
                    <th>NIF</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="c" items="${companyList}">
                       <c:url var="tempLink" value="user">
                            <c:param name="command" value="DETAILS" />
                            <c:param name="idCompany" value="${c.idCompany}" />
                    </c:url> 
                       <tr >
                        <td class="align-middle">${c.companyName}</td>
                        <td class="align-middle">${c.nif}</td>
                        <td class="align-middle">${c.address}</td>
                        <td class="align-middle">${c.phone}</td>                
                        <td>
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
            
        
   <!-- Add Client MODAL-->

     <div class="modal fade" id="RegUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
                <div class="card-body">                 
                    <form id="regForm" action="company" method="POST">
                    <input type="hidden" name="command" value="REGISTER"/>
                        <div class="form-group">
                          <input type="text" name="companyNameReg" placeholder="Company Name" class="form-control form-control-lg text-white bg-dark" />
                        </div>
                        <div class="form-group">
                          <input
                            type="text"
                            name="nifReg"
                            placeholder="NIF"
                            class="form-control form-control-lg text-white bg-dark" 
                          />
                        </div>
                        <div class="form-group">
                          <input
                            type="text"
                            name="addressReg"
                            placeholder="Address"
                            class="form-control form-control-lg text-white bg-dark" 
                          />
                        </div>
                        <div class="form-group">
                          <input
                            type="text"
                            name="phoneReg"
                            placeholder="Phone"
                            class="form-control form-control-lg text-white bg-dark" 
                          /> 
                        </div>
                            <div class="form-group">
                    <button
                    type="submit"
                    value="Add Client" 
                    class="btn btn-lg btn-outline-dark btn-block"
                    >Add Client</button></div>
               </form>
               </div>
             
           </div>
          </div>
        </div>
      </div>

    
    
    
  


