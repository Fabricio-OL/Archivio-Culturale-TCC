package pessoa;

import java.sql.Date;
import model.livro.Emprestimo;

public class Leitor extends Pessoa {
    
    int idLeitor;
    Emprestimo emprestimo;

    public Leitor(String nome, String cpf, Date dn, String end) {
        super(nome, cpf, dn, end);
    }
 
}
