/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Usuario;
import Metodos.SecurityPass;
import Modelos.IUsuario;
import Modelos.Usuario;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Usuario {

    public boolean setUser(Usuario user) {
        SecurityPass md5 = new SecurityPass();
        String hash = md5.getMD5(user.getPASSWORD_USER());
        user.setPASSWORD_USER(hash);

        IUsuario udao = new DAO_Usuario();
        boolean result = udao.setUser(user);
        return result;
    }

    public boolean updateUser(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.updateUser(user);
        return result;
    }

    public boolean deleteUser(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.deleteUser(user);
        return result;
    }

    public List<Usuario> getUsers() {
        IUsuario udao = new DAO_Usuario();
        List<Usuario> listaUsers = udao.getUser();
        return listaUsers;
    }

    //**********************************PROCEDIMIENTOS ALMACENADOS**************************************
    public boolean P_Login(Usuario user) {
        SecurityPass md5 = new SecurityPass();
        String hash = md5.getMD5(user.getPASSWORD_USER());
        user.setPASSWORD_USER(hash);

        IUsuario udao = new DAO_Usuario();
        boolean result = udao.P_Login(user);
        return result;
    }

    public boolean P_ValidUser(String tipo, Usuario user) {
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.P_ValidUser(tipo, user);
        return result;
    }
}
