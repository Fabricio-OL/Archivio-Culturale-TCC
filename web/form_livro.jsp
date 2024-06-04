

<%@page import="java.util.ArrayList"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="model.livro.Editora"%>
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
                margin: auto;
                width: 90%;
                max-width: 980px;
              
            }
            
            .form {
                display: flex;
                flex-direction: column;
                padding: 50px;
                padding-left: 60px;
            }
            
            .form input {
                padding: 0.4rem;
                margin: 2% 0;
                border-radius: 15px;
            }
            
            .form .button {
                width: 30%;
                padding: 1rem;
            }
            
        </style>
    </head>
    <body>
        <section class="container">
             <%@include file="index.jsp" %>
            <h1 style="margin-left:20%;">Adicionar/Atualizar Livro</h1>
            
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
                
                <label for="idEditora">ID Editora</label>
                <select  name="idEditora" id="idEditora">
                    <option value="" selected>Selecione...</option>
                <% 
                    ArrayList<Editora> listaeditora = new ArrayList<Editora>();
                    try {
                         EditoraDAO editoraDAO = new EditoraDAO();
                         listaeditora= editoraDAO.getLista();
                         
                        for(Editora editora : listaeditora){
                %>
                <option value="<%= editora.getIdEditora() %>"><%= editora.getIdEditora() %> - <%= editora.getNome() %></option>
                <% 
                        } 
                    } catch(Exception e) {
                        out.print(e);
                    }
                %>
                    
                </select>
                
                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
        
    </body>
</html>
