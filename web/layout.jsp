
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="Models.UserBean"%>
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
    <title>AMF Web Platform</title>
  </head>

  <body class="bg-dark"
    <c:if test="${not empty ContaAtiva}">
        onload="getItemsCart()"
    </c:if>
  >
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
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
                    <a href="products?route=list" class="nav-link" ><i class="fa fa-box-open"></i> Products</a>
                </li>
                <c:if test="${ContaAtiva.permission==5}">
                <li class="nav-item px-2">
                <a href="adminDash.jsp" class="nav-link"><i class="fas fa-cog"></i>  Admin Panel</a>
              </li></c:if>
              <c:if test="${ContaAtiva.permission==2}">
                <li class="nav-item px-2">
                <a href="company?route=list" class="nav-link"><i class="fa fa-handshake "></i> Clients</a>
              </li>
              <li class="nav-item px-2" >
                <a href="movement?route=listOrder" class="nav-link" ><i class="fas fa-receipt "></i> Orders</a>
              </li>
              </c:if>
              <c:if test="${ContaAtiva.permission==1}">            
              <li class="nav-item px-2" >
                <a href="movement?route=listOrder" class="nav-link" ><i class="fas fa-receipt "></i> Orders</a>
              </li>
             </c:if>
           
          </ul>
 
          <ul class="navbar-nav ml-auto">
            <c:if test="${empty ContaAtiva}">
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
            </c:if>
            <c:if test="${not empty ContaAtiva}">
                <c:if test="${ContaAtiva.permission==1}">

                <li class="nav-item">               
                  <a href="#" class="nav-link" data-toggle="modal"
              data-target="#contactModal">
                <i class="fas fa-envelope"></i> Contact us
                  </a>
            </li>
            </c:if>
                        <!-----------------CART------------------>

            <li class="nav-item px-2 dropdown" >
              <a id="layoutCart" href="#" class="nav-link" data-toggle="dropdown" data-target="#dropCart">
                <i class="fas fa-shopping-cart"></i> Cart
                <span id="nrCartItems" class="badge badge-pill badge-info"></span>
              </a>
              <div class="dropdown-menu" id="dropCart">
                <div class="row total-header-section">
                    <div class="col-lg-6 col-sm-6 col-6">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i> <span id="nrCartItemsIn" class="badge badge-pill badge-info">3</span>
                    </div>
                    <div class="col-lg-6 col-sm-6 col-6 total-section text-right">
                            <p>Total: <span id ="totalAmount" class="text-info">0.00 €</span></p>
                    </div>
                </div>
                <div class="row cart-detail" style="max-height: 425px; overflow: auto;">
                    <table class="table text-center" >  
                        <tbody id="lstItemsCart">
                            <tr>
                                <td class="align-middle">
                                    <img style="max-width: 80px; height: 70px; object-fit: cover; object-position: bottom" 
                                         src="images/produtos/8A0021.jpg"
                                         class="img-thumbnail card-img-top" alt=""
                                    >
                                </td>
                                <td>
                                    <p>Sony DSC-RX100M..</p>
                                    <span class="price text-info"> $250.22</span> <span class="count"> Quantity:01</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="align-middle">
                                    <img style="max-width: 80px; height: 70px; object-fit: cover; object-position: bottom" 
                                         src="images/produtos/8A0021.jpg"
                                         class="img-thumbnail card-img-top" alt=""
                                    >
                                </td>
                                <td>
                                    <p>Sony DSC-RX100M..</p>
                                    <span class="price text-info"> $250.22</span> <span class="count"> Quantity:01</span>
                                </td>
                            </tr>
                        </tbody>
                    </table> 
                </div>
                <div class="row">
                        <div class="col-lg-12 col-sm-12 col-12 text-center checkout">
                            <a href="movement?route=cart" class="btn btn-outline-dark btn-block">Checkout</a>
                        </div>
                </div>
            </div>  
            </li>
            <li class="nav-item dropdown mr-3" >
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
              >
                <i class="fas fa-user"></i> ${ContaAtiva.name}
              </a>
              <div class="dropdown-menu">
                <a href="profile.jsp" class="dropdown-item">
                  <i class="fa fa-user-circle"></i> Profile</a
                >            
              <a href="logout.jsp" class="dropdown-item">
                <i class="fa fa-power-off"></i> Logout
              </a>
              </div>
            </li>
           </c:if>
          </ul>           
              
              
        </div>
      </div>
    </nav>

    <!-- FOOTER -->
    <footer id="main-footer" class="bg-dark text-white mt-1 fixed-bottom">
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
    
    
    <!-- CONTACT MODAL -->

    <div class="modal fade" id="contactModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card bg-light">
            <div class="card-header text-center">
                <h4>Contact Us</h4>
            </div>
            <div class="card-body">
                <form action="#" method="post" name="form">
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
                    class="btn btn-lg btn-info btn-block" data-dismiss="modal"
                  />
                </form>
              </div>              
            </div>
        </div>
      </div>
    </div>

    

    <!-- LOGIN MODAL -->

    <div class="modal fade" id="loginModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="card bg-light">
              <div class="card-header text-center">
                <h4>Account Login</h4>
              </div>
              <div class="card-body">
                  <form action="user" method="post">
                      <input type="hidden" name="command" value="LOGIN" />
                  <div class="form-group">
                    <input
                      type="email"
                      name="email"
                      placeholder="Email"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group pb-3">
                    <input
                      type="password"
                      name="password"
                      placeholder="Password"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <input
                    type="submit"
                    value="Login"
                    class="btn btn-lg btn-info btn-block" 
                  />
                </form>
              </div>
              <div class="card-footer text-muted text-center">
                <h6>
                  New user?
                  <a href="#" class="text-dark" data-dismiss="modal" data-toggle="modal" data-target="#contactModal">Contact us</a>
                </h6>
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
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
    
    <script src="js/script.js"> </script>

    
  </body>
</html>

