# Aplicación Web de Chat Multiusuario

Este proyecto consiste en una **aplicación web de chat multiusuario** desarrollada en **Java**, utilizando **Jakarta Servlets y JSP**, desplegada sobre **Apache Tomcat** y conectada a una base de datos **PostgreSQL** mediante **JDBC**.

La aplicación implementa una **arquitectura cliente–servidor**, permitiendo que múltiples usuarios accedan simultáneamente desde distintos dispositivos dentro de la misma red local utilizando la dirección IP del servidor.

## Objetivos del Proyecto

- Implementar una arquitectura cliente–servidor funcional.
- Desarrollar un sistema de autenticación de usuarios.
- Permitir comunicación multiusuario a través de un chat web.
- Integrar una base de datos relacional usando JDBC.
- Aplicar buenas prácticas de organización y despliegue en Java Web.

## Arquitectura del Sistema

La aplicación sigue una arquitectura **cliente–servidor centralizada**:

- **Cliente:** Navegador web del usuario.
- **Servidor:** Apache Tomcat.
- **Lógica de negocio:** Servlets Java.
- **Persistencia:** PostgreSQL mediante JDBC.

El cliente envía solicitudes HTTP al servidor, el cual procesa la lógica, gestiona sesiones y responde con vistas JSP.

## Servicio en Red

El servidor Apache Tomcat se ejecuta escuchando en el **puerto 8080** y en todas las interfaces de red (`0.0.0.0`), lo que permite que la aplicación sea accesible desde cualquier dispositivo dentro de la misma red local utilizando la IP del servidor.

Ejemplo de acceso:

http://IP_DEL_SERVIDOR:8080/test

yaml
Copiar código

## Funcionalidades

- Registro de usuarios.
- Inicio de sesión con manejo de sesiones HTTP.
- Recuperación y restablecimiento de contraseña.
- Chat multiusuario accesible en red local.
- Interfaz web desarrollada con JSP y CSS.

## Organización del Proyecto

El proyecto se encuentra dentro del directorio `webapps` de Tomcat por conveniencia de despliegue, pero el control de versiones se limita únicamente al **código fuente**, **recursos web** y **scripts**, excluyendo archivos generados y dependencias externas.

- `src/` contiene el código fuente Java.
- `css/` y archivos `.jsp` contienen la capa de presentación.
- `build.sh` compila el proyecto.
- `deploy.sh` despliega la aplicación en Tomcat.

## Compilación y Despliegue

El proyecto se compila y despliega manualmente mediante scripts Bash.

### Compilar
- ```bash
./build.sh
Desplegar en Tomcat
bash
Copiar código
./deploy.sh
Una vez desplegado, Tomcat ejecuta la aplicación desde el directorio webapps.

## Requisitos
Java JDK 11 o superior.

Apache Tomcat 10.x.

PostgreSQL.

Driver JDBC de PostgreSQL.

Navegador web moderno.

## Autores

Jean Guillèn
Líder del proyecto

Jerameel Morris