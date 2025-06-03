<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.LocacaoDAO"%>
<%@page import="java.text.SimpleDateFormat"%> 
<%@page import="model.Locacao"%>
<%@page import="model.StatusLocacao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Locação</title>   
        <link
            href="../../../dist/css/output.css"
            rel="stylesheet"
            type="text/css"
        />                   
    </head>
    <body class="h-screen">
        <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
        <%
            SimpleDateFormat formatar = new SimpleDateFormat("yyyy-MM-dd");
            
            Locacao locacao = new Locacao();
            locacao.setId(Integer.parseInt(request.getParameter("id")));
            locacao.setIdCliente(Integer.parseInt(request.getParameter("idcliente")));
            locacao.setIdCarro(Integer.parseInt(request.getParameter("idcarro")));
            locacao.setDataInicio(formatar.parse(request.getParameter("datainicio")));
            locacao.setDataFim(formatar.parse(request.getParameter("datafim")));
            locacao.setValorTotal(Double.parseDouble(request.getParameter("valortotal")));
            locacao.setStatus(StatusLocacao.valueOf(request.getParameter("status")));
                        
            LocacaoDAO locacaoDAO = new LocacaoDAO();
            
            if (locacaoDAO.alterar(locacao)){ 
        %>
            <div class="flex bg-green-400 rounded-lg p-6 w-fit">
                <p class="text-green-800 font-semibold">Locação alterada com sucesso</p>
            </div>
        <%  }else{  %>        
             <div class="flex bg-red-400 rounded-lg p-6 w-fit">
                <p class="text-red-800 font-semibold">Não foi possivel alterar locação</p>
            </div>
        <%  }  %>
        </section>              
    </body>
</html>
