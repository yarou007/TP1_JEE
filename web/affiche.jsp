<%-- 
    Document   : newjsp
    Created on : 11 oct. 2023, 10:18:31
    Author     : hammi
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    <body>
        <table border="1" style="width: 100%">
            <tr>
                <td>CIN</td>
                <td>Name</td><!-- comment -->
                <td>LastName</td>
            </tr>
<%
            
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
           // out.println("Driver exist successfully");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp_jdbc","root","manager");
            //out.println("Conenction successfully"); 
            Statement requete = c.createStatement();
            ResultSet res = requete.executeQuery("select * from user");
            while (res.next()){
            %>
             <tr>
                <td><%=res.getString("cin")%></td>
                <td><%=res.getString("nom")%></td><!-- comment -->
                <td><%=res.getString("prenom")%></td>
            </tr>
            <%
           }
            
           } catch (Exception e) {
         e.printStackTrace();
       }
            %>    
       </table>
        
    </body>
</html>
