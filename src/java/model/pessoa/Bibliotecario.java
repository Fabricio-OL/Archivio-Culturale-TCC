package model.pessoa;

import java.sql.Date;

public class Bibliotecario extends Pessoa {
    
    private int idBibliotecario;
    private String senha;
    
    public Bibliotecario() {}

    public Bibliotecario(int idBibliotecario, String nome, String cpf, Date dn, String end, String senha) {
        super(nome, cpf, dn, end);
        this.idBibliotecario = idBibliotecario;
        this.senha = senha;
    }

    public int getIdBibliotecario() {
        return idBibliotecario;
    }

    public void setIdBibliotecario(int idBibliotecario) {
        this.idBibliotecario = idBibliotecario;
    }

   
    public String getSenha() {
        return senha;
    }

    
    public void setSenha(String senha) {
        this.senha = senha;
    }

    @Override
    public String toString() {
        return "Bibliotecario{" + "idBibliotecario=" + idBibliotecario + ", senha=" + senha + '}';
    }

    
    
}
