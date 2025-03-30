```
![Obsługa architektury aarch64][aarch64-shield]
![Obsługa architektury amd64][amd64-shield]
![Obsługa architektury armhf][armhf-shield]
![Obsługa architektury armv7][armv7-shield]
![Obsługa architektury i386][i386-shield]
[![Kod źródłowy na GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)
[![GitHub release (najnowsza według daty)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)
[![GitHub issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# Dodatek do Home Assistant: CarConnectivity

|         | Stabilna                                                                                                                       | Poglądowa                                                                                                                                     |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Wersja  | [![GitHub release (najnowsza według daty)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |


# Przewodnik konfiguracji dodatku CarConnectivity-Addon

## Wprowadzenie

Moduł **CarConnectivity-Addon** umożliwia podłączenie i uzyskanie informacji o Twoim pojeździe z usług online kompatybilnych producentów. Ten przewodnik wyjaśnia, jak prawidłowo skonfigurować moduł.
Po prostu pakuję [doskonałą pracę wykonaną przez Tilla.](https://github.com/tillsteinbach/CarConnectivity)

Jego prace są również dostępne jako obrazy dockera. Jeżeli używasz Home Assistant jako osobnego dockera, możesz ich użyć bezpośrednio.

**⚠️Projekt jest nadal w fazie rozwoju, z procesem inżynierii wstecznej API do ukończenia oraz dostosowaniem komunikacji z MQTT/Home Assistant.⚠️**


![Podłączony samochód jako urządzenie MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)

## Dodanie repozytorium

[![Dodatek Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Ogólna konfiguracja

Wypełnij ustawienia tylko dla marek pojazdów, które posiadasz. **Pozostaw wszystkie inne pola puste.**

### 1. Wybór marki pojazdu
Wybierz producenta odpowiadającego Twojemu pojazdowi spośród obsługiwanych marek:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**

Jeśli posiadasz wiele pojazdów różnych marek, możesz skonfigurować wiele sekcji.

### 2. Połączenie z usługami online producenta
Każdy producent samochodów udostępnia usługę online, która pozwala na dostęp do danych pojazdu zdalnie. Aby się połączyć, musisz podać swoje dane logowania.

#### Wymagane informacje:
- **Marka**: Marka producenta.
- **Login**: Adres e-mail używany do zalogowania się do usługi producenta.
- **Hasło**: Hasło do konta producenta.
- **Kod PIN**: 4-cyfrowy kod wymagany do zdalnego dostępu do niektórych funkcji pojazdu.
- **Interwał odświeżania**: Określa, jak często (w sekundach) dane pojazdu są aktualizowane.
  - **Ostrzeżenie:** Ustawienie zbyt częstego odświeżania może przekroczyć limity żądań API narzucone przez producenta, co może skutkować tymczasowymi ograniczeniami dostępu.

⚠️ Możesz używać 2 kont dla różnych marek lub 2 samochodów tej samej marki, które nie są powiązane z tym samym kontem.

### 3. Konfiguracja MQTT (obowiązkowa)
Musisz użyć **MQTT**, aby przesyłać dane pojazdu do Home Assistant, skonfiguruj te ustawienia:
- **Login**: Dane logowania do broker MQTT.
- **Hasło**: Hasło do broker MQTT.
- **Adres brokera**: IP lub nazwa domeny serwera MQTT.

⚠️ Jeśli jeszcze nie używasz MQTT na Home Assistant, możesz dodać na przykład [dodatek Mosquito oraz integrację MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Możesz odwiedzić http//x.x.x.x:4000 WEBUI z Carconnectivity:
- **Login**: login
- **Hasło**: hasło
- **Port WEBUI**: 4000

![Widok WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)

### 5. Poziom logowania
Określ ilość informacji zapisywanych w logach:
- **Info**: Wyświetla ogólne informacje operacyjne.
- **Warning**: Wyświetla tylko ostrzeżenia.
- **Error**: Wyświetla tylko komunikaty o błędach.
- **Debug**: Wyświetla dodatkowe szczegóły użyteczne przy rozwiązywaniu problemów.

### 6. Poziom logowania API
Określ ilość informacji zapisywanych w logach:
- **Info**: Wyświetla ogólne informacje operacyjne.
- **Warning**: Wyświetla tylko ostrzeżenia.
- **Error**: Wyświetla tylko komunikaty o błędach.
- **Debug**: Wyświetla dodatkowe szczegóły użyteczne przy rozwiązywaniu problemów.

## Najlepsze praktyki
- **Wypełnij tylko ustawienia dla marek pojazdów, które posiadasz.**
- **Nie udostępniaj swoich danych logowania.**
- **Dostosuj interwał odświeżania, aby uniknąć przekroczenia limitów żądań API. Pamiętaj, że limit wydaje się wynosić około 1000 żądań/dzień.**
- **Używaj poziomu logowania "Debug" tylko podczas rozwiązywania problemów.**

---

Jeśli masz dodatkowe pytania lub napotkasz problemy podczas konfiguracji, odwołaj się do dokumentacji modułu.
Jeśli znajdziesz błąd, otwórz problem.
```