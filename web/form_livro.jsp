<%@page import="java.util.ArrayList"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="model.livro.Editora"%>
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
            
                <label for="nomearquivo" class="control-label">Nome Arquivo</label>
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
