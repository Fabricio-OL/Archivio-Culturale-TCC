package model.livro;

import java.sql.Date;

public class Emprestimo {
    
    private int idEmp;
    private Date dataEmp;
    private Date dataDev;
    private String status;
    private Devolucao devolucao;
    
    public Emprestimo (){
    }

    public Emprestimo(int idEmp, Date dataEmp, Date dataDev, String status, Devolucao devolucao) {
        this.idEmp = idEmp;
        this.dataEmp = dataEmp;
        this.dataDev = dataDev;
        this.status = status;
        this.devolucao = devolucao;
    }
    
    public int getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
    }

    public Date getDataEmp() {
        return dataEmp;
    }

    public void setDataEmp(Date dataEmp) {
        this.dataEmp = dataEmp;
    }

    public Date getDataDev() {
        return dataDev;
    }

    public void setDataDev(Date dataDev) {
        this.dataDev = dataDev;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Devolucao getDevolucao() {
        return devolucao;
    }

    public void setDevolucao(Devolucao devolucao) {
        this.devolucao = devolucao;
    }

    @Override
    public String toString() {
        return "Emprestimo{" + "idEmp=" + idEmp + ", dataEmp=" + dataEmp + ", dataDev=" + dataDev + ", status=" + status + ", devolucao=" + devolucao + '}';
    }

}
