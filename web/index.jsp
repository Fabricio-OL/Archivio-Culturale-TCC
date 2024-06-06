<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Archivio Culturale</title>        
        <link rel="stylesheet" href="estilo/index.css" type="text/css"/>
        <link rel="stylesheet" href="estilo/fundo.css" type="text/css"/>
    </head>
    <body>
        
        <div class="container">
        <nav id="biblioteca">
            <div class="biblioteca_content">
                <div id="user">                                                                                   
                    <img class="img-biblioteca" src="imagens/biblioteca.jpeg" alt="biblioteca">
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
        </div>            
        <div id="logout">
            <button id="logout_btn">
               <i class='bx bx-log-in-circle'></i>
                <span class="item-description">
                    Logout
                </span>
            </button>
            </div>    
     </nav> 
    </div>
    </body>
</html>
