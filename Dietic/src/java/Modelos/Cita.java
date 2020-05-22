/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.text.ParseException;
import java.text.SimpleDateFormat;


/**
 *
 * @author clan-
 */
public class Cita {
    private int id;
    private String fecha;
    private String usuario;
    private int estado;
    private String descripcion;

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEstadoNombre() {
        return estadoNombre;
    }

    public void setEstadoNombre(String estadoNombre) {
        this.estadoNombre = estadoNombre;
    }
    
    private String nombres;
    private String apellidos;
    private String estadoNombre;

    public Cita() {
    }

    public Cita(int id, String fecha, String usuario, int estado, String descripcion) {
        this.id = id;
        this.fecha = fecha;
        this.usuario = usuario;
        this.estado = estado;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha)  throws ParseException{
        SimpleDateFormat intputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");  
        java.util.Date parseFecha = intputFormat.parse(fecha);
        SimpleDateFormat outFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        
        String nuevaFecha = outFormat.format(parseFecha);
        this.fecha = String.valueOf(nuevaFecha);
    }
    
    public void setFechaSQL(String fecha) {
        this.fecha = fecha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
