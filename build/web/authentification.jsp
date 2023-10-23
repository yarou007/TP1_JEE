<%-- 
    Document   : authentification
    Created on : 23 oct. 2023, 22:53:26
    Author     : hammi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    

    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <fieldset>
             <legend>Authentification</legend>
             <form method="POST" action="authentification.jsp">
                 <label>Utilisateur: </label>
                 <input type="text" name="login">
                  <label>Mot de passe: </label>
                 <input type="text" name="password">
                 <br>
                 <br>
                 <input type="submit" value="Connexion"> 
            </form>
             <% 
   if         
         (login!=null && password != null){
            try{
                 Class.forName("com.mysql.cj.jdbc.Driver");
                  Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp_jdbc","root","manager");
                   Statement requete = c.createStatement(); 
                  String sql = "select * from auth where login=? and password=?";
                  PreparedStatement preparedStatement = c.prepareStatement(sql);

                  preparedStatement.setString(1, login);
                  preparedStatement.setString(2, password);
                  ResultSet res = preparedStatement.executeQuery();

                  if (res.next()){
                  request.setAttribute("login",res.getString("login"));
                  request.setAttribute("password",res.getString("password"));
                 %>
                   <jsp:forward page="accueil.jsp">
                      <jsp:param name="login" value="login"/>
                  </jsp:forward>
               
                 <%
                 }
                 else {
                     out.println("Authentification echoué");
                 }
           
          }catch (ClassNotFoundException e) {
             out.println("Driver absent");
          } catch (SQLException ex) {
             out.println(ex.getMessage());
          } 
}

            %>
           
           
        </fieldset>
    </body>
</html>
