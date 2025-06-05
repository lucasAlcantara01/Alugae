<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="dao.ClienteDAO"%> 
<%@page import="model.Cliente"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Excluir de Cliente</title>
    <link href="../../dist/css/output.css" rel="stylesheet" type="text/css" />
  </head>
  <body class="h-screen">
    <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
      <% 
      Cliente cliente = new Cliente(); 
      cliente.setId(Integer.parseInt(request.getParameter("id"))); 
      ClienteDAO clienteDAO = new ClienteDAO(); 
      if(clienteDAO.excluir(cliente)){
      %>  
        <div class="flex bg-green-400 rounded-lg p-6 w-fit">
          <p class="text-green-800 font-semibold">Cliente exlcuido com sucesso</p>
        </div>
      <% }else{ %> 
        <div class="flex bg-red-400 rounded-lg p-6 w-fit">
          <p class="text-red-800 font-semibold">Falha ao Excluir Cliente</p>
        </div>
      <% } %>
    </section>
    <script src="../../dist/js/script.js" type="text/javascript"></script>
  </body>
</html>
