
package model.livro;

public class Editora {
    private int idEditora;
    private String cnpj;
    private String nome;
    private String end;
    private Livro livro;

    public Editora() {
    }
    
    

    public Editora(int idEditora,String cnpj, String nome, String end,Livro livro) {
        this.idEditora= idEditora;
        this.cnpj = cnpj;
        this.nome = nome;
        this.end = end;
        this.livro=livro;
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

    /**
     * @return the livro
     */
    public Livro getLivro() {
        return livro;
    }

    /**
     * @param livro the livro to set
     */
    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    @Override
    public String toString() {
        return "Editora{" + "idEditora=" + idEditora + ", cnpj=" + cnpj + ", nome=" + nome + ", end=" + end + ", livro=" + livro + '}';
    }

    

    
}
