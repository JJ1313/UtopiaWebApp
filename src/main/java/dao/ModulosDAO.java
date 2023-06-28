/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Modulo;

/**
 *
 * @author JJ
 */
public class ModulosDAO {
    public Modulo createModulo(String titulo, String parrafo, int idCurso){
        Modulo modulo = null;
        String query = "INSERT INTO modulos (titulo, parrafo, idCurso) VALUES (?, ?, ?)";
        
        try{
            Conexion db = new Conexion();
            Connection con = db.conexion();
            try{
                PreparedStatement sent = con.prepareStatement(query);
                sent.setString(1, titulo);
                sent.setString(2, parrafo);
                sent.setInt(2, idCurso);
                int rows = sent.executeUpdate();
                if(rows > 0){
//                    modulo = (Modulo) getCurso(id);
                }
            }
            catch(Exception e){
                System.out.println("Error crear usuario: " + e.getMessage());
            }
        }
        catch(Exception e){
            System.out.println("Error conectar con bdd: " + e.getMessage());
        }
        return modulo;
    }
}
