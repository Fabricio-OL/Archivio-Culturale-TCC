/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.AutorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.pessoa.Autor;

/**
 *
 * @author Claudia
 */
public class GerenciarAutor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
    
        Autor autor = new Autor ();
        
        try {
            AutorDAO autorDAO = new AutorDAO();
            if (acao.equals("alterar")) {
                autor = autorDAO.getCarregaPorID(Integer.parseInt(id));
                if (autor.getIdAutor() > 0) {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_autor.jsp");
                    request.setAttribute("autor", autor);
                    disp.forward(request, response);
                } else {
                    mensagem = "Autor não encontrado";
                }
            }
            if (acao.equals("delete")){
                autor.setIdAutor(Integer.parseInt(id));
                if (autorDAO.deletar(autor)){
                    mensagem ="Deletado com sucesso";
                }else{
                    mensagem = "Erro ao excluir Perfil";
                    
                }
            }

        } catch (Exception e) {
            System.out.print(e);
            mensagem = "Erro ao executar";

        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_autor.jsp';");
        out.println("</script>");

        
        
        
    }

   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         PrintWriter out = response.getWriter();

        String id = (request.getParameter("idAutor").equals(""))? "0": request.getParameter("idAutor");
        String nome = request.getParameter("nome");
        String  cpf  = request.getParameter("cpf");
        String dn  = request.getParameter("dn"); 
        String  end  = request.getParameter("end");
        System.out.println("----------------" + id);

        String mensagem = "";

        Autor autor = new Autor();
        try {
            AutorDAO autorDAO = new AutorDAO();

            if (!id.isEmpty()) {
                autor.setIdAutor(Integer.parseInt(id));
            }
            if (nome.equals("") || nome.isEmpty()) {
                mensagem = "Campos Obrigatórios deverão ser preenchidos";

            } else {
                autor.setIdAutor(Integer.parseInt(id));
                autor.setCpf(cpf);
                autor.setDn(Date.valueOf(dn));
                autor.setEnd(end);
                autor.setNome(nome);
                
                if (autorDAO.gravar(autor)) { 
                    mensagem = " Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar no banco de dados!";
                }
            }

       
        } catch (Exception e) {
            System.out.println(e.toString());
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_autor.jsp';");
        out.println("</script>");
    }

        
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
