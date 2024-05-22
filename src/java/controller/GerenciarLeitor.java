package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.pessoa.Leitor;
import dao.LeitorDAO;
import java.sql.Date;

public class GerenciarLeitor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String mensagem = "";

        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        System.out.println(acao + id);

        Leitor leitor = new Leitor();

        try {
            LeitorDAO leitorDAO = new LeitorDAO();
            
            if (acao.equals("alterar")) {
                
                leitor = leitorDAO.getCarregaPorID(Integer.parseInt(id));
                
                if (leitor.getIdLeitor() > 0) {
                    
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_leitor.jsp");
                    request.setAttribute("leitor", leitor);
                    disp.forward(request, response);
                    
                } else {
                    
                    mensagem = "Leitor não encontrado";
                    
                }
            }
            if(acao.equals("delete")){
                
                leitor.setIdLeitor(Integer.parseInt(id));
                
                if(leitorDAO.deletar(leitor)){
                    mensagem = "Deletado com sucesso";
                }else{
                    mensagem = "Erro ao excluir leitor";
                }
            }
        } catch (Exception e) {
            mensagem = e.toString();
            System.out.println(e);
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_leitor.jsp';");
        out.println("</script>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String id = (request.getParameter("idLeitor").equals(""))? "0": request.getParameter("idLeitor");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String dn = request.getParameter("dn");
        String end = request.getParameter("end");


        String mensagem = "";

        Leitor leitor = new Leitor();
        
        try {
            LeitorDAO leitorDAO = new LeitorDAO();

            if (!id.isEmpty()) {
                leitor.setIdLeitor(Integer.parseInt(id));
                
            }

            if (nome.equals("") || nome.isEmpty()) {
                mensagem = "Campos obrigatorios deverão ser preenchidos";
                
            } else {
                leitor.setIdLeitor(Integer.parseInt(id));
                leitor.setNome(nome);
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
    }

}
