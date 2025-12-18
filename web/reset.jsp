<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Obtener el usuario enviado desde la página de recuperación
    String usuario = request.getParameter("user");

    // Si no existe el usuario, redirigir al login
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva contraseña</title>

    <!-- Hoja de estilos para el reseteo de contraseña -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
</head>
<body>

<div class="box">
    <h2>Crear nueva contraseña</h2>

    <!-- Formulario para cambiar la contraseña -->
    <form action="reset" method="post">

        <!-- Usuario oculto recibido desde la validación -->
        <input type="hidden" name="usuario" value="<%= usuario %>">

        <!-- Campo para la nueva contraseña -->
        <input type="password" name="password" placeholder="Nueva contraseña" required>

        <!-- Botón de envío -->
        <button type="submit">Guardar</button>
    </form>
</div>

</body>
</html>
