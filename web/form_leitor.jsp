<%-- 
    Document   : form_leitor
    Created on : May 21, 2024, 8:53:43 PM
    Author     : Fabricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilo/_main.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Archivio Culturale</title>
    </head>
<body> 
    <section class="section">
    <%@include file="menu.jsp" %>
    <main class="content form">

        <h1>Adicionar/Atualizar Leitor</h1>

        <form method="post" action="gerenciar_leitor.do">
            <input 
                value="${leitor.idLeitor}"
                name="idLeitor" 
                type="hidden" 
                />

            <label for="nome">Nome</label>
            <input 
                value="${leitor.nome}"
                name="nome" 
                id="nome" 
                type="text"
                placeholder="Insira Nome. Ex. Ana da Silva"
                />

            <label for="cpf">CPF</label>
            <input 
                value="${leitor.cpf}"
                name="cpf" 
                id="cpf" 
                type="text"
                placeholder="Insira CPF. Ex. 123-456-789-10"
                />

            <label for="dataNascimento">Data de Nascimento</label>

            <input
                value="${leitor.dn}"
                name="dn" 
                id="dataNascimento" 
                type="date"
                placeholder="Insira Data de Nascimento"
                />

            <label for="endereco">Endereço</label>
            <input 
                value="${leitor.end}"
                name="end" 
                id="endereco" 
                type="text"
                placeholder="Insira Endereço. Ex. Q1, C2, L3, Avenida dos Coqueiros, Brasília - DF"
                />

            <input class="button" type="submit" value="Adicionar"/>
        </form>
    </main>
</section>          
</body>
</html>
