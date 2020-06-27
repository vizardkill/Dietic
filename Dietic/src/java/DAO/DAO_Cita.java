/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Modelos.Cita;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author clan-
 */
public class DAO_Cita implements ICita {

    @Override
    public boolean setCita(Cita c) {
        Connection con;
        String sql = "INSERT INTO CITAS VALUES(?,?,?,?,?)";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, c.getId());
                ps.setString(2, c.getUsuario());
                ps.setInt(3, c.getEstado());
                ps.setString(4, c.getDescripcion());
                ps.setString(5, c.getFecha());

                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Cita, método setCita: " + e);
            return false;
        }
        return true;
    }

    @Override
    public List<Cita> getCitas() {
        Connection con;
        Statement stm;
        ResultSet rs;

        String sql = "SELECT * FROM v_CitasUsuarios";

        List<Cita> listaCita = new ArrayList<>();

        try {
            con = Conexion.getConexion();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Cita cc = new Cita();
                cc.setId(rs.getInt("id"));
                cc.setUsuario(rs.getString("identificacion"));
                cc.setNombres(rs.getString("nombres"));
                cc.setApellidos(rs.getString("apellidos"));
                cc.setFechaSQL(rs.getString("fecha"));
                cc.setDescripcion(rs.getString("descripcion"));
                cc.setEstadoNombre(rs.getString("strEstado"));
                cc.setEstado(rs.getInt("intEstado"));

                listaCita.add(cc);
            }
            stm.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Cita, método getCitas: " + e);
        }
        return listaCita;
    }

    @Override
    public boolean updateCita(Cita c) {
        Connection con;
        String sql = "UPDATE CITAS SET "
                + "estado                 = ?, "
                + "descripcion            = ?, "
                + "fecha                  = ?  "
                + "WHERE id               = ?  ";

        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, c.getEstado());
                ps.setString(2, c.getDescripcion());
                ps.setString(3, c.getFecha());
                ps.setInt(4, c.getId());

                ps.executeUpdate();
                ps.close();
            }
            con.close();

            return true;

        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Cita, método updateCita: " + e);
            return false;
        }
    }
    
    @Override
    public boolean deleteCita(Cita c) {
        Connection con;

        String sql = "DELETE FROM CITAS WHERE id = ?";

        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, c.getId());
                ps.executeUpdate();
                ps.close();
            }
            
             return true;
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Cita, método deleteCita: " + e);
            return false;
        }
       
    }

}
