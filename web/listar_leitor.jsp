<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="dao.LeitorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.pessoa.Leitor"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Archivio Culturale</title>        
        <link rel="stylesheet" href="estilo/leitor.css" type="text/css"/>
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
                    <a href="Livros.html">
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
                    <a href="Livros.html">
                       <i class='bx bx-cart-download'></i>
                        <span class="item-des">
                            Empréstimos
                        </span>
                    </a>
                </li>
                  <li class="side-item">
                    <a href="Livros.html">
                       <i class='bx bx-cart-download'></i>
                        <span class="item-des">
                            Editora
                        </span>
                    </a>
                </li>
                  <li class="side-item">
                    <a href="Livros.html">
                       <i class='bx bx-cart-download'></i>
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
        </div>






     
        <div class="cadastro">                             
            <h1>Lista de Leitores</h1>           
            <a href="form_leitor.jsp">Novo Cadastro</a>           
            <table class="table">
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
                    }catch(Exception e){
                        out.print(e);
                    }
                    
                    for(Leitor leitor : lista){
                        
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
                <% } %>
            </table>
        </div>
    </body>
</html>

