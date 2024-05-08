
package model;

import model.pessoa.Leitor;
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

    public int getIdAcesso() {
        return idAcesso;
    }

    public void setIdAcesso(int idAcesso) {
        this.idAcesso = idAcesso;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Leitor getLeitor() {
        return leitor;
    }

    public void setLeitor(Leitor leitor) {
        this.leitor = leitor;
    }

    @Override
    public String toString() {
        return "Acesso{" + "idAcesso=" + idAcesso + ", nome=" + nome + ", leitor=" + leitor + '}';
    }
}
