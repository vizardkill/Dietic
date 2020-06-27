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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author clan-
 */
public class Delete extends HttpServlet {

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
            out.println("<title>Servlet Delete</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Delete at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        String Peticion = request.getParameter("Peticion");

        if (Peticion.equals("Eliminar_Usuario")) {
            Usuario user = new Usuario();
            user.setIdentificacion(request.getParameter("form_elim_idenfiticacion"));
            controller_Usuario cuser = new controller_Usuario();

            if (cuser.deleteUser(user)) {
                response.getWriter().write("true");
            } else {
                response.getWriter().write("false");
            }
        }

        if (Peticion.equals("Eliminar_Receta")) {
            Receta rec = new Receta();
            rec.setId(Integer.valueOf(request.getParameter("form_elim_id_receta")));
            controller_Receta crec = new controller_Receta();

            if (crec.deleteReceta(rec)) {
                response.getWriter().write("true");
            } else {
                response.getWriter().write("false");
            }
        }

        if (Peticion.equals("Eliminar_Cita")) {
            Cita c = new Cita();
            c.setId(Integer.valueOf(request.getParameter("form_elim_id_cita")));
            controller_Cita cc = new controller_Cita();

            if (cc.deleteCita(c)) {
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
