<% if (session.getAttribute("username_usuario") == null) {
        response.sendRedirect("../../redirect.jsp");
    }
%>
<head>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Dietic</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../css/font-awesome-5.css">
    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="../../css/mdb.min.css" rel="stylesheet">
    <!-- Sidebar -->
    <link href="../../css/sidebar.css" rel="stylesheet">
    <link href="../../css/sidebar-themes.css" rel="stylesheet">
    <!-- DataTable -->
    <link rel="stylesheet" href="../../addons/DataTables/datatables.min.css">
    <!--Estilos Personalizados-->
    <link rel="stylesheet" href="../../css/select2.min.css">
    <link rel="stylesheet" href="../../css/select2-bootstrap.min.css">
    <link rel="shortcut icon" href="../../favicon.ico" type="image/x-icon">
</head>
