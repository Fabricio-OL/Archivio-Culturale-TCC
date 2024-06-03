/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;



import dao.EditoraDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.livro.Editora;




/**
 *
 * @author Claudia
 */
public class GerenciarEditora extends HttpServlet {

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

        Editora editora = new Editora();

        try {
            EditoraDAO editoraDAO = new EditoraDAO();
            
            if (acao.equals("alterar")) {
                
                editora = editoraDAO.getCarregaPorID(Integer.parseInt(id));
                
                if (editora.getIdEditora() > 0) {
                    
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_editora.jsp");
                    request.setAttribute("editora", editora);
                    disp.forward(request, response);
                    
                } else {
                    
                    mensagem = "Editora não encontrada";
                    
                }
            }
            if(acao.equals("delete")){
                
                editora.setIdEditora(Integer.parseInt(id));
                
                if(editoraDAO.deletar(editora)){
                    mensagem = "Deletado com sucesso";
                }else{
                    mensagem = "Erro ao excluir Editora";
                }
            }
        } catch (Exception e) {
            mensagem = e.toString();
            System.out.println(e);
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='listar_editora.jsp';");
        out.println("</script>");

    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
              

        PrintWriter out = response.getWriter();
        String id = (request.getParameter("idEditora").equals(""))? "0": request.getParameter("idEditora");
        String nome = request.getParameter("nome");
        String cnpj = request.getParameter("cnpj");
        String end = request.getParameter("end");
        

        String mensagem = "";

        Editora editora = new Editora();
        
        
        try {
            EditoraDAO editoraDAO = new EditoraDAO();

            if (!id.isEmpty()) {
                editora.setIdEditora(Integer.parseInt(id));
            }

            if (nome.equals("") || nome.isEmpty()) {
                mensagem = "Campos obrigatorios deverão ser preenchidos";
                
            } else {
                editora.setIdEditora(Integer.parseInt(id));
                editora.setNome(nome);
                editora.setCnpj(cnpj);
                editora.setEnd(end);
                

                if (editoraDAO.gravar(editora)) {
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
        out.println("location.href='listar_editora.jsp';");
        out.println("</script>");
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
