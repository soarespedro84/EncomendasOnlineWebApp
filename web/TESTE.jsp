
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
</style>

<script type="text/javascript">
    
    $(document).ready(function (){
        /*$.ajax({
            type: 'GET',
            url: "ProductController?route=GetProductForOrder&idProduct=1" //+ idProduct,
            headers: {
                Accept : "application/json; charset=utf-8",
                "Content-Type" : "application/json; charset=utf-8"
            },
            success: function (result) {
                var product = $.parseJSON(result);
                alert(product.getName());
            }

        });*/
        
        $.ajax({
            url : "ProductController?route=GetProductForOrder",
            dataType : 'json',
            error : function() {
                alert("Error Occured");
            },
            success : function(data) {
                var receivedData = [];

                $.each(data.jsonArray, function(index) {
                    $.each(data.jsonArray[index], function(key, value) {
                        var point = [];

                            point.push(key);
                            point.push(value);
                            receivedData.push(point);

                        }); 
                });
            }
        });
    });
    
    function buyProduct(var idProduct) { 
    }
</script>
    
<header id="main-header" class="py-2 bg-dark text-light">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center ">

          <h2>TESTE</h2>

      </div>
    </div>
  </div>
</header>

<!-- ACTIONS -->

<!-- Search bar -->
<section id="actions" class="py-4 mb-4">
  <div class="container">
    <div class="row">          
        <div class="col-md-12">
            <form action="adminUsers.jsp" method="get">
                <div class="input-group">
                    <input type="text" name="userSearch" class="form-control form-control-lg" placeholder="Search" />
                    <button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
                </div>
            </form>            
        </div>          
    </div>
  </div>
</section>

<!-- Table -->
<section id="userList">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">

          <table class="table table-striped text-center">
            <thead class="thead-dark">
              <tr>
                <th>Name</th>
                <th></th>
              </tr>
            </thead>               
            <tbody>
                 <c:forEach var="item" items="${lstProduct}">
                <tr>
                    <td>${item.name}</td>             
                    <td>
                        <a class="btn btn-lg btn-block btn-outline-secondary" href="#" onclick="buyProduct(${item.getIdProduct().toString()})" data-toggle="modal" data-target="#productModal">TESTE JSON</a>
                    </td>
                </tr>  
                </c:forEach>
            </tbody>
          </table>
        </div>
      </div>                       
    </div>
  </div>
</section>

<!--MODALS-->
<!-- Product Modal -->          
<div class="modal fade" id="productModal">
    <div class="modal-dialog modal-lg">
      <div id='buyProductResult' class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Product Details</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="card bg-light">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <img class="img img-fluid" src="images/produtos/8B1123.jpg"/>
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
                                    <th>35</th>
                                    <th>36</th>
                                    <th>37</th>
                                    <th>38</th>
                                    <th>39</th>
                                    <th>40</th>                                    
                                    <th>41</th>
                                    <th>42</th>
                                    <th>43</th>
                                    <th>44</th>
                                    <th>45</th>
                                    <th>46</th>
                                    <th>47</th>
                                    <th>48</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type='number' name='35' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='36' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='37' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='38' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='39' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='40' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='41' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='42' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='43' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='44' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='45' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='46' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='47' style='width:40px; text-align: center;' /></td>
                                    <td><input type='number' name='48' style='width:40px; text-align: center;' /></td>
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