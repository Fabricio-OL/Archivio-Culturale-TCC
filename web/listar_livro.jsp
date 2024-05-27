<%@page import="dao.LivroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.livro.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1>Lista de Livros</h1>
            
            <a href="form_perfil.jsp" class="btn btn-primary">Novo Cadastro</a>
            
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>ISBN</th>
                    <th>Titulo</th>
                    <th>Genêro</th>
                </tr>
                
                <%
                    
                    ArrayList<Livro> lista = new ArrayList<Livro>();
                    try {
                        LivroDAO liDAO = new LivroDAO();
                        lista = liDAO.getLista();
                    }catch(Exception e){
                        out.print(e);
                    }
                    
                    for(Livro livro : lista){

                %>
                <tr>
                    <td><%=livro.getIdLivro()%></td>
                    <td><%=livro.getIsbn()%></td>
                    <td><%=livro.getTitulo()%></td>
                    <td><%=livro.getGenero()%></td>

                    <td>
                        <a class="btn btn-primary" href="gerenciar_livro.do?acao=alterar&id=<%= livro.getIdLivro()%>">
                            <i class='bx bxs-pencil' ></i>
                        </a>
                        <button class="btn btn-danger" href="gerenciar_livro.do?acao=delete&id=<%= livro.getIdLivro()%>">
                            <i class='bx bxs-trash'></i>
                        </button>
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

