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
public class Registro extends HttpServlet {

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
            out.println("<title>Servlet Registro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Registro at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        String Peticion = request.getParameter("Peticion");
        
        if (Peticion.equals("Registro_Usuario")) {
            Usuario user = new Usuario();
            controller_Usuario cuser = new controller_Usuario();

            //user.setID_PERFIL_USER(Integer.valueOf(request.getParameter("ID_PERFIL_USER")));
            user.setID_PERFIL_USER(1);
            user.setESTADO_USER(1);
            user.setNOMBRE_USER(request.getParameter("NOMBRE_USER"));
            user.setAPELLIDOS_USER(request.getParameter("APELLIDOS_USER"));
            user.setDOC_USER(request.getParameter("DOC_USER"));
            user.setCORREO_USER(request.getParameter("CORREO_USER"));
            user.setCELULAR_USER(request.getParameter("R_CELULAR_USER"));
            user.setNICK_USER(request.getParameter("R_NICK_USER"));
            user.setPASSWORD_USER(request.getParameter("R_PASSWORD_USER"));

            boolean result = cuser.setUser(user);
            if (result) {
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
