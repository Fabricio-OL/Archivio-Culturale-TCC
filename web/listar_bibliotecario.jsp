<%@page import="dao.BibliotecarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.pessoa.Bibliotecario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="estilo/main.css" type="text/css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Listar</title>
    </head>
    <body>
            <%@include file="menu.jsp" %>
            <h1>Lista de Bibliotecario</h1>
            
            <a href="form_bibliotecario.jsp" class="btn btn-primary">Novo Cadastro</a>
            
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Data de Nascimento</th>
                  
                    <th>Opções</th>
                </tr>
                
                <%
                    ArrayList<Bibliotecario> lista = new ArrayList<Bibliotecario>();
                    try {
                        BibliotecarioDAO bibliotecarioDAO = new BibliotecarioDAO();
                        lista = bibliotecarioDAO.getLista();
                    }catch(Exception e){
                        out.print(e);
                    }
                    
                    for(Bibliotecario bibliotecario : lista){
                        
                %>
                <tr>
                    <td><%=bibliotecario.getIdBibliotecario()%></td>
                    <td><%=bibliotecario.getNome()%></td>
                    <td><%=bibliotecario.getCpf()%></td>
                    <td><%=bibliotecario.getDn()%></td>
                    

                    <td>
                        <a class="btn btn-primary" href="gerenciar_bibliotecario.do?acao=alterar&id=<%= bibliotecario.getIdBibliotecario()%>">
                            <i class='bx bxs-pencil' ></i>
                        </a>
                        <a class="btn btn-danger" href="gerenciar_bibliotecario.do?acao=delete&id=<%= bibliotecario.getIdBibliotecario()%>">
                            <i class='bx bxs-trash'></i>
                        </a>
                    </td>
                </tr>
                <% } %>
            </table>
    </body>
</html>

