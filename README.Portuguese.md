![Suporta a arquitetura aarch64][aarch64-shield]
![Suporta a arquitetura amd64][amd64-shield]
![Suporta a arquitetura armhf][armhf-shield]
![Suporta a arquitetura armv7][armv7-shield]
![Suporta a arquitetura i386][i386-shield]
[![Código fonte do GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)
[![Lançamento do GitHub (último por data)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)
[![Problemas do GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-sim-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-sim-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-sim-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-sim-green.svg
[i386-shield]: https://img.shields.io/badge/i386-sim-green.svg

# Complemento do Home Assistant: CarConnectivity

|         | Estável                                                                                                                         | Edge                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Versão | [![Lançamento do GitHub (último por data)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Versão da Imagem Docker (última semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# Guias traduzidas

| ![Bandeira Francesa](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png) | ![Bandeira Italiana](https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1280px-Flag_of_Italy.svg.png) | ![Bandeira Alemã](https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/1280px-Flag_of_Germany.svg.png) | ![Bandeira Espanhola](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/1280px-Flag_of_Spain.svg.png) | ![Bandeira Polonesa](https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/1280px-Flag_of_Poland.svg.png) | ![Bandeira Portuguesa](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png) |
|---------|-----------|-----------|-----------|-----------|-----------|
| [README.French.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.French.md) | [README.Italian.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Italian.md) | [README.German.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.German.md) | [README.Spanish.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Spanish.md) | [README.Polish.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Polish.md) | [README.Portuguese.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Portuguese.md) |

## Introdução

O módulo **CarConnectivity-Addon** permite que você conecte e recupere informações sobre seu veículo a partir dos serviços online de fabricantes compatíveis. Este guia explica como configurar corretamente o módulo.  
Estou simplesmente empacotando o [excelente trabalho feito por Till.](https://github.com/tillsteinbach/CarConnectivity)

Seu trabalho também está disponível como imagens docker. Portanto, se você estiver usando o Home Assistant como um docker autônomo, você pode usá-lo diretamente