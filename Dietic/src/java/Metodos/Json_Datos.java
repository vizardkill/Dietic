/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import Controlador.controller_Cita;
import Controlador.controller_Receta;
import Controlador.controller_Usuario;
import Modelos.Cita;
import Modelos.Receta;
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

    public String Json_Recetas() {
        JsonObject json = new JsonObject();
        controller_Receta crec = new controller_Receta();

        List<Receta> lista_receta = crec.getReceta();

        JsonArray array = new JsonArray();
        for (Receta x : lista_receta) {
            JsonObject item = new JsonObject();

            item.addProperty("id", x.getId());
            item.addProperty("usuario", x.getUsuario());
            item.addProperty("descripcion", x.getDescripcion());

            array.add(item);

        }
        json.add("RECETAS", array);
        return json.toString();
    }

    public String Json_Recetas_Usuario(String usuario) {
        JsonObject json = new JsonObject();
        controller_Receta crec = new controller_Receta();

        List<Receta> lista_receta = crec.getReceta();

        JsonArray array = new JsonArray();
        for (Receta x : lista_receta) {
            JsonObject item = new JsonObject();

            if (usuario.equals(x.getUsuario())) {
                item.addProperty("id", x.getId());
                item.addProperty("descripcion", x.getDescripcion());

                array.add(item);

            }
        }
        json.add("RECETAS", array);
        return json.toString();
    }

    public String Json_Citas() {
        JsonObject json = new JsonObject();
        controller_Cita cc = new controller_Cita();

        List<Cita> lista_citas = cc.getCitas();

        JsonArray array = new JsonArray();
        for (Cita x : lista_citas) {
            JsonObject item = new JsonObject();

            item.addProperty("id", x.getId());
            item.addProperty("usuario", x.getUsuario());
            item.addProperty("nombres", x.getNombres());
            item.addProperty("apellidos", x.getApellidos());
            item.addProperty("fecha", x.getFecha());
            item.addProperty("descripcion", x.getDescripcion());
            item.addProperty("estado", x.getEstadoNombre());
            item.addProperty("intEstado", x.getEstado());

            array.add(item);

        }
        json.add("CITAS", array);
        return json.toString();
    }

    public String Json_Citas_Usuario(String usuario) {
        JsonObject json = new JsonObject();
        controller_Cita cc = new controller_Cita();

        List<Cita> lista_citas = cc.getCitas();

        JsonArray array = new JsonArray();
        for (Cita x : lista_citas) {
            JsonObject item = new JsonObject();

            if (usuario.equals(x.getUsuario())) {
                item.addProperty("id", x.getId());
                item.addProperty("fecha", x.getFecha());
                item.addProperty("descripcion", x.getDescripcion());
                item.addProperty("estado", x.getEstadoNombre());

                array.add(item);
            }

        }
        json.add("CITAS", array);
        return json.toString();
    }

}
