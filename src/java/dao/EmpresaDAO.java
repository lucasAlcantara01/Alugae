package dao;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import model.Empresa;
import util.ConectaDB;

public class EmpresaDAO {

    public boolean inserir(Empresa empresa) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            //String sql = "Insert into cliente (codigo, nome, renda, nasc) values(987654, 'José da Silva', 9500, '1981/03/22')";
            String sql = "INSERT INTO empresa (nome, email, endereco, cnpj) values(?,?,?,?)";

            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, empresa.getNome());
            stmt.setString(2, empresa.getEmail());
            stmt.setString(3, empresa.getEndereco());
            stmt.setString(4, empresa.getCnpj());

            stmt.executeUpdate(); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public Empresa consultar(Empresa empresa) throws ClassNotFoundException, ParseException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement(); // cria uma instrução

            String sql = "SELECT * FROM empresa WHERE id = " + empresa.getId();
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                empresa.setNome(rs.getString("nome"));
                empresa.setEmail(rs.getString("email"));
                empresa.setEndereco(rs.getString("endereco"));
                empresa.setCnpj(rs.getString("cnpj"));
                n_reg++;
            }

            if (n_reg == 0) {
                return null;
            } else {
                return empresa;
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

            String sql = "SELECT * FROM empresa";
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                Empresa empresa = new Empresa();
                empresa.setId(Integer.parseInt(rs.getString("id")));
                empresa.setNome(rs.getString("nome"));
                empresa.setEmail(rs.getString("email"));
                empresa.setEndereco(rs.getString("endereco"));
                empresa.setCnpj(rs.getString("cnpj"));
                lista.add(empresa);
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

    public boolean excluir(Empresa empresa) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement();
            String sql = "DELETE FROM empresa WHERE id = " + empresa.getId();
            stmt.executeUpdate(sql); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public boolean alterar(Empresa empresa) throws ClassNotFoundException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            String sql = "UPDATE empresa SET nome= ?, email= ?, endereco= ?, cnpj= ? WHERE id = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, empresa.getNome());
            stmt.setString(2, empresa.getEmail());
            stmt.setString(3, empresa.getEndereco());
            stmt.setString(4, empresa.getCnpj());
            stmt.setInt(5, empresa.getId());
            stmt.executeUpdate(); // Insert - Update - Delete
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
    
    public boolean login(String usuario, String senha) throws ClassNotFoundException, ParseException {
        //Conectar
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); //Abre a conexão
            String sql = "SELECT * FROM empresa WHERE email = ? AND senha = ? " ;
            PreparedStatement stmt = conexao.prepareStatement(sql); // cria uma instrução
            stmt.setString(1, usuario);
            stmt.setString(2, senha);

            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
}
