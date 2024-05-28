<%@page import="dao.EmprestimoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.livro.Emprestimo"%>
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
            <h1>Lista de Emprestimo</h1>
            
            <a href="form_emprestimo.jsp" class="btn btn-primary">Novo Cadastro</a>
            
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Data do Emprestimo</th>
                    <th>Data da Devolução</th>
                    <th>ID leitor</th>
                    <th>Condição</th>
                    <th>ID livro</th>
                    <th>ID bibliotecario</th>
                    <th>Opções</th>
                </tr>
                
                <%
                    ArrayList<Emprestimo> lista = new ArrayList<Emprestimo>();
                    try {
                        EmprestimoDAO emprestimoDAO = new EmprestimoDAO();
                        lista = emprestimoDAO.getLista();
                    }catch(Exception e){
                        out.print(e);
                    }
                    
                    for(Emprestimo emprestimo : lista){
                        
                %>
                <tr>
                    <td><%=emprestimo.getIdEmp()%></td>
                    <td><%=emprestimo.getDataEmp()%></td>
                    <td><%=emprestimo.getDataDev()%></td>
                    <td><%=emprestimo.getStatus()%></td>
                    <td><%=emprestimo.getLeitor().getIdLeitor()%></td>
                    <td><%=emprestimo.getCondicao()%></td>
                    <td><%=emprestimo.getLivro()%></td>
                    <td><%=emprestimo.getBibliotecario()%></td>
                    <td>
                        <a class="btn btn-primary" href="gerenciar_emprestimo.do?acao=alterar&id=<%= emprestimo.getIdEmp()%>">
                            <i class='bx bxs-pencil' ></i>
                        </a>
                        <a class="btn btn-danger" href="gerenciar_emprestimo.do?acao=delete&id=<%= emprestimo.getIdEmp()%>">
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

