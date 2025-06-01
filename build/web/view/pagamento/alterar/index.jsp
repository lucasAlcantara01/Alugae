<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.SimpleDateFormat, java.math.BigDecimal, model.Pagamento, dao.PagamentoDAO, model.Locacao, dao.LocacaoDAO"%>
<%@page import="model.StatusPagamento"%>
<%@page import="model.TipoPagamento"%>


<%
    String mensagem = null;
    Pagamento pagamento = null;
    List<Locacao> locacoes = new LocacaoDAO().consultar_lista();

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
            int idLocacao = Integer.parseInt(request.getParameter("id_locacao"));
            TipoPagamento tipoPagamento = TipoPagamento.valueOf(request.getParameter("tipo_pagamento"));
                    StatusPagamento statusPagamento = StatusPagamento.valueOf(request.getParameter("status_pagamento"));
            String dataPagamentoStr = request.getParameter("data_pagamento");
            String valorStr = request.getParameter("valor_total");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date dataPagamento = sdf.parse(dataPagamentoStr);
            BigDecimal valorTotal = new BigDecimal(valorStr);

            pagamento.setIdLocacao(idLocacao);
            pagamento.setTipoPagamento(tipoPagamento);
            pagamento.setStatusPagamento(statusPagamento);
            pagamento.setDataPagamento(dataPagamento);
            pagamento.setValorTotal(valorTotal);

            boolean atualizado = new PagamentoDAO().alterar(pagamento);
            mensagem = atualizado ? "Pagamento atualizado com sucesso!" : "Erro ao atualizar pagamento.";
        } catch (Exception e) {
            mensagem = "Erro no processamento: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Alterar Pagamento</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-6">
    <div class="w-full max-w-2xl bg-white rounded-2xl shadow-lg p-8 space-y-6">

        <h1 class="text-3xl font-bold text-gray-800">Alterar Pagamento</h1>

        <% if (mensagem != null) { %>
            <div class="p-4 rounded-lg font-medium text-sm 
                        <%= mensagem.contains("sucesso") ? "bg-green-100 text-green-700" : "bg-red-100 text-red-700" %>">
                <%= mensagem %>
            </div>
        <% } %>

        <% if (pagamento != null) { %>
        <form action="index.jsp?id=<%= pagamento.getId() %>" method="post" class="space-y-5">

            <div>
                <label for="id_locacao" class="block text-sm font-medium text-gray-700 mb-1">Locação</label>
                <select name="id_locacao" id="id_locacao" required
                        class="w-full p-3 border border-gray-300 rounded-xl shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <% for (Locacao loc : locacoes) { %>
                        <option value="<%= loc.getId() %>" data-valor="<%= loc.getValorTotal() %>"
                            <%= (loc.getId() == pagamento.getIdLocacao()) ? "selected" : "" %>>
                            Locação ID: <%= loc.getId() %> - Valor: R$ <%= loc.getValorTotal() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <div>
                <label for="tipo_pagamento" class="block text-sm font-medium text-gray-700 mb-1">Tipo de Pagamento</label>
                <select name="tipo_pagamento" id="tipo_pagamento" required
                        class="w-full p-3 border border-gray-300 rounded-xl shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="CARTAO" <%= pagamento.getTipoPagamento().equals("CARTAO") ? "selected" : "" %>>Cartão</option>
                    <option value="BOLETO" <%= pagamento.getTipoPagamento().equals("BOLETO") ? "selected" : "" %>>Boleto</option>
                    <option value="PIX" <%= pagamento.getTipoPagamento().equals("PIX") ? "selected" : "" %>>Pix</option>
                </select>
            </div>

            <div>
                <label for="status_pagamento" class="block text-sm font-medium text-gray-700 mb-1">Status do Pagamento</label>
                <select name="status_pagamento" id="status_pagamento" required
                        class="w-full p-3 border border-gray-300 rounded-xl shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="PAGO" <%= pagamento.getStatusPagamento().equals("PAGO") ? "selected" : "" %>>Pago</option>
                    <option value="PENDENTE" <%= pagamento.getStatusPagamento().equals("PENDENTE") ? "selected" : "" %>>Pendente</option>
                    <option value="CANCELADO" <%= pagamento.getStatusPagamento().equals("CANCELADO") ? "selected" : "" %>>Cancelado</option>
                </select>
            </div>

            <!-- Data do Pagamento -->
            <div>
                <label for="data_pagamento" class="block text-sm font-medium text-gray-700 mb-1">Data do Pagamento</label>
                <input type="date" name="data_pagamento" id="data_pagamento" required
                       value="<%= new SimpleDateFormat("yyyy-MM-dd").format(pagamento.getDataPagamento()) %>"
                       class="w-full p-3 border border-gray-300 rounded-xl shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="valor_total" class="block text-sm font-medium text-gray-700 mb-1">Valor Total</label>
                <input type="text" name="valor_total" id="valor_total" readonly
                       value="<%= pagamento.getValorTotal() %>"
                       class="w-full p-3 bg-gray-100 border border-gray-300 rounded-xl shadow-sm text-gray-700">
            </div>

            <div>
               <button type="submit"
                    class="w-full py-3 bg-orange-500 hover:bg-orange-600 text-white font-semibold rounded-xl transition duration-200">
                Atualizar Pagamento
                </button>
            </div>
        </form>
        <% } else { %>
            <p class="text-red-600 text-center">Pagamento não encontrado.</p>
        <% } %>
    </div>

    <script>
        document.getElementById("id_locacao").addEventListener("change", function () {
            const option = this.options[this.selectedIndex];
            const valor = option.getAttribute("data-valor");
            document.getElementById("valor_total").value = parseFloat(valor).toFixed(2);
        });
    </script>
</body>
</html>
