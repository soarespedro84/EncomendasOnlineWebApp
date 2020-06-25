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

    <header id="main-header" class="py-3 mt-5 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>Movement Manager</h2>
              
          </div>
        </div>
      </div>
    </header>
              
  <!-- ACTIONS -->

    <section id="actions" class="py-2 mb-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="input-group">
                <input id="productListSearch" onkeyup="productSearch()" type="text" name="productListSearch" class="form-control form-control-lg" placeholder="Fill in some value to search">
                <button id="productListClera" onclick="productSearchClear()" class="btn btn-lg btn-outline-light" hidden="true" ><i class="fas fa-eraser"></i></button>
            </div>             
        </div>
      </div>
    </section>

    <!-- Movements -->
    <section id="movementList mb-5 pb-5">
      <div class="container">
        <div class="row" >
          <div class="col-md-12">
              <div id="accordion">
                  <div class="card text-dark">
                    <div class="card-header bg-info text-white">
                         <div class="row text-center">
                             <div class="col-md-3">
                                 <h5>Date</h5>
                             </div>                             
                             <div class="col-md-2">
                                 <h5>Order Number</h5>
                             </div>
                             <div class="col-md-2">
                                 <h5>Client</h5>
                             </div>
                             <div class="col-md-2">
                                 <h5>Delivery Date</h5>
                             </div>                             
                             <div class="col-md-3">
                                 <h5>Ordered By</h5>
                             </div>
                         </div>
                     </div>
                      
                      <c:forEach var="item" items="${orderList}">
                         <c:url var="tempLink" value="products">
                            <c:param name="route" value="GetProduct" />
                            <c:param name="idMovement" value="${item.getLstItems()}" />
                         </c:url>
                         
                        <a href="#${item.idMovement}" id="productListContente" data-parent="#accordion" data-toggle="collapse">
                            <div class="card-body bg-light text-dark " >
                                <div class="row text-center">
                                    <div class="col-md-3">
                                        <h5>${item.dtReg}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.nrCliente}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.user.company.companyName}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.dtDelivery}</h5>
                                    </div>
                                     <div class="col-md-3">
                                        <h5>${item.user.name}</h5>
                                    </div>
                                </div>
                            </div>
                                        <div id="${item.idMovement}" class="collapse card-body bg-light text-dark text-center">
                                <div class="row bg-dark text-light">                                    
                                    <div class="col-md-2">
                                        <h5>Ref</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>Model</h5>
                                    </div>
                                    <div class="col-md-1">
                                        <h5>€/Uni</h5>
                                    </div>
                                    <div class="col-md-1">
                                        <h5>Qty</h5>
                                    </div>
                                     <div class="col-md-2">
                                        <h5>Total Price</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>Sizes</h5>
                                    </div>
                                     
                                 </div>
                                <c:forEach var="item" items="${item.getLstItems()}">
                                 <div class="row bg-secondary text-white"  style="font-size: 16px">
                                     <div class="col-md-2">
                                        <h5>${item.product.ref} </h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.product.name} </h5>
                                    </div>
                                    <div class="col-md-1">
                                        <h5>€ ${item.product.price}</h5>
                                    </div>
                                    <div class="col-md-1">
                                        <h5>${item.getQtdTotal()}</h5>
                                    </div>                                    
                                     <div class="col-md-2">
                                        <h5>€ ${String.format("%.2f", item.getAmountTotal())}</h5>
                                    </div>                                    
                                    <div class="col-md-4">
                                        <h5> <c:forEach var="item" items="${item.getLstSizes()}"><span>${item.size}</span><span>, </span></c:forEach></h5>
                                    </div>                                                                         
                                 </div>
                                </c:forEach>                                
                            </div>                                                                            
                        </a>                                                                  
                      </c:forEach>
                    </div>
             </div>
          </div>
        </div>
      </div>
    </section>
            
            
                    
                    
                        
                      
   
