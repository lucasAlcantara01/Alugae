
<%@page import="dao.LocacaoDAO"%>
<%@page import="model.Locacao"%> 
<%@page import="java.text.SimpleDateFormat"%> 
<%@page import="model.StatusLocacao"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Inseir locação</title>
    <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>  
  </head>
  <body class="h-screen">
    <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
      
      <% 
      SimpleDateFormat formatar = new SimpleDateFormat("yyyy-MM-dd");
      
      Locacao locacao = new Locacao();
      locacao.setIdCliente(Integer.parseInt(request.getParameter("idcliente")));
      locacao.setIdCarro(Integer.parseInt(request.getParameter("idcarro")));
      locacao.setDataInicio(formatar.parse(request.getParameter("datainicio")));
      locacao.setDataFim(formatar.parse(request.getParameter("datafim")));
      locacao.setValorTotal(Double.parseDouble(request.getParameter("valortotal")));

      LocacaoDAO locacaoDAO = new LocacaoDAO(); 
      boolean cadastrado = locacaoDAO.inserir(locacao); 
      if(cadastrado) { %>
      <div class="flex bg-green-400 rounded-lg p-6 w-fit">
        <p class="text-green-800 font-semibold">Locação cadastrado com Sucesso</p>
      </div>
      <% } else { %>
        <div class="flex bg-red-400 rounded-lg p-6 w-fit">
          <p class="text-red-800 font-semibold">Não foi possivel cadastar Locação</p>
        </div>
      <% } %>
    </section>
  </body>
</html>
