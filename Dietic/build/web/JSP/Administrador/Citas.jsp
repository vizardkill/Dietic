<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
   <%@include file="Head.jsp" %>
   <body>
   
      <%@include file="Modals.jsp" %>
      <!--Bloque necesario para El efecto Sidebar-->
      <div class="page-wrapper ice-theme sidebar-bg bg2 toggled">
         <!--Sidebar Menu-->
         <%@include file="Menu.jsp" %>
         <!--/Sidebar Menu-->
         <main class="page-content">
            <div class="container-fluid">
               <section>
                  <div class="row">
                     <div class="col">
                        <h1 class="h1">
                           <i class="fas fa-address-book"></i>
                           <strong> Gestion de Citas</strong>
                        </h1>
                        <nav aria-label="breadcrumb">
                           <ol class="breadcrumb">
                              <li class="breadcrumb-item">
                                 <a href="Inicio.jsp">Inicio</a>
                              </li>
                              <li class="breadcrumb-item">Administración</li>
                              <li class="breadcrumb-item active" aria-current="page">
                                 Gestion de citas
                              </li>
                           </ol>
                        </nav>
                     </div>
                  </div>
               </section>

               <hr class="hr blue-grey" />

               <section>
                  <div class="row">
                     <div class="col">
                        <div
                           class="btn-group btn-group-sm"
                           role="group"
                           aria-label="Basic example"
                        >
                           <button
                              type="button"
                              class="btn btn-secondary btn-sm"
                              data-toggle="modal"
                              data-target="#mod_form_reg_cita"
                           >
                              Agendar Cita
                           </button>
                        </div>
                     </div>
                  </div>
                  <br />
               </section>

               <section>
                  <div class="row">
                     <div class="col">
                        <table
                           id="table_citas"
                           class="table table-striped table-hover table-responsive-sm"
                        >
                           <thead class="thead-dark">
                              <tr>
                                 <th>Documento</th>
                                 <th>Nombre y Apellidos</th>
                                 <th>Fecha</th>
                                 <th>Descripcion</th>
                                 <th>Estado</th>
                                 <th><i class="fas fa-cogs"></i>Acciones</th>
                              </tr>
                           </thead>
                           <tfoot class="thead-dark">
                              <tr>
                                 <th>Documento</th>
                                 <th>Nombre y Apellidos</th>
                                 <th>Fecha</th>
                                 <th>Descripcion</th>
                                 <th>Estado</th>
                                 <th><i class="fas fa-cogs"></i>Acciones</th>
                              </tr>
                           </tfoot>
                           <tbody></tbody>
                        </table>
                     </div>
                  </div>
               </section>
            </div>
         </main>
      </div>
   </body>
   <%@include file="Footer.jsp" %>
</html>
