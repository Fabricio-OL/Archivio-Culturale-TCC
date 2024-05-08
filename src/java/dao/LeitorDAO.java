package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.pessoa.Leitor;

public class LeitorDAO extends DataBaseDAO {

    public LeitorDAO() throws Exception{}
    
    public ArrayList<Leitor> getLista() throws Exception{
        ArrayList<Leitor> lista = new ArrayList<>();
        String SQL = "SELECT * FROM leitor";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
        
        while(rs.next()){
            Leitor leitor = new Leitor();
            leitor.setIdLeitor(rs.getInt("idLeitor"));
            leitor.setNome(rs.getString("nome"));
            leitor.setCpf(rs.getString("cpf"));
            leitor.setDn(rs.getDate("dn"));
            leitor.setEnd(rs.getString("end"));

            lista.add(leitor);
        }
        
        this.desconectar();
        
        return lista;
    }
    
        public boolean gravar(Leitor leitor) {
        
        try {
            String sql;
            this.conectar();
            
            if (leitor.getIdLeitor() == 0) {
                sql = "INSERT INTO Leitor(nome ,cpf, dn, end)"
                        + "VALUES (?, ?, ?, ?)";

            } else {
                sql = "UPDATE Leitor SET nome = ?, cpf = ?, dn = ?, end = ? WHERE idLeitor = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, leitor.getNome());
            pstm.setString(2, leitor.getCpf());
            pstm.setDate(3, leitor.getDn());
            pstm.setString(4, leitor.getEnd());

            if (leitor.getIdLeitor() > 0) {
                pstm.setLong(5, leitor.getIdLeitor());
            }
            
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean deletar(Leitor leitor) {
        
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Leitor WHERE idLeitor =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, leitor.getIdLeitor());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }
    
    public Leitor getCarregaPorID(int idLeitor) throws Exception {
        
        Leitor leitor = new Leitor();
        String sql = "SELECT * FROM Leitor WHERE idLeitor = ?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idLeitor);
        ResultSet rs = pstm.executeQuery();
        
        if (rs.next()) {
            leitor.setIdLeitor(rs.getInt("idLeitor"));
            leitor.setNome   (rs.getString("nome"));
            leitor.setCpf    (rs.getString("cpf"));
            leitor.setDn     (rs.getDate("dn"));
            leitor.setEnd    (rs.getString("end"));
        }
        
        this.desconectar();
        return leitor;
    }

}
