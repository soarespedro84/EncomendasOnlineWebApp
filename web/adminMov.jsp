<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
      integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/style.css" />
    <title>ADMIN CONTROL PANEL</title>
  </head>

  <body class="bg-dark">
     <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <div class="container">
        <a href="index.jsp" class="navbar-brand"
          ><img src="/images/ToWorkFor - Logo.jpg" alt="" class="imgNav"
        /></a>
        <button
          class="navbar-toggler"
          data-toggle="collapse"
          data-target="#navbar-collapse"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar-collapse">
          <ul class="navbar-nav">
            <li class="nav-item px-2">
              <a href="adminDash.jsp" class="nav-link">Control Panel</a>
            </li>
              <li class="nav-item px-2">
              <a href="adminMov.jsp" class="nav-link">Orders</a>
            </li>
            <li class="nav-item px-2">
                <a href="adminProduct.jsp" class="nav-link">Products</a>
            </li>
            <li class="nav-item px-2">
                <a href="adminUsers.jsp" class="nav-link">Users</a>
            </li>
          </ul>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown mr-3">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
              >
                <i class="fas fa-user"></i> Welcome ${admin}
              </a>
              <div class="dropdown-menu">
                <a href="profile.html" class="dropdown-item">
                  <i class="fa fa-user-circle"></i> Profile</a
                >
                <a href="settings.html" class="dropdown-item">
                  <i class="fa fa-cog"></i> Settings</a
                >
              </div>
            </li>
            <li class="nav-item px-2">
              <a href="carrinho.html" class="nav-link">
                <i class="fas fa-shopping-cart"></i> Cart
              </a>
            </li>
            <li class="nav-item">
              <a href="index.jsp" class="nav-link">
                <i class="fas fa-user-times"></i> Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- HEADER  -->

    <header id="main-header" class="py-2 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>${admin} Movement Manager</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- ACTIONS -->

    <section id="actions" class="py-4 mb-4">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <a
              href="#"
              class="btn btn-outline-light btn-block"
              data-toggle="modal"
              data-target="#addMovementModal"
              ><i class="fas fa-plus"></i> Add Movement</a
            >
          </div>
         
        </div>
      </div>
    </section>

    <!-- MOVEMENTS -->
    <section id="movement">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4>Latest Movements</h4>
              </div>
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

