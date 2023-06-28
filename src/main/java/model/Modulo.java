/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Modulo {
    private int id;
    private String titulo;
    private int idCurso;
    private int capituloLibro;
    private int idLibro;
    
    public Modulo(){}

    public Modulo(int id, String titulo, int idCurso, int capituloLibro, int idLibro) {
        this.id = id;
        this.titulo = titulo;
        this.idCurso = idCurso;
        this.capituloLibro = capituloLibro;
        this.idLibro = idLibro;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public int getCapituloLibro() {
        return capituloLibro;
    }

    public void setCapituloLibro(int capituloLibro) {
        this.capituloLibro = capituloLibro;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }
}
