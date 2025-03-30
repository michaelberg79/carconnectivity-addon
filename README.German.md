![Unterstützt aarch64 Architektur][aarch64-shield]  
![Unterstützt amd64 Architektur][amd64-shield]  
![Unterstützt armhf Architektur][armhf-shield]  
![Unterstützt armv7 Architektur][armv7-shield]  
![Unterstützt i386 Architektur][i386-shield]  
[![GitHub Quellcode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![GitHub Veröffentlichung (neueste nach Datum)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![GitHub Probleme](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Home Assistant Add-on: CarConnectivity  

|         | Stabil                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![GitHub Veröffentlichung (neueste nach Datum)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Bildversion (neueste semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# CarConnectivity-Addon Konfigurationsanleitung  

## Einführung  

Das **CarConnectivity-Addon** Modul ermöglicht es Ihnen, Informationen über Ihr Fahrzeug von kompatiblen Herstellern online abzurufen. Diese Anleitung erklärt, wie Sie das Modul richtig konfigurieren.  
Ich verpacke einfach die [ausgezeichnete Arbeit von Till.](https://github.com/tillsteinbach/CarConnectivity)  

Seine Arbeit ist auch als Docker-Images verfügbar. Wenn Sie Home Assistant als eigenständigen Docker verwenden, können Sie es auch direkt verwenden.  

**⚠️Das Projekt befindet sich noch in der Entwicklung, die Rückentwicklung der API muss abgeschlossen werden und die Kommunikation mit MQTT/Home Assistant muss angepasst werden.⚠️**  

![Verbundenes Auto als MQTT-Gerät](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Repository hinzufügen  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Allgemeine Konfiguration  

Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen. **Lassen Sie alle anderen Felder leer.**  

### 1. Auswahl Ihrer Fahrzeugmarke  
Wählen Sie den Hersteller, der Ihrem Fahrzeug aus den unterstützten Marken entspricht:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Wenn Sie mehrere Fahrzeuge verschiedener Marken besitzen, können Sie mehrere Abschnitte konfigurieren.  

### 2. Verbindung zu den Online-Diensten des Herstellers  
Jeder Automobilhersteller bietet einen Online-Service an, der es Ihnen ermöglicht, auf die Daten Ihres Fahrzeugs aus der Ferne zuzugreifen. Um eine Verbindung herzustellen, müssen Sie Ihre Anmeldeinformationen angeben.  

#### Erforderliche Informationen:  
- **Marke**: Die Marke des Herstellers.  
- **Benutzername**: Die E-Mail-Adresse, die zum Anmelden beim Service des Herstellers verwendet wird.  
- **Passwort**: Das Passwort für Ihr Herstellerkonto.  
- **PIN-Code**: Ein 4-stelliger Code, der für den Fernzugriff auf bestimmte Fahrzeugfunktionen erforderlich ist.  
- **Aktualisierungsintervall**: Definiert, wie oft (in Sekunden