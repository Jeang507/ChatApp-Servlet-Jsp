<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    // Verificar que el usuario haya iniciado sesión
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Procesar cierre de sesión
    if ("1".equals(request.getParameter("logout"))) {
        session.invalidate();
        response.sendRedirect("Chat.jsp");
        return;
    }

    // Obtener el nombre del usuario desde la sesión
    String usuario = (String) session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat en Vivo</title>

    <!-- Hoja de estilos del chat -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">

    <!-- Lógica JavaScript del chat -->
    <script>
        // Cargar mensajes desde el servidor
        function cargarMensajes() {
            fetch("mensajes.jsp")
                .then(response => response.text())
                .then(html => {
                    const caja = document.getElementById("mensajes");
                    caja.innerHTML = html;
                    caja.scrollTop = caja.scrollHeight;
                });
        }

        // Actualizar mensajes periódicamente
        setInterval(cargarMensajes, 900);
        window.onload = cargarMensajes;

        // Enviar un nuevo mensaje
        function enviarMensaje(event) {
            event.preventDefault();

            const usuario = document.getElementById("usuario").value;
            const mensaje = document.getElementById("mensaje").value;

            // Evitar enviar mensajes vacíos
            if (mensaje.trim() === "") return;

            fetch(
                "enviar.jsp?usuario=" + encodeURIComponent(usuario) +
                "&mensaje=" + encodeURIComponent(mensaje)
            ).then(() => {
                document.getElementById("mensaje").value = "";
                cargarMensajes();
            });
        }
    </script>

</head>
<body>

<div class="chat-wrapper">

    <!-- Encabezado del chat -->
    <div class="header">
        Chat en Vivo
        <form method="post" action="Chat.jsp" style="display:inline;">
            <input type="hidden" name="logout" value="1">
            <button class="logout-btn">Salir</button>
        </form>
    </div>

    <!-- Contenedor de mensajes -->
    <div id="mensajes"></div>

    <!-- Formulario para enviar mensajes -->
    <form class="input-area" onsubmit="enviarMensaje(event)">
        <input type="text" id="usuario" value="<%= usuario %>" readonly>
        <input type="text" id="mensaje" placeholder="Escribe un mensaje..." required>
        <button type="submit">Enviar</button>
    </form>

</div>

</body>
</html>
