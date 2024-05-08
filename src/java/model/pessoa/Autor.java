package model.pessoa;

import java.sql.Date;
import model.Livro;

public class Autor extends Pessoa {
    
    private int idAutor;
    private Livro livro;

    public Autor() {}
    
    public Autor(int idAutor, String nome, String cpf, Date dn, String end) {
        super(nome, cpf, dn, end);
        this.idAutor = idAutor;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }
}
