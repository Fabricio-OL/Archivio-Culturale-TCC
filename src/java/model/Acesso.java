
package model;

import java.sql.Date;

public class Acesso {
    private  int idAcesso;
    private String nome;
    private Leitor leitor ;// No Diagrama, consta que a Classe Leitor está dentro de Acesso

    public Acesso(int idAcesso, String nome, Leitor leitor) {
        this.idAcesso = idAcesso;
        this.nome = nome;
        this.leitor = leitor;
    }

    /**
     * @return the idAcesso
     */
    public int getIdAcesso() {
        return idAcesso;
    }

    /**
     * @param idAcesso the idAcesso to set
     */
    public void setIdAcesso(int idAcesso) {
        this.idAcesso = idAcesso;
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
     * @return the leitor
     */
    public Leitor getLeitor() {
        return leitor;
    }

    /**
     * @param leitor the leitor to set
     */
    public void setLeitor(Leitor leitor) {
        this.leitor = leitor;
    }

    @Override
    public String toString() {
        return "Acesso{" + "idAcesso=" + idAcesso + ", nome=" + nome + ", leitor=" + leitor + '}';
    }
    
    

    
}
