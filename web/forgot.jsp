<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar contraseña</title>

    <!-- Hoja de estilos para la vista de recuperación -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgot.css">
</head>
<body>

<div class="container">
    <h2>Recuperar contraseña</h2>

    <!-- Formulario para validar usuario y correo -->
    <form action="forgot" method="post">

        <!-- Campo de usuario -->
        <input type="text"
               name="usuario"
               placeholder="Usuario"
               required>

        <!-- Campo de correo electrónico -->
        <input type="email"
               name="correo"
               placeholder="Correo electrónico"
               required>

        <!-- Botón de envío -->
        <button type="submit">Validar</button>
    </form>

    <!-- Enlace para volver al login -->
    <a href="login.jsp">Volver al inicio de sesión</a>
</div>

</body>
</html>
