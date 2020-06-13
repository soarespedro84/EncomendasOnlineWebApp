<%-- 
    Document   : index
    Created on : 22 May 2020, 20:12:27
    Author     : psoar
--%>

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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css"
    />

    <link rel="stylesheet" href="css/style.css" />
    <title>ToWorkFor</title>
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
                <a href="products.jsp" class="nav-link" >Products</a>
            </li>
            <li class="nav-item px-2" >
              <a href="orders.html" class="nav-link" >Orders</a>
            </li>
          </ul>
          <ul class="navbar-nav ml-auto">
            
            <li class="nav-item px-2" >
              <a href="carrinho.html" class="nav-link">
                <i class="fas fa-shopping-cart"></i> Cart
              </a>
            </li>            
            <li class="nav-item">
              <a href="#" class="nav-link" data-toggle="modal"
              data-target="#contactModal">
                <i class="fas fa-envelope"></i> Contact us
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link" data-toggle="modal"
              data-target="#loginModal">
                <i class="fas fa-user"></i> Login
              </a>
            </li>
            <li class="nav-item dropdown mr-3" >
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
              >
                <i class="fas fa-user"></i> ${ContaAtiva}
              </a>
              <div class="dropdown-menu">
                <a href="profile.html" class="dropdown-item">
                  <i class="fa fa-user-circle"></i> Profile</a
                >            
              <a href="index.jsp" class="dropdown-item">
                <i class="fas fa-user-times"></i> Logout
              </a>
           
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>

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
    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"
      integrity="sha256-Y1rRlwTzT5K5hhCBfAFWABD4cU13QGuRN6P5apfWzVs="
      crossorigin="anonymous"
    ></script>

    <script>
      
      $("#year").text(new Date().getFullYear());

      CKEDITOR.replace("editor1");
    </script>
  </body>
</html>

