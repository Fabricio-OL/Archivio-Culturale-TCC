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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="estilo/banner.css">
        <title>Listar</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
            <h1>Lista de Bibliotecario</h1>
            
            <a href="form_bibliotecario.jsp" class="btn btn-primary">Novo Cadastro</a>
            
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
                    <td><%=bibliotecario.getEnd()%></td>


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
        </div>
            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>

