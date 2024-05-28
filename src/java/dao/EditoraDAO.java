package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.livro.Editora;

public class EditoraDAO extends DataBaseDAO {

    public EditoraDAO() throws Exception {
    }

    // Metodo Listar 
    public ArrayList<Editora> getLista() throws Exception {
        ArrayList<Editora> lista = new ArrayList<>();
        String SQL = "SELECT * FROM Editora";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);

        while (rs.next()) {
            Editora editora = new Editora();
            editora.setIdEditora(rs.getInt("idEditora"));
            editora.setCnpj(rs.getString("cnpj"));
            editora.setNome(rs.getString("nome"));
            editora.setEnd(rs.getString("end"));

            lista.add(editora);
        }

        this.desconectar();

        return lista;
    }
    // Metodo Gravar

    public boolean gravar(Editora editora) {
        try {
            String sql;
            this.conectar();
            if (editora.getIdEditora() == 0) {
                sql = " INSERT INTO Editora(nome,end,cnpj,livro_idlivro)"
                        + "values (?,?,?)";

            } else {
                sql = "UPDATE Editora SET nome = ?, end = ?, cnpj = ?,livro_idlivro=? WHERE idEditora= ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, editora.getCnpj());
            pstm.setString(2, editora.getNome());
            pstm.setString(3, editora.getEnd());
            pstm.setInt(4, editora.getLivro()); // Duvidas 
            
            // Condição para o ID 
            if (editora.getIdEditora() > 0) {
                pstm.setLong(5, editora.getIdEditora());
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

    public boolean deletar(Editora editora) {
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Editora WHERE idEditora=?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, editora.getIdEditora());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }
    // Metodo carregar por ID, que basicamente busca A EDITORA no banco de dados pelo seu ID.

    public Editora getCarregaPorID(int idEditora) throws Exception {
        Editora editora = new Editora();
        String sql = "SELECT * FROM Editora WHERE idEditora=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idEditora);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            editora.setIdEditora(rs.getInt("idEditora"));
            editora.setCnpj(rs.getString("cnpj"));
            editora.setNome(rs.getString("nome"));
            editora.setEnd(rs.getString("end"));
        }
        this.desconectar();
        return editora;

    }

}
