<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>

    <!-- HEADER  -->

    <header id="main-header" class="py-2 bg-dark text-light mb-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center mb-5">
              
              <h2>${admin} Control Panel</h2>
              
          </div>
        </div>
      </div>
    </header>
              
   
    <!-- BOARD -->
    <section id="movement">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-header bg-light text-dark">
                <h3>Movements</h3>
              </div>
                <a href="adminMov.jsp">
                    <div class="card-body py-5 my-5">
                        <i class="fas fa-receipt fa-9x text-light"></i>
                    </div>
                </a>               
              </div>
          </div>
            
            <div class="col-md-3">
              <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-header bg-light text-dark">
                <h3>Products</h3>
              </div>
                  <a href="adminProduct.jsp">  
                    <div class="card-body py-5 my-5">
                        <i class="fa fa-store-alt fa-9x text-light"></i>               
                    </div>
                  </a>
              </div>
            </div>

            <div class="col-md-3">
            <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-header bg-light text-dark">
                <h3>Clients</h3>
              </div>
                <a href="adminClients.jsp">
                    <div class="card-body py-5 my-5">
                        <i class="fa fa-handshake fa-9x text-light"></i>
                    </div>
                </a>               
              </div>
            </div>

            <div class="col-md-3">
                
            <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-header bg-light text-dark">
                <h3>Users</h3>
              </div>
                <a href="adminUsers.jsp">                
                    <div class="card-body py-5 my-5">
                        <i class="fa fa-users fa-9x text-light"></i>               
                    </div>
                </a>
              </div>
            </div>
            
            </div>
          </div>                     

    </section>          

    