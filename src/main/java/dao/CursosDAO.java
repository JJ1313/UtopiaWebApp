package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Curso;

public class CursosDAO {
    public ArrayList<Curso> getCursosUsuario(int id){
        ArrayList<Curso> cursos = new ArrayList<>();
        String query = "SELECT * FROM usuario_curso INNER JOIN cursos ON usuario_curso.idCurso = cursos.id WHERE usuario_curso.idUsuario = ? ORDER BY cursos.cantModulos";
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                sent.setString(1, Integer.toString(id));
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    Curso c = new Curso();
                    c.setNombre(rs.getString("nombre"));
                    c.setCantModulos(rs.getInt("cantModulos"));
                    c.setIdCreador(rs.getInt("idCreador"));
                    c.setId(rs.getInt("idCurso"));
                
                    cursos.add(c);
                }
            }
            catch(Exception e){
                System.out.println("Error obtener cursos usuario:" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("CursoDAO 2: " + e.getMessage());
        }
        return cursos;
    }
    
    public ArrayList<Curso> getCursos(){
        ArrayList<Curso> cursos = new ArrayList<>();
        
        String query = "SELECT * FROM cursos";
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    Curso c = new Curso();
                    c.setNombre(rs.getString("nombre"));
                    c.setCantModulos(rs.getInt("cantModulos"));
                    c.setIdCreador(rs.getInt("idCreador"));
                    c.setId(rs.getInt("id"));
                    cursos.add(c);
                }
            }
            catch(Exception e){
                System.out.println("Error obtener cursos usuario:" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("CursoDAO 2: " + e.getMessage());
        }
        return cursos;
    }
    
    public Curso getCursoByTitulo(String titulo){
        Curso c = null;
        String query = "SELECT id, nombre, idCreador FROM cursos where nombre = '" + titulo +"'";
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    c = new Curso();
                    c.setId(rs.getInt("id"));
                    c.setNombre(rs.getString("nombre"));
                    c.setIdCreador(rs.getInt("idCreador"));
                }
            }
            catch(Exception e){
                System.out.println("87. Error :" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("Error al conecta con bdd: " + e.getMessage());
        }
        return c;
    }   
    
    public Curso createCurso(String nombre, int id){
        Curso curso = null;
        String query = "INSERT INTO cursos (nombre, idCreador) VALUES (?, ?)";
        
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                sent.setString(1, nombre);
                sent.setInt(2, id);
                int rows = sent.executeUpdate();
                if(rows > 0){
                    curso = (Curso) getCursoByTitulo(nombre);
                }
            }
            catch(Exception e){
                System.out.println("Error crear usuario: " + e.getMessage());
            }
        }
        catch(Exception e){
            System.out.println("Error conectar con bdd: " + e.getMessage());
        }
        return curso;
    }
    
    public Curso getCurso(int id){
        return new Curso();
    }
    
    public int getCantidadUsuariosCurso(int id){
        int cont = 0;
        String query = "SELECT count(idUsuario) from usuario_curso WHERE idCurso = ? group BY usuario_curso.idCurso";
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                sent.setInt(1, id);
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    cont = rs.getInt(1);
                }
            }
            catch(Exception e){
                System.out.println("Error obtener cursos usuario:" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("CursoDAO 2: " + e.getMessage());
        }
        return cont;
    
    }
    
    public ArrayList<Curso> getCursosCreados(int id){
        ArrayList<Curso> cursos = new ArrayList<>();
        
        String query = "SELECT nombre, id FROM cursos WHERE idCreador = '" + id + "'";
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    Curso c = new Curso();
                    c.setNombre(rs.getString("nombre"));
                    c.setId(rs.getInt("id"));
                    c.setCantUsuario(getCantidadUsuariosCurso(c.getId()));
                    cursos.add(c);
                }
            }
            catch(Exception e){
                System.out.println("Error obtener cursos usuario:" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("CursoDAO 2: " + e.getMessage());
        }
        return cursos;
    }
    
    public void agregarCurso(int idCurso, int idUsuario){
        String query = "INSERT INTO usuario_curso(idUsuario, idCurso, nivel) VALUES (?, ?, ?)";
        
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                sent.setInt(1, idUsuario);
                sent.setInt(2, idCurso);
                sent.setInt(3, 0);
                int rows = sent.executeUpdate();
                if(rows > 0){
                    System.out.println("Registrado");
                }
            }
            catch(Exception e){
                System.out.println("Error crear usuario: " + e.getMessage());
            }
        }
        catch(Exception e){
            System.out.println("Error conectar con bdd: " + e.getMessage());
        }
//        return curso;
    }
    
    public String deletCurso(int id){
        String msg = "USUARIO NO FUE ELIMINADO CORRECTAMENTE.";
        String query = "DELETE FROM cursos WHERE id = ?";
        try {
            Conexion db = new Conexion();
            Connection con = db.conexion();

            try {
                PreparedStatement sent = con.prepareStatement(query);
                sent.setInt(1, id);
                int filasEliminadas = sent.executeUpdate();
                // Verificar si se actualizó al menos una fila
                if (filasEliminadas > 0) {
                    msg = "USUARIO ELIMINADO CORRECTAMENTE."; // La eliminación fue exitosa
                }
            } catch (Exception ex) {
                System.out.println("Error: " + ex.getMessage());
            }

            con.close();
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }

        return msg; 
    }
}
