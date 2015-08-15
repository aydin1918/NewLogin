<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your notes</title>
   <style>
      #logout{
         margin-left: 50px;
      }
   </style>
</head>
<body>
      
         
   <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/aydin_cloud"
     user="root"  password=""/>
 
      <sql:query dataSource="${snapshot}" var="result">
          SELECT ID,username,text,dt FROM aydin_cloud.Notes WHERE username='<%=session.getAttribute("name")%>';
      </sql:query>
      
      <table border="1" width="100%">
         <tr>
             <th>ID</th>
             <th>Username</th>
             <th>Note</th>
             <th>Date</th>
        </tr>
           <c:forEach var="row" items="${result.rows}">
               <tr>
                     <td><c:out value="${row.ID}"/></td>
                     <td><c:out value="${row.username}"/></td>
                     <td><c:out value="${row.text}"/></td>
                     <td><c:out value="${row.dt}"/></td>
              </tr>
          </c:forEach>
     </table>
     
</body>
</html>