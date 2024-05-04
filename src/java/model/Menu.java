
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

    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public int getExibir() {
        return exibir;
    }

    public void setExibir(int exibir) {
        this.exibir = exibir;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Acesso getAcesso() {
        return acesso;
    }

    public void setAcesso(Acesso acesso) {
        this.acesso = acesso;
    }

    @Override
    public String toString() {
        return "Menu{" + "idMenu=" + idMenu + ", exibir=" + exibir + ", nome=" + nome + ", icone=" + icone + ", link=" + link + ", acesso=" + acesso + '}';
    }
}
