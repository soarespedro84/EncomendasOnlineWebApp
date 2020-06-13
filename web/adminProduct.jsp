<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>

    <!-- HEADER  -->

    <header id="main-header" class="py-2 bg-dark text-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center ">
              
              <h2>Product Manager</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- ACTIONS -->

    <section id="actions" class="py-4 mb-4">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
                  <a
              href="#"
              class="btn btn-outline-light btn-lg btn-block"
              data-toggle="modal"
              data-target="#addProductModal"
              ><i class="fas fa-plus"></i> Add Product</a
                  ></div>
            <div class="col-md-9">
                <form action="adminProducts.jsp" method="get">
                <div class="input-group">


    <input type="text" name="userSearch" class="form-control form-control-lg" placeholder="Search" />
<button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
</div></form>            
          </div>
          
        </div>
      </div>
    </section>

    <!-- Products -->
    <section id="movement">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <table class="table table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>Ref</th>
                    <th>Model</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>                                        
                    <td>8A11.31</td>
                    <td>MODEL</td>
                    <td>Description of this product</td>
                    <td>59.99 €</td>
                    <td>
                      <a href="details.html" class="btn btn-secondary"
                        ><i class="fas fa-angle-double-right"></i> Details</a
                      >
                    </td>
                  </tr>
                  <tr>                    
                   <td>8A86.00</td>
                    <td>MODEL#02</td>
                    <td>Description of this product</td>
                    <td>69.99 €</td>
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
            
           
        </div>
      </div>
    </section>          

   
     <!-- Product MODAL -->

    <div class="modal fade" id="addProductModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="card bg-light">
              <div class="card-header text-center">
                <h4>New Product Form</h4>
              </div>
              <div class="card-body">
                  <form action="#" method="post" name="form" onsubmit="return formValidation()">
                  <div class="form-group">
                    <input
                      type="text"
                      name="ref"
                      placeholder="Reference"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="model"
                      placeholder="Model"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>                      
                  <div class="form-group">
                    <input
                      type="text"
                      name="color"
                      placeholder="Color"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="initSize"
                      placeholder="Min Size"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                    </div>
                   <div class="form-group"> 
                    <input
                      type="text"
                      name="initSize"
                      placeholder="Max Size"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="text"
                      name="description"
                      placeholder="Description"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>                      
                  <div class="form-group ">
                    <input
                      type="text"
                      name="price"
                      placeholder="Price"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <div class="form-group ">
                    <input
                      type="file"
                      name="image"
                      placeholder="Image"
                      class="form-control form-control-lg text-white bg-dark"
                    />
                  </div>
                  <input
                    type="submit"
                    value="Add Product"
                    class="btn btn-lg btn-outline-dark btn-block"
                  />
                </form>
              </div>
              <div class="card-footer text-muted text-center mt-2">
                
              </div>
            </div>
        </div>
      </div>
    </div>
    
  

