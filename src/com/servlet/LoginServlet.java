package com.servlet;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.main.LoginMySQL;  
  
public class LoginServlet extends HttpServlet{  
  
    private static final long serialVersionUID = 1L;  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
  
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
          String user=request.getParameter("username");    
          String pass=request.getParameter("userpass");   
          
            HttpSession session = request.getSession(false);  
              if(session!=null) session.setAttribute("name", user); 
              if(session == null) {
            	  out.print("<h1><p style=\"color:red\">You do not have permission to this page!</p></h1>");    
                  RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");    
                  rd.include(request,response); 
              }
              
          // Security level 
             MessageDigest md = null;
			try {
				md = MessageDigest.getInstance("SHA-256");
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			 
              md.update(pass.getBytes());
               byte byteData[] = md.digest();
                   StringBuffer hexString = new StringBuffer();
    	                for (int i=0;i<byteData.length;i++) 
    	                   {
    		                      String hex=Integer.toHexString(0xff & byteData[i]);
   	     	                      if(hex.length()==1) hexString.append('0');
   	     	                      hexString.append(hex);
    	                   }
        
        if(LoginMySQL.validate(user, hexString.toString())){    
            RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");    
            rd.forward(request,response);    
        }    
          else   {    
                     out.print("<p style=\"color:red\">Sorry username or password error</p>");    
                     RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
                     rd.include(request,response);    
                 }    
  
        out.close();    
    }    
}   