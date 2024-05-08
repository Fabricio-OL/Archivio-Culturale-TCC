
package model;
import java.sql.Date;

public class Reservas {
    private int idReserva;
    private Date dataReserva;
    private String status;

    public Reservas() {
    }
    
    public Reservas(int idReserva, Date dataReserva, String status) {
        this.idReserva = idReserva;
        this.dataReserva = dataReserva;
        this.status = status;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public Date getDataReserva() {
        return dataReserva;
    }

    public void setDataReserva(Date dataReserva) {
        this.dataReserva = dataReserva;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Reservas{" + "idReserva=" + idReserva + ", dataReserva=" + dataReserva + ", status=" + status + '}';
    }
}
