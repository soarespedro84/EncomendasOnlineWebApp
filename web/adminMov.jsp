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
  <section id="actions" class="py-4 m5-4">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <form action="adminMov.jsp" method="get">
                <div class="input-group">
                    <input type="date" name="dtMov" class="form-control form-control-lg"/>
                </div>
            </form>
          </div>
          <div class="col-md-9">
            <form action="adminMov.jsp" method="get">
              <div class="input-group">
                <input type="text" name="userSearch" class="form-control form-control-lg" placeholder="Company" />
                <button type="submit" class="btn btn-lg btn-outline-light"><i class="fas fa-search"></i></button>
              </div>
            </form>            
          </div>
          
       
      </div>
    </section>

    <!-- MOVEMENTS Table-->
    <section id="movement">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="card">              
              <table class="table table-striped text-center">
                <thead class=" bg-info">
                  <tr>
                    <th>Date</th>
                    <th>Type</th>
                    <th>Doc Ref</th>
                    <th>Qty</th>
                    <th>Value</th>
                    <th>Related</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="align-middle">10 de Maio 2020</td>
                    <td class="align-middle">Order</td>
                    <td class="align-middle">GR2020/12</td>
                    <td class="align-middle">950</td>
                    <td class="align-middle">31222.32 €</td>
                    <td class="align-middle">Enc_32</td>

                    <td class="align-middle">
                      <a href="movDetails.jsp" class="btn btn-info"
                        ><i class="fas fa-angle-double-right"></i> Details</a
                      >
                    </td>
                  </tr>                  
                  
                </tbody>
              </table>
            </div>
          </div>
            
  