
package model;

public class Editora {
    private int idEditora;
    private String cnpj;
    private String nome;
    private String end;

    public Editora() {
    }
    
    

    public Editora(int idEditora,String cnpj, String nome, String end) {
        this.idEditora= idEditora;
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

   
    public int getIdEditora() {
        return idEditora;
    }

    public void setIdEditora(int idEditora) {
        this.idEditora = idEditora;
    }

    @Override
    public String toString() {
        return "Editora{" + "idEditora=" + idEditora + ", cnpj=" + cnpj + ", nome=" + nome + ", end=" + end + '}';
    }

    
}
