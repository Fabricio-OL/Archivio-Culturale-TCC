/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.BibliotecarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Claudia
 */
public class GerenciarAcesso extends HttpServlet {

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
        // LOGOFF
        HttpSession session = request.getSession();
        String acao=request.getParameter("acao");
        
        
        if(acao.equals("logoff")){
            session.invalidate();
            response.sendRedirect("./index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // LOGIN 
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");

        String mensagem = "";
        String local="";

        try {
            BibliotecarioDAO biDAO = new BibliotecarioDAO();

            if (biDAO.login(nome, senha)) {
                mensagem="Login Realizado com sucesso";
                local="./listar_bibliotecario";
                session.setAttribute("n",nome);
            }else {
                 mensagem="Falha na autenticação,Bibliotecario:"+ nome+"não encontrado";
                 local="./index.jsp";
                 session.setAttribute("n",nome);
                  
            }

       
        } catch (Exception e) {
            System.out.println(e.toString());
            mensagem = e.toString();
            local="./index.jsp";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='"+local+"';");
        out.println("</script>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
