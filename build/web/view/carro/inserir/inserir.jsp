<%@page import="java.text.SimpleDateFormat"%> <%@page import="dao.CarroDAO"%>
<%@page import="model.Carro"%> <%@page import="model.StatusCarro"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Inseir Carro</title>
    <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>  
  </head>
  <body class="h-screen">
    <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
      <% Carro carro = new Carro();
      carro.setModelo(request.getParameter("modelo"));
      carro.setMarca(request.getParameter("marca"));
      carro.setAno(Integer.parseInt(request.getParameter("ano")));
      carro.setPlaca(request.getParameter("placa"));
      carro.setStatus(StatusCarro.DISPONIVEL);
      carro.setPreco(Double.parseDouble(request.getParameter("preco"))); 
      CarroDAO carroDAO = new CarroDAO(); 
      boolean cadastrado = carroDAO.inserir(carro); 
      if(cadastrado) { %>
      <div class="flex bg-green-400 rounded-lg p-6 w-fit">
        <p class="text-green-800 font-semibold">Carro cadastrado com Sucesso</p>
      </div>
      <% } else { %>
        <div class="flex bg-red-400 rounded-lg p-6 w-fit">
          <p class="text-red-800 font-semibold">Não foi possivel Cadastar Carro</p>
        </div>
      <% } %>
    </section>
  </body>
</html>
