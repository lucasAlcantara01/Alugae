/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.*;

/**
 *
 * @author alunocmc
 */
public class ConectaDB {
    // zero Atrib.
    
    // Método(s)
    public static Connection conectar() throws ClassNotFoundException{
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alugae","root","");
            return conn;
        }
        catch(SQLException ex){
            System.out.println("Erro: " + ex);
        }
        return conn;        
    }
            
}
