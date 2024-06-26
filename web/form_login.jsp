<%-- 
    Document   : form_login
    Created on : 22/10/2023, 21:35:36
    Author     : Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo/_main.css">
    <link rel="stylesheet" href="estilo/_login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Archivio Culturale</title>
</head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo/_main.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Archivio Culturale</title>
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

    <main class="login-content center">
        <section class="login-section">

            <img class="logo" src="imagens/logo.svg" alt="logo">

            <form class="login-fields" action="gerenciar_acesso.do" method="POST">
                <div class="field">

                    <label for="login">Usuario</label>
                    <input 
                        class="username"
                        type="text"
                        name="nome"
                        placeholder="Usuário"
                        id="login"
                        value=""
                        required 
                        autocomplete="off"
                    >

                </div>

                <div class="field">

                    <label for="senha">Senha</label>
                    <input 
                        class="password"
                        type="password"
                        name="senha"
                        placeholder="Senha"
                        id="senha"
                        value=""
                        required 
                        autocomplete="off"
                    >

                </div>

                <div class="btn-container">
                    <input type="submit" value="Entrar" class="login-btn" >
                    
                    <a href="form_bibliotecario.jsp" class="login-btn">Cadastrar</a>
                </div>

            </form>
        
        </section>
    
        <div class="banner-content">
            <img class="banner" src="https://images.unsplash.com/photo-1470790376778-a9fbc86d70e2?q=80&w=1904&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="banner-login">
            <div class="banner-text">
                <h1>Bem-vindo</h1>
                <p>
                    Entre com suas informações de login
                </p>
            </div>
        </div>
    </main>
</body>
</html>