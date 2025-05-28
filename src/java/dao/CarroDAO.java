package dao;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import model.Carro;
import model.StatusCarro;
import util.ConectaDB;

public class CarroDAO {

    public boolean inserir(Carro carro) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "INSERT INTO carro (modelo, marca, ano, placa, status, precoDiaria) values(?,?,?,?,?,?)";
            PreparedStatement stmt = conexao.prepareStatement(sql);

            stmt.setString(1, carro.getModelo());
            stmt.setString(2, carro.getMarca());
            stmt.setInt(3, carro.getAno());
            stmt.setString(4, carro.getPlaca());
            stmt.setString(5, carro.getStatus().toString());
            stmt.setDouble(6, carro.getPreco());

            stmt.executeUpdate(); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public Carro consultar(Carro carro) throws ClassNotFoundException, ParseException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement(); // cria uma instrução

            String sql = "SELECT * FROM carro WHERE id = " + carro.getId();
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                carro.setId(Integer.parseInt(rs.getString("id")));
                carro.setModelo(rs.getString("modelo"));
                carro.setMarca(rs.getString("marca"));
                carro.setAno(Integer.parseInt(rs.getString("ano")));
                carro.setPlaca(rs.getString("placa"));
                carro.setStatus(StatusCarro.valueOf(rs.getString("status")));
                carro.setPreco(Double.parseDouble(rs.getString("precoDiaria")));
                n_reg++;
            }
            if (n_reg == 0) {
                return null;
            } else {
                return carro;
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

            String sql = "SELECT * FROM carro";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Carro carro = new Carro();
                carro.setId(Integer.parseInt(rs.getString("id")));
                carro.setModelo(rs.getString("modelo"));
                carro.setMarca(rs.getString("marca"));
                carro.setAno(Integer.parseInt(rs.getString("ano")));
                carro.setPlaca(rs.getString("placa"));
                carro.setStatus(StatusCarro.valueOf(rs.getString("status")));
                carro.setPreco(Double.parseDouble(rs.getString("precoDiaria")));
                lista.add(carro);
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

    public List<Carro> listarDisponiveis() throws ClassNotFoundException {
        List<Carro> lista = new ArrayList<>();
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM carro WHERE status = 'DISPONIVEL'";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Carro carro = new Carro();
                carro.setId(rs.getInt("id"));
                carro.setModelo(rs.getString("modelo"));
                carro.setMarca(rs.getString("marca"));
                carro.setAno(rs.getInt("ano"));
                carro.setPlaca(rs.getString("placa"));
                carro.setStatus(StatusCarro.valueOf(rs.getString("status")));
                carro.setPreco(rs.getDouble("precoDiaria"));
                lista.add(carro);               
            }
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return null;
        }
         return lista;
    }

    public boolean excluir(Carro carro) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement();
            String sql = "DELETE FROM carro WHERE id = " + carro.getId();
            stmt.executeUpdate(sql); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public boolean alterar(Carro carro) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão            
            String sql = "UPDATE carro SET modelo= ?, marca= ?, ano= ?, placa= ?, status= ?, precoDiaria= ? WHERE id = ?";

            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, carro.getModelo());
            stmt.setString(2, carro.getMarca());
            stmt.setInt(3, carro.getAno());
            stmt.setString(4, carro.getPlaca());
            stmt.setString(5, carro.getStatus().toString());
            stmt.setDouble(6, carro.getPreco());
            stmt.setInt(7, carro.getId());
            stmt.executeUpdate(); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
}
