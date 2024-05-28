<%-- 
    Document   : form_autor
    Created on : 28/05/2024, 14:59:10
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
            <h1>Adicionar/Atualizar Autores</h1>
            
            <form method="post" action="gerenciar_autor.do" class="form">
                <input 
                    value="${autor.idAutor}"
                    name="idAutor" 
                    type="hidden" 
                />
                
                <label for="nome">Nome</label>
                <input 
                    value="${autor.nome}"
                    name="nome" 
                    id="nome" 
                    type="text"
                    placeholder="Insira Nome. Ex. Ana da Silva"
                />

                <label for="cpf">CPF</label>
                <input 
                    value="${autor.cpf}"
                    name="cpf" 
                    id="cpf" 
                    type="text"
                    placeholder="Insira CPF. Ex. 123-456-789-10"
                />

                <label for="dataNascimento">Data de Nascimento</label>
                <input 
                    value="${autor.dn}"
                    name="dn" 
                    id="dataNascimento" 
                    type="date"
                />

                <label for="endereco">Endereço</label>
                <input 
                    value="${autor.end}"
                    name="end" 
                    id="endereco" 
                    type="text"
                    placeholder="Insira Endereço. Ex. Q1, C2, L3, Avenida dos Coqueiros, Brasília - DF"
                />

                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
        
    </body>
</html>
