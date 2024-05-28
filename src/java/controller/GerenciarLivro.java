/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.LivroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.livro.Livro;


/**
 *
 * @author Claudia
 */
public class GerenciarLivro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
          PrintWriter out = response.getWriter();
        String mensagem = "";

        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        System.out.println(acao + id);

        Livro livro = new Livro();

        try {
            LivroDAO liDAO = new LivroDAO();
            
            if (acao.equals("alterar")) {
                
                livro = liDAO.getCarregaPorID(Integer.parseInt(id));
                
                if (livro.getIdLivro() > 0) {
                    
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_livro.jsp");
                    request.setAttribute("livro", livro);
                    disp.forward(request, response);
                    
                } else {
                    
                    mensagem = "Livro não encontrado";
                    
                }
            }
            if(acao.equals("delete")){
                
                livro.setIdLivro(Integer.parseInt(id));
                
                if(liDAO.deletar(livro)){
                    mensagem = "Deletado com sucesso";
                }else{
                    mensagem = "Erro ao excluir livro";
                }
            }
        } catch (Exception e) {
            mensagem = e.toString();
            System.out.println(e);
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_livro.jsp';");
        out.println("</script>");
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        PrintWriter out = response.getWriter();
        String id = (request.getParameter("idLivro").equals(""))? "0": request.getParameter("idLivro");
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String genero = request.getParameter("genero");
        System.out.println("----------------" + id);
        


        String mensagem = "";

        Livro livro = new Livro();
        
        try {
            LivroDAO liDAO = new LivroDAO();

            if (!id.isEmpty()) {
                livro.setIdLivro(Integer.parseInt(id));
                
            }

            if (titulo.equals("") || titulo.isEmpty()) {
                mensagem = "Campos obrigatorios deverão ser preenchidos";
                
            } else {
                livro.setIdLivro(Integer.parseInt(id));
                livro.setIsbn((isbn));
                livro.setTitulo(titulo);
                livro.setGenero(genero);
               
                
                if (liDAO.gravar(livro)) {
                    mensagem = "Gravado com sucesso";
                    
                } else {
                    mensagem = "Erro ao gravar no banco de dados";
                    
                }

            }

        } catch (Exception e) {
            System.out.println(e);
            //out.print(e);
            mensagem = e.toString();
            //System.out.printf("Id:%s\nNome:%s\nCPF:%s\nDN:%s\nEND:%s",id,nome,cpf,dn,end);
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_livro.jsp';");
        out.println("</script>");
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
