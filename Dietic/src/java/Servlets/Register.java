/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.controller_Cita;
import Controlador.controller_Receta;
import Controlador.controller_Usuario;
import Modelos.Cita;
import Modelos.Receta;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author clan-
 */
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String Peticion = request.getParameter("Peticion");
        String Tipo = request.getParameter("Tipo");

        //************************************** Validaciones de la Tabla Usuario *********************************
        if (Tipo.equals("system")) {
            if (Peticion.equals("ValidarNickUsuario")) {
                Usuario user = new Usuario();
                user.setUsuario(request.getParameter("form_reg_username_system"));
                controller_Usuario cuser = new controller_Usuario();
                if (cuser.F_ValidUser(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }

            if (Peticion.equals("ValidarEmailUsuario")) {
                Usuario user = new Usuario();
                user.setCorreo(request.getParameter("form_reg_correo_system"));
                controller_Usuario cuser = new controller_Usuario();
                cuser.F_ValidUser(Peticion, user);
                if (cuser.F_ValidUser(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }

            if (Peticion.equals("ValidarDocUsuario")) {
                Usuario user = new Usuario();
                user.setIdentificacion(request.getParameter("form_reg_identificacion_system"));
                controller_Usuario cuser = new controller_Usuario();
                cuser.F_ValidUser(Peticion, user);
                if (cuser.F_ValidUser(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }

        }
        
        if (Tipo.equals("client")) {
            if (Peticion.equals("ValidarNickUsuario")) {
                Usuario user = new Usuario();
                user.setUsuario(request.getParameter("form_reg_username_client"));
                controller_Usuario cuser = new controller_Usuario();
                if (cuser.F_ValidUser(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }

            if (Peticion.equals("ValidarEmailUsuario")) {
                Usuario user = new Usuario();
                user.setCorreo(request.getParameter("form_reg_correo_client"));
                controller_Usuario cuser = new controller_Usuario();
                cuser.F_ValidUser(Peticion, user);
                if (cuser.F_ValidUser(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }

            if (Peticion.equals("ValidarDocUsuario")) {
                Usuario user = new Usuario();
                user.setIdentificacion(request.getParameter("form_reg_identificacion_client"));
                controller_Usuario cuser = new controller_Usuario();
                cuser.F_ValidUser(Peticion, user);
                if (cuser.F_ValidUser(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }
            
        }
        
        if (Tipo.equals("edit_system")) {
            if (Peticion.equals("ValidarNickUsuario")) {
                Usuario user = new Usuario();
                user.setUsuario(request.getParameter("form_edit_username_system"));
                user.setIdentificacion(request.getParameter("form_edit_identificacion_system"));
                controller_Usuario cuser = new controller_Usuario();
                
                if (cuser.F_ValidUserEdit(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }

            if (Peticion.equals("ValidarEmailUsuario")) {
                Usuario user = new Usuario();
                user.setCorreo(request.getParameter("form_edit_correo_system"));
                user.setIdentificacion(request.getParameter("form_edit_identificacion_system"));
                controller_Usuario cuser = new controller_Usuario();
                
                if (cuser.F_ValidUserEdit(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }

            if (Peticion.equals("ValidarDocUsuario")) {
                Usuario user = new Usuario();
                user.setIdentificacion(request.getParameter("form_edit_identificacion_system"));
                user.setIdentificacion(request.getParameter("form_edit_identificacion_system"));
                controller_Usuario cuser = new controller_Usuario();
                
                if (cuser.F_ValidUserEdit(Peticion, user)) {
                    response.getWriter().write("false");
                } else {
                    response.getWriter().write("true");
                }
            }
            
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String Peticion = request.getParameter("Peticion");

        if (Peticion.equals("Registro_Usuario_System")) {
            Usuario user = new Usuario();
            user.setPerfil(request.getParameter("form_reg_perfil_system"));
            user.setEstado(request.getParameter("form_reg_estado_system"));
            user.setSexo(request.getParameter("form_reg_sexo_system"));
            user.setNombres(request.getParameter("form_reg_nombres_system"));
            user.setApellidos(request.getParameter("form_reg_apellidos_system"));
            user.setIdentificacion(request.getParameter("form_reg_identificacion_system"));
            user.setCorreo(request.getParameter("form_reg_correo_system"));
            user.setTelefono(request.getParameter("form_reg_telefono_system"));
            user.setUsuario(request.getParameter("form_reg_username_system"));
            user.setPwd(request.getParameter("form_reg_pwd_system"));

            controller_Usuario cuser = new controller_Usuario();

            if (cuser.setUser(user, Peticion)) {
                response.getWriter().write("true");
            } else {
                response.getWriter().write("false");
            }
        }

        if (Peticion.equals("Registro_Usuario_Client")) {
            Usuario user = new Usuario();
            user.setEstado(request.getParameter("form_reg_estado_client"));
            user.setPerfil(request.getParameter("form_reg_perfil_client"));
            user.setSexo(request.getParameter("form_reg_sexo_client"));
            user.setNombres(request.getParameter("form_reg_nombres_client"));
            user.setApellidos(request.getParameter("form_reg_apellidos_client"));
            user.setIdentificacion(request.getParameter("form_reg_identificacion_client"));
            user.setCorreo(request.getParameter("form_reg_correo_client"));
            user.setTelefono(request.getParameter("form_reg_telefono_client"));
            user.setTalla(Integer.valueOf(request.getParameter("form_reg_talla_client")));
            user.setPeso(Integer.valueOf(request.getParameter("form_reg_peso_client")));

            controller_Usuario cuser = new controller_Usuario();

            if (cuser.setUser(user,Peticion)) {
                response.getWriter().write("true");
            } else {
                response.getWriter().write("false");
            }
        }

        if (Peticion.equals("Registro_Receta")) {
            Receta rec = new Receta();
            rec.setUsuario(request.getParameter("form_reg_usuario_receta"));
            rec.setDescripcion(request.getParameter("form_reg_desc_receta"));

            controller_Receta crec = new controller_Receta();

            if (crec.setReceta(rec)) {
                response.getWriter().write("true");
            } else {
                response.getWriter().write("false");
            }
        }
        
        if (Peticion.equals("Registro_Cita")) {
            try {
                Cita c = new Cita();
                c.setFecha(request.getParameter("form_reg_cita_fecha"));
                c.setUsuario(request.getParameter("form_reg_cita_usuario"));
                c.setEstado(1);
                c.setDescripcion(request.getParameter("form_reg_cita_desc"));
                
                controller_Cita cc = new controller_Cita();
                
                
                if(cc.setCita(c)) {
                    response.getWriter().write("true");
                } else {
                    response.getWriter().write("false");
                }
            } catch (ParseException ex) {
                System.out.println("Error en la petición de Registro de Citas: " + ex);
                response.getWriter().write("false");
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
