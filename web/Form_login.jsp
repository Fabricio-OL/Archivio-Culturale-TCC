<%-- 
    Document   : form_login
    Created on : 22/10/2023, 21:35:36
    Author     : Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1,
              user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="estilos/menu.css" type="text/css"/>
    </head>
    <body>

        <%
            String mensagem = (String) request.getSession().getAttribute("mensagem");
            if (mensagem != null) {
                request.getSession().removeAttribute("mensagem");

        %>
        <div class="alert alert-info"><%=mensagem%></div>
        <%

            }

        %>
        <section class="area-login">
            <div class="login">
                <div>
                    <img src="imagens/odontoestoquelogo.svg">
                </div>

                <h1> Seja bem-vindo ! </h1>               

                <form action="gerenciar_login.do" method="POST">

                    <!-- Nome do usuário  -->                       
                    <input class="logins" type="text" name="login" placeholder="Login" id="login" value="" required="" autocomplete="off">

                    <!-- Senha do usuário  -->  
                    <input  class="logins" type="password" name="senha" placeholder="Senha" id="senha" value="" required="" autocomplete="off">

                    <!-- Entrar  --> 
                    <input type="submit" value="entrar">  
                </form>
            </div>      
        </section>                             
    </body>
</html>
