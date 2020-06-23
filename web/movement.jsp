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
              
              <h2>Movements</h2>
              
          </div>
        </div>
      </div>
    </header>
              
    <!-- ACTIONS -->

    <section id="actions" class="py-2 mb-3">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="col-md-9">
                <div class="input-group">
                    <input id="productListSearch" onkeyup="productSearch()" type="text" name="productListSearch" class="form-control form-control-lg" placeholder="Fill in some value to search">
                    <button id="productListClera" onclick="productSearchClear()" class="btn btn-lg btn-outline-light" hidden="true" ><i class="fas fa-eraser"></i></button>
                </div>
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
                                 <h5>Number</h5>
                             </div>
                             <div class="col-md-2">
                                 <h5>Items</h5>
                             </div>
                             <div class="col-md-2">
                                 <h5>Price</h5>
                             </div>
                                 <div class="col-md-3">
                                 <h5>User</h5>
                             </div>
                         </div>
                     </div>
                      
                      <c:forEach var="item" items="${lstItems}">
                         <c:url var="tempLink" value="products">
                            <c:param name="route" value="GetProduct" />
                            <c:param name="idProduct" value="${item.idOrder}" />
                         </c:url>
                        <a href="#${item.getIdProduct()}" id="productListContente" data-parent="#accordion" data-toggle="collapse">
                            <div class="card-body bg-light text-dark " >
                                <div class="row text-center">
                                    <div class="col-md-3">
                                        <h5>${item.getRef()}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.getName()}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.getDescription()}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${item.getPrice()} €</h5>
                                    </div>
                                     <div class="col-md-3">
                                        <h5>${item.getUser().getName()} €</h5>
                                    </div>
                                </div>
                            </div>
                        </a>
                            <div id="${item.getIdProduct()}" class="collapse row mb-3 text-dark">
                              <div class="row text-center">
                                <div class="col-md-3">
                                    <h5>Date</h5>
                                </div>
                                <div class="col-md-2">
                                    <h5>Number</h5>
                                </div>
                                <div class="col-md-2">
                                    <h5>Items</h5>
                                </div>
                                <div class="col-md-2">
                                    <h5>Price</h5>
                                </div>
                                    <div class="col-md-3">
                                    <h5>User</h5>
                                </div>
                              </div>
                              <c:forEach var="item" items="${lstItems}">
                                <c:url var="tempLink" value="products">
                                    <c:param name="route" value="GetProduct" />
                                    <c:param name="idProduct" value="${item.idOrder}" />
                                </c:url>
                          
                                <div class="card-body bg-light text-dark " >
                                      <div class="row text-center">
                                          <div class="col-md-3">
                                              <h5>${item.getRef()}</h5>
                                          </div>
                                          <div class="col-md-2">
                                              <h5>${item.getName()}</h5>
                                          </div>
                                          <div class="col-md-2">
                                              <h5>${item.getDescription()}</h5>
                                          </div>
                                          <div class="col-md-2">
                                              <h5>${item.getPrice()} €</h5>
                                          </div>
                                           <div class="col-md-3">
                                              <h5>${item.getUser().getName()} €</h5>
                                          </div>
                                      </div>
                                  </div>
                             </c:forEach>
                            </div>
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