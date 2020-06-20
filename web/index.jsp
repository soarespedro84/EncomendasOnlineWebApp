<%-- 
    Document   : index
    Created on : 22 May 2020, 20:12:27
    Author     : psoar
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:include page="layout.jsp"/>


    <!-- CAROUSEL -->
    <section id="showcase" class="">
        
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
       <!--<ol class="carousel-indicators mb-5">
          <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
          <li data-target="#myCarousel" data-slide-to="4"></li>
          <li data-target="#myCarousel" data-slide-to="5"></li>
        </ol>-->
        <div class="carousel-inner bg-white">
          <div class="carousel-item carousel-image-1 active"></div>
          <div class="carousel-item carousel-image-2">         
          </div>
          <div class="carousel-item carousel-image-3">
            
          </div>
          <div class="carousel-item carousel-image-4">
            
          </div>
          <div class="carousel-item carousel-image-5">
            
          </div>
          <div class="carousel-item carousel-image-6">
            
          </div>
          <div class="dark-overlay">
              
              <div class="jumbotron text-center vertical-center text-white bg-transparent ">
      <h1 class="display-1 text-uppercase font-weight-bold">AMF SHOES</h1>
      <p class="lead display-4 mb-5">Your Safety Shoes Online Platform</p>
    
      
      <a class="btn btn-outline-light btn-lg mx-2" href="products?route=LIST" role="button">Check Our Products</a>
      <c:if test="${empty ContaAtiva}">
              <a href="#" class="btn btn-outline-light btn-lg mx-2" data-dismiss="modal" data-toggle="modal" data-target="#loginModal" >Login Now</a>
              <h6 class="my-3">
                  New user?
                  <a href="#" class="text-white" data-dismiss="modal" data-toggle="modal" data-target="#contactModal">Contact us to Sign Up</a>
                </h6>
              </c:if>
    </div>
          </div>
          
              </div>
        </div>
       <a href="#myCarousel" class="carousel-control-prev" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a href="#myCarousel" class="carousel-control-next" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
    </section>

    
    <c:if test="${LoginOK==true}">
        <script> 
                $(document).ready(function() {
                    $('#loginSuccessModal').modal('show');
                    });
                    setTimeout(function() {
    $('#loginSuccessModal').modal('hide');
  }, 2000);
  
        </script>
        <c:remove var="LoginOK"/>
    </c:if>
        
<c:if test="${LoginOK=='ErrorLOGIN'}">
        <script> 
                $(document).ready(function() {
                    $('#loginErrorModal').modal('show');
                    });
                    setTimeout(function() {
    $('#loginErrorModal').modal('hide');
  }, 6000);
  
        </script>
        <c:remove var="LoginOK"/>
    </c:if>        
        
    <!-- LOGIN SUCCESS MODAL -->
     <div class="modal fade" id="loginSuccessModal">         
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="card">
              <div class="card-header text-center text-success bg-light"> 
                  <h3>Successfull Login</h3>
              </div>
                <div class="card-body bg-dark text-light">                 
                    <h5 class="text-center my-3">Welcome </h5>
                    
                    <h4 class="text-center my-3">${ContaAtiva.name}</h4>
               </div>             
           </div>
          </div>
        </div>
      </div>
               <!-- LOGIN ERROR MODAL -->
     <div class="modal fade" id="loginErrorModal">         
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="card">
              <div class="card-header text-center text-danger bg-light"> 
                  <h3>Login Error</h3>
              </div>
                <div class="card-body bg-dark text-light">                 
                    <p class="text-center">Please check your email or password</p>
               </div>  
             <div class="card-footer text-muted text-center">
                <h6>
                  New user?
                  <a href="#" class="text-dark" data-dismiss="modal" data-toggle="modal" data-target="#contactModal">Contact us to Sign Up</a>
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

    
    

