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





![Soporta arquitectura aarch64](https://img.shields.io/badge/aarch64-yes-green.svg)
![Soporta arquitectura amd64](https://img.shields.io/badge/amd64-yes-green.svg)
![Soporta arquitectura armhf](https://img.shields.io/badge/armhf-yes-green.svg)
![Soporta arquitectura armv7](https://img.shields.io/badge/armv7-yes-green.svg)
![Soporta arquitectura i386](https://img.shields.io/badge/i386-yes-green.svg)
[![Código fuente de GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)
[![Lanzamiento de GitHub (último por fecha)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)
[![Problemas de GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# Complemento de Home Assistant: CarConnectivity

|         | Estable                                                                                                                         | Edge                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Versión | [![Lanzamiento de GitHub (último por fecha)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Versión de imagen de Docker (último semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |


# Guía de Configuración del Complemento CarConnectivity

## Introducción

El módulo **CarConnectivity-Addon** te permite conectar y recuperar información sobre tu vehículo de los servicios en línea de fabricantes compatibles. Esta guía explica cómo configurar correctamente el módulo.
Simplemente estoy empaquetando el [excelente trabajo realizado por Till.](https://github.com/tillsteinbach/CarConnectivity)

Su trabajo también está disponible como imágenes de docker. Así que si estás usando Home Assistant como un docker independiente, también puedes usarlo directamente.

**⚠️El proyecto aún está en desarrollo, con la ingeniería inversa de la API por completar y la comunicación con MQTT/Home Assistant por adaptar.⚠️**


![Coche conectado como dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)

## Agregar repositorio

[![Complemento Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuración General

Solo completa los ajustes para las marcas de vehículos que posees. **Deja todos los demás campos vacíos.**

### 1. Seleccionando la Marca de Tu Vehículo
Elige el fabricante correspondiente a tu vehículo de las marcas soportadas:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**

Si posees múltiples vehículos de diferentes marcas, puedes configurar múltiples secciones.

### 2. Conectando a los Servicios en Línea del Fabricante
Cada fabricante de automóviles proporciona un servicio en línea que te permite acceder a los datos de tu vehículo de forma remota. Para conectarte, necesitas proporcionar tus credenciales de inicio de sesión.

#### Información Requerida:
- **Marca**: La marca del fabricante.
- **Nombre de usuario**: La dirección de correo electrónico utilizada para iniciar sesión en el servicio del fabricante.
- **Contraseña**: La contraseña de tu cuenta de fabricante.
- **Código PIN**: Un código de 4 dígitos requerido para el acceso remoto a ciertas funciones del vehículo.
- **Intervalo de actualización