![Supports aarch64 Architecture][aarch64-shield]![Supports amd64 Architecture][amd64-shield]![Supports armhf Architecture][armhf-shield]![Supports armv7 Architecture][armv7-shield]![Supports i386 Architecture][i386-shield][![GitHub sourcecode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)[![GitHub issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg

[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg

[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg

[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# Anexo de asistente de inicio: Carconnectividad

|         | Estable                                                                                                                                                                                                      | Borde                                                                                                                                                                                                                                                           |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Versión | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# Guías traducidas

[![French](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/FR.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.fr.md)[![Italian](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/IT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.it.md)[![German](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/DE.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.de.md)[![Spanish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/ES.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.es.md)[![Polish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PL.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pl.md)[![Portuguese](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pt.md)[![English](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/US.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.md)

# Anexo de asistente de inicio: Carconnectividad

## Introducción

El`CarConnectivity-Addon`El módulo le permite conectar y recuperar información sobre su vehículo de los servicios en línea de los fabricantes compatibles. Esta guía explica cómo configurar correctamente el módulo.
Simplemente estoy empaquetando[El trabajo (excelente) realizado por Till.](https://github.com/tillsteinbach/CarConnectivity)

Su trabajo también está disponible como imágenes de Docker. Entonces, si estás usando el asistente de casa como independiente`docker`, también puedes usarlo directamente.

**⚠️ El proyecto todavía está en desarrollo,`reverse engineering`de la API que se completará y la comunicación con MQTT/Asistente de inicio para ser adaptado.**

## Agregar repositorio

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuración general

Solo complete la configuración de las marcas de vehículos que posee.**Deje todos los demás campos vacíos.**

### 1. Seleccionar la marca de su vehículo

Elija el fabricante correspondiente a su vehículo de las marcas compatibles:

-   `Seat`
-   `Cupra`
-   `Skoda`
-   `Volkswagen`
-   `Tronity`
-   `Volvo`

Si posee múltiples vehículos de diferentes marcas, puede configurar varias secciones.

### 2. Conexión con los servicios en línea del fabricante

Cada fabricante de automóviles proporciona un servicio en línea que le permite acceder a los datos de su vehículo de forma remota. Para conectarse, debe proporcionar sus credenciales de inicio de sesión.

#### Información requerida:

Para`seat`,`Cupra`, Skoda, Volkswagen y Tronity:

-   `Brand`: La marca del fabricante.
-   `Username`: La dirección de correo electrónico utilizada para iniciar sesión en el servicio del fabricante.
-   `Password`: La contraseña para su cuenta de fabricante.
-   `PIN Code`: Un código de 4 dígitos requerido para el acceso remoto a ciertas características del vehículo.
-   `Refresh Interval`: Define con qué frecuencia (en segundos) se actualizan los datos del vehículo.
-   `Warning:`Establecer una velocidad de actualización con demasiada frecuencia puede exceder los límites de solicitud de API impuestos por el fabricante, lo que resulta en restricciones de acceso temporales.

⚠️ Puede usar 2 cuentas para 2 marcas diferentes o 2 autos de una misma marca que no están vinculadas a la misma cuenta.

Para Volvo:

-   `API Key primary`: Volvo API primary key.
-   `API Key secondary`: Clave secundaria Volvo API.
-   `Vehicule Token`: Token de acceso para el vehículo.
-   `Vehicule Location Token`: Token de acceso para el punto final de ubicación.
-   `Refresh Interval`: Define con qué frecuencia (en segundos) se actualizan los datos del vehículo.
-   `Warning:`Establecer una velocidad de actualización con demasiada frecuencia puede exceder los límites de solicitud de API impuestos por el fabricante, lo que resulta en restricciones de acceso temporales.

### 3. Configuración MQTT (obligatoria)

Necesitas usar`MQTT`Para enviar datos del vehículo al asistente de inicio, configure estos ajustes:

-   `Username`: MQTT Broker Iniciar sesión
-   `Password`: Contraseña de mqtt corredor
-   `Broker Address`: IP o nombre de dominio del servidor MQTT

⚠️ Si aún no está usando MQTT en Home Assistant, puede agregar, por ejemplo,[Mosquito complemento e integración MQTT](https://www.home-assistant.io/integrations/mqtt)

### 4. Webuii

Puede visitar http // x.x.x.x: 4000 la webui de la carconnectividad:

-   `Username`: acceso
-   `Password`: contraseña
-   `WEBUI Port`: 4000

### 5. Nivel de registro

Defina la cantidad de información registrada en los registros:

-   `Info`: Muestra información operativa general.
-   `Warning`: Muestra solo advertencias.
-   `Error`: Muestra solo mensajes de error.
-   `Debug`: Muestra detalles adicionales útiles para solucionar problemas.

### 6. Nivel de registro de API

Defina la cantidad de información registrada en los registros:

-   `Info`: Muestra información operativa general.
-   `Warning`: Muestra solo advertencias.
-   `Error`: Muestra solo mensajes de error.
-   `Debug`: Muestra detalles adicionales útiles para solucionar problemas.

### 7. Modo experto

El modo experto permite el uso de todas las funciones de carconectividad nativa, incluidas las que no están disponibles a través de la interfaz gráfica, siempre que las funciones correspondientes son compatibles con los binarios complementarios.

⚠️ ADVERTENCIA:
Este modo deshabilita todas las verificaciones de validación y seguridad de contenido. Como resultado, incluso un pequeño error (como una sintaxis JSON inválida) puede evitar que el complemento se inicie correctamente.

El modo experto está destinado solo a usuarios avanzados.
Para usarlo de manera segura, debe:

Estar familiarizado con la sintaxis y la estructura JSON.

El modo experto permite el uso de un archivo de configuración personalizado. Cuando este modo está habilitado, el usuario puede proporcionar un archivo llamado`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json`que contiene la configuración deseada. Esto reemplaza completamente la configuración de la interfaz gráfica, que estará disponible en`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json`. El directorio`/addon_configs/1b1291d4_carconnectivity-addon/`puede no aparecer en el sistema de archivos del asistente de inicio. Si este es el caso, el supervisor debe reiniciarse.

Consulte la documentación oficial de la carconectividad para obtener la lista de funciones compatibles y parámetros esperados.

## Mejores prácticas

-   **Solo complete la configuración de las marcas de vehículos que posee.**
-   \***\*No comparta sus credenciales de inicio de sesión. \*\***
-   **Ajuste el intervalo de actualización para evitar exceder los límites de solicitud de API. Recuerde que el límite parece ser de aproximadamente 1000 req/día.**
-   **Use el nivel de registro de "depuración" solo cuando resuelva problemas.**\`\*\*

* * *

Si tiene alguna pregunta o problema de encuentro durante la configuración, consulte la documentación del módulo.
Si encuentra un error, abra un problema.
