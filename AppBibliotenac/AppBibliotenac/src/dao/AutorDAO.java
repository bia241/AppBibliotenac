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

    
    
    private Conexao conexao;
    private Connection conn;
    
    public AutorDAO(){
        this.conexao = new Conexao();
        this.conn = this.conexao.getConexao();
    }
    
public void alterar(Autor autor) {
    
        String sql = "UPDATE autor SET titulo=?, autor=?, qtde=? WHERE id=?";
        
        try{
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, autor.getTitulo());
            stmt.setInt(2, autor.getQtde());
            stmt.setString(3,autor.getAutor());
            stmt.setInt(4,autor.getId());
            stmt.execute();
        }catch(Exception e){
            System.out.println("Erro ao atualizar livro: "+ e.getMessage());
        }
    }
    
 public Autor getAutor(int id){
        String sql = "SELECT * FROM produto WHERE id =?";
        
        try{
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Autor autor = new Autor();
            rs.next();
            autor.setId(rs.getInt("id"));
            autor.setTitulo(rs.getString("titulo"));
            autor.setQtde(rs.getInt("qtde"));
            autor.setAutor(rs.getString("autor"));
            return autor;
        
        }catch(Exception e){
            System.out.println("Erro ao atualizar livro: "+ e.getMessage());
            return null;
        }
        
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
            System.out.println("Erro ao inserir livro: "+ e.getMessage());
        }
    }

public void excluir(int id){
        String sql = "DELETE FROM produto WHERE id = ?";
        try{
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1,id);
            stmt.execute();
        }catch(Exception e){
            System.out.println("Erro ao excluir livro: "+ e.getMessage());
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
    

