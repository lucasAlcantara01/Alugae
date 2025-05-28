
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Inseir Cliente</title>
    <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>  
  </head>
  <body class="h-screen">
    <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
      <% Cliente cliente = new Cliente();
      cliente.setNome(request.getParameter("nome"));
      cliente.setEmail(request.getParameter("email"));
      cliente.setEndereco(request.getParameter("endereco"));
      cliente.setTelefone(request.getParameter("telefone"));
      cliente.setCpf(request.getParameter("cpf"));
      ClienteDAO clienteDAO = new ClienteDAO(); 
      boolean cadastrado = clienteDAO.inserir(cliente); 
      if(cadastrado) { %>
      <div class="flex bg-green-400 rounded-lg p-6 w-fit">
        <p class="text-green-800 font-semibold">Cliente cadastrado com Sucesso</p>
      </div>
      <% } else { %>
        <div class="flex bg-red-400 rounded-lg p-6 w-fit">
          <p class="text-red-800 font-semibold">Não foi possivel Cadastar Cliente</p>
        </div>
      <% } %>
    </section>
  </body>
</html>
