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
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="estilo/banner.css">
        <title>Listar</title>
    </head>
    <body>
        <div>
            
            <h1>Lista de Emprestimo</h1>
            
            <a href="form_emprestimo.jsp">Novo Cadastro</a>
            
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Data do Emprestimo</th>
                    <th>Data da Devolução</th>
                    <th>Status</th>
                    <th>Condição</th>
                    <th>ID leitor</th>
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
                    <td><%=emprestimo.getCondicao()%></td>
                    <td><%=emprestimo.getLeitor().getIdLeitor()%></td>
                    <td><%=emprestimo.getLivro().getIdLivro()%></td>
                    <td><%=emprestimo.getBibliotecario().getIdBibliotecario()%></td>
                    <td>
                        <a href="gerenciar_emprestimo.do?acao=alterar&id=<%= emprestimo.getIdEmp()%>">
                            <i class='bx bxs-pencil' ></i>
                        </a>
                        <a href="gerenciar_emprestimo.do?acao=delete&id=<%= emprestimo.getIdEmp()%>">
                            <i class='bx bxs-trash'></i>
                        </a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>

    </body>
</html>

