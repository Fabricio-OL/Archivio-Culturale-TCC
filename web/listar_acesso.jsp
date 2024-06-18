<%@page import="dao.AcessoDAO"%>
<%@page import="model.Acesso"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  Perguntar sobre a TAGLIB para o Professor  -->
<!DOCTYPE html>
<html>
    <body>
        <section class="section">
            <%@include file="menu.jsp" %>
            <main class="content">
            <h1>Lista de Perfis </h1>
            <a  href="form_acesso.jsp" class="btn btn-primary">Novo Cadastro</a>
            <table class="table table-sucess table-striped-columns   table-hover">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Opções</th>
                </tr>

                <% 
                    ArrayList<Acesso> lista = new ArrayList<Acesso>();
                    try{
                        AcessoDAO aDAO = new AcessoDAO();
                        lista = aDAO.getLista();
                    }catch (Exception e){
                        out.print(e);
                    }
                      
                    // Varrer lista 
                    for (Acesso acesso:lista){
                %>
                
                <tr>
                    <td>${p.getIdAcesso}</td>
                    <td>${p.getNome}</td>
                    
                    <td>
                        <a class="btn btn-primary" href="gerenciar_acesso.do?acao=alterar&idAcesso="${acesso.getIdAcesso}><button class=" btn btn-primary">Alterar</button>
                            <i class='bx bxs-pencil' ></i>
                        </a>
                      <button class="btn btn-danger"</button>
                      <i class='bx bxs-trash'></i>
                    </td>
                </tr>
               <%} %>
            </table>
        </main>
        </section>
    </body>
</html>
