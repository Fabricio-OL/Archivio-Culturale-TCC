package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Reservas;

public class ReservasDAO extends DataBaseDAO {

    public ReservasDAO() throws Exception {
    }

// Metodo Listar
    public ArrayList<Reservas> getLista() throws Exception {
        ArrayList<Reservas> lista = new ArrayList<>();
        String SQL = "SELECT * FROM Reservas";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(SQL);

        while (rs.next()) {
            Reservas re = new Reservas();
            re.setIdReserva(rs.getInt("idReserva"));
            re.setDataReserva(rs.getDate("dataRev"));
            re.setStatus(rs.getString("status"));

            lista.add(re);
        }

        this.desconectar();

        return lista;
    }

    // Metodo Gravar
    public boolean gravar(Reservas re) {
        try {
            String sql;
            this.conectar();
            if (re.getIdReserva() == 0) {
                sql = " insert into Reservas(idReserva ,dataRev, status)"
                        + "values (?,?,?)";

            } else {
                sql = "UPDATE Reservas SET dataRev = ?, status = ? WHERE idReserva= ?";
            }

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setDate(1, re.getDataReserva());
            pstm.setString(2, re.getStatus());
            // Condição para o ID 
            if (re.getIdReserva() > 0) {
                pstm.setLong(3, re.getIdReserva());
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
    public boolean deletar(Reservas re) {
        try {
            String sql;
            this.conectar();
            sql = "DELETE FROM Reservas WHERE idReserva =?;";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setLong(1, re.getIdReserva()); // LONG ou INT?
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }
    // Metodo carregar por ID , que basicamente busca uma Reserva  no banco de dados pelo seu ID.

    public Reservas getCarregaPorID(int idReservas) throws Exception { // O prof usou o LONG mas no nosso banco está INT 
        Reservas re = new Reservas();
        String sql = "select * from Reservas where idReserva=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idReservas);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            re.setIdReserva(rs.getInt("idReserva"));
            re.setDataReserva(rs.getDate("dataRev"));
            re.setStatus(rs.getString("status"));
        }
        this.desconectar();
        return re;
    }

}
