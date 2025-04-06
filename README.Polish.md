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



# Przewodnik konfiguracyjny CarConnectivity-Addon

## Wprowadzenie

Moduł **CarConnectivity-Addon** pozwala na połączenie i uzyskanie informacji o Twoim pojeździe z kompatybilnych usług online producentów. Ten przewodnik wyjaśnia, jak prawidłowo skonfigurować moduł. 
Po prostu pakuję [doskonałą pracę wykonaną przez Tilla.](https://github.com/tillsteinbach/CarConnectivity)

Jego praca jest również dostępna jako obrazy docker. Więc jeśli używasz Home Assistant jako samodzielnego dockera, możesz go również bezpośrednio używać.

**⚠️ Projekt jest nadal w fazie rozwoju, z inżynierią odwrotną API do ukończenia i komunikacją z MQTT/Home Assistant do dostosowania.⚠️**

## Dodaj repozytorium

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Ogólna konfiguracja

Wypełnij tylko ustawienia dla marek pojazdów, które posiadasz. **Pozostaw wszystkie inne pola puste.**

### 1. Wybór marki pojazdu
Wybierz producenta odpowiadającego Twojemu pojazdowi z obsługiwanych marek:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**
- **Volvo**

Jeśli posiadasz wiele pojazdów różnych marek, możesz skonfigurować wiele sekcji.

### 2. Połączenie z usługami online producenta
Każdy producent samochodów oferuje usługę online, która pozwala na zdalny dostęp do danych Twojego pojazdu. Aby się połączyć, musisz podać swoje dane logowania.

#### Wymagane informacje:
Dla Seat, Cupra, Skoda, Volkswagen i Tronity:
- **Marka**: Marka producenta.
- **Nazwa użytkownika**: Adres e-mail używany do logowania się do usługi producenta.
- **Hasło**: Hasło do Twojego konta producenta.
- **Kod PIN**: 4-cyfrowy kod wymagany do zdalnego dostępu do niektórych funkcji pojazdu.
- **Interwał odświeżania**: Określa, jak często (w sekundach) dane pojazdu są aktualizowane.
  - **Ostrzeżenie:** Ustawienie zbyt częstego interwału odświeżania może przekroczyć limity żądań API nałożone przez producenta, co skutkuje tymczasowymi ograniczeniami dostępu.

⚠️ Możesz używać 2 kont dla 2 różnych marek lub 2 samochodów tej samej marki, które nie są powiązane z tym samym kontem.

Dla Volvo:
- **Klucz API główny**: Główny klucz API Volvo.
- **Klucz API pomocniczy**: Pomocniczy klucz API Volvo.
- **Token pojazdu**: Token dostępu do pojazdu.
- **Token lokalizacji pojazdu**: Token dostępu do punktu końcowego lokalizacji.
- **Interwał odświeżania**: Określa, jak często (w sekundach) dane pojazdu są aktualizowane.
  - **Ostrzeżenie:** Ustawienie zbyt częstego interwału odświeżania może przekroczyć limity żądań API nałożone przez producenta, co skutkuje tymczasowymi ograniczeniami dostępu.

### 3. Konfiguracja MQTT (Obowiązkowa)
Musisz używać **MQTT** do wysyłania danych pojazdu do Home Assistant, skonfiguruj te ustawienia:
- **Nazwa użytkownika**: Logowanie do brokera MQTT
- **Hasło**: Hasło brokera MQTT
- **Adres brokera**: IP lub nazwa domeny serwera MQTT

⚠️ Jeśli nie używasz już MQTT w Home Assistant, możesz dodać, na przykład, [dodatek Mosquito ORAZ integrację MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Możesz odwiedzić http//x.x.x