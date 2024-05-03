
package model;
import java.sql.Date;

public class Reservas {
    private int idReserva;
    private Date dataReserva;
    private String status;

    public Reservas(int idReserva, Date dataReserva, String status) {
        this.idReserva = idReserva;
        this.dataReserva = dataReserva;
        this.status = status;
    }

    /**
     * @return the idReserva
     */
    public int getIdReserva() {
        return idReserva;
    }

    /**
     * @param idReserva the idReserva to set
     */
    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    /**
     * @return the dataReserva
     */
    public Date getDataReserva() {
        return dataReserva;
    }

    /**
     * @param dataReserva the dataReserva to set
     */
    public void setDataReserva(Date dataReserva) {
        this.dataReserva = dataReserva;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Reservas{" + "idReserva=" + idReserva + ", dataReserva=" + dataReserva + ", status=" + status + '}';
    }
    
    
    
}
