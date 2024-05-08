package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Emprestimo;
import model.pessoa.Autor;

public class AutorDAO extends DataBaseDAO {

    public AutorDAO() throws Exception{}
    
    public ArrayList<Autor> getLista() throws Exception{
        ArrayList<Autor> lista = new ArrayList<>();
        String SQL = "SELECT * FROM autor";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
        
        while(rs.next()){
            Autor autor = new Autor();
            autor.setIdAutor(rs.getInt("idAutor"));
            autor.setNome(rs.getString("nome"));
            autor.setCpf(rs.getString("cpf"));
            autor.setDn(rs.getDate("dn"));
            autor.setEnd(rs.getString("end"));

            lista.add(autor);
        }
        
        this.desconectar();
        
        return lista;
    }
    
    public boolean gravar(Autor autor) {
        
        try {
            String sql;
            this.conectar();
            
            if (autor.getIdAutor() == 0) {
                sql = "INSERT INTO Autor(nome ,cpf, dn, end)"
                        + "VALUES (?, ?, ?, ?)";

            } else {
                sql = "UPDATE Autor SET nome = ?, cpf = ?, dn = ?, end = ? WHERE idEmp = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, autor.getNome());
            pstm.setString(2, autor.getCpf());
            pstm.setDate(3, autor.getDn());
            pstm.setString(3, autor.getEnd());

            if (autor.getIdAutor() > 0) {
                pstm.setLong(4, autor.getIdAutor());
            }
            
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

}
