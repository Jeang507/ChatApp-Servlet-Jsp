<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>

    <!-- Hoja de estilos del login -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>

<div class="container">

    <!-- Panel izquierdo: formulario de login -->
    <div class="left">
        <h2>Iniciar sesión</h2>

        <%
            // Obtener mensaje de error enviado desde el servlet
            String error = (String) request.getAttribute("error");

            // Mostrar el error si existe
            if (error != null) {
        %>
            <div class="error-box"><%= error %></div>
        <%
            }
        %>

        <!-- Formulario de inicio de sesión -->
        <form action="login" method="post">

            <!-- Campo de usuario -->
            <div class="input-group">
                <input type="text" name="usuario" placeholder="Usuario" required>
            </div>

            <!-- Campo de contraseña -->
            <div class="input-group">
                <input type="password" name="password" placeholder="Contraseña" required>
            </div>

            <!-- Enlace para recuperación de contraseña -->
            <div class="actions">
                <span></span>
                <a href="forgot.jsp">¿Olvidaste tu contraseña?</a>
            </div>

            <!-- Botón de envío -->
            <button class="btn-login" type="submit">Entrar</button>
        </form>
    </div>

    <!-- Panel derecho: información y registro -->
    <div class="right">
        <h1>¡BIENVENIDO A CHIPICHAT!</h1>
        <p>Ingresa tus datos y continúa tu experiencia con nosotros.</p>
        <a href="register.jsp">Crear cuenta</a>
    </div>

</div>

</body>
</html>
