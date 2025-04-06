# Przewodnik konfiguracyjny CarConnectivity-Addon

## Wprowadzenie

Moduł **CarConnectivity-Addon** umożliwia połączenie i pobieranie informacji o pojeździe z internetowych usług kompatybilnych producentów. Ten przewodnik wyjaśnia, jak prawidłowo skonfigurować moduł. 
Po prostu pakuję [doskonałą pracę wykonaną przez Tilla.](https://github.com/tillsteinbach/CarConnectivity)

Jego prace są również dostępne jako obrazy dockerowe. Tak więc, jeśli używasz Home Assistant jako samodzielnego dockera, możesz je również bezpośrednio wykorzystać.

**⚠️Projekt jest wciąż w trakcie rozwoju, a proces inżynierii odwrotnej API musi zostać zakończony, a komunikacja z MQTT/Home Assistant musi być dostosowana.⚠️**

## Dodaj repozytorium

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Ogólna konfiguracja

Wypełnij tylko ustawienia dla marek pojazdów, które posiadasz. **Pozostaw wszystkie pozostałe pola puste.**

### 1. Wybór marki pojazdu
Wybierz producenta odpowiadającego twojemu pojazdowi z obsługiwanych marek:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**
- **Volvo**

Jeśli posiadasz wiele pojazdów różnych marek, możesz skonfigurować wiele sekcji.

### 2. Połączenie z internetowymi usługami producenta
Każdy producent samochodów oferuje usługę online, która pozwala na zdalny dostęp do danych pojazdu. Aby się połączyć, musisz podać swoje dane logowania.

#### Wymagane informacje:
Dla Seat, Cupra, Skoda, Volkswagen i Tronity:
- **Marka**: Marka producenta.
- **Nazwa użytkownika**: Adres e-mail używany do logowania się do usługi producenta.
- **Hasło**: Hasło do konta producenta.
- **Kod PIN**: 4-cyfrowy kod wymagany do zdalnego dostępu do niektórych funkcji pojazdu.
- **Interwał odświeżania**: Określa, jak często (w sekundach) aktualizowane są dane pojazdu.
  - **Ostrzeżenie:** Ustawienie zbyt częstego interwału odświeżania może przekroczyć limity żądań API nałożone przez producenta, co skutkuje tymczasowymi ograniczeniami dostępu.

⚠️ Możesz używać 2 kont dla 2 różnych marek lub 2 samochodów tej samej marki, które nie są powiązane z tym samym kontem.

Dla Volvo:
- **Klucz API główny**: Główny klucz API Volvo.
- **Klucz API dodatkowy**: Dodatkowy klucz API Volvo.
- **Token pojazdu**: Token dostępu do pojazdu.
- **Token lokalizacji pojazdu**: Token dostępu do punktu końcowego lokalizacji.
- **Interwał odświeżania**: Określa, jak często (w sekundach) aktualizowane są dane pojazdu.
  - **Ostrzeżenie:** Ustawienie zbyt częstego interwału odświeżania może przekroczyć limity żądań API nałożone przez producenta, co skutkuje tymczasowymi ograniczeniami dostępu.

### 3. Konfiguracja MQTT (obowiązkowa)
Musisz użyć **MQTT**, aby wysłać dane pojazdu do Home Assistant, skonfiguruj te ustawienia:
- **Nazwa użytkownika**: Logowanie do brokera MQTT
- **Hasło**: Hasło brokera MQTT
- **Adres brokera**: Adres IP lub nazwa domeny serwera MQTT

⚠️ Jeśli nie używasz już MQTT w Home Assistant, możesz dodać na przykład [dodatek Mosquito OR ntegrację MQTT](https://www.home-assistant.io/integrations/mqtt)

### 4. WEBUI
Możesz odwiedzić http//x.x.x.x:4000 WEBUI z Carconnectivity:
- **Nazwa użytkownika**: logowanie
- **Hasło**: hasło
- **Port WEBUI**: 4000

### 5. Poziom logowania
Określ ilość informacji rejestrowanych w logach:
- **Info**: Wyświetla ogólne informacje operacyjne.
- **Ostrzeżenie**: Wyświetla tylko ostrzeżenia.
- **Błąd**: Wyświetla tylko komunikaty o błędach.
- **Debug**: Wyświetla dodatkowe szczegóły przydatne w rozwiązywaniu problemów.

### 6. Poziom logowania API
Określ ilość informacji rejestrowanych w logach:
- **Info**: Wyświetla ogólne informacje operacyjne.
- **Ostrzeżenie**: Wyświetla tylko ostrzeżenia.
- **Błąd**: Wyświetla tylko komunikaty o błędach.
- **Debug**: Wyświetla dodatkowe szczegóły przydatne w rozwiązywaniu problemów.

## Najlepsze praktyki
- **Wypełniaj tylko ustawienia dla marek pojazdów, które posiadasz.**
- **Nie udostępniaj swoich danych logowania.**
- **Dostosuj interwał odświeżania, aby uniknąć przekroczenia limitów żądań API. Limity wydają się wynosić około 1000 req/dzień.**
- **Używaj poziomu logowania "Debug" tylko podczas rozwiązywania problemów.**

---

Jeśli masz jakiekolwiek pytania lub napotykasz problemy podczas konfiguracji, zapoznaj się z dokumentacją modułu. 
Jeśli znajdziesz błąd, proszę otworzyć zgłoszenie.