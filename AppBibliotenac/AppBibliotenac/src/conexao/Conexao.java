/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexao;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author beatriz.lreis
 */
public class Conexao {

   public Connection getConexao(){ 
   try{
       Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/dblivros", 
               "root", 
               "");
       return conn;
   }catch(Exception e){
       System.out.println("Erro de conexão" + e.getMessage());
       return null;
   }
}
}

  
