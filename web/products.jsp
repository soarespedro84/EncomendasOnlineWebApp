<%-- 
    Document   : login
    Created on : 8 May 2020, 22:21:55
    Author     : psoar
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.dbConnection"%>
<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>

<style>
    input[type=number]::-webkit-inner-spin-button, 
    input[type=number]::-webkit-outer-spin-button { 
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        margin: 0;
    }
    
    #productModal .modal-content{
        width: 150%;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, 0%);
    }
    
    #productModal {
        
    }
</style>

<script type="text/javascript">
    
    //Variavel global
    var idProduct;
    
    // JSON to Model decoder
    function Model(obj) {
        for(var prop in obj){
            this[prop] = obj[prop];
        }
    }
    
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
    
    // Encomendar produto
    $(document).on("click", "#addToCart", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
        //alert(idProduct);
        //alert($("input[name=40]").val());
        
        $.ajax({
            type: "POST",
            url: "JS",
            data:{"route":"addToCart",
                  "idProduct":idProduct,
                  "35":$("input[name=35]").val(),
                  "36":$("input[name=36]").val(),
                  "37":$("input[name=37]").val(),
                  "38":$("input[name=38]").val(),
                  "39":$("input[name=39]").val(),
                  "40":$("input[name=40]").val(),
                  "41":$("input[name=41]").val(),
                  "42":$("input[name=42]").val(),
                  "43":$("input[name=43]").val(),
                  "44":$("input[name=44]").val(),
                  "45":$("input[name=45]").val(),
                  "46":$("input[name=46]").val(),
                  "47":$("input[name=47]").val(),
                  "48":$("input[name=48]").val(),
                },
            success: function(result){
                alert("OK: " + result.route + " " + result.idProduct);
            },
            error:function(error){
                console.log("error",error);
            },
         });
    });
</script>

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
    
    <section id="products mb-5">        
        <div class="container">
            <div class="card-deck mb-3 text-center">
                <c:forEach var="item" items="${lstProduct}">
                    <div class="col-md-4">
                        <div class="card border-light text-center bg-white text-dark mb-3">
                            <div class="card-header">
                                <h4 class="card-title pricing-card-title">${item.getName()} <small class="text-muted">/ ${item.getRef()}</small></h4>
                            </div>
                            <img style="height: 250px; object-fit: cover; object-position: bottom;" src="images/produtos/${item.getFoto()}" class="img-thumbnail card-img-top" alt="">
                            <div class="card-body">
                                <p class="card-text align-middel left">${item.getColor()} ${item.getDescription()}</p>                                
                            <c:if test="${ContaAtiva.permission >= 1}">
                                <a class="btn btn-lg btn-block btn-outline-secondary" onclick="getProduct('${item.getIdProduct().toString()}')" href="#" data-toggle="modal" data-target="#productModal">Order</a>
                           </c:if>
                                <br>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <small class="text-muted">Size: ${item.getInitSize()} - ${item.getFinSize()}</small>
                                    </div>
                                <c:if test="${ContaAtiva.permission >= 1}">
                                    <small class="text-muted">Price: ${item.getPrice()}0 €</small>
                                </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

    </section>        
              
  
   
<!--MODALS-->
<!-- Product Modal -->          
<div class="modal fade" id="productModal" style="with">
    <div class="modal-dialog modal-lg">
      <div id='buyProductResult' class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Product Details</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="card bg-light">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <img id="foto" style="max-width: 80%; height: 300px; object-fit: cover; object-position: bottom;" class="img img-fluid" src="images/produtos/8B1123.jpg"/>
                        </div>
                        <div class="col-md-8">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">Ref</th>
                                        <td colspan="3" id="ref">8A86.00</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Model</th>
                                        <td colspan="3"  id="name">MODEL#02</td>                    
                                    </tr>
                                    <tr>
                                        <th scope="row">Color</th>
                                        <td colspan="3"  id="color">Black</td>                    
                                    </tr>
                                    <tr>
                                        <th scope="row">Description</th>
                                        <td colspan="3"  id="desc">Description of this product</td>
                                    </tr>                
                                    <tr>
                                        <th scope="row">Price</th>
                                        <td colspan="3"  id="price">€ 59.99</td>
                                    </tr>
                                </tbody>
                            </table>
                            <p>TOTAL: <b>Qtd:</b> 0 pares | <b>Qtd:</b> 0 €</p>
                            <div class="row mb-3 m-auto">
                                <div class="col-md-6">
                                    
                                </div>
                                <div class="col-md-6"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped text-center">
                            <thead class="thead-dark">
                                <tr id="tHead">
                                    <th>40</th>     
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="tBody" >
                                    <td><input type='number' name='40' style='width:40px; text-align: center;' /></td>
                                </tr>                  
                            </tbody>
                        </table>
                    </div>
                    <div class="row mb-3 m-auto">
                        <div class="col-md-3"> </div>
                        <div class="col-md-3">
                            <a class="btn btn-dark btn-block btn-outline-dark btn-block" href="#" data-dismiss="modal" aria-hidden="true">Cancel</a>
                        </div>
                        <div class="col-md-3">
                            <a id="addToCart" onclick="" class="btn btn-dark btn-block btn-outline-dark btn-block" href="#" data-dismiss="modal" aria-hidden="true">Add to Cart</a>
                        </div>
                        <div class="col-md-3"> </div>
                    </div>
                    
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
  