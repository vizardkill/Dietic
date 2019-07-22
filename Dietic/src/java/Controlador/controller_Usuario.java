/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Usuario;
import DAO.IUsuario;
import Metodos.SecurityPass;
import Modelos.Usuario;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Usuario {

    public boolean setUser(Usuario user, String tipo) {
        if (tipo.equals("Registro_Usuario_System")) {
            SecurityPass md5 = new SecurityPass();
            String hash = md5.getMD5(user.getPwd());
            user.setPwd(hash);
        }
        IUsuario udao = new DAO_Usuario();
        return udao.setUser(user);
    }

    public boolean updateUser(Usuario user, String tipo) {
        IUsuario udao = new DAO_Usuario();
        return udao.updateUser(user, tipo);
    }

    public boolean deleteUser(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        return udao.deleteUser(user);
    }

    public List<Usuario> getUsers() {
        IUsuario udao = new DAO_Usuario();
        return udao.getUser();
    }

    //**********************************PROCEDIMIENTOS ALMACENADOS**************************************
    public boolean P_Login(Usuario user) {
        SecurityPass md5 = new SecurityPass();
        String hash = md5.getMD5(user.getPwd());
        user.setPwd(hash);

        IUsuario udao = new DAO_Usuario();
        return udao.P_Login(user);
    }

    public boolean F_ValidUser(String tipo, Usuario user) {
        IUsuario udao = new DAO_Usuario();
        return udao.F_ValidUser(tipo, user);
    }
}
