/*
package model;

import pessoa.Leitor;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class LeitorDAO extends DataBaseDAO {

    public LeitorDAO() throws Exception{}
    
    public ArrayList<Leitor> getLista() throws Exception{
        ArrayList<Leitor> lista = new ArrayList<Leitor>();
        String SQL = "SELECT * FROM perfil";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
        
        while(rs.next()){
            Leitor p = new Leitor();
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setNome(rs.getString("nome"));
            lista.add(p);
        }
        
        this.desconectar();
        
        return lista;
    }

}
*/
