<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="estilo/banner.css">
        <link rel="stylesheet" href="estilo/biblioteca.css">
        <title>Archivio Culturale</title>
        <link rel="stylesheet" href="estilo/menu.css" type="text/css"/>
    </head>
    <body>
        <nav id="bibli">
            <div class="biblioteca">
            <%@include file="biblioteca.jsp" %>
            <%@include file="menu.jsp" %>
        </div>
        <div>
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
              <li class="side-item active">
                    <a href="Livros.html">
                        <i class="fa-sharp fa-solid fa-book-journal-whills"></i>
                        <span class="item-inicio">
                            Inicio
                        </span>
                    </a>
                </li>
                 <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-sharp fa-solid fa-book-journal-whills"></i>
                        <span class="item-usuario">
                            Usuários
                        </span>
                    </a>
                </li>
                 <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-sharp fa-solid fa-book-journal-whills"></i>
                        <span class="item-leitores">
                            Leitores
                        </span>
                    </a>
                </li>
                 <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-sharp fa-solid fa-book-journal-whills"></i>
                        <span class="item-livros">
                            Livros
                        </span>
                    </a>
                </li>
                 <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-sharp fa-solid fa-book-journal-whills"></i>
                        <span class="item-emprestimos">
                            Empréstimos
                        </span>
                    </a>
                </li>
    </ul>
        <div class="index">
</div>
            <button id="open_btn">
                <i id="open_btn_icon" class="fa-solid fa-chevron-right"></i>
            </button>
        <div id="logout">
            <button id="logout_btn">
                <i class="fa-solid fa-right-from-bracket"></i>
                <span class="item-description">
                    Logout
                </span>
            </button>
        </div>
     </nav>   
    <script src="src/javascript/script.js"></script>
    <audio class="audio" src="src/audio/libary (online-audio-converter.com).mp3" controls preload  autoplay></audio>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
