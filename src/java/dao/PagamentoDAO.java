package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Pagamento;
import util.ConectaDB;

public class PagamentoDAO{

    public boolean inserir(Pagamento pagamento) throws ClassNotFoundException {
        String sql = "INSERT INTO locacao (idCliente, idCarro, dataInicio, dataFim, valorTotal) VALUES (?, ?, ?, ?, ?)";
        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, pagamento.getIdCliente());
            pstmt.setInt(2, pagamento.getIdCarro());
            pstmt.setDate(3, new java.sql.Date(pagamento.getDataInicio().getTime()));
            pstmt.setDate(4, new java.sql.Date(pagamento.getDataFim().getTime()));
            pstmt.setDouble(5, pagamento.getValorTotal());

            pstmt.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao inserir: " + ex);
            return false;
        }
    }
    

    public Pagamento consultar(int id) throws ClassNotFoundException {
        String sql = "SELECT * FROM locacao WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Pagamento pagamento = new Pagamento();
                    pagamento.setId(id);
                    pagamento.setIdCliente(rs.getInt("idCliente"));
                    pagamento.setIdCarro(rs.getInt("idCarro"));
                    pagamento.setDataInicio(rs.getDate("dataInicio"));
                    pagamento.setDataFim(rs.getDate("dataFim"));
                    pagamento.setValorTotal(rs.getDouble("valorTotal"));
                    return pagamento;
                } else {
                    return null;
                }
            }

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao consultar: " + ex);
            return null;
        }
    }

    public List<Pagamento> consultar_lista() throws ClassNotFoundException {
        String sql = "SELECT * FROM locacao";
        List<Pagamento> lista = new ArrayList<>();

        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Pagamento pagamento = new Pagamento();
                pagamento.setId(rs.getInt("id"));
                pagamento.setIdCliente(rs.getInt("idCliente"));
                pagamento.setIdCarro(rs.getInt("idCarro"));
                pagamento.setDataInicio(rs.getDate("dataInicio"));
                pagamento.setDataFim(rs.getDate("dataFim"));
                pagamento.setValorTotal(rs.getDouble("valorTotal"));
                lista.add(pagamento);
            }

            return lista;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao listar: " + ex);
            return null;
        }
    }

    public boolean excluir(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM locacao WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();

            return affectedRows > 0;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao excluir: " + ex);
            return false;
        }
    }

    public boolean alterar(Pagamento pagamento) throws ClassNotFoundException {
        String sql = "UPDATE locacao SET idCliente = ?, idCarro = ?, dataInicio = ?, dataFim = ?, valorTotal = ? WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar();
             PreparedStatement pstmt = conexao.prepareStatement(sql)) {

            pstmt.setInt(1, pagamento.getIdCliente());
            pstmt.setInt(2, pagamento.getIdCarro());
            pstmt.setDate(3, new java.sql.Date(pagamento.getDataInicio().getTime()));
            pstmt.setDate(4, new java.sql.Date(pagamento.getDataFim().getTime()));
            pstmt.setDouble(5, pagamento.getValorTotal());
            pstmt.setInt(6, pagamento.getId());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException ex) {
            System.out.println("Erro SQL ao alterar: " + ex);
            return false;
        }
    }

    private void setId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
}

    private void setIdCliente(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void setIdCarro(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void setDataInicio(Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void setDataFim(Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void setValorTotal(double aDouble) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private int getIdCliente() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private Object getDataInicio() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private int getIdCarro() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private Object getDataFim() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private double getValorTotal() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private int getId() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

