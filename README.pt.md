![Supports aarch64 Architecture][aarch64-shield]![Supports amd64 Architecture][amd64-shield]![Supports armhf Architecture][armhf-shield]![Supports armv7 Architecture][armv7-shield]![Supports i386 Architecture][i386-shield][![GitHub sourcecode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)[![GitHub issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg

[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg

[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg

[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# Adicionamento do Assistente de Casa: Carconnectividade

|        | Estável                                                                                                                                                                                                      | Borda                                                                                                                                                                                                                                                           |
| ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Versão | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# Guias traduzidos

[![French](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/FR.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.fr.md)[![Italian](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/IT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.it.md)[![German](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/DE.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.de.md)[![Spanish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/ES.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.es.md)[![Polish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PL.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pl.md)[![Portuguese](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pt.md)[![English](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/US.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.md)

# Adicionamento do Assistente de Casa: Carconnectividade

## Introdução

O`CarConnectivity-Addon`O módulo permite que você conecte e recupere informações sobre o seu veículo dos serviços on -line dos fabricantes compatíveis. Este guia explica como configurar corretamente o módulo.
Estou simplesmente embalando[O trabalho (excelente) feito por Till.](https://github.com/tillsteinbach/CarConnectivity)

Seu trabalho também está disponível como imagens do Docker. Então, se você está usando o assistente doméstico como um independente`docker`, você também pode usá -lo diretamente.

**⚠️ O projeto ainda está em desenvolvimento,`reverse engineering`da API a ser concluída e comunicação com o MQTT/Home Assistant a ser adaptado.**

## Adicionar repositório

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuração geral

Preencha apenas as configurações para as marcas de veículos que você possui.**Deixe todos os outros campos vazios.**

### 1. Selecionando sua marca de veículo

Escolha o fabricante correspondente ao seu veículo das marcas suportadas:

-   `Seat`
-   `Cupra`
-   `Skoda`
-   `Volkswagen`
-   `Tronity`
-   `Volvo`

Se você possui vários veículos de diferentes marcas, poderá configurar várias seções.

### 2. Conectando -se aos serviços on -line do fabricante

Cada fabricante de automóveis fornece um serviço on -line que permite acessar os dados do seu veículo remotamente. Para se conectar, você precisa fornecer suas credenciais de login.

#### Informações necessárias:

Para`seat`,`Cupra`, Skoda, Volkswagen e Tronity:

-   `Brand`: A marca do fabricante.
-   `Username`: O endereço de e -mail usado para fazer login no serviço do fabricante.
-   `Password`: A senha da sua conta do fabricante.
-   `PIN Code`: Um código de 4 dígitos necessário para o acesso remoto a determinados recursos do veículo.
-   `Refresh Interval`: Define com que frequência (em segundos) os dados do veículo são atualizados.
-   `Warning:`A definição de uma taxa de atualização com muita frequência pode exceder os limites de solicitação da API impostos pelo fabricante, resultando em restrições de acesso temporário.

⚠️ Você pode usar 2 contas para 2 marcas diferentes ou 2 carros da mesma marca que não estão vinculados à mesma conta.

Para Volvo:

-   `API Key primary`: Chave primária da API Volvo.
-   `API Key secondary`: Chave secundária da API Volvo.
-   `Vehicule Token`: Acesse token para o veículo.
-   `Vehicule Location Token`: Acesse token para o terminal de localização.
-   `Refresh Interval`: Define com que frequência (em segundos) os dados do veículo são atualizados.
-   `Warning:`A definição de uma taxa de atualização com muita frequência pode exceder os limites de solicitação da API impostos pelo fabricante, resultando em restrições de acesso temporário.

### 3. Configuração MQTT (obrigatória)

Você precisa usar`MQTT`Para enviar dados de veículos para o Assistente Home, definir estas configurações:

-   `Username`: MQTT Broker Login
-   `Password`: Senha do corretor MQTT
-   `Broker Address`: IP ou nome de domínio do servidor MQTT

⚠️ Se você ainda não está usando o MQTT no assistente doméstico, você pode adicionar, por exemplo,[Mosquito Addon e Integração MQTT](https://www.home-assistant.io/integrations/mqtt)

### 4. Webuii

Você pode visitar http // x.x.x.x: 4000 o webui da carconnectividade:

-   `Username`: Conecte-se
-   `Password`: senha
-   `WEBUI Port`: 4000

### 5. Nível de registro

Defina a quantidade de informações registradas em logs:

-   `Info`: Exibe informações operacionais gerais.
-   `Warning`: Exibe apenas avisos.
-   `Error`: Exibe apenas mensagens de erro.
-   `Debug`: Exibe detalhes adicionais úteis para solução de problemas.

### 6. Nível de registro da API

Defina a quantidade de informações registradas em logs:

-   `Info`: Exibe informações operacionais gerais.
-   `Warning`: Exibe apenas avisos.
-   `Error`: Exibe apenas mensagens de erro.
-   `Debug`: Exibe detalhes adicionais úteis para solução de problemas.

### 7. Modo de especialista

O modo especialista permite o uso de todas as funções nativas da carconnectividade, incluindo aquelas que não estão disponíveis na interface gráfica-desde que as funções correspondentes sejam suportadas pelos binários complementares.

⚠️ Aviso:
Este modo desativa todas as verificações de validação e segurança de conteúdo. Como resultado, mesmo um pequeno erro (como uma sintaxe JSON inválida) pode impedir que o complemento seja lançado corretamente.

Modo de especialista destina -se apenas a usuários avançados.
Para usá -lo com segurança, você deve:

Familiarize -se com a sintaxe e estrutura JSON.

O modo especialista permite o uso de um arquivo de configuração personalizado. Quando este modo está ativado, o usuário pode fornecer um arquivo nomeado`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json`contendo as configurações desejadas. Isso substitui completamente a configuração da interface gráfica, que estará disponível em`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json`. O diretório`/addon_configs/1b1291d4_carconnectivity-addon/`pode não aparecer no sistema de arquivos do Assistant Home. Se for esse o caso, o supervisor deve ser reiniciado.

Consulte a documentação oficial da carconnectividade para obter a lista de funções suportadas e parâmetros esperados.

## Práticas recomendadas

-   **Preencha apenas as configurações das marcas de veículos que você possui.**
-   \***\*Não compartilhe suas credenciais de login. \*\***
-   **Ajuste o intervalo de atualização para evitar exceder os limites da solicitação da API. Lembre -se de que o limite parece ser cerca de 1000 req/dia.**
-   **Use o nível de registro "Debug" somente ao solucionar problemas.**\`\*\*

* * *

Se você tiver alguma dúvida ou encontrar problemas durante a configuração, consulte a documentação do módulo.
Se você encontrar um bug, abra um problema.
