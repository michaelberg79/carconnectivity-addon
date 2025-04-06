![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]
[![GitHub sourcecode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)
[![GitHub issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# Home Assistant Add-on: CarConnectivity

|         | Stable                                                                                                                         | Edge                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Version | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# Translated guides

<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.French.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Italian.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1280px-Flag_of_Italy.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.German.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/1280px-Flag_of_Germany.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Spanish.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/1280px-Flag_of_Spain.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Polish.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/1280px-Flag_of_Poland.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Portuguese.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.md"><img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg" width="40" height="30"></a>



# Guía de Configuración del Complemento CarConnectivity

## Introducción

El módulo **CarConnectivity-Addon** te permite conectar y recuperar información sobre tu vehículo de los servicios en línea de fabricantes compatibles. Esta guía explica cómo configurar correctamente el módulo.
Simplemente estoy empaquetando el [excelente trabajo realizado por Till.](https://github.com/tillsteinbach/CarConnectivity)

Su trabajo también está disponible como imágenes de docker. Así que si estás usando Home Assistant como un docker independiente, también puedes usarlo directamente.

**⚠️El proyecto aún está en desarrollo, con la ingeniería inversa de la API por completar y la comunicación con MQTT/Home assistant por adaptar.⚠️**

## Agregar repositorio

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuración General

Solo completa los ajustes para las marcas de vehículos que posees. **Deja todos los demás campos vacíos.**

### 1. Seleccionando la Marca de Tu Vehículo
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
  - **Advertencia:** Configurar una tasa de actualización demasiado frecuente puede exceder los límites de solicitudes de API impuestos por el fabricante, resultando en restricciones de acceso temporales.

⚠️ Puedes usar 2 cuentas para 2 marcas diferentes o 2 coches de la misma marca que no estén vinculados a la misma cuenta.

Para volvo:
- **API Key primaria**: Clave API primaria de Volvo.
- **API Key secundaria**: Clave API secundaria de Volvo.
- **Token del Vehículo**: Token de acceso para el vehículo.
- **Token de Ubicación del Vehículo**: Token de acceso para el endpoint de ubicación.
- **Intervalo de actualización**: Define con qué frecuencia (en segundos) se actualizan los datos del vehículo.
  - **Advertencia:** Configurar una tasa de actualización demasiado frecuente puede exceder los límites de solicitudes de API impuestos por el fabricante, resultando en restricciones de acceso temporales.
  
### 3. Configuración de MQTT (Obligatoria)
Necesitas usar **MQTT** para enviar datos del vehículo a home assistant, configura estos ajustes:
- **Nombre de usuario**: Inicio de sesión del broker MQTT
- **Contraseña**: Contraseña del broker MQTT
- **Dirección del Broker**: IP o nombre de dominio del servidor MQTT

⚠️ Si aún no estás usando MQTT en Home assistant, puedes agregar, por ejemplo, [Mosquito addon Y la integración de MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Puedes visitar http//x.x.x.x:4000 La WEBUI de Carconnectivity:
- **Nombre de usuario**: login
- **Contraseña**: password
- **Puerto WEBUI**: 4000

### 5. Nivel de Registro
Define la cantidad de información registrada en los logs:
- **Info**: Muestra información operativa general.
- **Advertencia**: Muestra solo advertencias.
- **Error**: Muestra solo mensajes de error.
- **Depuración**: Muestra detalles adicionales útiles para la solución de problemas.

### 6. Nivel de Registro de API
Define la cantidad de información registrada en los logs:
- **Info**: Muestra información operativa general.
- **Advertencia**: Muestra solo advertencias.
- **Error**: Muestra solo mensajes de error.
- **Depuración**: Muestra detalles adicionales útiles para la solución de problemas.

## Mejores Prácticas
- **Solo completa los