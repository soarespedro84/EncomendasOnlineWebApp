<%-- 
    Document   : tttttttttttt
    Created on : 16/jun/2020, 22:06:02
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
    
        
    function passDataUsingJQueryAJAXInJSON()
    {
        var firstName = $("#firstName").val();
        var LastName = $("#lastName").val(); 
        var processData = 'JSON'; 
          $.ajax({  
            type: "GET",  
            url: "JS",  
            data: "firstName="+firstName+"&lastName="
                    +LastName+"&processData="+processData,  
            success: function(result){
              var firstName = result.firstName;
              var lastName = result.lastName;
              alert("First Name: "+ firstName+"  Last Name: "
                      +lastName);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert("Error status code: "+xhr.status);
                alert("Error details: "+ thrownError);
            }
          }); 

    }
        

</script>
</head>
<body>

First Name: <input type="text" value="" id="firstName"><br>
Last Name: <input type="text" value="" id="lastName"><br><br>

<input type="Submit" value="Process JSON data AJAX" 
            onclick="passDataUsingJQueryAJAXInJSON();">

</body>
</html>