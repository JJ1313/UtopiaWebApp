package model;

public class Curso {
    private int id;
    private String name;
    private int idCreador;
    private int cantModulos;

    public Curso() {
    }

    public Curso(int id, String nombre, int idCreador, int cantModulos) {
        this.id = id;
        this.name = nombre;
        this.idCreador = idCreador;
        this.cantModulos = cantModulos;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return name;
    }
    public void setNombre(String nombre) {
        this.name = nombre;
    }

    public int getIdCreador() {
        return idCreador;
    }
    public void setIdCreador(int idCreador) {
        this.idCreador = idCreador;
    }

    public int getCantModulos() {
        return cantModulos;
    }
    public void setCantModulos(int cantModulos) {
        this.cantModulos = cantModulos;
    }
    
    
}
