/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.controller_Usuario;
import Metodos.Json_Datos;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author clan-
 */
public class Ingreso extends HttpServlet {

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
            out.println("<title>Servlet Ingreso</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ingreso at " + request.getContextPath() + "</h1>");
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
        String Peticion = request.getParameter("Peticion");
        
        
         //************************************** Validaciones de la Tabla Usuario *********************************
        if (Peticion.equals("ValidarNickUsuario")) {
            Usuario user = new Usuario();
            user.setNICK_USER(request.getParameter("R_NICK_USER"));
            controller_Usuario cuser = new controller_Usuario();
            boolean result = cuser.P_ValidUser(Peticion, user);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        if (Peticion.equals("ValidarEmailUsuario")) {
            Usuario user = new Usuario();
            user.setCORREO_USER(request.getParameter("CORREO_USER"));
            controller_Usuario cuser = new controller_Usuario();
            boolean result = cuser.P_ValidUser(Peticion, user);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        if (Peticion.equals("ValidarDocUsuario")) {
            Usuario user = new Usuario();
            user.setDOC_USER(request.getParameter("DOC_USER"));
            controller_Usuario cuser = new controller_Usuario();
            boolean result = cuser.P_ValidUser(Peticion, user);
            if (result) {
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

        HttpSession session = request.getSession(true);
        Usuario user = new Usuario();
        user.setNICK_USER(request.getParameter("NICK_USER"));
        user.setPASSWORD_USER(request.getParameter("PASSWORD_USER"));

        Json_Datos login = new Json_Datos();
        if (login.Json_Login(user).equals("false")) {
            response.getWriter().write("false");
        } else {
            session.setAttribute("NICK_USER", user.getNICK_USER());
            session.setAttribute("NOMBRE_USER", user.getNOMBRE_USER());
            session.setAttribute("APELLIDOS_USER", user.getAPELLIDOS_USER());
            session.setAttribute("DOC_USER", user.getDOC_USER());
            request.getRequestDispatcher("JSP/Administrador/Inicio.jsp").forward(request, response);
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
