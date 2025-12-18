#!/bin/bash

TOMCAT=~/tomcat/apache-tomcat-10.1.49
APP_NAME=test
echo ""
echo "Desplegando aplicación en Tomcat"
echo ""

# Limpiar deploy anterior
rm -rf deploy/$APP_NAME
mkdir -p deploy/$APP_NAME/WEB-INF/classes
mkdir -p deploy/$APP_NAME/WEB-INF/lib

# Copiar clases compiladas
cp -r build/* deploy/$APP_NAME/WEB-INF/classes/

# Copiar JSP y CSS
cp -r web/* deploy/$APP_NAME/

# Copiar librerías
cp lib/*.jar deploy/$APP_NAME/WEB-INF/lib/

# Copiar al directorio webapps de Tomcat
rm -rf $TOMCAT/webapps/$APP_NAME
cp -r deploy/$APP_NAME $TOMCAT/webapps/

echo "Despliegue completado."
echo "Entra en http://TuIP:8080/test"