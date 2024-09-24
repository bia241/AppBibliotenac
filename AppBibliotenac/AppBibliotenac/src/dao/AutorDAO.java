/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import beans.Autor;
import java.sql.Connection;
import conexao.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author beatriz.lreis
 */
public class AutorDAO {

    public static void alterar(Autor a) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    private Conexao conexao;
    private Connection conn;
    
    public AutorDAO(){
        this.conexao = new Conexao();
        this.conn = this.conexao.getConexao();
    }
    
    //Método Inserir classe ProdutoDAO.

public void inserir(Autor autor){
        String sql = "INSERT INTO autor (titulo, autor, qtde) VALUES (?,?,?) ";
        
        try{
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, autor.getTitulo());
            stmt.setString(2, autor.getAutor());
            stmt.setInt(3,autor.getQtde());
            stmt.execute();
        }catch(Exception e){
            System.out.println("Erro ao inserir produto: "+ e.getMessage());
        }
    }

    public List<Autor> getAutor() {
               String sql = "SELECT * FROM autor";
        try{
          PreparedStatement stmt = this.conn.prepareStatement(sql);
          ResultSet rs = stmt.executeQuery();
          List<Autor> listaAutor = new ArrayList<>();
          while(rs.next()){
              Autor a = new Autor();
              a.setId(rs.getInt("id"));
              a.setTitulo(rs.getString("titulo"));
              a.setAutor(rs.getString("autor"));
              a.setQtde(rs.getInt("qtde"));
              listaAutor.add(a);
          }
          return listaAutor;
        }catch(Exception e){
            return null;
        }
    }
    }
}
