<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.CarroDAO"%>
<%@page import="model.Carro"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar dados Carro</title>
        <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>        
    </head>
    <body>
        <%
            Carro carro = new Carro();
            carro.setId( Integer.parseInt( request.getParameter("id") ));
                                    
            CarroDAO carroDAO = new CarroDAO();
            
            if (carroDAO.consultar(carro) != null){  
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
              value="<%= carro.getId()%>"
              readonly
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Modelo
            <input
              type="text"
              name="modelo"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= carro.getModelo()%>"
            />
          </label>
        </div>
        <div class="flex gap-6 w-full">
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Marca
            <input
              type="text"
              name="marca"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= carro.getMarca()%>"
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Ano
            <input
              type="number"
              name="ano"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= carro.getAno() %>"
            />
          </label>
        </div>
        <div class="flex gap-6 w-full">
            <label class="flex flex-1 flex-col gap-1.5 text-sm">
              Placa
              <input
                  type="text"
                  name="placa"
                  class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
                  value="<%= carro.getPlaca() %>"
                />
            </label>
            <label class="flex flex-1 flex-col gap-1.5 text-sm">
                Status
                <select
                  name="status"
                  class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
                >
                  <option value="DISPONIVEL" <%= carro.getStatus() == model.StatusCarro.DISPONIVEL ? "selected" : "" %>>DISPONIVEL</option>
                  <option value="INDISPONIVEL" <%= carro.getStatus() == model.StatusCarro.INDISPONIVEL ? "selected" : "" %>>INDISPONIVEL</option>
                </select>
             </label>
        </div>
        <label class="flex flex-col gap-1.5 text-sm">
          Preço
          <input
              type="number"
              name="preco"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= carro.getPreco() %>"
            />
        </label>
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
