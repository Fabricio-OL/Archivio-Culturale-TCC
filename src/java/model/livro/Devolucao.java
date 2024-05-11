package model.livro;


import java.sql.Date;
 
public class Devolucao {
    
    private int idDev;
    private Date dataDev;
    private String condicao;

    public Devolucao(int idDev, Date dataDev, String condicao) {
        this.idDev = idDev;
        this.dataDev = dataDev;
        this.condicao = condicao;
    }

    public int getIdDev() {
        return idDev;
    }
    
    public void setIdDev(int idDev) {
        this.idDev = idDev;
    }

    public Date getDataDev() {
        return dataDev;
    }
   
    public void setDataDev(Date dataDev) {
        this.dataDev = dataDev;
    }
   
    public String getCondicao() {
        return condicao;
    }
    
    public void setCondicao(String condicao) {
        this.condicao = condicao;
    }

    @Override
    public String toString() {
        return "Devolucao{" + "idDev=" + idDev + ", dataDev=" + dataDev + ", condicao=" + condicao + '}';
    }
    
}
  