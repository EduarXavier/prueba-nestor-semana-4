# Pruea de conocimientos - SEMANA 4

**Esta prueba tiene como objetivo evaluar las capacidades del desarrollador para crear microservicios en python y el manejo de bases de datos no relacionales usadas por la empresa, aparte de la gestión de servicios en un cluster de Docker swarm con nodos etiquetados

NOTA: Los puntos que se hacen por terminal tendrán que subirse en el repositorio en la carpeta "evidencias", en la que la imagen llevará el nombre del punto que se desarrolla

Los commit hechos por el desarrollador se tendrán que hacer en la rama "semana-4" la cual se dejará con un PR al finalizar la prueba**

**Tiempo estimado para la prueba: 2 Horas**

1. Crear un proyecto en python con flask que haga una conexión a una base de datos de mongoDB y haga un CRUD de usuarios, esta api debe cumplir con los siguientes requerimientos:

- Se debe seguir una buena estructuración del proyecto
- Seguir las prácticas de codificación recomendadas para python
- La configuración para conectarse a la base de datos debe hacerse mediante variables de entorno
- Los endpoints de guardado y edición pueden recibir uno o muchos usuarios y hacer las validaciones de existencia antes de agregarlos a la base de datos.
- El email de los usuarios no se puede repetir
- Se necesita un endpoint que pase un QueryParam q el cual debe buscar usuarios filtrando por nombre, email o username y retornar los resultados de la búsqueda

2. Crear un Dockerfile para el proyecto con las siguientes caracteristicas:

- Aprovechar el modulo de caché de Docker para la instalación de dependencias
- Uso de tini como proceso principal
- Uso de gunicorn para la ejecución de la aplicación

3. Crear un swarm manager y agregar 2 nodos (con contenedores de docker)
4. Etiquetar los nodos con los siguientes labels:
	- nodo manager: este nodo se va a etiquetar con "app : database"
	- nodo worker 1: este nodo se va a etiquetar con "app : ingress"
	- nodo worker 2: este nodo se va a etiquetar con "app : api"

5. Crear un docker stack que despliegue los siguientes servicios:

- Servicio de base de datos de mongo el cual se debe desplegar en el nodo etiquetado como "database", este debe tener límites de recursos con autenticación para el uso de la base de datos
- Sevicio de api el cual debe partir de la imagen creada del proyecto con flask, este debe estar configurado para hacer la conexión a la base de datos desde las variables de entorno y se despliega en el nodo marcado como "api"
- Servicio de Ingress, este servicio parte de una imagen de nginx el cual expone nuestro api por http y https, cuando ingresamos por http el servicio nos debe redirigir a https y debe ser desplegado en el nodo etiquetado como "ingress" 

***
NOTAS: 
- El único servicio que expone puerto del local al contenedor, es el servicio de ingress, los demás no deben exponer puertos externos
- Las bases de datos no deben ser accesibles desde el servicio de ingress ya que genera una vulnerabilidad
***

6. Desplegar el stack con el nombre "semana4"
7. Verificar el estado y funcionamiento de los servicios (desde el navegador)

**IMPORTANTE: La imagen de api se debe subir a un registry público y debe quedar registrado con esa imagen en el docker stack**
