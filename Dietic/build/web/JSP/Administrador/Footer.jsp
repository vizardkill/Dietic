<<<<<<< HEAD
<% if (session.getAttribute("username_usuario") == null) {
        response.sendRedirect("../../redirect.jsp");
    } else {
        if (session.getAttribute("perfil_usuario").equals("2")) {
            response.sendRedirect("index.jsp");
        }  
    }
%>
<!--JQuery-->
<script type="text/javascript" src="../../js/jquery.min.js"></script>
=======
<!--JQuery-->
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da
<!--JQuery Validation-->
<script type="text/javascript" src="../../js/jquery.validate.js"></script>
<script type="text/javascript" src="../../js/additional-methods.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="../../js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="../../js/mdb.min.js"></script>
<!--Sidebar-->
<script type="text/javascript" src="../../js/jqueryScrollBar.min.js"></script>
<script type="text/javascript" src="../../js/sidebar.js"></script>
<!--DataTable-->
<script type="text/javascript" src="../../addons/DataTables/datatables.min.js"></script>
<!--JS Personalizados-->
<<<<<<< HEAD
<script src="../../js/select2.full.min.js"></script>
<script src="../../js/select2-cascade.js"></script>
<script src="../../js/administrador.js"></script>
=======
<script src="../../js/Admin.js"></script>
>>>>>>> 9701b6c2f638dd4acb2d156bca70bf2cdc8e57da