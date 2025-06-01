<%@page import="model.StatusPagamento"%>
<%@page import="model.TipoPagamento"%>
<%@page import="model.Pagamento"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Inserir Pagamento</title>
    <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>
      <%
          Pagamento pagamento = new Pagamento();
        %> 
    <div class="p-6">
      <h2 class="text-3xl text-gray-900 font-semibold mb-8">
        Cadastrar Pagamento
      </h2>
      <form action="inserir.jsp" method="post" class="flex flex-col gap-4 max-w-[700px]">

        <label class="flex flex-col gap-1.5 text-sm">
          ID Locação
          <input
            type="number"
            name="id_locacao"
            class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base"
            required
          />
        </label>

        <label class="flex flex-col gap-1.5 text-sm">
          Valor Total (R$)
          <input
            type="number"
            name="valor_total"
            step="0.01"
            class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base"
            required
          />
        </label>

        <label class="flex flex-col gap-1.5 text-sm">
          Tipo de Pagamento
          <select
              name="tipo_pagamento"
              class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base"
              required
              >      
              <option value="CARTAO" <%= pagamento.getTipoPagamento() == model.TipoPagamento.CARTAO ? "selected" : "" %>>Cartão</option>
              <option value="BOLETO" <%= pagamento.getTipoPagamento() == model.TipoPagamento.BOLETO ? "BOLETO" : "" %>>Boleto</option>
              <option value="PIX" <%= pagamento.getTipoPagamento() == model.TipoPagamento.PIX ? "PIX" : "" %>>Pix</option>
          </select>
        </label>

        <label class="flex flex-col gap-1.5 text-sm">
          Status do Pagamento
          <select
            name="status_pagamento"
            class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base"
            requiredS
          >
            <option value="PENDENTE" <%= pagamento.getStatusPagamento() == model.StatusPagamento.PENDENTE ? "selected" : "" %>>Pendente</option>
              <option value="PAGO" <%= pagamento.getStatusPagamento() == model.StatusPagamento.PAGO ? "PAGO" : "" %>>Pago</option>
              <option value="CANCELADO" <%= pagamento.getStatusPagamento() == model.StatusPagamento.CANCELADO ? "CANCELADO" : "" %>>Cancelado</option>
          </select>
        </label>

        <label class="flex flex-col gap-1.5 text-sm">
          Data do Pagamento
          <input
            type="date"
            name="data_pagamento"
            class="bg-white shadow-sm px-4 py-2.5 rounded-lg text-base"
          />
        </label>

        <button
          class="flex gap-2 px-3 py-4 text-white bg-orange-500 rounded-lg hover:bg-amber-400 transition-all duration-200 ease-in"
          type="submit"
        >
          Adicionar Pagamento
        </button>
      </form>
    </div>
  </body>
</html>

