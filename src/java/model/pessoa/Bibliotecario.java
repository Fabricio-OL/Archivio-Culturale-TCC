package model.pessoa;

import java.sql.Date;

public class Bibliotecario extends Pessoa {
    
    private int idBibliotecario;
    private double salario;
    
    public Bibliotecario() {}

    public Bibliotecario(int idBibliotecario, String nome, String cpf, Date dn, String end, double salario) {
        super(nome, cpf, dn, end);
        this.idBibliotecario = idBibliotecario;
        this.salario = salario;
    }

    public int getIdBibliotecario() {
        return idBibliotecario;
    }

    public void setIdBibliotecario(int idBibliotecario) {
        this.idBibliotecario = idBibliotecario;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }
    
}
