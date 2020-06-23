
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.dbConnection"%>
<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout.jsp"/>
<!DOCTYPE html>
<!-- HEADER  -->
<c:if test="${sessionScope.ContaAtiva == null}"><c:redirect url="index"/></c:if>

<style>
    .ui-widget {
        background-color: whitesmoke;
        align-content: center;
        margin-right: 60%;
        list-style-type: none;
    }
    
    .ui-menu-item a {        
        background-color: #fff;
        list-style-type: none;
    }
</style>


<header id="main-header" class="py-3 mt-5 bg-dark text-light">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center ">
                <h2>Order Cart</h2>
            </div>
        </div>
    </div>
</header>
              


<!-- ORDER ITEMS -->
<section id="clients" class="mb-5">
    <div class="" style="margin: 0 5%">
    <div class="row">
      <div class="col-md-12">
        <div class="card">

          <table class="table table-striped text-center">
            <thead class="bg-info text-white">
                <tr>
                    <th style="">Foto</th>
                    <th>Model</th>
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
                    <th>Total Qnt</th>
                    <th>Amount</th>
                    <th width="115"></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${lstItems}">   
            <form action="movement" method="POST">
                <input type="hidden" name="route" value="updateItemCart"/>
                <input type="hidden" name="idCart" value="${item.getIdItemCart().toString()}">
                <input type="hidden" name="idProduct" value="${item.getProduct().getIdProduct().toString()}">
                <tr>
                    <td>
                        <img style="max-width: 80px; height: 70px; object-fit: cover; object-position: bottom" src="images/produtos/${item.getProduct().getFoto()}" class="img-thumbnail card-img-top" alt="">
                    </td>
                    <td class="align-middle">${item.getProduct().getName()} <small class="text-muted">/ ${item.getProduct().getRef()}</small></td>
                <c:forEach var = "i" begin = "35" end = "48">
                    <td class="align-middle">
                        <input type='number' name="${i}" onchange="updateItemCart('${item.getProduct().getRef()}', ${item.getProduct().getPrice()})" class="${item.getProduct().getRef()}"
                            step="1" min="0" size=3 style='width:40px; text-align: center;'
                            value="<c:if test='${item.getQtdBySize(i) != null}'>${item.getQtdBySize(i).getQtd()}</c:if>"
                            <c:if test='${i < item.getProduct().getInitSize() || i > item.getProduct().getFinSize()}'>disabled</c:if>
                        />
                    </td>
                        
                </c:forEach>
                    <td class="align-middle" id="q${item.getProduct().getRef()}">${item.getQtdTotal()}</td>
                    <td class="align-middle" id="a${item.getProduct().getRef()}">${String.format("%.2f", item.getAmountTotal())} €</td>
                    <td class="align-middle">
                        <button type="submit" hidden="true" id="s${item.getProduct().getRef()}" class="btn btn-success" ><i class="far fa-save"></i></button>
                        <a href="movement?route=cart=${item.getIdItemCart().toString()}" hidden="true" id="c${item.getProduct().getRef()}" class="btn btn-warning" ><i class="far fa-window-close"></i></a>
                        <a href="#" id="d${item.getProduct().getRef()}" class="btn btn-danger" data-toggle="modal" data-target="#deleteItemModal"
                           onclick="deliteItemCart('${item.getProduct().getName()}', '${item.getIdItemCart().toString()}')">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </td>           
                </tr>
            </form>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>                       
    </div>
  </div>
</section>

<!-- ACTIONS -->     
<section id="actions mb-5 pb-5" onload="getCompanysSuggestion()">
 <div class="container" >
   <div class="row" >
     <div class="col-md-12">
         <div id="accordion">
             <a href="#confirmOrderCollapse" class="btn btn-lg btn-outline-info text-white btn-block" id="" data-parent="#accordion" data-toggle="collapse"><i class="fa fa-check"></i> Confirm</a>        
             <div id="confirmOrderCollapse" class="collapse my-3 text-dark">
             <form action="movement" method="POST">
               <input type="hidden" name="route" value="saveOrder"/>
               <div class="container">
                   <div class="row mb-3">
                       <div class="col-md-2">
                           <label for="delDate" class="text-light col-form-label align-middle"> <h4>Delivery Date:</h4></label></div>
                       <div class="col-md-2">
                       <div class="input-group">
                           <input name="dtDelivery" class="form-control form-control-lg" type="date" value="" id="delDate" required>
                       </div>
                           </div>
                       <div class="col-md-2">
                           <div class="input-group">
                               <input type="text" name="nrCliente" class="form-control form-control-lg" placeholder="Order number" required />
                           </div>
                       </div>
                       <c:if test="${ContaAtiva.permission > 1}">        
                       <div class="col-md-6">
                           <div class="input-group" >
                                <select class="form-control form-control-lg text-white bg-dark" id="" name="idCompany" >
                                    <option selected >Choose company</option>
                                    <c:forEach var="c" items="${companyList}">
                                    <option value="${c.getIdCompany().toString()}">${c.getCompanyName()}</option>
                                  </c:forEach>
                               </select> 
                               
                           </div>
                       </div>                        
                       </c:if>
                </div>
               <div class="row">
                   <div class="col-md-12">
                      <input type="submit" name="deleteYes" value="Place Order" class="btn btn-lg btn-outline-success btn-block" />
                   </div>
               </div>
            </div>
           </form>
           </div>
       </div>
     </div>
  </div>
</div>
</section>


<!-- DELETE USER MODAL -->
<div class="modal fade" id="deleteItemModal">
 <div class="modal-dialog modal-md">
   <div class="modal-content">
     <div class="card">
            <div class="card-header bg-danger text-center text-white"> 
                <h3 id ="deliteItemName">Delete NAME</h3>
            </div>
            <div class="card-body">                 
                <form action="movement" method="GET" >
                    <input type="hidden" name="route" value="deleteInCart"/>
                    <input id="deliteItemId" type="hidden" name="idCart" value="ID"/>
                    <div class="row my-3">
                        <div class="col-md-6">
                            <input type="submit" name="deleteYes" value="Confirm" class="btn btn-lg btn-outline-success btn-block" />
                        </div>
                        <div class="col-md-6">
                            <input type="button" data-dismiss="modal" value="Cancel" class="btn btn-lg btn-outline-danger btn-block" />
                        </div>
                   </div>
                </form>
            </div>             
        </div>
     </div>
   </div>
</div>