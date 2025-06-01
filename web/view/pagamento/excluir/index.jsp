<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pagamento, dao.PagamentoDAO"%>

<%
    String mensagem = null;
    Pagamento pagamento = null;

    int id = 0;
    try {
        id = Integer.parseInt(request.getParameter("id"));
        PagamentoDAO dao = new PagamentoDAO();
        pagamento = dao.consultar(id);
    } catch (Exception e) {
        mensagem = "Erro ao carregar pagamento: " + e.getMessage();
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            boolean excluido = new PagamentoDAO().excluir(id);
            mensagem = excluido ? "Pagamento excluído com sucesso!" : "Erro ao excluir pagamento.";
        } catch (Exception e) {
            mensagem = "Erro no processamento: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Excluir Pagamento</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10">
<div class="max-w-2xl mx-auto bg-white p-8 rounded-xl shadow-md">
    <h1 class="text-2xl font-bold mb-6 text-gray-800">Excluir Pagamento</h1>

    <% if (mensagem != null) { %>
        <div class="mb-4 p-4 rounded <%=(mensagem.contains("sucesso") ? "bg-green-200 text-green-800" : "bg-red-200 text-red-800")%>">
            <%= mensagem %>
        </div>
    <% } %>

    <% if (pagamento != null && mensagem == null) { %>
        <p class="mb-4 text-gray-700">
            Tem certeza que deseja excluir o pagamento de <strong>R$ <%= pagamento.getValorTotal() %></strong>?
        </p>

        <form action="index.jsp?id=<%= pagamento.getId() %>" method="post" class="space-y-4">
            <button type="submit"
                    class="w-full py-3 bg-red-600 hover:bg-red-700 text-white font-semibold rounded-xl transition duration-200">
                Confirmar Exclusão
            </button>
            <a href="../listar.jsp"
               class="w-full block text-center py-3 bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold rounded-xl transition duration-200">
                Cancelar
            </a>
        </form>
    <% } else if (mensagem == null) { %>
        <p class="text-red-500">Pagamento não encontrado.</p>
    <% } %>
</div>
</body>
</html>
