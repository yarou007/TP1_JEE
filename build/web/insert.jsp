<%-- 
    Document   : insert
    Created on : 15 oct. 2023, 18:06:45
    Author     : hammi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    int cin = 0;
    String nom =null;
     String prenom = null;
    if (    
   (request.getParameter("cin") )!=null &&
   (request.getParameter("nom") ) !=null && 
   (request.getParameter("prenom") ) !=null){
     cin = Integer.parseInt(request.getParameter("cin"));
     nom = request.getParameter("nom");
    prenom = request.getParameter("prenom");
    

    }
    else {
     out.println("Saisir les informations");
    }
  
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <form method="GET" action="insert.jsp" >
        <label>Cin : </label>
        <input type="text" name="cin" >
        <label>Nom : </label>
        <input type="text" name="nom" >
        <label>PreNom : </label>
        <input type="text" name="prenom" >
           <input type="submit" value="Envoyer"> 
    </form>
      <%  if (cin!=0 && nom!=null && prenom!=null)
      {
          try{
            Class.forName("com.mysql.cj.jdbc.Driver");
           // out.println("Driver exist successfully");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp_jdbc","root","manager");
            //out.println("Conenction successfully"); 
            Statement requete = c.createStatement(); // statement de requette besh nabda nekhdem beha 
            String sql = "insert into `user` values(?,?,?)";
            PreparedStatement pstm = c.prepareStatement(sql); // prepare statement 
            pstm.setInt(1,cin); // binding l argument '?' to properties 
            pstm.setString(2,nom);// binding l argument '?' to properties 
            pstm.setString(3,prenom);// binding l argument '?' to properties 
            int n = pstm.executeUpdate(); // mettre numbre colonne updated
            if (n!=0){out.println("Ajout avec succes");}
            else {out.println("Probleme dans la saisie");}
          }catch (ClassNotFoundException e) {
             out.println("Driver absent");
          } catch (SQLException ex) {
             out.println("Sql absent");
          }   

          }
      %>
      
    </body>
</html>
