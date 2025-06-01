package dao;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import model.Empresa;
import util.ConectaDB;

public class EmpresaDAO {

    public boolean inserir(Empresa empresa) throws ClassNotFoundException {
       
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            String sql = "INSERT INTO empresa (nome, email, endereco, cnpj) values(?,?,?,?)";

            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, empresa.getNome());
            stmt.setString(2, empresa.getEmail());
            stmt.setString(3, empresa.getEndereco());
            stmt.setString(4, empresa.getCnpj());

            stmt.executeUpdate(); 
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public Empresa consultar(Empresa empresa) throws ClassNotFoundException, ParseException {
       
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement(); 

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
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement(); 

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
   
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement();
            String sql = "DELETE FROM empresa WHERE id = " + empresa.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    public boolean alterar(Empresa empresa) throws ClassNotFoundException {
        
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            String sql = "UPDATE empresa SET nome= ?, email= ?, endereco= ?, cnpj= ? WHERE id = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, empresa.getNome());
            stmt.setString(2, empresa.getEmail());
            stmt.setString(3, empresa.getEndereco());
            stmt.setString(4, empresa.getCnpj());
            stmt.setInt(5, empresa.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
    
    public boolean login(String usuario, String senha) throws ClassNotFoundException, ParseException {
        
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar(); 
            String sql = "SELECT * FROM empresa WHERE email = ? AND senha = ? " ;
            PreparedStatement stmt = conexao.prepareStatement(sql);
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
