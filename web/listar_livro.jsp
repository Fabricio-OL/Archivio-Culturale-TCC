<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.LivroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.livro.Livro"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.8.1/vanilla-tilt.min.js" integrity="sha512-wC/cunGGDjXSl9OHUH0RuqSyW4YNLlsPwhcLxwWW1CR4OeC2E1xpcdZz2DeQkEmums41laI+eGMw95IJ15SS3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="estilo/livro.css" type="text/css"/>
        <link rel="stylesheet" href="estilo/_main.css" type="text/css"/>
        <title>Livros</title>
    </head>
    <body>
        <section class="section">
        <%@include file="menu.jsp" %>
        <main class="content">
        <div class="LI" >
            <a href="form_livro.jsp">Novo Cadastro</a>
            <div class="container">
                <div class="card">
                    <h2>A Herdeira</h2>
                    <img src="imagens/A Herdeira.png" class="produtoL1">               
                </div>        
                <div class="card">
                    <h2>A Coroa</h2>
                    <img src="imagens/A Coroa.png" class="produtoL2">
                </div>
                <div class="card">
                    <h2>Biblia Sagrada</h2>
                    <img src="imagens/bibliaSagrada.png" class="produtoL3">
                </div>
                <div class="card">
                    <h2>O pequeno Príncipe</h2>
                    <img src="imagens/pequeno.png" class="produtoL4">
                </div>
                <div class="card">
                    <h2>Uma Garota</h2>
                    <img src="imagens/garota.png" class="produtoL5">
                </div>
                <div class="card">
                    <h2>Nárnia</h2>
                    <img src="imagens/narnia.png" class="produtoL6">
                </div>
                <div class="card">
                    <h2>Diário De Um Banana</h2>
                    <img src="imagens/banana.png" class="produtoL7">
                </div>
                <div class="card">
                    <h2>O Príncipe Maquiavel</h2>
                    <img src="imagens/maquiavel.png" class="produtoL8">
                </div>
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
                    <th>ID</th>
                    <th>ISBN</th>
                    <th>Titulo</th>
                    <th>Genero</th>
                    <th>Editora</th>
                </tr>       
                <table>
                    <tr>
                        <td><%=livro.getIdLivro()%></td>
                        <td><%=livro.getIsbn()%></td>
                        <td><%=livro.getTitulo()%></td>
                        <td><%=livro.getGenero()%></td>
                        <td><%=livro.getEditora().getIdEditora()%></td>


                        <td><img src="${pageContext.request.contextPath}/img/${li.nomearquivo}" style="width: 100px; height: 100px;"/></td>

                        <td>
                            <a href="gerenciar_livro.do?acao=alterar&id=<%= livro.getIdLivro()%>">
                                <i class='bx bxs-pencil' ></i>
                            </a>
                            <a href="gerenciar_livro.do?acao=delete&id=<%= livro.getIdLivro()%>">
                                <i class='bx bxs-trash'></i>
                            </a>
                        </td>
                    </tr>
                </table>

                <% }%>
                <script>
                    VanillaTilt.init(document.querySelectorAll(".card"), {
                        max: 25,
                        speed: 400,
                        glare: true,
                        "max-glare": 0.5
                    });
                </script>                        
            </div>
        </div>
        </main>
        </section>
    </body>
</html>

