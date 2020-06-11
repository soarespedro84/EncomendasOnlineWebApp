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
           ><img src="images/logo-toworkfor_1.jpg" alt="" class="imgNav"
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

