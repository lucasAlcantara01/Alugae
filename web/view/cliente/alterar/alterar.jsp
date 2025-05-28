<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Cliente</title>   
        <link
            href="../../../dist/css/output.css"
            rel="stylesheet"
            type="text/css"
        />                   
    </head>
    <body class="h-screen">
        <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
        <%
            Cliente cliente = new Cliente();
            cliente.setId(Integer.parseInt(request.getParameter("id")));
            cliente.setNome(request.getParameter("nome"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setEndereco(request.getParameter("endereco"));
            cliente.setTelefone(request.getParameter("telefone"));
            cliente.setCpf(request.getParameter("cpf"));
                        
            ClienteDAO clienteDAO = new ClienteDAO();
            
            if (clienteDAO.alterar(cliente)){ 
        %>
            <div class="flex bg-green-400 rounded-lg p-6 w-fit">
                <p class="text-green-800 font-semibold">Cliente alterado com sucesso</p>
            </div>
        <%  }else{  %>        
             <div class="flex bg-red-400 rounded-lg p-6 w-fit">
                <p class="text-red-800 font-semibold">Não foi possivel alterar cliente</p>
            </div>
        <%  }  %>
        </section>              
    </body>
</html>
