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
        String SQL = "SELECT * FROM bibliotecario";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
        
        while(rs.next()){
            Bibliotecario bibliotecario = new Bibliotecario();
            
            bibliotecario.setIdBibliotecario(rs.getInt("idBibliotecario"));
            bibliotecario.setNome(rs.getString("nome"));
            bibliotecario.setCpf(rs.getString("cpf"));
            bibliotecario.setDn(rs.getDate("dn"));
            bibliotecario.setEnd(rs.getString("end"));
            bibliotecario.setSalario(rs.getDouble("salario"));
            
            lista.add(bibliotecario);
        }
        
        this.desconectar();
        
        return lista;
    }
    
        public boolean gravar(Bibliotecario bibliotecario) {
        
        try {
            String sql;
            this.conectar();
            
            if (bibliotecario.getIdBibliotecario() == 0) {
                sql = "INSERT INTO Bibliotecario(nome ,cpf, dn, end, salario)"
                        + "VALUES (?, ?, ?, ?, ?)";

            } else {
                sql = "UPDATE Bibliotecario SET nome = ?, cpf = ?, dn = ?, end = ?, salario = ? WHERE idBibliotecario = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, bibliotecario.getNome());
            pstm.setString(2, bibliotecario.getCpf());
            pstm.setDate(3, bibliotecario.getDn());
            pstm.setString(4, bibliotecario.getEnd());
            pstm.setDouble(5, bibliotecario.getSalario());

            if (bibliotecario.getIdBibliotecario() > 0) {
                pstm.setLong(6, bibliotecario.getIdBibliotecario());
            }
            
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean deletar(Bibliotecario bibliotecario) {
        
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Bibliotecario WHERE idBibliotecario =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, bibliotecario.getIdBibliotecario());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }
    
    public Bibliotecario getCarregaPorID(int idBibliotecario) throws Exception {
        
        Bibliotecario bibliotecario = new Bibliotecario();
        String sql = "SELECT * FROM Bibliotecario WHERE idBibliotecario = ?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idBibliotecario);
        ResultSet rs = pstm.executeQuery();
        
        if (rs.next()) {
            bibliotecario.setIdBibliotecario(rs.getInt("idBibliotecario"));
            bibliotecario.setNome   (rs.getString("nome"));
            bibliotecario.setCpf    (rs.getString("cpf"));
            bibliotecario.setDn     (rs.getDate("dn"));
            bibliotecario.setEnd    (rs.getString("end"));
            bibliotecario.setSalario(rs.getDouble("salario"));
        }
        
        this.desconectar();
        return bibliotecario;
    }

}
