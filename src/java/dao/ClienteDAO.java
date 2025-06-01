package dao;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import util.ConectaDB;

public class ClienteDAO {

    public boolean inserir(Cliente cli) throws ClassNotFoundException {
       
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();

            String sql = "INSERT INTO cliente (nome, email, cpf, telefone, endereco) values(?,?,?,?,?)";
            PreparedStatement stmt = conexao.prepareStatement(sql);

            stmt.setString(1, cli.getNome());
            stmt.setString(2, cli.getEmail());
            stmt.setString(3, cli.getCpf());
            stmt.setString(4, cli.getTelefone());
            stmt.setString(5, cli.getEndereco());

            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public Cliente consultar(Cliente cli) throws ClassNotFoundException, ParseException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "SELECT * FROM cliente WHERE id = " + cli.getId();
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                cli.setNome(rs.getString("nome"));
                cli.setEmail(rs.getString("email"));
                cli.setCpf(rs.getString("cpf"));
                cli.setTelefone(rs.getString("telefone"));
                cli.setEndereco(rs.getString("endereco"));
                n_reg++;
            }
            if (n_reg == 0) {
                return null;
            } else {
                return cli;
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
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "SELECT * FROM cliente";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(Integer.parseInt(rs.getString("id")));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setEndereco(rs.getString("endereco"));
                lista.add(cliente);
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

    public boolean excluir(Cliente cli) throws ClassNotFoundException {
     
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement();
            String sql = "DELETE FROM cliente WHERE id = " + cli.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public boolean alterar(Cliente cli) throws ClassNotFoundException {
        
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            String sql = "UPDATE cliente SET nome= ?, email= ?, cpf= ?, telefone= ?, endereco = ? WHERE id = ? ";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            
            stmt.setString(1, cli.getNome());
            stmt.setString(2, cli.getEmail());
            stmt.setString(3, cli.getCpf());
            stmt.setString(4, cli.getTelefone());
            stmt.setString(5, cli.getEndereco());
            stmt.setInt(6, cli.getId());
            stmt.executeUpdate(); 
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
}
