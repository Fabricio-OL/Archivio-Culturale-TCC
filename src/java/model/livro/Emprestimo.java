package model.livro;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import model.pessoa.Bibliotecario;
import model.pessoa.Leitor;

public class Emprestimo {
    
    private static final double VALOR_PADRAO_ALUGUEL = 5.0;
    private static final double VALOR_PADRAO_MULTA = 0.80;
    private static final double VALOR_PADRAO_MULTA_DANIFICADO = 0.35;
    
    private int idEmp;
    private Date dataEmp;
    private Date dataDev;
    private String status;
    private Leitor leitor;
    private String condicao;
    private Livro livro;
    private Bibliotecario bibliotecario; 
    
    
    public Emprestimo (){
    }

    public Emprestimo(int idEmp, Date dataEmp, Date dataDev, String status,Leitor leitor,Livro livro,Bibliotecario bibliotecario) {
        this.idEmp = idEmp;
        this.dataEmp = dataEmp;
        this.dataDev = dataDev;
        this.status = status;
        this.leitor=leitor;
        this.bibliotecario=bibliotecario;
        this.livro=livro;
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



    public Leitor getLeitor() {
        return leitor;
    }

    
    public void setLeitor(Leitor leitor) {
        this.leitor = leitor;
    }

    /**
     * @return the livro
     */
    public Livro getLivro() {
        return livro;
    }

    /**
     * @param livro the livro to set
     */
    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    /**
     * @return the bibliotecario
     */
    public Bibliotecario getBibliotecario() {
        return bibliotecario;
    }

    /**
     * @param bibliotecario the bibliotecario to set
     */
    public void setBibliotecario(Bibliotecario bibliotecario) {
        this.bibliotecario = bibliotecario;
    }

    @Override
    public String toString() {
        return "Emprestimo{" + "idEmp=" + idEmp + ", dataEmp=" + dataEmp + ", dataDev=" + dataDev + ", status=" + status + ", leitor=" + leitor + ", livro=" + livro + ", bibliotecario=" + bibliotecario + '}';
    }

    public String getCondicao() {
        return condicao;
    }

    public void setCondicao(String condicao) {
        this.condicao = condicao;
    }
    
    public double emitirMultaAtraso(long diasAtraso) {
        
        double multaPorAtraso = diasAtraso * VALOR_PADRAO_MULTA;
        
        return multaPorAtraso;
    }
    
    public double emitirMultaDanificado(){
        return VALOR_PADRAO_MULTA_DANIFICADO;
    }
    
    public String getValorAluguelFinal(boolean isAtrasado, boolean isDanificado, long diasAtraso) {
        
        double valorAluguel = VALOR_PADRAO_ALUGUEL;
        
        if(isAtrasado) {
            valorAluguel += emitirMultaAtraso(diasAtraso);
        }
        
        if(isDanificado) {
            valorAluguel += emitirMultaDanificado();
        }
        
        NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

        return nf.format(valorAluguel);
    }
}
