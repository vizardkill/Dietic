/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.controller_Usuario;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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

        //************************************** Validaciones de la Tabla Usuario *********************************
        if (Peticion.equals("ValidarNickUsuario")) {
            Usuario user = new Usuario();
            user.setUsuario(request.getParameter("form_reg_username"));
            controller_Usuario cuser = new controller_Usuario();
            if (cuser.F_ValidUser(Peticion, user)) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        if (Peticion.equals("ValidarEmailUsuario")) {
            Usuario user = new Usuario();
            user.setCorreo(request.getParameter("form_reg_correo"));
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
            user.setIdentificacion(request.getParameter("form_reg_identificacion"));
            controller_Usuario cuser = new controller_Usuario();
            cuser.F_ValidUser(Peticion, user);
            if (cuser.F_ValidUser(Peticion, user)) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
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

        if (Peticion.equals("Registro_Usuario")) {
            Usuario user = new Usuario();
            user.setPerfil(request.getParameter("form_reg_perfil"));
            user.setEstado(request.getParameter("form_reg_estado"));
            user.setSexo(request.getParameter("form_reg_sexo"));
            user.setNombres(request.getParameter("form_reg_nombres"));
            user.setApellidos(request.getParameter("form_reg_apellidos"));
            user.setIdentificacion(request.getParameter("form_reg_identificacion"));
            user.setCorreo(request.getParameter("form_reg_correo"));
            user.setTelefono(Integer.valueOf(request.getParameter("form_reg_telefono")));
            user.setUsuario(request.getParameter("form_reg_username"));
            user.setPwd(request.getParameter("form_reg_pwd"));
            
            controller_Usuario cuser = new controller_Usuario();

            if (cuser.setUser(user)) {
                response.getWriter().write("true");
            } else {
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
