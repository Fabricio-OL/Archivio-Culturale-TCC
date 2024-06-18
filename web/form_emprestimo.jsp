<%-- 
    Document   : form_emprestimo
    Created on : May 21, 2024, 8:53:43 PM
    Author     : Fabricio
--%>

<%@page import="dao.BibliotecarioDAO"%>
<%@page import="model.pessoa.Bibliotecario"%>
<%@page import="dao.LivroDAO"%>
<%@page import="model.livro.Livro"%>
<%@page import="dao.LeitorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.pessoa.Leitor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <section class="section">
        <%@include file="menu.jsp" %>
        <section class="container">

            <h1>Adicionar/Atualizar Emprestimo</h1>

            <form method="post" action="gerenciar_emprestimo.do" class="form">
                <input 
                    value="${emprestimo.idEmp}"
                    name="idEmp" 
                    type="hidden" 
                    />

                <label for="dataEmp">Data do Emprestimo</label>
                <input
                    value="${emprestimo.dataEmp}"
                    name="dataEmp" 
                    id="dataEmp" 
                    type="date"
                    />

                <label for="dataDev">Data da Devolução</label>
                <input
                    value="${emprestimo.dataDev}"
                    name="dataDev" 
                    id="dataDev" 
                    type="date"
                    />

                <label for="status">Status</label>
                <input 
                    value="${emprestimo.status}"
                    name="status" 
                    id="status" 
                    type="text"
                    />

                <label for="condicao">Condição</label>
                <input 
                    value="${emprestimo.condicao}"
                    name="condicao" 
                    id="condicao" 
                    type="text"
                    placeholder="Insira a Condição que o livro se encontra. Ex. Danificado, Novo, Semi-Novo"
                />
    
                
            <label for="Leitor_idLeitor">ID Leitor</label>
            <select name="Leitor_idLeitor" id="Leitor_idLeitor">
                <option value="" selected>Selecione...</option>
                <% 
                    ArrayList<Leitor> listaLeitores = new ArrayList<Leitor>();
                    try {
                        LeitorDAO leitorDAO = new LeitorDAO();
                        listaLeitores = leitorDAO.getLista();
                        for(Leitor leitor : listaLeitores){
                %>
                <option value="<%= leitor.getIdLeitor() %>"><%= leitor.getIdLeitor() %> - <%= leitor.getNome() %></option>
                <% 
                        } 
                    } catch(Exception e) {
                        out.print(e);
                    }
                %>
            </select>
                
            <label for="Livro_idLivro">ID Livro</label>
            <select name="Livro_idLivro" id="Livro_idLivro">
                <option value="" selected>Selecione...</option>
                <% 
                    ArrayList<Livro> listaLivros = new ArrayList<Livro>();
                    try {
                        LivroDAO livroDAO = new LivroDAO();
                        listaLivros = livroDAO.getLista();
                        for(Livro livro : listaLivros){
                %>
                <option value="<%= livro.getIdLivro() %>"><%= livro.getIdLivro() %>  - <%= livro.getTitulo() %>  </option>
                <% 
                        } 
                    } catch(Exception e) {
                        out.print(e);
                    }
                %>
            </select>
                
            <label for="Bibliotecario_idBibliotecario">ID Bibliotecário</label>
            <select name="Bibliotecario_idBibliotecario" id="Bibliotecario_idBibliotecario">
                <option value="" selected>Selecione...</option>
                <% 
                    ArrayList<Bibliotecario> listaBibliotecarios = new ArrayList<Bibliotecario>();
                    try {
                        BibliotecarioDAO bibliotecarioDAO = new BibliotecarioDAO();
                        listaBibliotecarios = bibliotecarioDAO.getLista();
                        for(Bibliotecario bibliotecario : listaBibliotecarios){
                %>
                <option value="<%= bibliotecario.getIdBibliotecario() %>"><%= bibliotecario.getIdBibliotecario() %> - <%= bibliotecario.getNome() %></option>
                <% 
                        } 
                    } catch(Exception e) {
                        out.print(e);
                    }
                %>
            </select>
            
            
            
            
            

                <input class="button" type="submit" value="Adicionar"/>
            </form>
        </section>
    </section>
    </body>
</html>
