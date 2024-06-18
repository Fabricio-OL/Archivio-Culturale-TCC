
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.livro.Livro;
import model.livro.Editora;

public class LivroDAO extends DataBaseDAO {
    
    public LivroDAO() throws Exception {
    }

    // Metodo Listar 
    public ArrayList<Livro> getLista() throws Exception {
        ArrayList<Livro> lista = new ArrayList<>();
        String SQL =  "SELECT"
                    + " li.idLivro, li.isbn, li.titulo, li.genero," 
                    + " li.idEditora"
                    + " FROM Livro li"
                    + " JOIN Editora ed ON li.idEditora = ed.idEditora";
        
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);

        while (rs.next()) {
            Livro livro = new Livro();
            Editora editora = new Editora();
            
            livro.setIdLivro(rs.getInt("idLivro"));
            livro.setIsbn(rs.getString("isbn"));
            livro.setTitulo(rs.getString("titulo"));
            livro.setGenero(rs.getString("genero"));
          //  livro.setNomearquivo(rs.getString("nomearquivo"));
            
            editora.setIdEditora(rs.getInt("idEditora"));
            livro.setEditora(editora);
            

            lista.add(livro);
        }

        this.desconectar();

        return lista;
    }
    
    
    
      // Metodo Gravar

    public boolean gravar(Livro livro ) {
        try {
            String sql;
            this.conectar();
            if (livro.getIdLivro()== 0) {
                sql = " INSERT INTO Livro(isbn,titulo,genero,idEditora)"
                        + "values (?,?,?,?)";

            } else {
                sql = "UPDATE Livro SET  isbn= ? ,titulo = ?,genero = ?,idEditora=? WHERE idLivro= ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, livro.getTitulo());
            pstm.setString(2, livro.getIsbn());
            pstm.setString(3, livro.getGenero());
           // pstm.setString(4,livro.getNomearquivo());
            pstm.setInt(5,livro.getEditora().getIdEditora());
            
      
            // Condição para o ID 
            if (livro.getIdLivro()> 0) {
                pstm.setLong(6, livro.getIdLivro());
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

    public boolean deletar(Livro livro ) {
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Livro WHERE idLivro=?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, livro.getIdLivro());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

       
    }
    
     // Metodo carregar por ID, que basicamente busca O LIVRO  no banco de dados pelo seu ID.

    public Livro getCarregaPorID(int idLivro) throws Exception {
        Livro livro = new Livro();
        Editora editora = new Editora();
        
        String sql = "SELECT * FROM Livro WHERE idLivro=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idLivro);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            livro.setIdLivro(rs.getInt("idLivro"));
            livro.setTitulo(rs.getString("titulo"));
            livro.setIsbn(rs.getString("isbn"));
            livro.setGenero(rs.getString("genero"));
            
           editora.setIdEditora(rs.getInt("idEditora"));
            livro.setEditora(editora);
        }
        this.desconectar();
        return livro;

    }
    
}
