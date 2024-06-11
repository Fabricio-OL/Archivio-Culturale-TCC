<%-- 
    Document   : form_bibliotecario
    Created on : May 21, 2024, 8:53:43 PM
    Author     : Fabricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilo/main.css" type="text/css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Archivio Culturale</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <section class="container">
            
            
            <%
                /* Aqui mostrará se o nome do usuario for nulo, ele sera redirecionado a pagina inicial ou a de login
             String nome=(String) session.getAttribute("n");
              if(nome==null){
                  response.sendRedirect("./index.jsp");
              }

            */
            %>
            <h1>Adicionar/Atualizar Bibliotecário</h1>
            
            <form method="post" action="gerenciar_bibliotecario.do" class="form">
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
                
                
                <label for="senha">Senha</label>
                <input
                    value="${bibliotecario.senha}"
                    name="senha" 
                    id="senha" 
                    type="text"
                    placeholder=" Insira a senha. Ex. 1@ew#21"
                />
                
                
                
                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
        
    </body>
</html>
