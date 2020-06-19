<%-- 
    Document   : logout
    Created on : 16 May 2020, 18:15:49
    Author     : psoar
--%>

<%
session.removeAttribute("ContaAtiva");
/*session.removeAttribute("name");
session.removeAttribute("email");
session.removeAttribute("password");*/
session.invalidate();
response.sendRedirect("index.jsp");
%>
