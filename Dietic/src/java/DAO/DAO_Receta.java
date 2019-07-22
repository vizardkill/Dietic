/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Modelos.Receta;
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
public class DAO_Receta implements IReceta {

    @Override
    public boolean setReceta(Receta rec) {
        Connection con;
        String sql = "INSERT INTO RECETAS VALUES(?,?,?)";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, rec.getId());
                ps.setString(2, rec.getUsuario());
                ps.setString(3, rec.getDescripcion());

                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Receta, método setReceta: " + e);
            return false;
        }
        return true;
    }

    @Override
    public boolean updateReceta(Receta rec) {
        Connection con;
        String sql = "UPDATE RECETAS SET "
                   + "usuario       = ?, "
                   + "descripcion   = ?  "
                   + "WHERE id      = ?  ";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, rec.getUsuario());
                ps.setString(2, rec.getDescripcion());
                ps.setInt(3, rec.getId());

                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Receta, método updateReceta: " + e);
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteReceta(Receta rec) {
        Connection con;
        String sql = "DELETE FROM RECETAS WHERE id = ?";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, rec.getId());

                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Receta, método deleteReceta: " + e);
            return false;
        }
        return true;
    }

    @Override
    public List<Receta> getReceta() {
        Connection con;
        Statement stm;
        ResultSet rs;

        String sql = "SELECT * FROM RECETAS";

        List<Receta> listaReceta = new ArrayList<>();

        try {
            con = Conexion.getConexion();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Receta rec = new Receta();
                rec.setId(rs.getInt("id"));
                rec.setUsuario(rs.getString("usuario"));
                rec.setDescripcion(rs.getString("descripcion"));

                listaReceta.add(rec);
            }
            stm.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Receta, método getReceta: " + e);
        }
        return listaReceta;
    }

}
