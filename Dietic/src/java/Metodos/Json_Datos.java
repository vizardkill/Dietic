/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import Controlador.controller_Usuario;
import Modelos.Usuario;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.util.List;

/**
 *
 * @author clan-
 */
public class Json_Datos {

    public Json_Datos() {
    }

    public String Json_Usuarios() {
        JsonObject json = new JsonObject();
        controller_Usuario cuser = new controller_Usuario();
        List<Usuario> lista_usuarios = cuser.getUsers();

        JsonArray array = new JsonArray();
        for (Usuario x : lista_usuarios) {
            JsonObject item = new JsonObject();

            item.addProperty("identificacion", x.getIdentificacion());
            item.addProperty("username", x.getUsuario());
            item.addProperty("nombres", x.getNombres());
            item.addProperty("apellidos", x.getApellidos());
            item.addProperty("correo", x.getCorreo());
            item.addProperty("telefono", x.getTelefono());
            item.addProperty("direccion", x.getDireccion());
            item.addProperty("fecha_nacimiento", x.getFecha_nacimiento());
            item.addProperty("talla", x.getTalla());
            item.addProperty("peso", x.getPeso());
            item.addProperty("perfil", x.getPerfil());
            item.addProperty("estado", x.getEstado());
            item.addProperty("sexo", x.getSexo());

            array.add(item);
        }
        json.add("v_Usuarios", array);
        return json.toString();

    }

<<<<<<< HEAD
=======
    public String Json_Usuarios() {
        JsonObject json = new JsonObject();
        controller_Usuario cuser = new controller_Usuario();
        List<Usuario> listaUsuarios = cuser.getUsers();

        JsonArray array = new JsonArray();
        for (Usuario x : listaUsuarios) {
            JsonObject item = new JsonObject();

            item.addProperty("DOC_USER", x.getDOC_USER());
            item.addProperty("NICK_USER", x.getNICK_USER());
            item.addProperty("NOMBRE_USER", x.getNOMBRE_USER());
            item.addProperty("APELLIDOS_USER", x.getAPELLIDOS_USER());
            item.addProperty("CELULAR_USER", x.getCELULAR_USER());
            item.addProperty("CORREO_USER", x.getCORREO_USER());

            array.add(item);
        }
        json.add("Usuarios", array);
        return json.toString();

    }
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
}
