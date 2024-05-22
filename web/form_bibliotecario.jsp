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
            .container {
                
            }
            
            .form {
                display: flex;
                flex-direction: column;
            }
        </style>
    </head>
    <body>
        <h1>Adicionar/Atualizar Bibliotecário</h1>
        <form method="get" action="GerenciarBibliotecario" class="form">
            <input name="id" type="hidden" value=""/>
            
            <label for="nome">Nome</label>
            <input name="nome" id="nome" type="text"/>
            
            <label for="cpf">CPF</label>
            <input name="cpf" id="cpf" type="number"/>
            
            <label for="dn">Data de Nascimento</label>
            <input name="dataNascimento" id="dn" type="date"/>
            
            <label for="endereco">Endereço</label>
            <input name="endereco" id="endereco" type="text"/>
            
            <input type="submit" value="Adicionar"/>
        </form>
    </body>
</html>
