<%-- 
    Document   : login
    Created on : 27 de mai. de 2025, 21:06:48
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            
            
//            if (ctrlUser.logar(login, senha))
            
            if (login.equals("contato@alugae.com.br") && (senha.equals('123'))){
               session.setAttribute("autorizado", "1"); 
        %>       
        <script> window.location.href='menu.html'; </script>
        <%
            } else {
               session.setAttribute("autorizado", "0"); 
            }
            
        %>    
    </body>
</html>
