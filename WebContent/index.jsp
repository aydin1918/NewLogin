<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1"%>  
<html>  
<head>  
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Login</title>  
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/files/css/styles.css" />
</head>  
<body>  
  <div id="formContainer">
    <form action="loginServlet" id="login" method="post">  
            <input type="text" name="username" id="username" placeholder="username" required="required" /> 
            <input type="password" name="userpass" placeholder="password" id="password" required="required"/> 
                  <input type="submit" name="submit" value="Login" /> 
    </form> 
    
   </div>  
        
  	
</body>  
</html>