<%@page import="model.Empresa"%> 
<%@page import="dao.EmpresaDAO"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="./dist/css/output.css" rel="stylesheet" type="text/css" />
  </head>
  <body
    class="h-screen w-screen flex flex-col justify-center items-center bg-gray-200"
  >
    <img src="./assets/alugae.svg" alt="Logotipo" class="mb-9" />
    <div
      class="flex flex-col justify-center items-center shadow-sm bg-white py-6 px-12 rounded-lg"
    >
      <div class="flex flex-col items-center text-center mb-6">
        <h1 class="font-semibold text-gray-500 text-3xl mb-2">Seja Bem vindo!</h1>
        <p class="text-gray-400 text-sm">Vamo começar, entre com seu login</p>
      </div>
      <form action="login.jsp" class="w-[300px] mb-4">
        <div class="flex flex-col gap-3 mb-9">
          <label class="flex flex-1 flex-col gap-1.5 text-xs font-semibold">
            Usuario
            <input
              type="email"
              name="usuario"
              class="bg-white shadow-sm px-3 py-2 rounded-lg text-base font-normal placeholder:text-sm placeholder:font-normal"
              placeholder="Email"
              required
            />
          </label>
          <label class="flex flex-1 flex-col gap-1.5 text-xs font-semibold">
            Senha
            <input
              type="password"
              name="senha"
              class="bg-white shadow-sm px-3 py-2 rounded-lg text-base  font-normal placeholder:text-sm placeholder:font-normal"
              required
            />
          </label>
        </div>
        <button
          type="submit"
          class="flex w-full justify-center items-center gap-2 px-3 py-3 text-sm text-white bg-orange-500 rounded-lg hover:bg-amber-400 transition-all duration-200 ease-in"
        >
          Login
        </button>
      </form>
      <span class="text-xs text-gray-300">@alugae2025</span>
    </div>

    <% String usuario = request.getParameter("usuario"); String senha =
    request.getParameter("senha"); EmpresaDAO empresa = new EmpresaDAO();
    boolean autenticado = empresa.login(usuario, senha); if(usuario!=null &&
    senha!=null && !usuario.isEmpty() && !senha.isEmpty() && autenticado){
    session.setAttribute("usuario", usuario);
    response.sendRedirect("index.jsp"); } %>
  </body>
</html>
