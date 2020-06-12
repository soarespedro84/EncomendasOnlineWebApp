<%-- 
    Document   : index
    Created on : 22 May 2020, 20:12:27
    Author     : psoar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>
 
    <!-- CAROUSEL -->
    <section id="showcase">
        
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
          <li data-target="#myCarousel" data-slide-to="4"></li>
          <li data-target="#myCarousel" data-slide-to="5"></li>
        </ol>
        <div class="carousel-inner bg-white">
          <div class="carousel-item carousel-image-1 active">
            <div class="container">
              <div class="carousel-caption d-none d-sm-block text-right mb-10">
                <h1 class="display-1"></h1>                
                <a href="#" class="btn btn-dark btn-lg">Buy Now</a>
              </div>
            </div>
          </div>
          <div class="carousel-item carousel-image-2">
            <div class="container">
              <div class="carousel-caption d-none d-sm-block text-right mb-10">
                <h1 class="display-1"></h1>                
                <a href="#" class="btn btn-dark btn-lg">Buy Now</a>
              </div>
            </div>
          </div>
          <div class="carousel-item carousel-image-3">
            <div class="container">
              <div class="carousel-caption d-none d-sm-block text-right mb-10">
                <h1 class="display-1"></h1>                
                <a href="#" class="btn btn-dark btn-lg">Buy Now</a>
              </div>
            </div>
          </div>
          <div class="carousel-item carousel-image-4">
            <div class="container">
              <div class="carousel-caption d-none d-sm-block text-right mb-10">
                <h1 class="display-1"></h1>                
                <a href="#" class="btn btn-dark btn-lg">Buy Now</a>
              </div>
            </div>
          </div>
          <div class="carousel-item carousel-image-5">
            <div class="container">
              <div class="carousel-caption d-none d-sm-block text-right mb-10">
                <h1 class="display-1"></h1>                
                <a href="#" class="btn btn-dark btn-lg">Buy Now</a>
              </div>
            </div>
          </div>
          <div class="carousel-item carousel-image-6">
            <div class="container">
              <div class="carousel-caption d-none d-sm-block text-right mb-10">
                <h1 class="display-1"></h1>                
                <a href="#" class="btn btn-dark btn-lg">Buy Now</a>
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
              <div class="card-footer text-muted text-center mt-2">
                <h6>
                  Already a member?
                  <a href="#" class="text-dark" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">Login Now</a>
                </h6>
              </div>
            </div>
        </div>
      </div>
    </div>

    

    <!-- LOGIN MODAL -->

    <div class="modal fade" id="loginModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card bg-light">
              <div class="card-header text-center">
                <h4>Account Login</h4>
              </div>
              <div class="card-body">
                  <form action="UserController" method="post">
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
                    class="btn btn-lg btn-outline-dark btn-block"
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

   
