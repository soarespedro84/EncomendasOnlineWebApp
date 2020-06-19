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

    <header id="main-header" class="py-3 mt-5  bg-dark text-light">
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
                <form action="products" method="get">
                  <input type="hidden" name="route" value="SEARCH"/>
                <div class="input-group">
                    <input type="text" name="productSearch" class="form-control form-control-lg" placeholder="Search" />
                <button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
                </div>
                </form>            
          </div>
          
        </div>
      </div>
    </section>

    <!-- Products -->
    <section id="productList mb-5 pb-5">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
              <div id="accordion">
                  <div class="card text-dark">
                   <div class="card-header bg-secondary text-white">
                        <div class="row text-center">
                        <div class="col-md-2">
                            <h5>Ref</h5>
                        </div>
                        <div class="col-md-2">
                            <h5>Name</h5>
                        </div>
                        <div class="col-md-7">
                            <h5>Description</h5>
                        </div>
                        <div class="col-md-1">
                            <h5>Price</h5>
                        </div>
                        </div>
                    </div>
                      <c:forEach var="item" items="${lstProduct}">
                         <c:url var="tempLink" value="products">
                            <c:param name="route" value="GetProduct" />
                            <c:param name="idProduct" value="${item.idProduct}" />
                         </c:url>
                          <a href="#${item.getIdProduct()}" id="prodListCollapse" data-parent="#accordion" data-toggle="collapse">
                          <div class="card-body bg-light text-dark ">
                                <div class="row text-center">
                                    <div class="col-md-2">
                                        <h5>${item.getRef()}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.getName()}</h5>
                                    </div>
                                    <div class="col-md-7">
                                        <h5>${item.getDescription()}</h5>
                                    </div>
                                    <div class="col-md-1">
                                        <h5>${item.getPrice()} €</h5>
                                    </div>
                                </div>
                            </div>
                            <div id="${item.getIdProduct()}" class="collapse row mb-3 text-dark">
                                <div class="col-md-4">
                                    <img id="foto" style="max-width: 80%; height: 250px; object-fit: cover; object-position: bottom;" class="img img-fluid" src="images/produtos/${item.getFoto()}"/>
                                </div>
                                <div class="col-md-8">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th scope="row">Ref</th>
                                                <td colspan="3" id="ref">${item.getRef()}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Model</th>
                                                <td colspan="3"  id="name">${item.getName()}</td>                    
                                            </tr>
                                            <tr>
                                                <th scope="row">Color</th>
                                                <td colspan="3"  id="color">${item.getColor()}</td>                    
                                            </tr>
                                            <tr>
                                                <th scope="row">Description</th>
                                                <td colspan="3"  id="desc">${item.getDescription()}</td>
                                            </tr>                
                                            <tr>
                                                <th scope="row">Price</th>
                                                <td colspan="3"  id="price">${item.getPrice()}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Sizes</th>
                                                <td colspan="2"  id="price">${item.getInitSize()} - ${item.getFinSize()}</td>
                                                <td colspan="1"  id="price"><a href="#" class="btn btn-secondary btn-block text-white" id="editProduct">EDIT</a></td>

                                            </tr>
                                            
                                            <tr>
                                              
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>           
                            </div>
                        </a>
                      </c:forEach>
              </div>
             </div>
          </div>
        </div>
      </div>
    </section>
            
            
                    
                    
                        
                      
   

      <!-- Product Collapse -->          
<
  
<script type="text/javascript">
//Buscar produto
    function getProduct(idProduct){
        
        //AJAX configure
        var processData = 'JSON';
        var route = "GetProduct";
        $.ajax({  
            type: "GET",  
            url: "products",  
            data: "route="+route+"&idProduct="+idProduct+"&processData="+processData,  
            success: function(result){
                //alert(result.name);
                
                var m = new Model(result);
                //alert("Modelo: "+m.name);
                
                showProduct(m);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert("Error status code: "+xhr.status);
                alert("Error details: "+ thrownError);
            }
        });
    }    
// Preencher formulário
    function showProduct(model){
        // window.alert("Classe: "+model.ref);
        $("#ref").text(model.ref);
        $("#name").text(model.name);
        $("#color").text(model.color);
        $("#desc").text(model.desc);
        $("#price").text(model.price);        
        $("#foto").attr("src","images/produtos/"+model.foto);
        idProduct = model.idProduct;
        
        // Limapr tabela dos tamanhos
        $("#tHead").children('th').remove();        
        $("#tBody").children('td').remove();
        
        // Preencher tabela dos tamanhos
        for(i = Number(model.init); i <= Number(model.fin); i++){
            $("#tHead").append('<th>'+i+'</th>');
            $("#tBody").append("<td><input type='number' name='"+i+"' style='width:50px; text-align: center;' /></td>");
        }
    }
</script>