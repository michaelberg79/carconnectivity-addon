![Compatible con la Arquitectura aarch64][aarch64-shield]  
![Compatible con la Arquitectura amd64][amd64-shield]  
![Compatible con la Arquitectura armhf][armhf-shield]  
![Compatible con la Arquitectura armv7][armv7-shield]  
![Compatible con la Arquitectura i386][i386-shield]  
[![Código fuente en GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![Lanzamiento de GitHub (más reciente por fecha)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![Problemas en GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Complemento de Home Assistant: CarConnectivity  

|         | Versión Estable                                                                                                                          | Edge                                                                                                                                            |  
| ------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |  
| Versión | [![Lanzamiento de GitHub (más reciente por fecha)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Versión de Imagen Docker (última semántica)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guía de Configuración del Complemento CarConnectivity  

## Introducción  

El módulo **CarConnectivity-Addon** te permite conectar y obtener información sobre tu vehículo desde los servicios en línea de fabricantes compatibles. Esta guía explica cómo configurar correctamente el módulo.  
Estoy simplemente empaquetando el [excelente trabajo realizado por Till.](https://github.com/tillsteinbach/CarConnectivity)  

Su trabajo también está disponible como imágenes de docker. Por lo tanto, si estás utilizando Home Assistant como un docker independiente, puedes usarlo directamente también.  

**⚠️El proyecto aún está en desarrollo, con la ingeniería inversa del API por completar y la comunicación con MQTT/Home Assistant por adaptar.⚠️**  

![Coche conectado como dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Añadir repositorio  

[![Complemento Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configuración General  

Solo completa los ajustes para las marcas de vehículos que poseas. **Deja todos los demás campos vacíos.**  

### 1. Selección de la Marca de tu Vehículo  
Elige el fabricante correspondiente a tu vehículo de las marcas compatibles:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Si posees múltiples vehículos de diferentes marcas, puedes configurar varias secciones.  

### 2. Conexión a los Servicios en Línea del Fabricante  
Cada fabricante de automóviles proporciona un servicio en línea que te permite acceder a los datos de tu vehículo de forma remota. Para conectarte, necesitas proporcionar tus credenciales de inicio de sesión.  

#### Información Requerida:  
- **Marca**: La marca del fabricante.  
- **Nombre de usuario**: La dirección de correo electrónico utilizada para iniciar sesión en el servicio del fabricante.  
- **Contraseña**: La contraseña de tu cuenta del fabricante.  
- **Código PIN**: Un código de 4 dígitos requerido para el acceso remoto a ciertas funciones del vehículo.  
- **Intervalo de Actualización**: Define con qué frecuencia (en segundos) se actualizan los datos del vehículo.  
  - **Advertencia:** Configurar una frecuencia de actualización demasiado corta puede exceder los límites de solicitudes API impuestos por el fabricante, resultando en restricciones temporales de acceso.  

⚠️ Puedes usar 2 cuentas para 2 marcas diferentes o 2 vehículos de una misma marca que no estén vinculados a la misma cuenta.  

### 3. Configuración de MQTT (Obligatoria)  
Necesitas usar **MQTT** para enviar datos del vehículo a Home Assistant, configura los siguientes ajustes:  
- **Nombre de usuario**: Inicio de sesión del broker MQTT  
- **Contraseña**: Contraseña del broker MQTT  
- **Dirección del Broker**: IP o nombre de dominio del servidor MQTT  

⚠️ Si aún no estás usando MQTT en Home Assistant, puedes añadir, por ejemplo, [El complemento Mosquito Y la integración MQTT](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI  
Puedes visitar http//x.x.x.x:4000 La WEBUI de Carconnectivity:  
- **Nombre de usuario**: inicio de sesión  
- **Contraseña**: contraseña  
- **Puerto WEBUI**: 4000  

![Vista de WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Nivel de Registro  
Define la cantidad de información registrada en los logs:  
- **Info**: Muestra información operativa general.  
- **Warning**: Muestra solo advertencias.  
- **Error**: Muestra solo mensajes de error.  
- **Debug**: Muestra detalles adicionales útiles para la resolución de problemas.  

### 6. Nivel de Registro de API  
Define la cantidad de información registrada en los logs:  
- **Info**: Muestra información operativa general.  
- **Warning**: Muestra solo advertencias.  
- **Error**: Muestra solo mensajes de error.  
- **Debug**: Muestra detalles adicionales útiles para la resolución de problemas.  

## Mejores Prácticas  
- **Solo completa los ajustes para las marcas de vehículos que poseas.**  
- **No compartas tus credenciales de inicio de sesión.**  
- **Ajusta el intervalo de actualización para evitar exceder los límites de solicitudes API. Recuerda que el límite parece ser de aproximadamente 1000 req/día**  
- **Usa el nivel de registro "Debug" solo cuando estés resolviendo problemas.**  

---  

Si tienes preguntas o encuentras problemas durante la configuración, consulta la documentación del módulo.  
Si encuentras un error, por favor abre un problema.  