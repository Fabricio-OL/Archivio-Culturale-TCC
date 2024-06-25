<%-- 
    Document   : form_editora
    Created on : 28/05/2024, 15:16:09
    Author     : Claudia
--%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilo/_main.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Archivio Culturale</title>
        <link rel="icon" type="image/x-icon" href="imagens/favicon.svg">
    </head>
    <body>
        <section class="section">
        <%@include file="menu.jsp" %>
        <main class="content form">
            
            <h1>Adicionar/Atualizar Editora</h1>
            
            <form method="post" action="gerenciar_editora.do">
                <input 
                    value="${editora.idEditora}"
                    name="idEditora" 
                    type="hidden" 
                />
                
                <label for="nome">Nome</label>
                <input 
                    value="${editora.nome}"
                    name="nome" 
                    id="nome" 
                    type="text"
                    placeholder="Insira Nome. Ex. Thomas Jefferson"
                />

                <label for="cnpj">CNPJ</label>
                <input 
                    value="${editora.cnpj}"
                    name="cnpj" 
                    id="cnpj" 
                    type="text"
                    placeholder="Insira CNPJ. Ex. 12.345.678/0001-00"
                />


                <label for="endereco">Endereco</label>
                <input 
                    value="${editora.end}"
                    name="end" 
                    id="endereco" 
                    type="text"
                    placeholder="Insira Endere�o. Ex. Q5, B3, L2, Avenida dos Anjos, Bras�lia - DF"
                />
                
             <%--   <label for="Livro_idLivro">ID livro</label>
                <input> 
                    value="${editora.livro.idLivro}"
                    name="Livro_idLivro" 
                    id="Livro_idLivro" 
                    type="number"
                />
           --%>     
                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </main>
        </section>
    </section>
    </body>
</html>
