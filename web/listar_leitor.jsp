<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="dao.LeitorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.pessoa.Leitor"%>
<!DOCTYPE html>
<html>
     <body>
        <section class="section">
        <%@include file="menu.jsp" %>
        <main class="content">
        <div class="cadastro">                                 
            <h1>Lista de Leitores</h1>           
            <a href="form_leitor.jsp">Novo Cadastro</a>           
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
        </main>
    </section>
    </body>
</html>
