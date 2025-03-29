![Unterstützt aarch64 Architektur][aarch64-shield]  
![Unterstützt amd64 Architektur][amd64-shield]  
![Unterstützt armhf Architektur][armhf-shield]  
![Unterstützt armv7 Architektur][armv7-shield]  
![Unterstützt i386 Architektur][i386-shield]  
[![GitHub Quellcode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![GitHub Version (neueste nach Datum)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![GitHub Issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Home Assistant Add-on: CarConnectivity  

|         | Stabil                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![GitHub Version (neueste nach Datum)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Bild Version (neueste Semantik)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# CarConnectivity-Addon Konfigurationsanleitung  

## Einleitung  

Das Modul **CarConnectivity-Addon** ermöglicht die Verbindung und Abruf von Informationen über Ihr Fahrzeug aus kompatiblen Online-Diensten der Hersteller. Diese Anleitung erklärt, wie das Modul richtig konfiguriert wird.  
Ich stelle lediglich die [hervorragende Arbeit von Till](https://github.com/tillsteinbach/CarConnectivity) bereit.  

Seine Arbeit ist ebenfalls als Docker-Bilder verfügbar. Wenn Sie Home Assistant als eigenständigen Docker nutzen, können Sie diese direkt verwenden.

**⚠️Das Projekt befindet sich noch in der Entwicklung, mit Reverse Engineering der API und Anpassung der Kommunikation mit MQTT/Home Assistant.⚠️**

![Verbundenes Auto als MQTT-Gerät](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Repository hinzufügen  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Allgemeine Konfiguration  

Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen. **Lassen Sie alle anderen Felder leer.**  

### 1. Auswahl der Fahrzeugmarke  
Wählen Sie den Hersteller, der Ihrem Fahrzeug entspricht, aus den unterstützten Marken:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Falls Sie mehrere Fahrzeuge von verschiedenen Marken besitzen, können Sie mehrere Abschnitte konfigurieren.  

### 2. Verbindung zu den Online-Diensten des Herstellers  
Jeder Autohersteller bietet einen Online-Dienst, über den Sie auf die Daten Ihres Fahrzeugs zugreifen können. Um eine Verbindung herzustellen, müssen Sie Ihre Zugangsdaten bereitstellen.  

#### Erforderliche Informationen:  
- **Marke**: Marke des Herstellers.  
- **Benutzername**: Die E-Mail-Adresse, die zum Einloggen bei dem Dienst verwendet wird.  
- **Passwort**: Das Passwort für Ihr Herstellerkonto.  
- **PIN-Code**: Ein 4-stelliger Code für den Fernzugriff auf bestimmte Fahrzeugfunktionen.  
- **Aktualisierungsintervall**: Legt fest, wie oft (in Sekunden) die Fahrzeugdaten aktualisiert werden.  
  - **Warnung:** Ein zu häufiges Aktualisierungsintervall kann die API-Anfragelimits des Herstellers überschreiten und zu vorübergehenden Zugriffsrestriktionen führen.  

⚠️ Sie können 2 Konten für 2 verschiedene Marken oder 2 Autos derselben Marke verwenden, die nicht mit demselben Konto verknüpft sind.  

### 3. MQTT-Konfiguration (obligatorisch)  
Sie müssen **MQTT** verwenden, um Fahrzeugdaten an Home Assistant zu senden. Konfigurieren Sie folgende Einstellungen:  
- **Benutzername**: MQTT-Broker-Login  
- **Passwort**: MQTT-Broker-Passwort  
- **Broker-Adresse**: IP-Adresse oder Domänenname des MQTT-Servers  

⚠️ Falls Sie noch kein MQTT in Home Assistant verwenden, können Sie z. B. [Mosquito-Addon UND MQTT-Integration](https://www.home-assistant.io/integrations/mqtt) hinzufügen.  

### 4. WEBUI  
Sie können die WEBUI von CarConnectivity unter http://x.x.x.x:4000 besuchen:  
- **Benutzername**: Login  
- **Passwort**: Passwort  
- **WEBUI-Port**: 4000  

![WEBUI Ansicht](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Logging-Level  
Legen Sie fest, wie viele Informationen in Logs aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warnung**: Zeigt nur Warnmeldungen an.  
- **Fehler**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details zur Fehlersuche an.  

### 6. API-Logging-Level  
Legen Sie fest, wie viele Informationen in Logs aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warnung**: Zeigt nur Warnmeldungen an.  
- **Fehler**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details zur Fehlersuche an.  

## Beste Praktiken  
- **Füllen Sie nur Einstellungen für die Fahrzeugmarken aus, die Sie besitzen.**  
- **Teilen Sie Ihre Zugangsdaten nicht mit anderen.**  
- **Passen Sie das Aktualisierungsintervall an, um API-Anfragelimits zu vermeiden. Begrenzung scheint etwa 1000 Anfragen/Tag zu sein.**  
- **Verwenden Sie das "Debug"-Logging-Level nur zur Fehlersuche.**  

---

Falls Sie Fragen haben oder auf Probleme während der Konfiguration stoßen, konsultieren Sie die Dokumentation des Moduls.  
Falls Sie einen Fehler finden, öffnen Sie bitte ein Issue.