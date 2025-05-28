<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.LocacaoDAO"%>
<%@page import="model.Locacao"%>
<%@page import="model.StatusLocacao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Locação</title>
        <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>        
    </head>
    <body>
        <%
            Locacao locacao = new Locacao();
            locacao.setId( Integer.parseInt( request.getParameter("id") ));
                                    
            LocacaoDAO locacaoDAO = new LocacaoDAO();
            
            if (locacaoDAO.consultar(locacao) != null){  
        %> 
        <form action="./alterar.jsp" class="flex flex-col gap-4 max-w-[700px]">
        <div class="flex gap-6 w-full">
          <label class="flex flex-1 flex-col gap-1.5 text-sm ">
            Id
            <input
              type="text"
              name="id"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              placeholder="Civic"
              value="<%= locacao.getId()%>"
              readonly
              disable= true
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Id Cliente
            <input
              type="text"
              name="idcliente"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= locacao.getIdCliente()%>"
              disable= true
            />
          </label>
        </div>
        <div class="flex gap-6 w-full">
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Id Carro
            <input
              type="text"
              name="idcarro"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= locacao.getIdCarro()%>"
              disable= true
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Data Inicio
            <input
              type="date"
              name="datainicio"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= locacao.getDataInicio() %>"
              disable= true
            />
          </label>
        </div>
        <label class="flex flex-1 flex-col gap-1.5 text-sm">
          Data Fim
          <input
              type="date"
              name="datafim"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= locacao.getDataFim() %>"
              disable= true
            />
        </label>
        <label class="flex flex-1 flex-col gap-1.5 text-sm">
          Valor Total
          <input
              type="number"
              name="valortotal"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= locacao.getValorTotal() %>"
              disable= true
            />
        </label>
        <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Status
            <select
              name="status"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
            >
              <option value="ATIVA" <%= locacao.getStatus() == model.StatusLocacao.ATIVA ? "selected" : "" %>>Ativa</option>
              <option value="FINALIZADA" <%= locacao.getStatus() == model.StatusLocacao.FINALIZADA ? "FINALIZADA" : "" %>>FINALIZADA</option>
              <option value="CANCELADA" <%= locacao.getStatus() == model.StatusLocacao.CANCELADA ? "CANCELADA" : "" %>>CANCELADA</option>
            </select>
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
                out.println("Empresa não Localizado!!!");
            }                      
        %>
        
    </body>
</html>
