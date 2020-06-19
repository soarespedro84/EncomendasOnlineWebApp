<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>
<c:if test="${sessionScope.ContaAtiva == null}"><c:redirect url="index"/></c:if>

    <!-- HEADER  -->

    <header id="main-header" class="py-2 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>Movement Manager</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- ACTIONS -->
  <section id="actions" class="py-4 mb-4">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <form action="adminMov.jsp" method="get">
                <div class="input-group">
                    <input type="date" name="dtMov" class="form-control form-control-lg"/>
                </div>
            </form>
          </div>
          <div class="col-md-9">
            <form action="adminMov.jsp" method="get">
              <div class="input-group">
                <input type="text" name="userSearch" class="form-control form-control-lg" placeholder="Company" />
                <button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
              </div>
            </form>            
          </div>
          
       
      </div>
    </section>

    <!-- MOVEMENTS -->
    <section id="movement">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <table class="table table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>Date</th>
                    <th>User</th>
                    <th>Company</th>
                    <th>State</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>10 de Maio 2020</td>
                    <td>José Sousa</td>
                    <td>Company One</td>
                    <td>Processing</td>
                    <td>
                      <a href="details.html" class="btn btn-secondary"
                        ><i class="fas fa-angle-double-right"></i> Details</a
                      >
                    </td>
                  </tr>
                  <tr>
                    <td>10 de Maio 2020</td>
                    <td>José Sousa</td>
                    <td>Company One</td>
                    <td>Shipped</td>
                    <td>
                      <a href="details.html" class="btn btn-secondary"
                        ><i class="fas fa-angle-double-right"></i> Details</a
                      >
                    </td>
                  </tr>
                  
                </tbody>
              </table>
            </div>
          </div>
            
            
 <!-- SIDE DASHBOARD 

          <div class="col-md-3">
            <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-body">
                <h3>Movements</h3>               
                <a href="adminMov.jsp" class="btn btn-outline-light btn-sm"
                  >View</a
                >
              </div>
            </div>
            <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-body">
                <h3>Products</h3>
                <a href="adminProduct.jsp" class="btn btn-outline-light btn-sm"
                  >View</a
                >
              </div>
            </div>
            <div class="card border-light text-center bg-dark text-white mb-3">
              <div class="card-body">
                <h3>Users</h3>
                <a href="adminUsers.jsp" class="btn btn-outline-light btn-sm"
                  >View</a
                >
              </div>
            </div>
          </div>-->
        </div>
      </div>
    </section>          

    <!-- FOOTER -->
    <footer id="main-footer" class="bg-dark text-white mt-1 p-1 fixed-bottom">
      <div class="container">
        <div class="row">
          <div class="col">
            <p class="lead text-center">
              Copyright &copy; <span id="year"></span>
              Sergii e Pedro
            </p>
          </div>
        </div>
      </div>
    </footer>

    <script
      src="http://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
      integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
      crossorigin="anonymous"
    ></script>

    <script>
      // Get the current year for the copyright
      $("#year").text(new Date().getFullYear());
    </script>
  </body>
</html>

