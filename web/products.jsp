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

    
