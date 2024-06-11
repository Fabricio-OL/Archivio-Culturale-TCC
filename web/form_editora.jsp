<%-- 
    Document   : form_editora
    Created on : 28/05/2024, 15:16:09
    Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilo/main.css" type="text/css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Archivio Culturale</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <section class="container">
            
            <h1>Adicionar/Atualizar Editora</h1>
            
            <form method="post" action="gerenciar_editora.do" class="form">
                <input 
                    value="${editora.idEditora}"
                    name="idEditora" 
                    type="hidden" 
                />
                
                <label for="nome">Nome</label>
                <input 
                    value="${editora.nome}"
                    name="nome" 
                    id="nome" 
                    type="text"
                    placeholder="Insira Nome. Ex. Thomas Jefferson"
                />

                <label for="cnpj">CNPJ</label>
                <input 
                    value="${editora.cnpj}"
                    name="cnpj" 
                    id="cnpj" 
                    type="text"
                    placeholder="Insira CNPJ. Ex. 12.345.678/0001-00"
                />


                <label for="endereco">Endereço</label>
                <input 
                    value="${editora.end}"
                    name="end" 
                    id="endereco" 
                    type="text"
                    placeholder="Insira Endereço. Ex. Q5, B3, L2, Avenida dos Anjos, Brasília - DF"
                />
                
             <%--   <label for="Livro_idLivro">ID livro</label>
                <input> 
                    value="${editora.livro.idLivro}"
                    name="Livro_idLivro" 
                    id="Livro_idLivro" 
                    type="number"
                />
           --%>     
                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
        
    </body>
</html>
