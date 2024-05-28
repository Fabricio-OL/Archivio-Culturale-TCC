package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.pessoa.Bibliotecario;

public class BibliotecarioDAO extends DataBaseDAO {

    public BibliotecarioDAO() throws Exception{}
    
    public ArrayList<Bibliotecario> getLista() throws Exception{
        ArrayList<Bibliotecario> lista = new ArrayList<>();
        String SQL = "SELECT * FROM Bibliotecario";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
        
        while(rs.next()){
            Bibliotecario Bibliotecario = new Bibliotecario();
            
            Bibliotecario.setIdBibliotecario(rs.getInt("idBibliotecario"));
            Bibliotecario.setNome(rs.getString("nome"));
            Bibliotecario.setCpf(rs.getString("cpf"));
            Bibliotecario.setDn(rs.getDate("dn"));
            Bibliotecario.setEnd(rs.getString("end"));

            lista.add(Bibliotecario);
        }
        
        this.desconectar();
        
        return lista;
    }
    
        public boolean gravar(Bibliotecario Bibliotecario) {
        
        try {
            String sql;
            this.conectar();
            
            if (Bibliotecario.getIdBibliotecario() == 0) {
                sql = "INSERT INTO Bibliotecario(nome ,cpf, dn, end)"
                        + "VALUES (?, ?, ?, ?)";

            } else {
                sql = "UPDATE Bibliotecario SET nome = ?, cpf = ?, dn = ?, end = ? WHERE idBibliotecario = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, Bibliotecario.getNome());
            pstm.setString(2, Bibliotecario.getCpf());
            pstm.setDate(3, Bibliotecario.getDn());
            pstm.setString(4, Bibliotecario.getEnd());

            if (Bibliotecario.getIdBibliotecario() > 0) {
                pstm.setLong(5, Bibliotecario.getIdBibliotecario());
            }
            
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean deletar(Bibliotecario Bibliotecario) {
        
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Bibliotecario WHERE idBibliotecario =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, Bibliotecario.getIdBibliotecario());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }
    
    public Bibliotecario getCarregaPorID(int idBibliotecario) throws Exception {
        
        Bibliotecario Bibliotecario = new Bibliotecario();
        String sql = "SELECT * FROM Bibliotecario WHERE idBibliotecario = ?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idBibliotecario);
        ResultSet rs = pstm.executeQuery();
        
        if (rs.next()) {
            Bibliotecario.setIdBibliotecario(rs.getInt("idBibliotecario"));
            Bibliotecario.setNome   (rs.getString("nome"));
            Bibliotecario.setCpf    (rs.getString("cpf"));
            Bibliotecario.setDn     (rs.getDate("dn"));
            Bibliotecario.setEnd    (rs.getString("end"));
        }
        
        this.desconectar();
        return Bibliotecario;
    }

}
