package model.pessoa;

import java.sql.Date;

public abstract class Pessoa {
    
    private String nome;
    private String cpf;
    private Date dn;
    private String end;

    protected Pessoa(String nome, String cpf, Date dn, String end) {
        this.nome = nome;
        this.cpf = cpf;
        this.dn = dn;
        this.end = end;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getDn() {
        return dn;
    }

    public void setDn(Date dn) {
        this.dn = dn;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }
    
}
