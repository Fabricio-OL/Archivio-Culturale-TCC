package model;

import java.sql.Date;

public class Emprestimo {
    private int idEmp;
    private Date dataEmp;
    private Date dataDev;
    private Status status;
    private Devolucao devolucao;

    public Emprestimo(int idEmp, Date dataEmp, Date dataDev, Status status, Devolucao devolucao) {
        this.idEmp = idEmp;
        this.dataEmp = dataEmp;
        this.dataDev = dataDev;
        this.status = status;
        this.devolucao = devolucao;
    }

    /**
     * @return the idEmp
     */
    public int getIdEmp() {
        return idEmp;
    }

    /**
     * @param idEmp the idEmp to set
     */
    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
    }

    /**
     * @return the dataEmp
     */
    public Date getDataEmp() {
        return dataEmp;
    }

    /**
     * @param dataEmp the dataEmp to set
     */
    public void setDataEmp(Date dataEmp) {
        this.dataEmp = dataEmp;
    }

    /**
     * @return the dataDev
     */
    public Date getDataDev() {
        return dataDev;
    }

    /**
     * @param dataDev the dataDev to set
     */
    public void setDataDev(Date dataDev) {
        this.dataDev = dataDev;
    }

    /**
     * @return the status
     */
    public Status getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(Status status) {
        this.status = status;
    }

    /**
     * @return the devolucao
     */
    public Devolucao getDevolucao() {
        return devolucao;
    }

    /**
     * @param devolucao the devolucao to set
     */
    public void setDevolucao(Devolucao devolucao) {
        this.devolucao = devolucao;
    }

    @Override
    public String toString() {
        return "Emprestimo{" + "idEmp=" + idEmp + ", dataEmp=" + dataEmp + ", dataDev=" + dataDev + ", status=" + status + ", devolucao=" + devolucao + '}';
    }
    
    
}
