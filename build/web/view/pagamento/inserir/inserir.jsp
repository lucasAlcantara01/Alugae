<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*, java.math.BigDecimal"%>
<%@page import="model.Pagamento"%>
<%@page import="dao.PagamentoDAO"%>
<%@page import="model.StatusPagamento"%>
<%@page import="model.TipoPagamento"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Inserir Pagamento</title>
        <link href="../../../dist/css/output.css" rel="stylesheet" type="text/css"/>  
    </head>
    <body class="h-screen">
        <section class="container mx-auto px-4 flex justify-center items-center h-full w-full">
            <%
                String mensagem = null;

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

                    if (inserido) {
            %>
            <div class="flex bg-green-400 rounded-lg p-6 w-fit">
                <p class="text-green-800 font-semibold">Pagamento cadastrado com sucesso!</p>
            </div>
            <%
                    } else {
            %>
            <div class="flex bg-red-400 rounded-lg p-6 w-fit">
                <p class="text-red-800 font-semibold">Não foi possível cadastrar o pagamento.</p>
            </div>
            <%
                    }
                } catch (Exception e) {
            %>
            <div class="flex bg-red-400 rounded-lg p-6 w-fit">
                <p class="text-red-800 font-semibold"><%= e.getMessage() %></p>
            </div>
            <%
                }
            %>
        </section>
    </body>
</html>
