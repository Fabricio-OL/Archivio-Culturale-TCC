package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.livro.Emprestimo;
import model.livro.Livro;
import model.pessoa.Bibliotecario;
import model.pessoa.Leitor;

public class EmprestimoDAO extends DataBaseDAO {

    public EmprestimoDAO() throws Exception {
    }

    // Metodo Listar
    public ArrayList<Emprestimo> getLista() throws Exception {
        ArrayList<Emprestimo> lista = new ArrayList<>();
        /*String SQL = "SELECT"
                    + "emp.idEmp, emp.dataEmp, emp.status, emp.codicao," 
                    + "lei.idLeitor, lei.nome,"
                    + "liv.idLivro, liv.titulo"
                    + "bib.idBibliotecario, bib.nome"
                    + "FROM Emprestimo emp"
                    + "JOIN Leitor lei ON emp.idLeitor = lei.idLeitor"
                    + "JOIN Livro liv ON emp.idLivro = liv.idLivro"
                    + "JOIN Bibliotecario bib ON emp.idBibliotecario = bib.idBibliotecario";*/
        
        String SQL = "SELECT"
                    + " emp.idEmp, emp.dataEmp, emp.dataDev, emp.status, emp.condicao," 
                    + " lei.idLeitor,"
                    + " liv.idLivro,"
                    + " bib.idBibliotecario"
                    + " FROM Emprestimo emp"
                    + " JOIN Leitor lei ON emp.Leitor_idLeitor = lei.idLeitor"
                    + " JOIN Livro liv ON emp.Livro_idLivro = liv.idLivro"
                    + " JOIN Bibliotecario bib ON emp.Bibliotecario_idBibliotecario = bib.idBibliotecario";
                
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
            

        while (rs.next()) {
            Emprestimo emprestimo = new Emprestimo();
            emprestimo.setIdEmp(rs.getInt("idEmp"));
            emprestimo.setDataEmp(rs.getDate("dataEmp"));
            emprestimo.setDataDev(rs.getDate("dataDev"));
            emprestimo.setStatus(rs.getString("status"));
            emprestimo.setCondicao(rs.getString("condicao"));
            
            Leitor leitor = new Leitor();
            leitor.setIdLeitor(rs.getInt("idLeitor"));
            emprestimo.setLeitor(leitor);

            
            Livro livro = new Livro();
            livro.setIdLivro(rs.getInt("idLivro"));
            emprestimo.setLivro(livro);
            
            Bibliotecario bibliotecario = new Bibliotecario();
            bibliotecario.setIdBibliotecario(rs.getInt("idBibliotecario"));
            emprestimo.setBibliotecario(bibliotecario);
            

            lista.add(emprestimo);
        }

        this.desconectar();

        return lista;
    }
    // Metodo Gravar

    public boolean gravar(Emprestimo emprestimo) {
        try {
            String sql;
            this.conectar();
            if (emprestimo.getIdEmp() == 0) {
                sql = " insert into Emprestimo(dataEmp ,dataDev, status, Leitor_idLeitor, condicao, Livro_idLivro, Bibliotecario_idBibliotecario)"
                        + "values (?, ?, ?, ?, ?, ?, ?)";

            } else {
                sql =   "UPDATE Emprestimo" 
                        + " SET dataEmp = ?, dataDev = ?, status = ?, Leitor_idLeitor = ?, condicao = ?, Livro_idLivro = ?, Bibliotecario_idBibliotecario = ?  WHERE idEmp = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setDate(1, emprestimo.getDataEmp());
            pstm.setDate(2, emprestimo.getDataDev());
            pstm.setString(3, emprestimo.getStatus());
            pstm.setInt(4, emprestimo.getLeitor().getIdLeitor());
            pstm.setString(5, emprestimo.getCondicao());
            pstm.setInt(6, emprestimo.getLivro().getIdLivro());
            pstm.setInt(7, emprestimo.getBibliotecario().getIdBibliotecario());


            if (emprestimo.getIdEmp() > 0) {
                pstm.setLong(8, emprestimo.getIdEmp());
            }
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;

        }

    }
    // Metodo Deletar 

    public boolean deletar(Emprestimo emprestimo) {
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Emprestimo WHERE idEmp =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, emprestimo.getIdEmp());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }
// Metodo carregar por ID , que basicamente busca um emprestimo no banco de dados pelo seu ID.

    public Emprestimo getCarregaPorID(int idEmp) throws Exception {
        
        Emprestimo emprestimo = new Emprestimo();
        Leitor leitor = new Leitor();
        Livro livro = new Livro();
        Bibliotecario bibliotecario = new Bibliotecario();
        
        String sql = "SELECT * FROM Emprestimo WHERE idEmp = ?";
        
        this.conectar();
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idEmp);
        ResultSet rs = pstm.executeQuery();
        
        if (rs.next()) {
            emprestimo.setIdEmp(rs.getInt("idEmp"));
            emprestimo.setDataEmp(rs.getDate("dataEmp"));
            emprestimo.setDataDev(rs.getDate("dataDev"));
            emprestimo.setStatus(rs.getString("status"));
            emprestimo.setCondicao(rs.getString("condicao"));
            
            leitor.setIdLeitor(rs.getInt("Leitor_idLeitor"));
            emprestimo.setLeitor(leitor);
            
            livro.setIdLivro(rs.getInt("Livro_idLivro"));
            emprestimo.setLivro(livro);
            
            bibliotecario.setIdBibliotecario(rs.getInt("Bibliotecario_idBibliotecario"));
            emprestimo.setBibliotecario(bibliotecario);

        }
        this.desconectar();
        return emprestimo;
        
    }

    public String ConferirStatus(int id) throws Exception {
        Emprestimo emprestimo = new Emprestimo();
        String sql = "select status from Emprestimo where id =?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            emprestimo.setStatus(rs.getString("status"));
        }
        this.desconectar();
        return emprestimo.getStatus();

    }

    public double emitirMulta(int id) throws Exception {

        double multa = 0;

        if (ConferirStatus(id) == "0") {
            multa = 0;

        } else if (ConferirStatus(id) == "1") {
            multa = 15;

        } else if (ConferirStatus(id) == "2") {
            multa = 50;

        }
        return multa;

    }
}
