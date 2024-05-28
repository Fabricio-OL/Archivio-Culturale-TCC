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

public class GerenciarBibliotecario extends HttpServlet {

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
            System.out.println(e);
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_bibliotecario.jsp';");
        out.println("</script>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String id = (request.getParameter("idBibliotecario").equals(""))? "0": request.getParameter("idBibliotecario");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String dn = request.getParameter("dn");
        String end = request.getParameter("end");
        System.out.println("----------------" + id);


        String mensagem = "";

        Bibliotecario bibliotecario = new Bibliotecario();
        
        try {
            BibliotecarioDAO bibliotecarioDAO = new BibliotecarioDAO();

            if (!id.isEmpty()) {
                bibliotecario.setIdBibliotecario(Integer.parseInt(id));
            }

            if (nome.equals("") || nome.isEmpty()) {
                mensagem = "Campos obrigatorios deverão ser preenchidos";
                
            } else {
                bibliotecario.setIdBibliotecario(Integer.parseInt(id));
                bibliotecario.setNome(nome);
                bibliotecario.setCpf(cpf);
                bibliotecario.setDn(Date.valueOf(dn));
                bibliotecario.setEnd(end);

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
            //System.out.printf("Id:%s\nNome:%s\nCPF:%s\nDN:%s\nEND:%s",id,nome,cpf,dn,end);
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_bibliotecario.jsp';");
        out.println("</script>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
