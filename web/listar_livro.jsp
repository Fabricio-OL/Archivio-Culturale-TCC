<%@page import="dao.LivroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.livro.Livro"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="estilo/index.css" type="text/css"/>
        <link rel="stylesheet" href="estilo/livro.css" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.8.1/vanilla-tilt.min.js" integrity="sha512-wC/cunGGDjXSl9OHUH0RuqSyW4YNLlsPwhcLxwWW1CR4OeC2E1xpcdZz2DeQkEmums41laI+eGMw95IJ15SS3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <title>Livros</title>
    </head>
    <body>
        <%@include file="index.jsp" %>          
        <div class="container">

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

            <div class="card">
                <tr>
                    <th>ID</th>
                    <th>ISBN</th>
                    <th>Titulo</th>
                    <th>Gen�ro</th>
                </tr>
                <table>

                    <tr>
                        <td><%=livro.getIdLivro()%></td>
                        <td><%=livro.getIsbn()%></td>
                        <td><%=livro.getTitulo()%></td>
                        <td><%=livro.getGenero()%></td>
                        <td>
                            <a href="gerenciar_livro.do?acao=alterar&id=<%= livro.getIdLivro()%>">
                                <i class='bx bxs-pencil' ></i>
                            </a>
                            <a href="gerenciar_livro.do?acao=delete&id=<%= livro.getIdLivro()%>">
                                <i class='bx bxs-trash'></i>
                            </a>
                        </td>
                    </tr>
                    
                    <tr>
                        <img src=<%=livro.getImageURL()%> alt="" class="produto" style="padding-top:25px;">
                        <button>Alugar</button>
                    </tr>
                </table>
                <% }%>
            </div>           
        </div>

        <script>
            VanillaTilt.init(document.querySelectorAll(".card"), {
                max: 25,
                speed: 400,
                glare: true,
                "max-glare": 1
            });
        </script>


        <div class="list">                                               
            <div>
                <a href="form_livro.jsp"  >Novo Cadastro</a>

            </div>
        </div>
    </body>

</html>

