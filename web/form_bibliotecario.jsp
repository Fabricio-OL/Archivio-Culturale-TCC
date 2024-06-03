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
        <title>Archivio Culturale</title>
        
        <style>
            :root {
                font-family: sans-serif;
            }
            
            * {
                box-sizing: border-box;
            }
            
            body {
                margin: 0;
            }
            
            section {
                height: 90vh;
            }
            
            .container {
                margin: 0 auto;
                width: 90%;
                max-width: 980px;
            }
            
            .form {
                display: flex;
                flex-direction: column;
            }
            
            .form input {
                padding: 0.4rem;
                margin: 2% 0;
                
            }
            
            .form .button {
                width: 30%;
                padding: 1rem;
            }
            
        </style>
    </head>
    <body>
        <%@include file="index.jsp" %>
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
