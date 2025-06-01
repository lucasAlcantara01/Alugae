package dao;

import java.sql.*;
import java.util.*;
import model.Pagamento;
import model.StatusPagamento;
import model.TipoPagamento;
import util.ConectaDB;

public class PagamentoDAO {

    public boolean inserir(Pagamento pagamento) throws ClassNotFoundException {
        String sql = "INSERT INTO pagamento (idLocacao, tipoPagamento, statusPagamento, data_pagamento, valorTotal) VALUES (?, ?, ?, ?, ?)";

        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, pagamento.getIdLocacao());
            pstmt.setString(2, pagamento.getTipoPagamento().toString());
            pstmt.setString(3, pagamento.getStatusPagamento().toString());
            pstmt.setDate(4, new java.sql.Date(pagamento.getDataPagamento().getTime()));
            pstmt.setBigDecimal(5, pagamento.getValorTotal());

            pstmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao inserir: " + ex);
            return false;
        }
    }

    public Pagamento consultar(int id) throws ClassNotFoundException {
        String sql = "SELECT * FROM pagamento WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Pagamento pagamento = new Pagamento();
                    pagamento.setId(rs.getInt("id"));
                    pagamento.setIdLocacao(rs.getInt("idLocacao"));
                    pagamento.setTipoPagamento(TipoPagamento.valueOf(rs.getString("tipoPagamento")));
                    pagamento.setStatusPagamento(StatusPagamento.valueOf(rs.getString("statusPagamento")));
                    pagamento.setDataPagamento(rs.getDate("data_pagamento"));
                    pagamento.setValorTotal(rs.getBigDecimal("valorTotal"));
                    return pagamento;
                }
            }

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar: " + ex);
        }
        return null;
    }

    public List<Pagamento> consultar_lista() throws ClassNotFoundException {
        String sql = "SELECT * FROM pagamento";
        List<Pagamento> lista = new ArrayList<>();

        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Pagamento pagamento = new Pagamento();
                pagamento.setId(rs.getInt("id"));
                pagamento.setIdLocacao(rs.getInt("IdLocacao"));
                pagamento.setTipoPagamento(TipoPagamento.valueOf(rs.getString("TipoPagamento")));
                pagamento.setStatusPagamento(StatusPagamento.valueOf(rs.getString("statusPagamento")));
                pagamento.setDataPagamento(rs.getDate("data_pagamento"));
                pagamento.setValorTotal(rs.getBigDecimal("valorTotal"));
                lista.add(pagamento);
            }

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao listar: " + ex);
        }

        return lista;
    }

    public boolean excluir(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM pagamento WHERE id = ?";

        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao excluir: " + ex);
            return false;
        }
    }

    public boolean alterar(Pagamento pagamento) throws ClassNotFoundException {
        String sql = "UPDATE pagamento SET idLocacao = ?, tipoPagamento = ?, statusPagamento = ?, data_pagamento = ?, valorTotal = ? WHERE id = ?";

        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, pagamento.getIdLocacao());
            pstmt.setString(2, pagamento.getTipoPagamento().toString());
            pstmt.setString(3, pagamento.getStatusPagamento().toString());
            pstmt.setDate(4, new java.sql.Date(pagamento.getDataPagamento().getTime()));
            pstmt.setBigDecimal(5, pagamento.getValorTotal());
            pstmt.setInt(6, pagamento.getId());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao alterar: " + ex);
            return false;
        }
    }
}
