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



# Guia de Configuração do CarConnectivity-Addon

## Introdução

O módulo **CarConnectivity-Addon** permite que você conecte e recupere informações sobre seu veículo a partir dos serviços online de fabricantes compatíveis. Este guia explica como configurar corretamente o módulo.  
Estou simplesmente empacotando o [excelente trabalho feito por Till.](https://github.com/tillsteinbach/CarConnectivity)

Seu trabalho também está disponível como imagens docker. Portanto, se você estiver usando o Home Assistant como um docker autônomo, você pode usá-lo diretamente também.

**⚠️O projeto ainda está em desenvolvimento, com a engenharia reversa da API a ser concluída e a comunicação com MQTT/Home assistant a ser adaptada.⚠️**

## Adicionar repositório

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuração Geral

Preencha apenas as configurações para as marcas de veículos que você possui. **Deixe todos os outros campos em branco.**

### 1. Selecionando a Marca do Seu Veículo
Escolha o fabricante correspondente ao seu veículo entre as marcas suportadas:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**
- **Volvo**

Se você possui vários veículos de marcas diferentes, pode configurar várias seções.

### 2. Conectando-se aos Serviços Online do Fabricante
Cada fabricante de automóveis fornece um serviço online que permite acessar os dados do seu veículo remotamente. Para se conectar, você precisa fornecer suas credenciais de login.

#### Informações Necessárias:
Para Seat, Cupra, Skoda, Volkswagen e Tronity:
- **Marca**: A marca do fabricante.
- **Nome de Usuário**: O endereço de e-mail usado para fazer login no serviço do fabricante.
- **Senha**: A senha da sua conta do fabricante.
- **Código PIN**: Um código de 4 dígitos necessário para acesso remoto a certos recursos do veículo.
- **Intervalo de Atualização**: Define com que frequência (em segundos) os dados do veículo são atualizados.
  - **Aviso:** Definir uma taxa de atualização muito frequente pode exceder os limites de solicitação da API impostos pelo fabricante, resultando em restrições temporárias de acesso.

⚠️ Você pode usar 2 contas para 2 marcas diferentes ou 2 carros da mesma marca que não estão vinculados à mesma conta.

Para volvo:
- **Chave API primária**: Chave API primária da Volvo.
- **Chave API secundária**: Chave API secundária da Volvo.
- **Token do Veículo**: Token de acesso para o veículo.
- **Token de Localização do Veículo**: Token de acesso para o endpoint de localização.
- **Intervalo de Atualização**: Define com que frequência (em segundos) os dados do veículo são atualizados.
  - **Aviso:** Definir uma taxa de atualização muito frequente pode exceder os limites de solicitação da API impostos pelo fabricante, resultando em restrições temporárias de acesso.
  
### 3. Configuração do MQTT (Obrigatório)
Você precisa usar **MQTT** para enviar dados do veículo para o home assistant, configure estas configurações:
- **Nome de Usuário**: Login do broker MQTT
- **Senha**: Senha do broker MQTT
- **Endereço do Broker**: IP ou nome de domínio do servidor MQTT

⚠️ Se você ainda não estiver usando MQTT no Home assistant, pode adicionar, por exemplo, [Mosquito addon E integração MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Você pode visitar http//x.x.x.x:4000 A WEBUI do Carconnectivity:
- **Nome de Usuário**: login
- **Senha**: senha
- **Porta WEBUI**: 4000

### 5. Nível de Registro
Defina a quantidade de informações registradas nos logs:
- **Info**: Exibe informações operacionais gerais.
- **Warning**: Exibe apenas avisos.
- **Error**: Exibe apenas mensagens de erro.
- **Debug**: Exibe detalhes adicionais úteis para solução de problemas.

### 6. Nível de Registro da API
Defina a quantidade de informações registradas nos logs:
- **Info**: Exibe informações operacionais gerais.
- **Warning**: Exibe apenas avisos.
- **Error**: Exibe apenas mensagens de erro.
- **Debug**: Exibe detalhes adicionais úteis para