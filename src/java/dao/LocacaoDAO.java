package dao;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import model.Locacao;
import model.StatusLocacao;
import util.ConectaDB;

public class LocacaoDAO {

    public boolean inserir(Locacao locacao) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão

            String sql = "INSERT INTO locacao (idCliente, idCarro, dataInicio, dataFim, valorTotal, status) values(?,?,?,?,?,?)";
            PreparedStatement stmt = conexao.prepareStatement(sql);

            stmt.setInt(1, locacao.getIdCliente());
            stmt.setInt(2, locacao.getIdCarro());
            stmt.setDate(3, new Date(locacao.getDataInicio().getTime()));
            stmt.setDate(4, new Date(locacao.getDataFim().getTime()));
            stmt.setDouble(5, locacao.getValorTotal());
            stmt.setString(6, "ATIVA");
            stmt.executeUpdate(); // Insert - Update - Delete
            
            String updateSql = "UPDATE carro SET status = 'INDISPONIVEL' WHERE id = ?";
            PreparedStatement update = conexao.prepareStatement(updateSql);
            update.setInt(1, locacao.getIdCarro());
            update.executeUpdate();
            return true;            
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public Locacao consultar(Locacao locacao) throws ClassNotFoundException, ParseException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement(); // cria uma instrução

            String sql = "SELECT * FROM locacao WHERE id = " + locacao.getId();
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                locacao.setIdCliente(Integer.parseInt(rs.getString("idCliente")));
                locacao.setIdCarro(Integer.parseInt(rs.getString("idCarro")));
                locacao.setDataInicio(rs.getDate("dataInicio"));
                locacao.setDataFim(rs.getDate("dataFim"));
                locacao.setValorTotal(Double.parseDouble(rs.getString("valorTotal")));
                locacao.setStatus(StatusLocacao.valueOf(rs.getString("status")));
                n_reg++;
            }

            if (n_reg == 0) {
                return null;
            } else {
                return locacao;
            }
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }

    public List consultar_lista() throws ClassNotFoundException, ParseException {
        List lista = new ArrayList();
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement(); // cria uma instrução

            String sql = "SELECT * FROM locacao";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Locacao locacao = new Locacao();
                locacao.setId(Integer.parseInt(rs.getString("id")));
                locacao.setIdCliente(Integer.parseInt(rs.getString("idCliente")));
                locacao.setIdCarro(Integer.parseInt(rs.getString("idCarro")));
                locacao.setDataInicio(rs.getDate("dataInicio"));
                locacao.setDataFim(rs.getDate("dataFim"));
                locacao.setValorTotal(Double.parseDouble(rs.getString("valorTotal")));
                locacao.setStatus(StatusLocacao.valueOf(rs.getString("status")));
                lista.add(locacao);
                n_reg++;
            }

            if (n_reg == 0) {
                return null;
            } else {
                return lista;
            }

        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }

    public boolean inativar(Locacao locacao) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            String sql = "UPDATE locacao SET status = 'CANCELADA' WHERE id = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);

            stmt.setInt(1, locacao.getId());
            stmt.executeUpdate(); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public boolean alterar(Locacao locacao) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            String sql = "UPDATE locacao SET idCliente= ?, idCarro= ?, dataInicio= ?,"
                    + " dataFim= ?, valorTotal= ?, status= ? WHERE id= ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);

            stmt.setInt(1, locacao.getIdCliente());
            stmt.setInt(2, locacao.getIdCarro());
            stmt.setDate(3, new Date(locacao.getDataInicio().getTime()));
            stmt.setDate(4, new Date(locacao.getDataFim().getTime()));
            stmt.setDouble(5, locacao.getValorTotal());
            stmt.setString(6, locacao.getStatus().toString());
            stmt.setInt(7, locacao.getId());
            stmt.executeUpdate(); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
}
