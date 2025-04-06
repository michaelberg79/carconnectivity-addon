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





![Suporta a arquitetura aarch64][aarch64-shield]
![Suporta a arquitetura amd64][amd64-shield]
![Suporta a arquitetura armhf][armhf-shield]
![Suporta a arquitetura armv7][armv7-shield]
![Suporta a arquitetura i386][i386-shield]
[![Código fonte do GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)
[![Lançamento do GitHub (último por data)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)
[![Problemas do GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-sim-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-sim-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-sim-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-sim-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-sim-yes-green.svg

# Complemento do Home Assistant: CarConnectivity

|         | Estável                                                                                                                         | Edge                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Versão | [![Lançamento do GitHub (último por data)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Versão da Imagem Docker (última semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |


# Guia de Configuração do CarConnectivity-Addon

## Introdução

O módulo **CarConnectivity-Addon** permite que você conecte e recupere informações sobre seu veículo a partir dos serviços online de fabricantes compatíveis. Este guia explica como configurar corretamente o módulo.
Estou simplesmente empacotando o [excelente trabalho feito por Till.](https://github.com/tillsteinbach/CarConnectivity)

Seu trabalho também está disponível como imagens docker. Portanto, se você estiver usando o Home Assistant como um docker autônomo, você pode usá-lo diretamente também.

**⚠️O projeto ainda está em desenvolvimento, com a engenharia reversa da API a ser concluída e a comunicação com MQTT/Home assistant a ser adaptada.⚠️**


![Carro conectado como dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)

## Adicionar repositório

[![Complemento Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuração Geral

Preencha apenas as configurações para as marcas de veículos que você possui. **Deixe todos os outros campos em branco.**

### 1. Selecionando a Marca do Seu Veículo
Escolha o fabricante correspondente ao seu veículo entre as marcas suportadas:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**

Se você possui vários veículos de marcas diferentes, pode configurar várias seções.

### 2. Conectando-se aos Serviços Online do Fabricante
Cada fabricante de automóveis fornece um serviço online que permite acessar os dados do seu veículo remotamente. Para se conectar, você precisa fornecer suas credenciais de login.

#### Informações Necessárias:
- **Marca**: A marca do fabricante.
- **Nome de Usuário**: O endereço de e-mail usado para fazer login no serviço do fabricante.
- **Senha**: A senha da sua conta do fabricante.
- **Código PIN**: Um código de 4 dígitos necessário para acesso remoto a certos recursos do veículo.
- **Intervalo de Atualização**: Define com que frequência (em segundos) os dados do veículo são atualizados.
  - **Aviso:** Definir uma taxa de atualização muito