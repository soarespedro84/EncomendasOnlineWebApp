<%-- 
    Document   : index
    Created on : 22 May 2020, 20:12:27
    Author     : psoar
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>
 
    <!-- CAROUSEL -->
    <section id="showcase" class="mt-5">
        
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!---<ol class="carousel-indicators">
          <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
          <li data-target="#myCarousel" data-slide-to="4"></li>
          <li data-target="#myCarousel" data-slide-to="5"></li>
        </ol>--->
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
            <div class="dark-overlay"></div>
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
   
