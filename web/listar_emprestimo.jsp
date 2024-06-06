<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.temporal.ChronoUnit"%>
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
            <%@include file="index.jsp" %>
            <h1>Lista de Emprestimo</h1>
            
            <a href="form_emprestimo.jsp">Novo Cadastro</a>
            
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Data do Emprestimo</th>
                    <th>Data da Devolução</th>
                    <th>Duração do Empréstimo</th>
                    <th>Dias Atrasados</th>
                    <th>Valor do Emprestimo</th>
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
                        
                        Date dataEmpDate = emprestimo.getDataEmp();
                        Date dataDevDate = emprestimo.getDataDev();
                        
                        LocalDate dataEmpLocalDate = dataEmpDate.toLocalDate();
                        LocalDate dataDevLocalDate = dataDevDate.toLocalDate();
                        
                        final int PERIODO_MAXIMO_EMPRESTIMO_DIAS = 7;
                        String condicaoLivro = emprestimo.getCondicao();
                        
                        long duracaoEmprestimo = ChronoUnit.DAYS.between(dataEmpLocalDate, dataDevLocalDate);
                        long diasAtraso = Math.max(0, duracaoEmprestimo - PERIODO_MAXIMO_EMPRESTIMO_DIAS);
                        
                        boolean isAtrasado = duracaoEmprestimo > PERIODO_MAXIMO_EMPRESTIMO_DIAS;
                        boolean isDanificado = condicaoLivro.equalsIgnoreCase("Danificado");
                        String status = "Devolvido";
                        double valorAluguel = 5.0;
                        
                        if(isAtrasado) {
                            status = "Devolvido com atraso";
                            valorAluguel = emprestimo.emitirMulta(diasAtraso, valorAluguel);
                        } else if(isDanificado) {
                            status = "Devolvido com ressalvas";
                        }
                %>
                %>
                <tr>
                    <td><%=emprestimo.getIdEmp()%></td>
                    <td><%=emprestimo.getDataEmp()%></td>
                    <td><%=emprestimo.getDataDev()%></td>
                    <td><%=duracaoEmprestimo%></td>
                    <td><%=diasAtraso%></td>
                    <td><%="R$ " + valorAluguel%></td>
                    <td><%=status%></td>
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

