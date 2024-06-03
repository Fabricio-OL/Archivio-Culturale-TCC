<%-- 
    Document   : form_leitor
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
            
           
            body {
                margin: 0;
                padding-top:50px; 
                margin-top: 50px;
            }
            
            section {
                height: 90vh;
            }
            
            .container {
               margin-right: 5%;
                width: 14%;
                max-width: 980px;
            
            }
            
            .form {
              
                flex-direction: column;
               
            }
            
            .form input {
                padding: 0.4rem;
                margin: 2% 0;
                border-radius: 15px;
                
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
            
            <h1>Adicionar/Atualizar Leitor</h1>
            
            <form method="post" action="gerenciar_leitor.do" class="form">
                <input 
                    value="${leitor.idLeitor}"
                    name="idLeitor" 
                    type="hidden" 
                />
                
                <label for="nome">Nome</label>
                <input 
                    value="${leitor.nome}"
                    name="nome" 
                    id="nome" 
                    type="text"
                    placeholder="Insira Nome. Ex. Ana da Silva"
                />

                <label for="cpf">CPF</label>
                <input 
                    value="${leitor.cpf}"
                    name="cpf" 
                    id="cpf" 
                    type="text"
                    placeholder="Insira CPF. Ex. 123-456-789-10"
                />

                <label for="dataNascimento">Data de Nascimento</label>
                
                <input
                    value="${leitor.dn}"
                    name="dn" 
                    id="dataNascimento" 
                    type="date"
                    placeholder="Insira Data de Nascimento"
                />

                <label for="endereco">Endereço</label>
                <input 
                    value="${leitor.end}"
                    name="end" 
                    id="endereco" 
                    type="text"
                    placeholder="Insira Endereço. Ex. Q1, C2, L3, Avenida dos Coqueiros, Brasília - DF"
                />

                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
        
    </body>
</html>
