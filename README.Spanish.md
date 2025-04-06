# Guía de Configuración del Complemento CarConnectivity

## Introducción

El módulo **CarConnectivity-Addon** te permite conectar y recuperar información sobre tu vehículo de los servicios en línea de fabricantes compatibles. Esta guía explica cómo configurar correctamente el módulo.  
Simplemente estoy empaquetando el [excelente trabajo realizado por Till.](https://github.com/tillsteinbach/CarConnectivity)

Su trabajo también está disponible como imágenes de docker. Así que si estás usando Home Assistant como un docker independiente, también puedes usarlo directamente.

**⚠️El proyecto aún está en desarrollo, con la ingeniería inversa de la API por completarse y la comunicación con MQTT/Home Assistant por adaptarse.⚠️**

## Agregar repositorio

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuración General

Solo completa los ajustes para las marcas de vehículos que posees. **Deja todos los demás campos vacíos.**

### 1. Selección de la Marca de Tu Vehículo
Elige el fabricante correspondiente a tu vehículo de las marcas soportadas:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  
- **Volvo**  

Si posees múltiples vehículos de diferentes marcas, puedes configurar múltiples secciones.

### 2. Conectando a los Servicios en Línea del Fabricante
Cada fabricante de automóviles proporciona un servicio en línea que te permite acceder a los datos de tu vehículo de forma remota. Para conectarte, necesitas proporcionar tus credenciales de inicio de sesión.

#### Información Requerida:  
Para Seat, Cupra, Skoda, Volkswagen y Tronity:  
- **Marca**: La marca del fabricante.  
- **Nombre de usuario**: La dirección de correo electrónico utilizada para iniciar sesión en el servicio del fabricante.  
- **Contraseña**: La contraseña de tu cuenta de fabricante.  
- **Código PIN**: Un código de 4 dígitos requerido para el acceso remoto a ciertas funciones del vehículo.  
- **Intervalo de actualización**: Define con qué frecuencia (en segundos) se actualizan los datos del vehículo.  
  - **Advertencia:** Establecer una tasa de actualización con demasiada frecuencia puede exceder los límites de solicitud de la API impuestos por el fabricante, resultando en restricciones temporales de acceso.  

⚠️ Puedes usar 2 cuentas para 2 marcas diferentes o 2 coches de la misma marca que no estén vinculados a la misma cuenta.

Para Volvo:  
- **Clave de API primaria**: Clave primaria de API de Volvo.  
- **Clave de API secundaria**: Clave secundaria de API de Volvo.  
- **Token del Vehículo**: Token de acceso para el vehículo.  
- **Token de Ubicación del Vehículo**: Token de acceso para el endpoint de ubicación.  
- **Intervalo de actualización**: Define con qué frecuencia (en segundos) se actualizan los datos del vehículo.  
  - **Advertencia:** Establecer una tasa de actualización con demasiada frecuencia puede exceder los límites de solicitud de la API impuestos por el fabricante, resultando en restricciones temporales de acceso.  

### 3. Configuración de MQTT (Obligatorio)
Necesitas usar **MQTT** para enviar datos del vehículo al Home Assistant, configura estos ajustes:  
- **Nombre de usuario**: Inicio de sesión del broker MQTT  
- **Contraseña**: Contraseña del broker MQTT  
- **Dirección del Broker**: IP o nombre de dominio del servidor MQTT  

⚠️ Si no estás utilizando MQTT en Home Assistant, puedes agregar, por ejemplo, [el complemento Mosquito Y la integración MQTT](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI
Puedes visitar http//x.x.x.x:4000 La WEBUI de Carconnectivity:  
- **Nombre de usuario**: inicio de sesión  
- **Contraseña**: contraseña  
- **Puerto WEBUI**: 4000  

### 5. Nivel de Registro
Define la cantidad de información registrada en los registros:  
- **Info**: Muestra información operativa general.  
- **Advertencia**: Muestra solo advertencias.  
- **Error**: Muestra solo mensajes de error.  
- **Depuración**: Muestra detalles adicionales útiles para la solución de problemas.  

### 6. Nivel de Registro de API
Define la cantidad de información registrada en los registros:  
- **Info**: Muestra información operativa general.  
- **Advertencia**: Muestra solo advertencias.  
- **Error**: Muestra solo mensajes de error.  
- **Depuración**: Muestra detalles adicionales útiles para la solución de problemas.  

### 7. Modo Experto
El Modo Experto permite el uso de todas las funciones nativas de Carconnectivity, incluidas aquellas que no están disponibles a través de la interfaz gráfica, siempre que las funciones correspondientes estén soportadas por los binarios del complemento.

⚠️ Advertencia:  
Este modo desactiva toda la validación de contenido y las verificaciones de seguridad. Como resultado, incluso un pequeño error (como una sintaxis JSON inválida) puede impedir que el complemento se inicie correctamente.

El Modo Experto está destinado solo para usuarios avanzados.  
Para usarlo de manera segura, debes:

Estar familiarizado con la sintaxis y estructura JSON.

El Modo Experto permite el uso de un archivo de configuración personalizado. Cuando este modo está habilitado, el usuario puede proporcionar un archivo llamado /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json que contenga la configuración deseada. Esto reemplaza completamente la configuración de la interfaz gráfica, que estará disponible en /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json. El directorio /addon_configs/1b1291d4_carconnectivity-addon/ puede no aparecer en el sistema de archivos de Home Assistant. Si este es el caso, se debe reiniciar el supervisor.  

Consulta la documentación oficial de Carconnectivity para la lista de funciones soportadas y parámetros esperados.

## Mejores Prácticas
- **Solo completa los ajustes para las marcas de vehículos que posees.**  
- **No compartas tus credenciales de inicio de sesión.**  
- **Ajusta el intervalo de actualización para evitar exceder los límites de solicitudes de API. Recuerda que el límite parece ser de aproximadamente 1000 req/día.**  
- **Usa el nivel de registro "Depuración" solo cuando resuelvas problemas.**  

---

Si tienes alguna pregunta o encuentras problemas durante la configuración, consulta la documentación del módulo.  
Si encuentras un error, abre un problema.