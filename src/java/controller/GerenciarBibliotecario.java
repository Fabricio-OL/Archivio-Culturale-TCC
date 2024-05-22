/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.pessoa.Bibliotecario;
import dao.BibliotecarioDAO;
import java.sql.Date;

/**
 *
 * @author jxavi
 */
public class GerenciarBibliotecario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

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
        String id = request.getParameter("idBibliotecario");

        Bibliotecario bibliotecario = new Bibliotecario();

        try {
            BibliotecarioDAO bibliotecarioDAO = new BibliotecarioDAO();
            
            if (acao.equals("alterar")) {
                
                bibliotecario = bibliotecarioDAO.getCarregaPorID(Integer.parseInt(id));
                
                if (bibliotecario.getIdBibliotecario() > 0) {
                    
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_bibliotecario.jsp");
                    request.setAttribute("bibliotecario", bibliotecario);
                    disp.forward(request, response);
                    
                } else {
                    
                    mensagem = "Bibliotecario não encontrado";
                    
                }
            }
            if(acao.equals("delete")){
                
                bibliotecario.setIdBibliotecario(Integer.parseInt(id));
                
                if(bibliotecarioDAO.deletar(bibliotecario)){
                    mensagem = "Deletado com sucesso";
                }else{
                    mensagem = "Erro ao excluir bibliotecario";
                }
            }
        } catch (Exception e) {
            mensagem = e.toString();
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='estoque.jsp';");
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
        String id = request.getParameter("idBibliotecario");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String dn = request.getParameter("dn");
        String end = request.getParameter("end");
        String salario = request.getParameter("salario");


        String mensagem = "";

        Bibliotecario bibliotecario = new Bibliotecario();
        
        try {
            BibliotecarioDAO bibliotecarioDAO = new BibliotecarioDAO();

            if (!id.isEmpty()) {
                bibliotecario.setIdBibliotecario(Integer.parseInt(id));
                
            }else{
                bibliotecario.setIdBibliotecario(0);
                
            }

            if (nome.equals("") || nome.isEmpty()) {
                mensagem = "Campos obrigatorios deverão ser preenchidos";
                
            } else {
                bibliotecario.setNome(nome);
                bibliotecario.setCpf(cpf);
                bibliotecario.setDn(Date.valueOf(dn));
                bibliotecario.setEnd(end);
                bibliotecario.setSalario(Double.parseDouble(salario));

                if (bibliotecarioDAO.gravar(bibliotecario)) {
                    mensagem = "Gravado com sucesso";
                    
                } else {
                    mensagem = "Erro ao gravar no banco de dados";
                    
                }
            }

        } catch (Exception e) {
            System.out.println(e);
            //out.print(e);
            mensagem = e.toString();
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='estoque.jsp';");
        out.println("</script>");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
