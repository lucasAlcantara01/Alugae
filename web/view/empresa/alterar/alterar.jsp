<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.EmpresaDAO"%>
<%@page import="model.Empresa"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Empresa</title>   
        <link
            href="../../../dist/css/output.css"
            rel="stylesheet"
            type="text/css"
        />                   
    </head>
    <body class="h-screen">
        <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
        <%
            Empresa empresa = new Empresa();
            empresa.setId(Integer.parseInt(request.getParameter("id")));
            empresa.setNome(request.getParameter("nome"));
            empresa.setEmail(request.getParameter("email"));
            empresa.setEndereco(request.getParameter("endereco"));
            empresa.setCnpj(request.getParameter("cnpj"));
                        
            EmpresaDAO empresaDAO = new EmpresaDAO();
            
            if (empresaDAO.alterar(empresa)){ 
        %>
            <div class="flex bg-green-400 rounded-lg p-6 w-fit">
                <p class="text-green-800 font-semibold">Empresa alterado com sucesso</p>
            </div>
        <%  }else{  %>        
             <div class="flex bg-red-400 rounded-lg p-6 w-fit">
                <p class="text-red-800 font-semibold">Não foi possivel alterar empresa</p>
            </div>
        <%  }  %>
        </section>              
    </body>
</html>
