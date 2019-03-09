/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Modelos.IUsuario;
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
        String sql = "INSERT INTO USUARIO VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user.getDOC_USER());
                ps.setString(2, user.getNICK_USER());
                ps.setString(3, user.getPASSWORD_USER());
                ps.setString(4, user.getNOMBRE_USER());
                ps.setString(5, user.getAPELLIDOS_USER());
                ps.setString(6, user.getCELULAR_USER());
                ps.setString(7, user.getCORREO_USER());
                ps.setInt(8, user.getID_PERFIL_USER());
                ps.setInt(9, user.getESTADO_USER());
                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Usuario, método registrar: " + e);
            return false;
        }
        return true;
    }

    @Override
    public List<Usuario> getUser() {
        Connection con;
        Statement stm;
        ResultSet rs;

        String sql = "SELECT * FROM USUARIO ORDER BY NOMBRE_USER";

        List<Usuario> listaUsuario = new ArrayList<>();

        try {
            con = Conexion.getConexion();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setDOC_USER(rs.getString("DOC_USER"));
                u.setNICK_USER(rs.getString("NICK_USER"));
                u.setNOMBRE_USER(rs.getString("NOMBRE_USER"));
                u.setAPELLIDOS_USER(rs.getString("APELLIDOS_USER"));
                u.setCELULAR_USER(rs.getString("CELULAR_USER"));
                u.setCORREO_USER(rs.getString("CORREO_USER"));
                u.setID_PERFIL_USER(rs.getInt("ID_PERFIL_USER"));
                u.setESTADO_USER(rs.getInt("ESTADO_USER"));
                listaUsuario.add(u);
            }
            stm.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_USUARIO, método obtener: " + e);
        }
        return listaUsuario;
    }

    @Override
    public boolean updateUser(Usuario user) {
        Connection con;

        String sql = "UPDATE USUARIO SET "
                + "NICK_USER          = ?, "
                + "PASSWORD_USER      = ?, "
                + "NOMBRE_USER        = ?, "
                + "APELLIDOS_USER     = ?, "
                + "CELULAR_USER       = ?, "
                + "CORREO_USER        = ?, "
                + "ID_PERFIL_USER     = ?, "
                + "ESTADO_USER        = ?, "
                + "WHERE DOC_USER     = ?";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user.getNICK_USER());
                ps.setString(2, user.getPASSWORD_USER());
                ps.setString(3, user.getNOMBRE_USER());
                ps.setString(4, user.getAPELLIDOS_USER());
                ps.setString(5, user.getCELULAR_USER());
                ps.setString(6, user.getCORREO_USER());
                ps.setInt(7, user.getID_PERFIL_USER());
                ps.setInt(8, user.getESTADO_USER());
                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_USUARIO, método actualizar: " + e);
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteUser(Usuario user) {
        Connection con;

        String sql = "DELETE FROM USUARIO WHERE DOC_USER = ?";

        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, user.getDOC_USER());
                ps.executeUpdate();
                ps.close();
            }
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Usuario, método eliminar: " + e);
            return false;
        }
        return true;
    }

    //**************************************************Procedimientos Almacenados******************************************************
    @Override
    public boolean P_Login(Usuario user) {
        Connection con;
        con = Conexion.getConexion();
        int valor;
        try (CallableStatement cst = con.prepareCall("{call LoginUsuario (?,?,?,?,?,?,?,?,?,?)}")) {

            cst.setString(1, user.getNICK_USER());
            cst.setString(2, user.getPASSWORD_USER());

            cst.registerOutParameter(3, java.sql.Types.INTEGER);
            cst.registerOutParameter(4, java.sql.Types.VARCHAR);
            cst.registerOutParameter(5, java.sql.Types.VARCHAR);
            cst.registerOutParameter(6, java.sql.Types.VARCHAR);
            cst.registerOutParameter(7, java.sql.Types.VARCHAR);
            cst.registerOutParameter(8, java.sql.Types.VARCHAR);
            cst.registerOutParameter(9, java.sql.Types.INTEGER);
            cst.registerOutParameter(10, java.sql.Types.INTEGER);

            cst.execute();

            valor = cst.getInt(3);
            user.setDOC_USER(cst.getString(4));
            user.setNOMBRE_USER(cst.getString(5));
            user.setAPELLIDOS_USER(cst.getString(6));
            user.setCORREO_USER(cst.getString(7));
            user.setCELULAR_USER(cst.getString(8));
            user.setID_PERFIL_USER(cst.getInt(9));
            user.setESTADO_USER(cst.getInt(10));

            cst.close();

        } catch (SQLException ex) {
            System.out.println("Error: Procedimiento Almacenado, método Login: " + ex);
            return false;
        }

        if (valor == 1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean P_ValidUser(String tipo, Usuario user) {
        Connection con;
        con = Conexion.getConexion();
        int valor;
        try (CallableStatement cst = con.prepareCall("{call Validaciones_Usuario (?,?,?)}")) {

            cst.setString(1, tipo);
            
            if (tipo.equals("ValidarNickUsuario")) {
                cst.setString(2, user.getNICK_USER());
            }
            
            if (tipo.equals("ValidarEmailUsuario")) {
                cst.setString(2, user.getCORREO_USER());
            }
            
            if (tipo.equals("ValidarDocUsuario")) {
                cst.setString(2, user.getDOC_USER());
            }   
            cst.registerOutParameter(3, java.sql.Types.INTEGER);

            cst.execute();

            valor = cst.getInt(3);

            cst.close();

        } catch (SQLException ex) {
            System.out.println("Error: Procedimiento Almacenado, método P_ValidUser: " + ex);
            return false;
        }

        if (valor == 1) {
            return true;
        }
        return false;
    }
}
