package model.pessoa;

import java.sql.Date;

public class Autor extends Pessoa {
    
    private int idAutor;

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
}
