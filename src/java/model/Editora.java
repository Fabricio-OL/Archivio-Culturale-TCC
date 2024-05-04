
package model;

public class Editora {
    private String cnpj;
    private String nome;
    private String end;

    public Editora(String cnpj, String nome, String end) {
        this.cnpj = cnpj;
        this.nome = nome;
        this.end = end;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "Editora{" + "cnpj=" + cnpj + ", nome=" + nome + ", end=" + end + '}';
    }
}
