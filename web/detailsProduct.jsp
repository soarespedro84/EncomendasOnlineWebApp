<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.dbConnection"%>
<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>
<c:if test="${sessionScope.ContaAtiva == null}"><c:redirect url="index"/></c:if>

    
    <header id="main-header" class="pt-3 mt-5 mb-3 bg-dark text-light">
      <div class="container">
        
     
          <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>${productToEdit.name} Details</h2>
              
          </div>
        </div>
      </div>
    </header>
              

     <div id="updateProduct">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
            
                <div class="card-body">                 
                    <form id="regForm" action="products" method="POST">
                    <input type="hidden" name="route" value="updateProduct"/>
                    <input type="hidden" name="idProduct" value="${productToEdit.idProduct}"/>
                        <div class="form-group">
                          <input type="text" name="ref" value="${productToEdit.ref}" class="form-control form-control-lg text-white bg-dark" />
                        </div>
                        <div class="form-group">
                          <input
                            type="text"
                            name="name"
                            value="${productToEdit.name}"
                            class="form-control form-control-lg text-white bg-dark" 
                          />
                        </div>
                        <div class="form-group">
                          <input
                            type="text"
                            name="description"
                            value="${productToEdit.description}"
                            class="form-control form-control-lg text-white bg-dark" 
                          />
                        </div>
                        <div class="form-group">
                          <input
                            type="text"
                            name="price"
                            value="${productToEdit.price}"
                            class="form-control form-control-lg text-white bg-dark" 
                          />
                        </div>
                    <div class="form-group">
                          <input
                            type="text"
                            name="color"
                            value="${productToEdit.color}"
                            class="form-control form-control-lg text-white bg-dark" 
                          /> 
                        </div>
                    <div class="form-group">
                          <input
                            type="text"
                            name="initSize"
                            value="${productToEdit.initSize}"
                            class="form-control form-control-lg text-white bg-dark" 
                          /> 
                        </div>
                    <div class="form-group">
                          <input
                            type="text"
                            name="finSize"
                            value="${productToEdit.finSize}"
                            class="form-control form-control-lg text-white bg-dark" 
                          /> 
                        </div>
                    <div class="form-group">
                          <input
                            type="file"
                            name="photo"
                            value="${productToEdit.foto}"
                            id="photo"
                            accept="image/*"
                            class="form-control form-control-lg text-white bg-dark" hidden
                          />
                        
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-lg btn-info btn-block" >Update</button>
                        <a data-toggle="modal" data-target="#deleteProductModal" class="btn btn-lg btn-info text-white btn-block">Delete</a>
                    </div>
               </form>
               </div>
             
           </div>
          </div>
        </div>
      </div>                    

    
    
    
  
<!-- DELETE Product MODAL -->
     <div class="modal fade" id="deleteProductModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card">
              <div class="card-header bg-danger text-center text-white"> 
                  <h3>Delete ${productToEdit.name}?</h3>
              </div>
                <div class="card-body">                 
                    <form action="products" method="post" >
                    <input type="hidden" name="route" value="deleteProduct"/>
                    <input type="hidden" name="idProduct" value="${productToEdit.idProduct}"/>
                  <div class="row my-3">
                   <div class="col-md-6">
                <input
                    type="submit"
                    name="deleteYes"
                    value="Confirm"
                    class="btn btn-lg btn-outline-success btn-block"
                  />                </div>
                <div class="col-md-6">
                <input
                    type="button"
                    data-dismiss="modal"
                    value="Cancel"
                    class="btn btn-lg btn-outline-danger btn-block"
                  />                </div>
               </div>
               </form>
               </div>             
           </div>
          </div>
        </div>
      </div>