package model.livro;

import java.sql.Date;

public class Emprestimo {
    int idEmp;
    Date dataEmp;
    Date dataDev;
    Status status;
    Devolucao devolucao;
}
