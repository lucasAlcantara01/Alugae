<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="dao.EmpresaDAO"%> 
<%@page import="model.Empresa"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Excluir de Empresa</title>
    <link href="../../dist/css/output.css" rel="stylesheet" type="text/css" />
  </head>
  <body class="h-screen">
    <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
      <% 
      Empresa empresa = new Empresa(); 
      empresa.setId(Integer.parseInt(request.getParameter("id"))); 
      EmpresaDAO empresaDAO = new EmpresaDAO(); 
      if(empresaDAO.excluir(empresa)){
      %>  
        <div class="flex bg-green-400 rounded-lg p-6 w-fit">
          <p class="text-green-800 font-semibold">Cliente exluido com sucesso</p>
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
