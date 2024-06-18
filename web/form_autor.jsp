<%-- 
    Document   : form_autor
    Created on : 28/05/2024, 14:59:10
    Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <section class="section">
        <%@include file="menu.jsp" %>
        <section class="container">
            
            <h1>Adicionar/Atualizar Autores</h1>
            
            <form method="post" action="gerenciar_autor.do" class="form">
                <input 
                    value="${autor.idAutor}"
                    name="idAutor" 
                    type="hidden" 
                />
                
                <label for="nome">Nome</label>
                <input 
                    value="${autor.nome}"
                    name="nome" 
                    id="nome" 
                    type="text"
                    placeholder="Insira Nome. Ex. Ana da Silva"
                />

                <label for="cpf">CPF</label>
                <input 
                    value="${autor.cpf}"
                    name="cpf" 
                    id="cpf" 
                    type="text"
                    placeholder="Insira CPF. Ex. 123-456-789-10"
                />

                <label for="dataNascimento">Data de Nascimento</label>
                <input
                    value="${autor.dn}"
                    name="dn" 
                    id="dataNascimento" 
                    type="date"
                />
                <label for="endereco">Endereço</label>
                <input 
                    value="${autor.end}"
                    name="end" 
                    id="endereco" 
                    type="text"
                    placeholder="Insira Endereço. Ex. Q1, C2, L3, Avenida dos Coqueiros, Brasília - DF"
                />
                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
    </section>
    </body>
</html>
