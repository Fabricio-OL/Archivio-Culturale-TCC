package model.pessoa;

import java.sql.Date;
import model.livro.Emprestimo;

public class Leitor extends Pessoa {
    
    private int idLeitor;
    private Emprestimo emprestimo;
    
    public Leitor() {}

    public Leitor(int idLeitor, String nome, String cpf, Date dn, String end) {
        super(nome, cpf, dn, end);
        this.idLeitor = idLeitor;
    }
    
    public int getIdLeitor() {
        return idLeitor;
    }

    public void setIdLeitor(int idLeitor) {
        this.idLeitor = idLeitor;
    }

    public Emprestimo getEmprestimo() {
        return emprestimo;
    }

    public void setEmprestimo(Emprestimo emprestimo) {
        this.emprestimo = emprestimo;
    }
 
}
