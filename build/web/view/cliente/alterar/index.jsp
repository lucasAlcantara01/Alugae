<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar dados Cliente</title>
        <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>        
    </head>
    <body>
        <%
            Cliente cliente = new Cliente();
            cliente.setId( Integer.parseInt( request.getParameter("id") ));
                                    
            ClienteDAO clienteDAO = new ClienteDAO();
            
            if (clienteDAO.consultar(cliente) != null){  
        %> 
        <form action="./alterar.jsp" class="flex flex-col gap-4 max-w-[700px]">
        <div class="flex gap-6 w-full">
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Id
            <input
              type="text"
              name="id"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              placeholder="Civic"
              value="<%= cliente.getId()%>"
              readonly
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Nome
            <input
              type="text"
              name="nome"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= cliente.getNome()%>"
            />
          </label>
        </div>
        <div class="flex gap-6 w-full">
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            E-mail
            <input
              type="text"
              name="email"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= cliente.getEmail()%>"
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Endereço
            <input
              type="text"
              name="endereco"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= cliente.getEndereco() %>"
            />
          </label>
        </div>
        <div class="flex gap-6 w-full">
            <label class="flex flex-1 flex-col gap-1.5 text-sm">
              Telefone
              <input
                  type="text"
                  name="telefone"
                  class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
                  value="<%= cliente.getTelefone() %>"
                />
            </label>
            <label class="flex flex-1 flex-col gap-1.5 text-sm">
              CPF
              <input
                  type="text"
                  name="cpf"
                  class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
                  value="<%= cliente.getCpf() %>"
                />
            </label>
        </div>
        <div class="flex gap-6 w-full">
            <button
              class="flex w-fit items-center gap-2 p-3 text-sm text-white bg-orange-500 rounded-lg hover:bg-amber-400 transition-all duration-200 ease-in"
              type="submit"
            >
              Atualizar Carro
            </button>
            <a
              href="../listar.jsp"
              class="flex w-fit items-center gap-2 p-3 text-sm text-white bg-orange-500 rounded-lg hover:bg-amber-400 transition-all duration-200 ease-in"
            >
              Voltar
            </a>
        </div>  
      </form>       
        <%
                }else{
                out.println("Cliente não Localizado!!!");
            }                      
        %>
        
    </body>
</html>
