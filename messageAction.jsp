<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!DOCTYPE html>
<%

String name=request.getParameter("name");
String email=request.getParameter("email");
String subject=request.getParameter("subject");
String message=request.getParameter("message");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "");
           PreparedStatement ps=con.prepareStatement("insert into message(name,email,subject,message)values(?,?,?,?)");
           ps.setString(1, name);
           ps.setString(2, email);
           ps.setString(3, subject);
           ps.setString(4, message);
           ps.executeUpdate();
           response.sendRedirect("index.html");
                
        } catch(Exception e)
        {
            System.out.println(e);
            response.sendRedirect("index.html");
          
        }        
       
%>