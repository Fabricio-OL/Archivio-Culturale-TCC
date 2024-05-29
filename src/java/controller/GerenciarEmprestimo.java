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
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.livro.Emprestimo;
import model.livro.Livro;
import model.pessoa.Bibliotecario;
import model.pessoa.Leitor;



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

        Emprestimo emprestimo = new Emprestimo();

        try {
            EmprestimoDAO emprestimoDAO = new EmprestimoDAO();
            
            if (acao.equals("alterar")) {
                
               emprestimo = emprestimoDAO.getCarregaPorID(Integer.parseInt(id));
                
                if (emprestimo.getIdEmp() > 0) {
                    
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_emprestimo.jsp");
                    request.setAttribute("emprestimo", emprestimo);
                    disp.forward(request, response);
                    
                } else {
                    
                    mensagem = "Emprestimo não encontrado";
                    
                }
            }
            if(acao.equals("delete")){
                
                emprestimo.setIdEmp(Integer.parseInt(id));
                
                if(emprestimoDAO.deletar(emprestimo)){
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
        String id = (request.getParameter("idEmp").equals(""))? "0": request.getParameter("idEmp");
        String dataEmp = request.getParameter("dataEmp");
        String dataDev = request.getParameter("dataDev");
        String status= request.getParameter("status");
        String condicao = request.getParameter("condicao");
        String idLeitor = request.getParameter("Leitor_idLeitor");
        String idLivro = request.getParameter("Livro_idLivro");
        String idBibliotecario = request.getParameter("Bibliotecario_idBibliotecario");



        String mensagem = "";

        Emprestimo emprestimo  = new Emprestimo();
        Leitor leitor = new Leitor();
        Livro livro = new Livro();
        Bibliotecario bibliotecario = new Bibliotecario();
        
        try {
            EmprestimoDAO emprestimoDAO = new EmprestimoDAO();

            if (!id.isEmpty()) {
                emprestimo.setIdEmp(Integer.parseInt(id));
                
            }

            if (condicao.equals("") || condicao.isEmpty()) {
                mensagem = "Campos obrigatorios deverão ser preenchidos";
                
            } else {
                emprestimo.setIdEmp(Integer.parseInt(id));
                emprestimo.setDataEmp(Date.valueOf(dataEmp));
                emprestimo.setDataDev(Date.valueOf(dataDev));
                emprestimo.setStatus(status);
                emprestimo.setCondicao(condicao);
                
                leitor.setIdLeitor(Integer.parseInt(idLeitor));
                emprestimo.setLeitor(leitor);
                
                livro.setIdLivro(Integer.parseInt(idLivro));
                emprestimo.setLivro(livro);

                bibliotecario.setIdBibliotecario(Integer.parseInt(idBibliotecario));
                emprestimo.setBibliotecario(bibliotecario);

                if (emprestimoDAO.gravar(emprestimo)) {
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
        out.println("location.href='listar_emprestimo.jsp';");
        out.println("</script>");
        
        
        
        
        
        
       
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
