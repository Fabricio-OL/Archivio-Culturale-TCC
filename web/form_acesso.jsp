<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="estilo/banner.css">
        <title>Archivio Culturale</title>
    </head>
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
