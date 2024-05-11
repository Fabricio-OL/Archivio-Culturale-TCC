
package model.livro;

public class Editora {
    
    private int cnpj;
    private String nome;
    private String end;

    public Editora() {
    }
    
    

    public Editora(int cnpj, String nome, String end) {
        this.cnpj = cnpj;
        this.nome = nome;
        this.end = end;
    }

    public int getCnpj() {
        return cnpj;
    }

    public void setCnpj(int cnpj) {
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
