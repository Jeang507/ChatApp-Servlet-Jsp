#!/bin/bash
echo ""
echo "Compilando proyecto "
echo ""

TOMCAT=~/tomcat/apache-tomcat-10.1.49
SERVLET_API=$TOMCAT/lib/servlet-api.jar
POSTGRES_JAR=lib/postgresql-42.7.8.jar

# Limpiar compilación anterior
rm -rf build
mkdir -p build

# Compilar código Java
javac \
  -cp "$SERVLET_API:$POSTGRES_JAR" \
  -d build \
  src/controllers/*.java src/db/*.java

# Verificar compilación
if [ $? -eq 0 ]; then
    echo "Compilación completada correctamente."
else
    echo "Error durante la compilación."
    exit 1
fi
