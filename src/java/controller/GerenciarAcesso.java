/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AcessoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Acesso;

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
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       String idAcesso = request.getParameter("idAcesso");
       String nome = request.getParameter("nome");
       
       String mensagem="";
       
       Acesso acesso = new Acesso();
       try{
       AcessoDAO aDAO = new AcessoDAO();
          if (!idAcesso.isEmpty()){
              acesso.setIdAcesso(Integer.parseInt(idAcesso));
          }
          if(nome.equals("")| nome.isEmpty()){
              mensagem = "Campos Obrigatórios deverão ser preenchidos";
              
          }else{
              acesso.setNome(nome);
              if(aDAO.gravar(acesso)){
                  mensagem = " Gravado com sucesso!";
              }else{
                  mensagem = "Erro ao gravar no banco de dados!";
              }
          }
       
   
       }catch(Exception e ){
           out.print(e); 
           mensagem="Erro ao executar";
       }
       out.println("<script type='text/javascript'>");
       out.println("alert('"+mensagem+"');");
       out.println("location.href='listar_acesso.jsp';");
       out.println("</script>");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
