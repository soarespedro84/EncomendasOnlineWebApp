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
    <title>WELCOME</title>
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
              <a href="products.jsp" class="nav-link">Products</a>
            </li>
            <li class="nav-item px-2">
              <a href="orders.jsp" class="nav-link">Orders</a>
            </li>
          </ul>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown mr-3">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
              >
                <i class="fas fa-user"></i> Welcome ${user}
              </a>
              <div class="dropdown-menu">
                <a href="userProfile.jsp" class="dropdown-item">
                  <i class="fa fa-user-circle"></i> Profile</a
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
          <div class="col-md-12 text-center my-3">
              
              <h2>Check Our Products</h2>
              
          </div>
        </div>
      </div>
    </header>

              <!-- PRODUCTS  -->
    
    <section id="products">
      <div class="container">
        <div class="row mb-3">
          <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
              <img class="card-img-top" src="images/produtos/8A11.31.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#" data-toggle="modal" data-target="#productModal">Buy Now</a>
                </div>
            </div>
          </div>
           <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8A12.24.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8A30.10.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8A86.00.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            </div>
        <div class="row mb-3">
          <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8B86.00.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
           <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/3A01.730.JPG" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/6A03.12.JPG" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8A01.21.JPG" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            </div>
        <div class="row mb-5">
        <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
              <img class="card-img-top" src="images/produtos/8A11.31.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#" data-toggle="modal" data-target="#productModal">Buy Now</a>
                </div>
            </div>
          </div>
           <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8A12.24.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8A30.10.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
            </div>
          </div>
            <div class="col-md-3">
            <div class="card border-light text-center bg-white text-dark mb-3">
                <img class="card-img-top" src="images/produtos/8A86.00.jpg" alt="">
                <div class="card-body">
                <h5 class="card-title">Product One</h5>                
                <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Buy Now</a>
                </div>
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

    <!--MODALS-->
      <!-- Product Modal -->          
    <div class="modal fade" id="productModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card bg-light">
              <div class="card-header text-center">
                <h4>Product Details</h4>
              </div>
              <div class="card-body">
                  <div class="row mb-3">
                      <div class="col-md-6">
                          <img class="img img-fluid" src="images/produtos/8A11.31.jpg"/>
                      </div>
                      <div class="col-md-6">
                          <table class="table">
            <tbody>
                <tr>
                    <th scope="row">Ref</th>
                    <td>8A86.00</td>
                </tr>
                <tr>
                    <th scope="row">Model</th>
                    <td>MODEL#02</td>                    
                </tr>
                <tr>
                    <th scope="row">Description</th>
                    <td>Description of this product</td>
                </tr>                
                <tr>
                    <th scope="row">Price</th>
                    <td>€ 59.99</td>
                </tr>
            </tbody>
        </table>

                      </div>
                  </div>
                  
                <div class="table-responsive">
                <table class="table table-striped text-center">
                <thead class="thead-dark">
                  <tr>
                    <th>38</th>
                    <th>39</th>
                    <th>40</th>
                    <th>41</th>
                    <th>42</th>
                    <th>43</th>
                    <th>44</th>
                    <th>45</th>                   
                  </tr>
                </thead>
                <tbody>
                  <tr>
                      <td><input type="text" name="sz38" size="2" /></td>
                      <td><input type="text" name="sz39" size="2" /></td>
                      <td><input type="text" name="sz40" size="2" /></td>
                      <td><input type="text" name="sz41" size="2" /></td>
                      <td><input type="text" name="sz42" size="2" /></td>
                      <td><input type="text" name="sz43" size="2" /></td>
                      <td><input type="text" name="sz44" size="2" /></td>
                      <td><input type="text" name="sz45" size="2" /></td>                      
                  </tr>                  
                </tbody>
              </table>
              </div>
                  <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#">Add to Basket</a>
              </div>
              <div class="card-footer text-muted text-center">
                <h6>
                  More information?
                  <a href="#" class="text-dark" data-dismiss="modal" data-toggle="modal" data-target="#contactModal">Contact us</a>
                </h6>
              </div>
            </div>
        </div>
      </div>
    </div>
    
    <!-- CONTACT MODAL -->

    <div class="modal fade" id="contactModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card bg-light">
            <div class="card-header text-center">
                <h4>Contact Us</h4>
            </div>
            <div class="card-body">
                <form action="RegController" method="post" name="form" onsubmit="return formValidation()">
                <div class="form-group">
                    <input
                      type="text"
                      name="name"
                      placeholder="Name"
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
                      name="company"
                      placeholder="Company"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group pb-3">
                    <textarea                      
                      name="message"
                      placeholder="How can we help?"
                      class="form-control form-control-lg text-white bg-dark" rows="5"
                      ></textarea>
                  </div>
                  <input
                    type="submit"
                    value="Send Message"
                    class="btn btn-lg btn-outline-dark btn-block" data-dismiss="modal"
                  />
                </form>
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

