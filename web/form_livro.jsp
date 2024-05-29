<%-- 
    Document   : form_livro
    Created on : 27/05/2024, 16:45:47
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
        <%@include file="banner.jsp" %>
        <%@include file="menu.jsp" %>
        <section class="container">
            <h1>Adicionar/Atualizar Livro</h1>
            
            <form method="post" action="gerenciar_livro.do" class="form">
                <input 
                    value="${livro.idLivro}"
                    name="idLivro" 
                    type="hidden" 
                />
                
                <label for="nome">Titulo</label>
                <input 
                    value="${leitor.titulo}"
                    name="titulo" 
                    id="titulo" 
                    type="text"
                    placeholder="Insira o Titulo . Ex. Pequeno Principe"
                />

                <label for="isbn">ISBN</label>
                <input 
                    value="${livro.isbn}"
                    name="isbn" 
                    id="isbn" 
                    type="text"
                    placeholder="ISBN 978-85-333-0227-3"
                />

                <label for="genero">Genêro</label>
                <input 
                    value="${livro.genero}"
                    name="genero" 
                    id="genero" 
                    type="text"
                />
                
                <label for="Editora_idEditora">ID Editora</label>
                <input 
                    value="${livro.editora.idEditora}"
                    name="Editora_idEditora" 
                    id="Editora_idEditora" 
                    type="number"
                />

                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
        
    </body>
</html>
