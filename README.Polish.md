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





![Wspiera architekturę aarch64](https://img.shields.io/badge/aarch64-yes-green.svg)
![Wspiera architekturę amd64](https://img.shields.io/badge/amd64-yes-green.svg)
![Wspiera architekturę armhf](https://img.shields.io/badge/armhf-yes-green.svg)
![Wspiera architekturę armv7](https://img.shields.io/badge/armv7-yes-green.svg)
![Wspiera architekturę i386](https://img.shields.io/badge/i386-yes-green.svg)
[![Kod źródłowy GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)
[![Wydanie GitHub (najnowsze według daty)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)
[![Problemy GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# Wtyczka Home Assistant: CarConnectivity

|         | Stabilna                                                                                                                         | Krawędź                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Wersja | [![Wydanie GitHub (najnowsze według daty)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Wersja obrazu Docker (najnowszy semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |


# Przewodnik konfiguracyjny CarConnectivity-Addon

## Wprowadzenie

Moduł **CarConnectivity-Addon** pozwala na połączenie i uzyskanie informacji o pojeździe za pośrednictwem kompatybilnych usług online producentów. Ten przewodnik wyjaśnia, jak prawidłowo skonfigurować moduł. 
Po prostu pakuję [świetną pracę wykonaną przez Tilla.](https://github.com/tillsteinbach/CarConnectivity)

Jego praca jest również dostępna jako obrazy docker. Jeśli używasz Home Assistant jako samodzielnego dockera, możesz go również bezpośrednio użyć.

**⚠️Projekt wciąż jest w fazie rozwoju, w trakcie inżynierii odwrotnej API i dostosowania komunikacji z MQTT/Home assistant.⚠️**


![Połączony samochód jako urządzenie MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)

## Dodaj repozytorium

[![Wtyczka Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Ogólna konfiguracja

Wypełnij tylko ustawienia dla marek pojazdów, które posiadasz. **Pozostaw wszystkie inne pola puste.**

### 1. Wybór marki pojazdu
Wybierz producenta odpowiadającego twojemu pojazdowi z obsługiwanych marek:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**

Jeśli posiadasz wiele pojazdów różnych marek, możesz skonfigurować wiele sekcji.

### 2. Połączenie z usługami online producenta
Każdy producent samochodów oferuje usługi online, które umożliwiają zdalny dostęp do danych pojazdu. Aby się połączyć, musisz podać swoje dane logowania.

#### Wymagane informacje:
- **Marka**: Marka producenta.
- **Nazwa użytkownika**: Adres e-mail używany do logowania się do usługi producenta.
- **Hasło**: Hasło do twojego konta producenta.
- **Kod PIN**: 4-cyfrowy kod wymagany do zdalnego dostępu do niektórych funkcji pojazdu.
- **Interwał odświeżania**: Określa, jak często (w sekundach) aktualizowane są dane pojazdu.
  - **Ostrzeżenie:** Ustawienie zbyt często odświeżania może przekroczyć limity żądań API nałożone przez producenta, co skutkuje czasowymi ograniczeniami dostępu.

⚠️ Możesz używać 2 kont dla 2 różnych marek lub 2 samochodów tej samej marki, które nie są powiązane z tym samym kontem.

### 3. Konfiguracja MQTT (obowiązkowa)
Musisz użyć **MQTT**, aby wysyłać dane pojazdu do home assistant, skonfiguruj te ustawienia:
- **Nazwa użytkownika**: Logowanie do brokera MQTT
- **Hasło**: Hasło brokera MQTT
- **Adres brokera**: IP lub nazwa domeny serwera MQTT

⚠️ Jeśli nie używasz jeszcze MQTT w Home assistant, możesz dodać na przykład [wtyczkę Mosquito I INTEGRACJĘ MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Możesz odwiedzić http//x.x.x.x:4000 WEBUI z Carconnectivity:
- **Nazwa użytkownika**: logowanie
- **Hasło**: hasło
- **Port WEBUI**: 4000

![Widok WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)

### 5. Poziom logowania
Określ ilość informacji rejestrowanych w logach:
- **Info**: Wyświetla ogólne informacje o działaniu.
- **Ostrzeżenie**: Wyświetla tylko ostrzeżenia.
- **Błąd**: Wyświetla tylko komunikaty o błędach.
- **Debug**: Wyświetla dodatkowe szczegóły przydatne do rozwiązywania problemów.

### 6. Poziom logowania API
Określ ilość informacji rejestrowanych w logach:
- **Info**: Wyświetla ogólne informacje o działaniu.
- **Ostrzeżenie**: Wyświetla tylko ostrzeżenia.
- **Błąd**: Wyświetla tylko komunikaty o błędach.
- **Debug**: Wyświetla dodatkowe szczegóły przydatne do rozwiązywania problemów.

### 7. Tryb ekspercki
Tryb ekspercki umożliwia korzystanie ze wszystkich natywnych funkcji Carconnectivity, w tym tych, które nie są dostępne przez interfejs graficzny — pod warunkiem, że odpowiadające funkcje są wspierane przez pliki binarne wtyczki.

⚠️ Ostrzeżenie:
Ten tryb wyłącza wszystkie walidacje treści i kontrole bezpieczeństwa. W rezultacie nawet drobny błąd (np. nieprawidłowa składnia JSON) może uniemożliwić poprawne uruchomienie wtyczki.

Tryb ekspercki jest przeznaczony tylko dla zaawansowanych użytkowników.
Aby korzystać z niego w sposób bezpieczny, musisz:

Być zaznajomionym z składnią i strukturą JSON.

Tryb ekspercki umożliwia korzystanie z własnego pliku konfiguracyjnego. Gdy ten tryb jest włączony, użytkownik może podać plik o nazwie /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json zawierający żądane ustawienia. To całkowicie zastępuje konfigurację z interfejsu graficznego, który będzie dostępny w /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json. Katalog /addon_configs/1b1291d4_carconnectivity-addon/ może nie pojawić się w systemie plików Home Assistant. Jeśli tak się stanie, supervisor powinien zostać uruchomiony ponownie.

Odwołaj się do oficjalnej dokumentacji Carconnectivity, aby zobaczyć listę wspieranych funkcji i oczekiwanych parametrów.

## Najlepsze praktyki
- **Wypełniaj tylko ustawienia dla marek pojazdów, które posiadasz.**
- **Nie dziel się swoimi danymi logowania.**
- **Dostosuj interwał odświeżania, aby uniknąć przekroczenia limitów żądań API. Pamiętaj, limit wydaje się wynosić około 1000 req/dzień.**
- **Używaj poziomu logowania "Debug" tylko podczas rozwiązywania problemów.**

---

Jeśli masz jakiekolwiek pytania lub napotykasz problemy podczas konfiguracji, odwołaj się do dokumentacji modułu.
Jeśli znajdziesz błąd, otwórz zgłoszenie.