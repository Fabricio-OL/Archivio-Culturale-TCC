 package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Acesso;

public class AcessoDAO extends DataBaseDAO {
    
    public AcessoDAO() throws Exception{}
    // Metodo Listar
    public ArrayList<Acesso> getLista() throws Exception {
        ArrayList<Acesso> lista = new ArrayList<>();
        String SQL = "SELECT * FROM Acesso";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);

        while (rs.next()) {
            Acesso acesso = new Acesso();
            acesso.setIdAcesso(rs.getInt("idAcesso"));
            acesso.setNome(rs.getString("nome"));

            lista.add(acesso);
        }

        this.desconectar();

        return lista;
    }

    // Metodo Gravar
    public boolean gravar(Acesso acesso) {
        try {
            String sql;
            this.conectar();
            if (acesso.getIdAcesso() == 0) {
                sql = " INSERT INTO Acesso(nome)"
                        + "values (?)";

            } else {
                sql = "UPDATE Acesso SET nome = ? WHERE idAcesso = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, acesso.getNome());
            // Condição para o ID 
            if (acesso.getIdAcesso() > 0) {
                pstm.setLong(2, acesso.getIdAcesso());
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
    public boolean deletar(Acesso acesso) {
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Acesso WHERE idAcesso =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, acesso.getIdAcesso());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }
    // Metodo carregar por ID , que basicamente busca um Acesso no banco de dados pelo seu ID.

    public Acesso getCarregaPorID(int idAcesso) throws Exception {
        Acesso acesso = new Acesso();
        String sql = "SELECT * FROM Acesso WHERE idAcesso=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idAcesso);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            acesso.setIdAcesso(rs.getInt("idEmp"));
            acesso.setNome(rs.getString("nome"));
        }
        this.desconectar();
        return acesso;
    }
}
