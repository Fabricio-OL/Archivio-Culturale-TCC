
<%@page import="model.pessoa.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <h1>Lista de Autores </h1>
            
            <a href="form_autor.jsp" class="btn btn-primary">Novo Cadastro</a>
            
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Data de Nascimento</th>
                    <th>Endereço</th>
                    <th>Opções</th>
                </tr>
                
                <%
                    ArrayList<Autor> lista = new ArrayList<Autor>();
                    try {
                        AutorDAO autorDAO = new AutorDAO();
                        lista = autorDAO.getLista();
                    }catch(Exception e){
                        out.print(e);
                    }
                    
                    for(Autor autor : lista){
                        
                %>
                <tr>
                    <td><%=autor.getIdAutor()%></td>
                    <td><%=autor.getNome()%></td>
                    <td><%=autor.getCpf()%></td>
                    <td><%=autor.getDn()%></td>
                    <td><%=autor.getEnd()%></td>


                    <td>
                        <a class="btn btn-primary" href="gerenciar_autor.do?acao=alterar&id=<%= autor.getIdAutor()%>">
                            <i class='bx bxs-pencil' ></i>
                        </a>
                        <a class="btn btn-danger" href="gerenciar_autor.do?acao=delete&id=<%= autor.getIdAutor()%>">
                            <i class='bx bxs-trash'></i>
                        </a>
                    </td>
                </tr>
                <% } %>
            </table>
        </main>  
        </section>  
    </body>
</html>

