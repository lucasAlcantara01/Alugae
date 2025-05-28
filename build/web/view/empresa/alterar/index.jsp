<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.EmpresaDAO"%>
<%@page import="model.Empresa"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar dados Empresa</title>
        <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>        
    </head>
    <body>
        <%
            Empresa empresa = new Empresa();
            empresa.setId( Integer.parseInt( request.getParameter("id") ));
                                    
            EmpresaDAO empresaDAO = new EmpresaDAO();
            
            if (empresaDAO.consultar(empresa) != null){  
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
              value="<%= empresa.getId()%>"
              readonly
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Nome
            <input
              type="text"
              name="nome"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= empresa.getNome()%>"
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
              value="<%= empresa.getEmail()%>"
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-sm">
            Endereço
            <input
              type="text"
              name="endereco"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= empresa.getEndereco() %>"
            />
          </label>
        </div>
        <label class="flex flex-1 flex-col gap-1.5 text-sm">
          Cnpj
          <input
              type="text"
              name="cnpj"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base placeholder:text-base"
              value="<%= empresa.getCnpj() %>"
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
                out.println("Empresa não Localizado!!!");
            }                      
        %>
        
    </body>
</html>
