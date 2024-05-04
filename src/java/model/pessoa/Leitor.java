package model.pessoa;

import model.pessoa.Pessoa;
import java.sql.Date;
import model.Emprestimo;
import model.Emprestimo;

public class Leitor extends Pessoa {
    
    private int idLeitor;
    private Emprestimo emprestimo;

    public Leitor(String nome, String cpf, Date dn, String end) {
        super(nome, cpf, dn, end);
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
