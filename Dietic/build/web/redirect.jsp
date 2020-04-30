<% if (session.getAttribute("username_usuario") == null) {
        response.sendRedirect("index.jsp");
    } else {
        if (session.getAttribute("perfil_usuario").equals("2")) {
            response.sendRedirect("JSP/Usuarios/Inicio.jsp");
        }  
        
        if (session.getAttribute("perfil_usuario").equals("1")) {
            response.sendRedirect("JSP/Administrador/Inicio.jsp");
        }
    }
%>