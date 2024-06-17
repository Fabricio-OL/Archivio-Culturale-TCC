<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        
           <%@include file="index.jsp" %> 
            <h1>Cadastrar Acesso </h1>

            <form action="gerenciar_acesso.do" method="post">               
                <input type="hidden" name="idAcesso" value="${acesso.idAcesso}"/>                                                                       
                        <input type="text" class="form-control"   name="nome"  value="${acesso.nome}"/>                                                                                                    
<!--  Botao Adicionar nao esta funcionando e o metodo Gravar não está funcionando -->
            </form>       
</body>
</html>
