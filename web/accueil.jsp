<%-- 
    Document   : accueil
    Created on : 23 oct. 2023, 23:20:48
    Author     : hammi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenue <%= request.getAttribute("login") %> </h1>
    </body>
</html>
