package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.livro.Editora;
import model.livro.Livro;

public class EditoraDAO extends DataBaseDAO {

    public EditoraDAO() throws Exception {
    }

    // Metodo Listar 
    public ArrayList<Editora> getLista() throws Exception {
        ArrayList<Editora> lista = new ArrayList<>();
        /* 
        String SQL = "SELECT"
                    + " ed.idEditora, ed.nome, ed.end, ed.cnpj" 
                    + " liv.idLivro,"
                    + " FROM Editora ed"
                    + " JOIN Livro liv ON ed.Livro_idLivro = liv.idLivro";   */
        
        String SQL = "SELECT"
                    + " ed.idEditora, ed.nome, ed.end, ed.cnpj," 
                    + " liv.idLivro"
                    + " FROM Editora ed"
                    + " JOIN Livro liv ON ed.Livro_idLivro = liv.idLivro";        
        
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);

        while (rs.next()) {
            Editora editora = new Editora();
            Livro livro = new Livro();
            
            editora.setIdEditora(rs.getInt("idEditora"));
            editora.setCnpj(rs.getString("cnpj"));
            editora.setNome(rs.getString("nome"));
            editora.setEnd(rs.getString("end"));
            
            livro.setIdLivro(rs.getInt("idLivro"));
            editora.setLivro(livro);

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
                sql = " INSERT INTO Editora(nome,end,cnpj,Livro_idLivro)"
                        + "values (?,?,?,?)";

            } else {
                sql = "UPDATE Editora SET nome = ?, end = ?, cnpj = ?,Livro_idLivro=? WHERE idEditora= ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, editora.getNome());
            pstm.setString(2, editora.getEnd());
            pstm.setString(3, editora.getCnpj());
            pstm.setInt(4,editora.getLivro().getIdLivro());
            
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
        Livro livro = new Livro();
        
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
            
            livro.setIdLivro(rs.getInt("Livro_idLivro"));
            editora.setLivro(livro);
        }
        this.desconectar();
        return editora;

    }

}
