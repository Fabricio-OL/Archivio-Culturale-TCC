<%-- 
    Document   : form_bibliotecario
    Created on : May 21, 2024, 8:53:43 PM
    Author     : Fabricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
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
        <main class="content form alt-b">
            
            
            <%
                /* Aqui mostrará se o nome do usuario for nulo, ele sera redirecionado a pagina inicial ou a de login
             String nome=(String) session.getAttribute("n");
              if(nome==null){
                  response.sendRedirect("./index.jsp");
              }

            */
            %>
            <h1>Adicionar/Atualizar Bibliotecário</h1>
            
            <form method="post" action="gerenciar_bibliotecario.do">
                <input 
                    value="${bibliotecario.idBibliotecario}"
                    name="idBibliotecario" 
                    type="hidden" 
                />
                
                <label for="nome">Nome</label>
                <input 
                    value="${bibliotecario.nome}"
                    name="nome" 
                    id="nome" 
                    type="text"
                    placeholder="Insira Nome. Ex. Ana da Silva"
                />

                <label for="cpf">CPF</label>
                <input 
                    value="${bibliotecario.cpf}"
                    name="cpf" 
                    id="cpf" 
                    type="text"
                    placeholder="Insira CPF. Ex. 123-456-789-10"
                />

                <label for="dataNascimento">Data de Nascimento</label>
                <input
                    value="${bibliotecario.dn}"
                    name="dn" 
                    id="dataNascimento" 
                    type="date"
                />
                
                <label for="senha">Senha</label>
                <input
                    value="${bibliotecario.senha}"
                    name="senha" 
                    id="senha" 
                    type="text"
                    placeholder="Insira a senha . Ex. 1@34%R"
                />                           
                <%--<label for="endereco">Endereço</label>
                <input 
                    value="${bibliotecario.end}"
                    name="end" 
                    id="endereco" 
                    type="text"
                    placeholder="Insira Endereço. Ex. Q1, C2, L3, Avenida dos Coqueiros, Brasília - DF"
                />
                --%>                                                                            
                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </main>
    </section>
    </body>
</html>
