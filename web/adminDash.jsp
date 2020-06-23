<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>

    <!-- HEADER  -->
<c:if test="${sessionScope.ContaAtiva == null}"><c:redirect url="index"/></c:if>

    <header id="main-header" class="pt-5 mt-5 mb-2 bg-dark text-light mb-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center mb-5">
              
              <h2>${ContaAtiva.name} Control Panel</h2>
              
          </div>
        </div>
      </div>
    </header>
              
   
    <!-- BOARD -->
    <section id="adminboard">
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
                  <a href="products?route=ADMINLIST">
                    <div class="card-body py-5 my-5">
                        <i class="fa fa-box-open fa-9x text-light"></i>               
                    </div>
                  </a>
              </div>
            </div>

            <div class="col-md-3">
            <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-header bg-light text-dark">
                <h3>Clients</h3>
              </div>
                <a href="company">
                    <input type="hidden" name="command" value="list" />
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
                <a href="user">            
                    <input type="hidden" name="command" value="list" />
                    <div class="card-body py-5 my-5">
                        <i class="fa fa-users fa-9x text-light"></i>               
                    </div>
                </a>
              </div>
            </div>
            
            </div>
          </div>                     

    </section>          

    