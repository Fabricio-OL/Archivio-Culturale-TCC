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
        <title>Archivio Culturale</title>
        
        <style>
            :root {
                font-family: sans-serif;
            }
            
            * {
                box-sizing: border-box;
            }
            
            body {
                margin: 0;
            }
            
            section {
                height: 90vh;
            }
            
            .container {
                margin: 0 auto;
                width: 90%;
                max-width: 980px;
            }
            
            .form {
                display: flex;
                flex-direction: column;
            }
            
            .form input {
                padding: 0.4rem;
                margin: 2% 0;
                
            }
            
            .form .button {
                width: 30%;
                padding: 1rem;
            }
            
        </style>
    </head>
    <body>
        <%@include file="index.jsp" %>
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
