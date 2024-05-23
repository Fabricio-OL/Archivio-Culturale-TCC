/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.EmprestimoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.livro.Emprestimo;



/**
 *
 * @author Claudia
 */
public class GerenciarEmprestimo extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {PrintWriter out = response.getWriter();
        String mensagem = "";

        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        System.out.println(acao + id);

        Emprestimo emp = new Emprestimo();

        try {
            EmprestimoDAO empDAO = new EmprestimoDAO();
            
            if (acao.equals("alterar")) {
                
               emp= empDAO.getCarregaPorID(Integer.parseInt(id));
                
                if (emp.getIdEmp() > 0) {
                    
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_emprestimo.jsp");
                    request.setAttribute("emprestimo", emp);
                    disp.forward(request, response);
                    
                } else {
                    
                    mensagem = "Emprestimo não encontrado";
                    
                }
            }
            if(acao.equals("delete")){
                
                emp.setIdEmp(Integer.parseInt(id));
                
                if(empDAO.deletar(emp)){
                    mensagem = "Deletado com sucesso";
                }else{
                    mensagem = "Erro ao excluir emprestimo";
                }
            }
        } catch (Exception e) {
            mensagem = e.toString();
            System.out.println(e);
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_emprestimo.jsp';");
        out.println("</script>");

     
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String id = (request.getParameter("idEmprestimo").equals(""))? "0": request.getParameter("idEmprestimo");
        String dataEmp = request.getParameter("dataEmp");
        String dataDev = request.getParameter("dataDev");
        String status= request.getParameter("status");
        String condicao = request.getParameter("condicao");


        String mensagem = "";

        Emprestimo emp  = new Emprestimo();
        
        try {
            EmprestimoDAO empDAO = new EmprestimoDAO();

            if (!id.isEmpty()) {
                emp.setIdEmp(Integer.parseInt(id));
                
            }

            if (nome.equals("") || nome.isEmpty()) {
                mensagem = "Campos obrigatorios deverão ser preenchidos";
                
            } else {
                 emp.setIdEmp(Integer.parseInt(id));
                 emp.setDataDev(dataDev);
                leitor.setCpf(cpf);
                leitor.setDn(Date.valueOf(dn));
                leitor.setEnd(end);

                if (leitorDAO.gravar(leitor)) {
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
        out.println("location.href='listar_leitor.jsp';");
        out.println("</script>");
        
        
        
        
        
        
       
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
