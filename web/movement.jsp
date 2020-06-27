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
        <div class="row mb-3">
          <div class="col-md-12 ">
            <div class="input-group">
                <input id="productListSearch" onkeyup="productSearch()" type="text" name="productListSearch" class="form-control form-control-lg" placeholder="Fill in some value to search">
                <button id="productListClera" onclick="productSearchClear()" class="btn btn-lg btn-outline-light" hidden="true" ><i class="fas fa-eraser"></i></button>
            </div>             
          </div>
        </div>
        <div class="row">
       
        <c:if test="${ContaAtiva.permission > 1}">
          <div class="col-md-12">
            <form action="movement" method="POST" >
                <input type="hidden" name="route" value="listOrder"/>                
                    <div class="input-group" >
                        <div class="col-md-8">
                            <select class="form-control form-control-lg text-white bg-dark" id="" name="idCompany" >
                                <option selected >Choose company</option>
                                <c:forEach var="c" items="${companyList}">
                                <option value="${c.getIdCompany().toString()}">${c.getCompanyName()}</option>
                                </c:forEach>
                            </select> 
                        </div>
                        <div class="col-md-4">                    
                            <input type="submit" name="" value="Select" class="btn btn-lg btn-outline-info btn-block" />
                        </div>
                    </div>
            </form>
          </div>
        </c:if>
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
                             <div class="col-md-2">
                                 <h5>Order Date</h5>
                             </div>                             
                             <div class="col-md-2">
                                 <h5>Ref</h5>
                             </div>                            
                             <div class="col-md-2">
                                 <h5>Delivery Date</h5>
                             </div>
                            <div class="col-md-2">
                                 <h5>Company</h5>
                             </div>                             
                             <div class="col-md-2">
                                 <h5>Ordered By</h5>
                             </div>
                              <div class="col-md-2">
                                 <h5>Total</h5>
                             </div>
                         </div>
                     </div>
                      
                      <c:forEach var="ordItem" items="${orderList}">
                         <c:url var="tempLink" value="products">
                            <c:param name="route" value="GetProduct" />
                            <c:param name="idMovement" value="${ordItem.getLstItems()}" />
                         </c:url>
                         
                        <a href="#${ordItem.idMovement}" id="productListContente" data-parent="#accordion" data-toggle="collapse">
                            <div class="card-body bg-light text-dark " >
                                <div class="row text-center">
                                    <div class="col-md-2">
                                        <h5>${ordItem.dtReg.toLocalDate()}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${ordItem.nrCliente}</h5>
                                    </div>                                    
                                    <div class="col-md-2">
                                        <h5>${ordItem.dtDelivery}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${ordItem.user.company.companyName}</h5>
                                    </div>
                                     <div class="col-md-2">
                                        <h5>${ordItem.user.name}</h5>
                                    </div>
                                    <div class="col-md-2">
                                        <h5>${String.format("%.2f", ordItem.totalAmount)} €</h5>
                                    </div>
                                </div>
                            </div>
                            <div id="${ordItem.idMovement}" class="collapse card-body bg-light text-dark text-center">
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
                                    <div class="col-md-4">
                                        <h5>Sizes</h5>
                                    </div>
                                    <div class="col-md-1">
                                        <h5>Qty</h5>
                                    </div>
                                     <div class="col-md-2">
                                        <h5>Total Price</h5>
                                    </div>
                                    
                                     
                                 </div>
                                <c:forEach var="item" items="${ordItem.getLstItems()}">
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
                                    <div class="col-md-4">
                                        <h5> <c:forEach var="sizeItem" items="${item.getLstSizes()}"><span>${sizeItem.size}</span><span>, </span></c:forEach></h5>
                                    </div>  
                                    <div class="col-md-1">
                                        <h5>${item.getQtdTotal()}</h5>
                                    </div>                                    
                                     <div class="col-md-2">
                                        <h5>€ ${String.format("%.2f", item.getAmountTotal())}</h5>
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