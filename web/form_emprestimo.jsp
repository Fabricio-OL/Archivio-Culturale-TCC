<%-- 
    Document   : form_emprestimo
    Created on : May 21, 2024, 8:53:43 PM
    Author     : Fabricio
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
            <h1>Adicionar/Atualizar Emprestimo</h1>
            
            <form method="post" action="gerenciar_emprestimo.do" class="form">
                <input 
                    value="${emprestimo.idEmp}"
                    name="idEmp" 
                    type="hidden" 
                />
                
                <label for="dataEmp">Data do Emprestimo</label>
                <input 
                    value="${emprestimo.dataEmp}"
                    name="dataEmp" 
                    id="dataEmp" 
                    type="date"
                />

                <label for="dataDev">Data da Devolução</label>
                <input 
                    value="${emprestimo.dataDev}"
                    name="dataDev" 
                    id="dataDev" 
                    type="date"
                />
                
                <label for="status">Status</label>
                <input 
                    value="${emprestimo.status}"
                    name="status" 
                    id="status" 
                    type="text"
                />

                <label for="condicao">Condição</label>
                <input 
                    value="${emprestimo.condicao}"
                    name="condicao" 
                    id="condicao" 
                    type="text"
                    placeholder="Insira a Condição que o livro se encontra. Ex. Danificado, Novo, Semi-Novo"
                />
                
                <label for="Leitor_idLeitor">ID leitor</label>
                <input 
                    value="${leitor.idLeitor}"
                    name="Leitor_idLeitor" 
                    id="Leitor_idLeitor" 
                    type="number"
                />
                
                <label for="Livro_idLivro">ID livro</label>
                <input 
                    value="${livro.idLivro}"
                    name="Livro_idLivro" 
                    id="Livro_idLivro" 
                    type="number"
                />
                
                <label for="Bibliotecario_idBibliotecario">ID bibliotecario</label>
                <input 
                    value="${bibliotecario.idBibliotecario}"
                    name="Bibliotecario_idBibliotecario" 
                    id="Bibliotecario_idBibliotecario" 
                    type="number"
                />

                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
        
    </body>
</html>
