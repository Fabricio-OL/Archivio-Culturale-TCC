<%@page import="dao.EditoraDAO"%>
<%@page import="model.livro.Editora"%>
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
    <link rel="icon" type="image/x-icon" href="imagens/favicon.svg">
</head>
    <body>
        <section class="section">
           <%@include file="menu.jsp" %>
           <main class="content form">
            <h1>Lista de Editoras</h1>
            
            <a href="form_editora.jsp" class="btn btn-primary">Novo Cadastro</a>
            
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CNPJ</th>
                    <th>Endereço</th>
                    <th>Opções</th>
                    
                </tr>
                
                <%
                    ArrayList<Editora> lista = new ArrayList<Editora>();
                    try {
                        EditoraDAO editoraDAO = new EditoraDAO();
                        lista = editoraDAO.getLista();
                    }catch(Exception e){
                        out.print(e);
                    }
                    
                    for(Editora editora : lista){
                        
                %>
                <tr>
                    <td><%=editora.getIdEditora()%></td>
                    <td><%=editora.getNome()%></td>
                    <td><%=editora.getCnpj()%></td>
                    <td><%=editora.getEnd()%></td>
                   


                    <td>
                        <a class="btn btn-danger" href="gerenciar_editora.do?acao=alterar&id=<%= editora.getIdEditora()%>">
                            <i class='bx bxs-pencil' ></i>
                        </a>
                        <a class="btn btn-danger" href="gerenciar_editora.do?acao=delete&id=<%= editora.getIdEditora()%>">
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