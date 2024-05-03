
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

    /**
     * @return the cnpj
     */
    public String getCnpj() {
        return cnpj;
    }

    /**
     * @param cnpj the cnpj to set
     */
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the end
     */
    public String getEnd() {
        return end;
    }

    /**
     * @param end the end to set
     */
    public void setEnd(String end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "Editora{" + "cnpj=" + cnpj + ", nome=" + nome + ", end=" + end + '}';
    }
    
    
    
}
