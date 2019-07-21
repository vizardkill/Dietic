/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import DAO.IUsuario;
import Modelos.Usuario;
import java.sql.CallableStatement;
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
public class DAO_Usuario implements IUsuario {

    @Override
    public boolean setUser(Usuario user) {
        Connection con;
        String sql = "INSERT INTO USUARIOS VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user.getIdentificacion());
                ps.setString(2, user.getUsuario());
                ps.setString(3, user.getPwd());
                ps.setString(4, user.getNombres());
                ps.setString(5, user.getApellidos());
                ps.setString(6, user.getCorreo());
                ps.setInt(7, user.getTelefono());
                ps.setString(8, user.getDireccion());
                ps.setString(9, user.getFecha_nacimiento());
                ps.setDouble(10, user.getTalla());
                ps.setDouble(11, user.getPeso());
                ps.setInt(12, Integer.valueOf(user.getPerfil()));
                ps.setInt(13, Integer.valueOf(user.getEstado()));
                ps.setInt(14, Integer.valueOf(user.getSexo()));
                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Usuario, método setUser: " + e);
            return false;
        }
        return true;
    }

    @Override
    public List<Usuario> getUser() {
        Connection con;
        Statement stm;
        ResultSet rs;

        String sql = "SELECT * FROM v_Usuarios ORDER BY nombres";

        List<Usuario> listaUsuario = new ArrayList<>();

        try {
            con = Conexion.getConexion();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdentificacion(rs.getString("identificacion"));
                u.setUsuario(rs.getString("username"));
                u.setNombres(rs.getString("nombres"));
                u.setApellidos(rs.getString("apellidos"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getInt("telefono"));
                u.setDireccion(rs.getString("direccion"));
                u.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                u.setTalla(rs.getDouble("talla"));
                u.setPeso(rs.getDouble("peso"));
                u.setPerfil(rs.getString("perfil"));
                u.setEstado(rs.getString("estado"));
                u.setSexo(rs.getString("sexo"));
                listaUsuario.add(u);
            }
            stm.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_usuario, método getUser: " + e);
        }
        return listaUsuario;
    }

    @Override
    public boolean updateUser(Usuario user, String tipo) {
        Connection con;

        if (tipo.equals("System")) {
            String sql = "UPDATE USUARIOS SET "
                    + "identificacion          = ?, "
                    + "username                = ?, "
                    + "pwd                     = ?, "
                    + "nombres                 = ?, "
                    + "apellidos               = ?, "
                    + "correo                  = ?, "
                    + "telefono                = ?, "
                    + "perfil                  = ?, "
                    + "estado                  = ?, "
                    + "sexo                    = ?  "
                    + "WHERE identificacion    = ?  ";

            try {
                con = Conexion.getConexion();
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, user.getIdentificacion());
                    ps.setString(2, user.getUsuario());
                    ps.setString(3, user.getPwd());
                    ps.setString(4, user.getNombres());
                    ps.setString(5, user.getApellidos());
                    ps.setString(6, user.getCorreo());
                    ps.setInt(7, user.getTelefono());
                    ps.setInt(8, Integer.valueOf(user.getPerfil()));
                    ps.setInt(9, Integer.valueOf(user.getEstado()));
                    ps.setInt(10, Integer.valueOf(user.getSexo()));
                    ps.setString(11, user.getIdentificacion());
                    ps.executeUpdate();
                    ps.close();
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("Error: Clase DAO_Usuario, método updateUser_System: " + e);
                return false;
            }
        }

        return true;
    }

    @Override
    public boolean deleteUser(Usuario user) {
        Connection con;

        String sql = "DELETE FROM USUARIOS WHERE identificacion = ?";

        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user.getIdentificacion());
                ps.executeUpdate();
                ps.close();
            }
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Usuario, método deleteUser: " + e);
            return false;
        }
        return true;
    }

    //**************************************************Procedimientos Almacenados******************************************************
    @Override
    public boolean P_Login(Usuario user) {
        Connection con;
        con = Conexion.getConexion();
        int aux;
        try (CallableStatement cst = con.prepareCall("{call LOGIN_USUARIO (?,?,?,?,?)}")) {

            cst.setString(1, user.getUsuario());
            cst.setString(2, user.getPwd());

            cst.registerOutParameter(3, java.sql.Types.INTEGER);
            cst.registerOutParameter(4, java.sql.Types.VARCHAR);
            cst.registerOutParameter(5, java.sql.Types.INTEGER);

            cst.execute();

            user.setIdentificacion(cst.getString(4));
            user.setPerfil(String.valueOf(cst.getInt(3)));
            aux = cst.getInt(5);

            cst.close();

        } catch (SQLException ex) {
            System.out.println("Error: Procedimiento Almacenado, método P_Login: " + ex);
            return false;
        }

        if (aux == 1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean F_ValidUser(String tipo, Usuario user) {
        Connection con;
        con = Conexion.getConexion();
        int aux;
        try (CallableStatement cst = con.prepareCall("{ ? = call Validaciones_Usuario (?,?)}")) {

            cst.setString(2, tipo);

            if (tipo.equals("ValidarNickUsuario")) {
                cst.setString(3, user.getUsuario());
            }

            if (tipo.equals("ValidarEmailUsuario")) {
                cst.setString(3, user.getCorreo());
            }

            if (tipo.equals("ValidarDocUsuario")) {
                cst.setString(3, user.getIdentificacion());
            }
            cst.registerOutParameter(1, java.sql.Types.INTEGER);

            cst.execute();

            aux = cst.getInt(1);

            cst.close();

        } catch (SQLException ex) {
            System.out.println("Error: En la Funcion SQL, método F_ValidUser: " + ex);
            return false;
        }

        if (aux == 1) {
            return true;
        }
        return false;
    }

}
