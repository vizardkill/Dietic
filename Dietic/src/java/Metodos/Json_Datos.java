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

    public String Json_Login(Usuario user) {
        JsonObject json = new JsonObject();
        controller_Usuario cuser = new controller_Usuario();

        boolean aux = cuser.P_Login(user);
        if (aux) {
            JsonArray array = new JsonArray();
            JsonObject item = new JsonObject();

            item.addProperty("resulset", aux);
            item.addProperty("nombre", user.getNOMBRE_USER());
            item.addProperty("apellidos", user.getAPELLIDOS_USER());
            item.addProperty("documento", user.getDOC_USER());
            array.add(item);
            json.add("data", array);
            return json.toString();
        }
        return "false";
    }

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
}
