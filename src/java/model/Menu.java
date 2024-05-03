
package model;
import java.sql.Date;

public class Menu {
    private int idMenu;
    private int exibir ;
    private String nome;
    private String icone;
    private String link ;
    private Acesso acesso;

    public Menu(int idMenu, int exibir, String nome, String icone, String link, Acesso acesso) {
        this.idMenu = idMenu;
        this.exibir = exibir;
        this.nome = nome;
        this.icone = icone;
        this.link = link;
        this.acesso = acesso;
    }

    /**
     * @return the idMenu
     */
    public int getIdMenu() {
        return idMenu;
    }

    /**
     * @param idMenu the idMenu to set
     */
    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    /**
     * @return the exibir
     */
    public int getExibir() {
        return exibir;
    }

    /**
     * @param exibir the exibir to set
     */
    public void setExibir(int exibir) {
        this.exibir = exibir;
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
     * @return the icone
     */
    public String getIcone() {
        return icone;
    }

    /**
     * @param icone the icone to set
     */
    public void setIcone(String icone) {
        this.icone = icone;
    }

    /**
     * @return the link
     */
    public String getLink() {
        return link;
    }

    /**
     * @param link the link to set
     */
    public void setLink(String link) {
        this.link = link;
    }

    /**
     * @return the acesso
     */
    public Acesso getAcesso() {
        return acesso;
    }

    /**
     * @param acesso the acesso to set
     */
    public void setAcesso(Acesso acesso) {
        this.acesso = acesso;
    }

    @Override
    public String toString() {
        return "Menu{" + "idMenu=" + idMenu + ", exibir=" + exibir + ", nome=" + nome + ", icone=" + icone + ", link=" + link + ", acesso=" + acesso + '}';
    }
   
    
    
}
