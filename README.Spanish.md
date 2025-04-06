![Soporta arquitectura aarch64][aarch64-shield]  
![Soporta arquitectura amd64][amd64-shield]  
![Soporta arquitectura armhf][armhf-shield]  
![Soporta arquitectura armv7][armv7-shield]  
![Soporta arquitectura i386][i386-shield]  
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

# Guías traducidas  

| ![Bandera Francesa](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png) | ![Bandera Italiana](https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1280px-Flag_of_Italy.svg.png) | ![Bandera Alemana](https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/1280px-Flag_of_Germany.svg.png) | ![Bandera Española](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/1280px-Flag_of_Spain.svg.png) | ![Bandera Polaca](https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/1280px-Flag_of_Poland.svg.png) | ![Bandera Portuguesa](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png) |  
|---------|-----------|-----------|-----------|-----------|-----------|  
| [README.French.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.French.md) | [README.Italian.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Italian.md) | [README.German.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.German.md) | [README.Spanish.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Spanish.md) | [README.Polish.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Polish.md) | [README.Portuguese.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Portuguese.md) |  

## Introducción  

El módulo **CarConnectivity-Addon** te permite conectar y recuperar información sobre tu vehículo de los servicios en línea de fabricantes compatibles. Esta guía explica cómo configurar correctamente el módulo.  
Simplemente estoy empaquetando el [excelente trabajo realizado por Till.](https://github.com/tillsteinbach/CarConnectivity)  

Su trabajo también está disponible como imágenes de docker. Así que si estás usando Home Assistant como un docker independiente, también puedes usarlo directamente.  

**⚠️