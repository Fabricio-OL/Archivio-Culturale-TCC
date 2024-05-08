
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Editora;



public class EditoraDAO extends DataBaseDAO{
    
    public EditoraDAO() throws Exception{}
    
   // Metodo Listar 
    public ArrayList<Editora> getLista() throws Exception{
        ArrayList<Editora> lista = new ArrayList<>();
        String SQL = "SELECT * FROM Editora";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);
        
        while(rs.next()){
            Editora editora = new Editora();
            editora.setCnpj(rs.getInt(0));
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
            if (editora.getCnpj() == 0) {
                sql = " INSERT INTO Editora(nome , end)"
                        + "values (?,?)";

            } else {
                sql = "UPDATE Editora SET nome = ?, end = ? WHERE cnpj = ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, editora.getNome());
            pstm.setString(2, editora.getEnd());
            // Condição para o ID 
            if (editora.getCnpj()> 0) {
                pstm.setLong(4, editora.getCnpj());
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
            sql = "DELETE FROM Ediotra WHERE cnpj =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, editora.getCnpj());// Banco de dos está INT, maso prof disse que não dá problema deixar assim
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        
        
    // Metodo carregar por CNPJ , que basicamente busca A EDITORA no banco de dados pelo seu CNPJ.

    public Editora getCarregaPorID(int cnpj) throws Exception { // O prof usou o LONG mas no nosso banco está INT 
       Editora editora = new Editora();
        String sql = "select * from Editora where cnpj=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cnpj);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            editora.setCnpj(rs.getInt("cnpj"));
            editora.setNome(rs.getString("nome"));
            editora.setEnd(rs.getString("end"));
        }
        this.desconectar();
        return editora;

    }

    
}
