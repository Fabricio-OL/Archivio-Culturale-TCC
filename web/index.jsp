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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="estilo/index.css" type="text/css"/>
       
    </head>
    <body>
        <script>
    document.getElementById('open_btn').addEventListener('click',function(){
document.getElementById('biblioteca').classList.toggle('open-biblioteca');
});
        </script>
        <nav id="biblioteca">
            <div class="biblioteca_content">
                <div id="user">
                    <a href="listar_livro.jsp">
                    
            <!--
                <%@include file="biblioteca.jsp" %>
            -->
            
            <%@include file="menu.jsp" %>              
                    <img class="img-biblioteca" src="imagens/biblioteca.jpeg" id="user_avatar" alt="biblioteca">
                </a>
                <p id="user_infos">
                    <span class="item-description">                    
                    </span>
                    <span class="item-description">
                      <strong>Archivio Culturale</strong>
                    </span>
                </p>
            </div> 
         <ul id="side_items">
              <li class="side-item ">
                    <a href="Livros.html">
                        <i class="fa-sharp fa-solid fa-book-journal-whills"></i>
                        <span class="item-des">
                            Inicio
                        </span>
                    </a>
                </li>
                 <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-solid fa-user-tie"></i>
                        <span class="item-des">
                            Usuários
                        </span>
                    </a>
                </li>
                 <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-solid fa-book-open-reader"></i>
                        <span class="item-des">
                            Leitores
                        </span>
                    </a>
                </li>
                 <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-sharp fa-solid fa-book-journal-whills"></i>
                        <span class="item-des">
                            Livros
                        </span>
                    </a>
                </li>
                  <li class="side-item">
                    <a href="Livros.html">
                        <i class="fa-solid fa-truck-ramp-box"></i>
                        <span class="item-des">
                            Emprestimos
                        </span>
                    </a>
                </li>
    </ul>      
            <button id="open_btn">
                <i id="open_btn_icon" class="fa-solid fa-chevron-right"></i>
            </button>
        </div>            
        <div id="logout">
            <button id="logout_btn">
                <i class="fa-solid fa-right-from-bracket"></i>
                <span class="item-description">
                    Logout
                </span>
            </button>
            </div>    
     </nav> 
         <main>
            <h1>Titulo</h1>
        </main>
    <audio class="audio" src="src/audio/libary (online-audio-converter.com).mp3" controls preload  autoplay></audio>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
