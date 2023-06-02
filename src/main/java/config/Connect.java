package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
    Connection conn = null;
    public static void main(String[] args){
        Connect cn = new Connect();
    }
    public Connect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver cargado");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/utopia", "root", ""); 
            if(conn != null){
                System.out.println("Conectado");
            }
        }
        catch(Exception e){
            System.out.println("Problema coneccion con BDD: " + e.getMessage());
        }
    }
}
