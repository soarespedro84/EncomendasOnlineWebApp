<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@page import="Models.dbConnection"%>
<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>

    <!-- HEADER  -->

    <header id="main-header" class="py-2 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>Client Manager</h2>
              
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
              data-target="#clientRegistModal"
              ><i class="fas fa-plus"></i> Add Client</a
                  ></div>
            <div class="col-md-9">
                <form action="adminClients.jsp" method="get">
                <div class="input-group">


    <input type="text" name="companySearch" class="form-control form-control-lg" placeholder="Search" />
<button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
</div></form>            
          </div>
          
        </div>
      </div>
    </section>
<%
            String company = request.getParameter("companySearch");
            if (company != null && company != "") {
                Connection conn = dbConnection.createConnection();
                Statement stmt = conn.createStatement();
                
                String str = "SELECT * FROM company WHERE companyName = '" + company + "';";
                
                ResultSet rset = stmt.executeQuery(str);
        %>     
    <!-- clients -->
    <section id="clients">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <table class="table table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>Company</th>
                    <th>NIF</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th></th>
                  </tr>
                </thead>
                <% while (rset.next()) { %>
                <tbody>
                  <tr>
                    <td><%= rset.getString("companyName")%></td>
                <td><%= rset.getString("nif")%></td>
                <td><%= rset.getString("address")%></td>
                <td><%= rset.getString("phone")%></td>
                    <td>
                      <a href="details.html" class="btn btn-secondary"
                        ><i class="fas fa-angle-double-right"></i> Details</a
                      >
                    </td>
                  </tr>
                  <% 
            }
            rset.close();
            stmt.close();
            conn.close();            
        
            %>
                  
                </tbody>
              </table>
            </div>
          </div>                       
        </div>
      </div>
    </section>
             <% }else{

                Connection conn = dbConnection.createConnection();
                Statement stmt = conn.createStatement();
                
                String str = "SELECT * FROM company ORDER BY companyName ASC;";
                
                ResultSet rset = stmt.executeQuery(str);
        %>     
            <!-- clients -->
    <section id="clients">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <table class="table table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>Company</th>
                    <th>NIF</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th></th>
                  </tr>
                </thead>
                <% while (rset.next()) { %>
                <tbody>
                  <tr>
                    <td><%= rset.getString("companyName")%></td>
                <td><%= rset.getString("nif")%></td>
                <td><%= rset.getString("address")%></td>
                <td><%= rset.getString("phone")%></td>
                    <td>
                      <a href="details.html" class="btn btn-secondary"
                        ><i class="fas fa-angle-double-right"></i> Details</a
                      >
                    </td>
                  </tr>
                  <% 
            }
            rset.close();
            stmt.close();
            conn.close();            
}
            %>
                  
                </tbody>
              </table>
            </div>
          </div>                       
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

    
        <!-- Client MODAL -->

    <div class="modal fade" id="clientRegistModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card bg-light">
              <div class="card-header text-center">
                <h4>Registration Form</h4>
              </div>
              <div class="card-body">
                  <form action="#" method="post" name="form" onsubmit="return formValidation()">
                  <div class="form-group">
                    <input
                      type="text"
                      name="company"
                      placeholder="Company"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      name="email"
                      placeholder="Email"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="nif"
                      placeholder="NIF"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="phone"
                      placeholder="Phone Number"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group ">
                    <input
                      type="text"
                      name="address"
                      placeholder="Address"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group ">
                    <input
                      type="text"
                      name="city"
                      placeholder="City"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group pb-3">
                    <input
                      type="text"
                      inputmode="numeric"
                      pattern="\\d{4}-\\d{3}$"
                      name="cp"
                      placeholder="ZIP Code"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>    
                  <input
                    type="submit"
                    value="Add Client"
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

