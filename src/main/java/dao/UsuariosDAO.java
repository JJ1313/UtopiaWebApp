package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Usuario;

/**
 *
 * @author Heinz G. Beckers Sandoval
 */
public class UsuariosDAO {
    public Usuario getUserByName(String name){
        Usuario u = null;
        String query = "SELECT id, correo, idRol, estado, pass FROM usuarios where nombre = '" + name + "'";
       
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    u = new Usuario();
                    u.setId(rs.getInt("id"));
                    u.setRol(rs.getInt("idRol"));
                    u.setNombre(name);
                    u.setCorreo(rs.getString("correo"));
                }
            }
            catch(Exception e){
                System.out.println("33. Error :" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("Error al conecta con bdd: " + e.getMessage());
        }
        return u;
    }
    
    public Usuario getUserById(int id){
        Usuario u = null;
        String query = "SELECT (nombre, correo, idRol, estado, pass) FROM usuarios where id = " + id;
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    u = new Usuario();
                    u.setId(id);
                    u.setRol(rs.getInt("idRol"));
                    u.setNombre(rs.getString("nombre"));
                    u.setCorreo(rs.getString("correo"));
                }
            }
            catch(Exception e){
                System.out.println("Error :" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("Error al conecta con bdd: " + e.getMessage());
        }
        return u;
    }
    
    public Usuario createUser(String name, String mail, String pass){
        Usuario user = null;
        String query = "INSERT INTO usuarios(nombre, correo, pass) VALUES (?, ?, ?)";
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                sent.setString(1, name);
                sent.setString(2, mail);
                sent.setString(3, pass);
                int rows =  sent.executeUpdate();
                if(rows > 0){
                    user = (Usuario) getUserByName(name);
                }
            }
            catch(Exception e){
                System.out.println("Error registrar usuario: " + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("Error conecta con bdd: " + e.getMessage());
        }
        return user;
    }
    
    public boolean  checkPassword(String name, String pass){
        boolean verificado = false;
        String query = "SELECT nombre, pass, id, correo FROM usuarios where nombre = ? AND pass = ?";
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                sent.setString(1, name);
                sent.setString(2, pass);
                ResultSet rs = sent.executeQuery();
                while(rs.next()){
                    verificado = true;
                }
            }
            catch(Exception e){
                System.out.println("1 Error :" + e.getMessage());
            }
            con.close();
        }
        catch(Exception e){
            System.out.println("Error al conecta con bdd: " + e.getMessage());
        }
        return verificado;
    }
}
