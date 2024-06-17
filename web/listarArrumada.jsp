<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="dao.LeitorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.pessoa.Leitor"%>
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
        <%@include file="index.jsp" %>

        <div class="cadastro">                                 
            <h1>Lista de Leitores</h1>           
            <a href="formArrumada.jsp">Novo Cadastro</a>           
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
                    ArrayList<Leitor> lista = new ArrayList<Leitor>();
                    try {
                        LeitorDAO leitorDAO = new LeitorDAO();
                        lista = leitorDAO.getLista();
                    } catch (Exception e) {
                        out.print(e);
                    }

                    for (Leitor leitor : lista) {

                %>
                <tr>
                    <td><%=leitor.getIdLeitor()%></td>
                    <td><%=leitor.getNome()%></td>
                    <td><%=leitor.getCpf()%></td>
                    <td><%=leitor.getDn()%></td>
                    <td><%=leitor.getEnd()%></td>

                    <td>
                        <a href="gerenciar_leitor.do?acao=alterar&id=<%= leitor.getIdLeitor()%>">
                            <i class='bx bxs-pencil' ></i>
                        </a>
                        <a href="gerenciar_leitor.do?acao=delete&id=<%= leitor.getIdLeitor()%>">
                            <i class='bx bxs-trash'></i>
                        </a>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>


    </body>
</html>