<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.LivroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.livro.Livro"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.8.1/vanilla-tilt.min.js" integrity="sha512-wC/cunGGDjXSl9OHUH0RuqSyW4YNLlsPwhcLxwWW1CR4OeC2E1xpcdZz2DeQkEmums41laI+eGMw95IJ15SS3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="estilo/livro.css" type="text/css"/>
        <title>Livros</title>
    </head>
    <body>

        <div class="container">
            <nav id="biblioteca">
                <div id="user">  

                    <img class="img-biblioteca" src="imagens/biblioteca.jpeg">
                    <p id="user_infos">
                        <span class="item-description">  
                            Biblioteca
                        </span>
                        <span class="item-description">
                            <strong>Archivio Culturale</strong>
                        </span>
                    </p>
                </div>         
                <ul id="side_items">
                    <li class="side-item ">
                        <a href="index.jsp">
                            <i class='bx bx-store'></i>
                            <span class="item-des">
                                Inicio
                            </span>
                        </a>
                    </li>
                    <li class="side-item">
                       <a href="index.jsp">
                            <i class='bx bx-user-pin'></i>                       
                            <span class="item-des">
                                Usuários
                            </span>
                        </a>
                    </li>
                    <li class="side-item">
                        <a href="listar_leitor.jsp"> 
                            <i class='bx bxs-book-reader'></i>
                            <span class="item-des">
                                Leitores
                            </span>
                        </a>
                    </li>
                    <li class="side-item">
                        <a href="listar_livro.jsp">
                            <i class='bx bxs-book-bookmark'></i>
                            <span class="item-des">
                                Livros
                            </span>
                        </a>
                    </li>
                    <li class="side-item">
                        <a href="index.jsp">
                            <i class='bx bx-cart-download'></i>
                            <span class="item-des">
                                Empréstimos
                            </span>
                        </a>
                    </li>
                    <li class="side-item">
                        <a href="index.jsp">
                            <i class='bx bx-edit'></i>
                            <span class="item-des">
                                Editora
                            </span>
                        </a>
                    </li>
                    <li class="side-item">
                        <a href="index.jsp">
                            <i class='bx bx-user-check'></i>
                            <span class="item-des">
                                Autora
                            </span>
                        </a>
                    </li>
                </ul> 
                <div id="logout">
                    <button id="logout_btn">
                        <i class='bx bx-log-in-circle'></i>
                        <span class="item-description">
                            Logout
                        </span>
                    </button>
                </div>
                <a href="form_livro.jsp">
                    Novo Cadastro</a>
        </div>


        <div class="container">
            <div class="card">
                <h2>     <%

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
                            <td><%=livro.getEditora()%></td>
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

                    <% }%></h2>
                <img src="imagens/A Herdeira.png" class="produtoL1">
                <button>Alugar</button>
            </div>        
            <div class="card">
                <h2>A Coroa</h2>
                <img src="imagens/A Coroa.png" class="produtoL2">
                <button>Alugar</button>
            </div>
            <div class="card">
                <h2>Biblia Sagrada</h2>
                <img src="imagens/bibliaSagrada.png" class="produtoL3">
                <button>Alugar</button>
            </div>
            <div class="card">
                <h2>O pequeno Principe</h2>
                <img src="imagens/pequeno.png" class="produtoL4">
                <button>Alugar</button>
            </div>
            <div class="card">
                <h2>Uma Garota</h2>
                <img src="imagens/garota.png" class="produtoL5">
                <button>Alugar</button>
            </div>
            <div class="card">
                <h2>Uma Garota</h2>
                <img src="imagens/narnia.png" class="produtoL6">
                <button>Alugar</button>
            </div>
            <div class="card">
                <h2>Uma Garota</h2>
                <img src="imagens/banana.png" class="produtoL7">
                <button>Alugar</button>
            </div>
            <div class="card">
                <h2>Uma Garota</h2>
                <img src="imagens/maquiavel.png" class="produtoL8">
                <button>Alugar</button>
            </div>
            <script>
                VanillaTilt.init(document.querySelectorAll(".card"), {
                    max: 25,
                    speed: 400,
                    glare: true,
                    "max-glare": 0.5
                });
            </script>                        
        </div>    
    </body>
</html>

