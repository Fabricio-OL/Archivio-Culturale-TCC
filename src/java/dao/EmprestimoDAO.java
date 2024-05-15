package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.livro.Emprestimo;

public class EmprestimoDAO extends DataBaseDAO {

    public EmprestimoDAO() throws Exception {
    }

    // Metodo Listar
    public ArrayList<Emprestimo> getLista() throws Exception {
        ArrayList<Emprestimo> lista = new ArrayList<>();
        String SQL = "SELECT * FROM Emprestimo";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);

        while (rs.next()) {
            Emprestimo em = new Emprestimo();
            em.setIdEmp(rs.getInt("idEmp"));
            em.setDataEmp(rs.getDate("dataEmp"));
            em.setDataDev(rs.getDate("dataDev"));
            em.setStatus(rs.getString("status"));

            lista.add(em);
        }

        this.desconectar();

        return lista;
    }
    // Metodo Gravar

    public boolean gravar(Emprestimo em) {
        try {
            String sql;
            this.conectar();
            if (em.getIdEmp() == 0) {
                sql = " insert into Emprestimo(dataEmp ,dataDev, status)"
                        + "values (?,?,?)";

            } else {
                sql = "UPDATE Emprestimo SET dataEmp = ?, dataDev = ?, status = ? WHERE idEmp = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setDate(1, em.getDataEmp());
            pstm.setDate(2, em.getDataDev());
            pstm.setString(3, em.getStatus());
            // Condição para o ID 
            if (em.getIdEmp() > 0) {
                pstm.setLong(4, em.getIdEmp());
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

    public boolean deletar(Emprestimo em) {
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Emprestimo WHERE idEmp =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, em.getIdEmp());
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
        Emprestimo em = new Emprestimo();
        String sql = "select * from Emprestimo where idEmp=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idEmp);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            em.setIdEmp(rs.getInt("idEmp"));
            em.setDataEmp(rs.getDate("dataEmp"));
            em.setDataDev(rs.getDate("dataDev"));
            em.setStatus(rs.getString("status"));
        }
        this.desconectar();
        return em;
    }

    public String ConferirStatus(int id) throws Exception {
        Emprestimo em = new Emprestimo();
        String sql = "select status from Emprestimo where id =?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            em.setStatus(rs.getString("status"));
        }
        this.desconectar();
        return em.getStatus();

    }

    public double emitirMulta(int id) throws Exception {

        double multa = 0;

        if (ConferirStatus(id) == "0") {
            multa = 0;

        } else if (ConferirStatus(id) == "1") {
            multa = 50;

        } else if (ConferirStatus(id) == "2") {
            multa = 100;

        }
        return multa;

    }
}