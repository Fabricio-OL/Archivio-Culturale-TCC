package dao;

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

}
