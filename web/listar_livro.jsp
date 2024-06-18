<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.LivroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.livro.Livro"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.8.1/vanilla-tilt.min.js" integrity="sha512-wC/cunGGDjXSl9OHUH0RuqSyW4YNLlsPwhcLxwWW1CR4OeC2E1xpcdZz2DeQkEmums41laI+eGMw95IJ15SS3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        
        <link rel="stylesheet" href="estilo/_main.css" type="text/css"/>
        <title>Livros</title>
    </head>
    <body>
        <section class="section">
        <%@include file="menu.jsp" %>
        <main class="content form">
            <h1>Lista de Livro</h1>
            <a href="form_livro.jsp" class="btn btn-primary">Novo Cadastro</a>
            <table class="table table-hover">
             
                <tr>
                    <th>ID</th>
                    <th>ISBN</th>
                    <th>Titulo</th>
                    <th>Genero</th>
                    <th>Editora</th>
                </tr>  
                <%
                ArrayList<Livro> lista = new ArrayList<Livro>();
                try {
                    LivroDAO liDAO = new LivroDAO();
                    lista = liDAO.getLista();
                } catch (Exception e) {
                    out.print(e);
                }

                for (Livro livro : lista) {

            %>     
                    <tr>
                        <td><%=livro.getIdLivro()%></td>
                        <td><%=livro.getIsbn()%></td>
                        <td><%=livro.getTitulo()%></td>
                        <td><%=livro.getGenero()%></td>
                        <td><%=livro.getEditora().getIdEditora()%></td>


                        

                        <td>
                            <a class="btn btn-danger" href="gerenciar_livro.do?acao=alterar&id=<%= livro.getIdLivro()%>">
                                <i class='bx bxs-pencil' ></i>
                            </a>
                            <a class="btn btn-danger" href="gerenciar_livro.do?acao=delete&id=<%= livro.getIdLivro()%>">
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

