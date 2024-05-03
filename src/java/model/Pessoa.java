package model;

import java.sql.Date;

public abstract class Pessoa {
    private String nome;
    private String cpf;
    private Date dn;
    private String end;

    public Pessoa(String nome, String cpf, Date dn, String end) {
        this.nome = nome;
        this.cpf = cpf;
        this.dn = dn;
        this.end = end;
    }

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }

    public Date getDn() {
        return dn;
    }

    public String getEnd() {
        return end;
    }
    
}
