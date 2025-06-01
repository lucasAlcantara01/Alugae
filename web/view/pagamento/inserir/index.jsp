<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*, java.math.BigDecimal, model.Pagamento, dao.PagamentoDAO, model.Locacao, dao.LocacaoDAO"%>
<%@page import="model.StatusPagamento"%>
<%@page import="model.TipoPagamento"%>

<%
    String mensagem = null;
    List<Locacao> locacoes = new LocacaoDAO().consultar_lista();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int idLocacao = Integer.parseInt(request.getParameter("id_locacao"));
            TipoPagamento tipoPagamento = TipoPagamento.valueOf(request.getParameter("tipo_pagamento"));
            StatusPagamento statusPagamento = StatusPagamento.valueOf(request.getParameter("status_pagamento"));
            String dataPagamentoStr = request.getParameter("data_pagamento");
            BigDecimal valorTotal = new BigDecimal(request.getParameter("valor_total"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dataPagamento = sdf.parse(dataPagamentoStr);

            Pagamento pagamento = new Pagamento();
            pagamento.setIdLocacao(idLocacao);
            pagamento.setTipoPagamento(tipoPagamento);
            pagamento.setStatusPagamento(statusPagamento);
            pagamento.setDataPagamento(dataPagamento);
            pagamento.setValorTotal(valorTotal);

            boolean inserido = new PagamentoDAO().inserir(pagamento);

            mensagem = inserido ? "Pagamento cadastrado com sucesso!" : "Erro ao cadastrar pagamento.";

        } catch (Exception e) {
            mensagem = "Erro no processamento: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Novo Pagamento</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            // Função para atualizar o campo valor_total com base no ID da locação
            function atualizarValorTotal() {
            const select = document.getElementById("id_locacao");
            const valorInput = document.getElementById("valor_total");
            const idSelecionado = select.value;
            const valor = locacoesMap[idSelecionado];
            valorInput.value = valor !== undefined ? valor : "";
            }

            // Este objeto será preenchido via script gerado pelo JSP
            let locacoesMap = {};
        </script>
    </head>
    <body class="bg-gray-100 p-10">
        <%
          Pagamento pagamento = new Pagamento();
        %> 
        <div class="max-w-2xl mx-auto bg-white p-8 rounded-xl shadow-md">

            <h1 class="text-2xl font-bold mb-6 text-gray-800">Novo Pagamento</h1>

            <% if (mensagem != null) { %>
            <div class="mb-4 p-4 rounded <%=(mensagem.contains("sucesso") ? "bg-green-200 text-green-800" : "bg-red-200 text-red-800")%>">
                <%= mensagem %>
            </div>
            <% } %>

            <form action="index.jsp" method="post" class="space-y-6">
                <!-- Locação -->
                <div>
                    <label for="id_locacao" class="block text-sm font-medium text-gray-700">Locação</label>
                    <select name="id_locacao" id="id_locacao" required onchange="atualizarValorTotal()"
                            class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
                        <option value="">Selecione</option>
                        <% for (Locacao locacao : locacoes) { %>
                        <option value="<%= locacao.getId() %>">
                            ID: <%= locacao.getId() %> - Cliente: <%= locacao.getIdCliente() %> - Carro: <%= locacao.getIdCarro() %>
                        </option>
                        <% } %>
                    </select>
                </div>

                <!-- Preencher locacoesMap via script JSP -->
                <script>
                    locacoesMap = {
                    <% for (Iterator<Locacao> it = locacoes.iterator(); it.hasNext(); ) {
                            Locacao loc = it.next();
                    %>
                    "<%= loc.getId() %>": "<%= loc.getValorTotal() %>"<%= it.hasNext() ? "," : "" %>
                    <% } %>
                    };
                </script>

                <!-- Tipo Pagamento -->
                <div>
                    <label for="tipo_pagamento" class="block text-sm font-medium text-gray-700">Tipo de Pagamento</label>
                    <select name="tipo_pagamento" id="tipo_pagamento" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                        <option value="CARTAO" <%= pagamento.getTipoPagamento() == model.TipoPagamento.CARTAO ? "selected" : "" %>>Cartão</option>
                        <option value="BOLETO" <%= pagamento.getTipoPagamento() == model.TipoPagamento.BOLETO ? "BOLETO" : "" %>>Boleto</option>
                        <option value="PIX" <%= pagamento.getTipoPagamento() == model.TipoPagamento.PIX ? "PIX" : "" %>>Pix</option>
                    </select>
                </div>

                <!-- Status Pagamento -->
                <div>
                    <label for="status_pagamento" class="block text-sm font-medium text-gray-700">Status do Pagamento</label>
                    <select name="status_pagamento" id="status_pagamento" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                        <option value="PENDENTE" <%= pagamento.getStatusPagamento() == model.StatusPagamento.PENDENTE ? "selected" : "" %>>Pendente</option>
                        <option value="PAGO" <%= pagamento.getStatusPagamento() == model.StatusPagamento.PAGO ? "PAGO" : "" %>>Pago</option>
                        <option value="CANCELADO" <%= pagamento.getStatusPagamento() == model.StatusPagamento.CANCELADO ? "CANCELADO" : "" %>>Cancelado</option>
                    </select>
                </div>

                <!-- Data Pagamento -->
                <div>
                    <label for="data_pagamento" class="block text-sm font-medium text-gray-700">Data do Pagamento</label>
                    <input type="date" name="data_pagamento" id="data_pagamento" required
                           class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
                </div>

                <!-- Valor Total -->
                <div>
                    <label for="valor_total" class="block text-sm font-medium text-gray-700">Valor Total (R$)</label>
                    <input type="number" step="0.01" name="valor_total" id="valor_total" required readonly
                           class="mt-1 block w-full p-2 border border-gray-300 rounded-md bg-gray-100" />
                </div>

                <div>
                    <button class="w-full px-4 py-3 bg-orange-500 text-white font-semibold rounded-md hover:bg-orange-600 transition">
                        Salvar Pagamento
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
