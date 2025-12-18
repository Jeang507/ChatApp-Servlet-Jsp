<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear cuenta</title>

    <!-- Hoja de estilos del registro -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>

<body>

<div class="container">

    <!-- Panel izquierdo: formulario de registro -->
    <div class="left">
        <h2>Crear cuenta</h2>

        <!-- Formulario de registro -->
        <form action="register" method="post">

            <!-- Campo de usuario -->
            <div class="input-group">
                <input type="text" name="usuario" placeholder="Usuario" required>
            </div>

            <!-- Campo de nombre -->
            <div class="input-group">
                <input type="text" name="nombre" placeholder="Nombre" required>
            </div>

            <!-- Campo de apellido -->
            <div class="input-group">
                <input type="text" name="apellido" placeholder="Apellido" required>
            </div>

            <!-- Campo de correo -->
            <div class="input-group">
                <input type="email" name="correo" placeholder="Correo electrónico" required>
            </div>

            <!-- Campo de contraseña -->
            <div class="input-group">
                <input type="password" name="password" placeholder="Contraseña" required>
            </div>

            <!-- Botón de envío -->
            <button type="submit">Registrarse</button>
        </form>

        <!-- Enlace para volver al login -->
        <a class="link" href="login.jsp">Ya tengo una cuenta</a>
    </div>

    <!-- Panel derecho: mensaje de bienvenida -->
    <div class="right">
        <h1>¡BIENVENIDO A CHIPICHAT!</h1>
        <p>Completa tus datos y únete a nuestra comunidad.</p>
        <a href="login.jsp">Iniciar sesión</a>
    </div>

</div>

</body>
</html>
