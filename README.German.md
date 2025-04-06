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



# CarConnectivity-Addon-Konfigurationshandbuch

## Einführung

Das **CarConnectivity-Addon**-Modul ermöglicht es Ihnen, Informationen zu Ihrem Fahrzeug von den Online-Diensten kompatibler Hersteller abzurufen und zu verbinden. Dieses Handbuch erklärt, wie Sie das Modul korrekt konfigurieren. 
Ich verpacke einfach die [ausgezeichnete Arbeit von Till.](https://github.com/tillsteinbach/CarConnectivity)

Seine Arbeit ist auch als Docker-Images verfügbar. Wenn Sie Home Assistant als eigenständigen Docker verwenden, können Sie es ebenfalls direkt nutzen.

**⚠️Das Projekt befindet sich noch in der Entwicklung, die Rückentwicklungsarbeiten an der API müssen noch abgeschlossen werden, und die Kommunikation mit MQTT/Home Assistant muss angepasst werden.⚠️**

## Repository hinzufügen

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Allgemeine Konfiguration

Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen. **Lassen Sie alle anderen Felder leer.**

### 1. Auswahl Ihrer Fahrzeugmarke
Wählen Sie den Hersteller, der Ihrem Fahrzeug entspricht, aus den unterstützten Marken:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**
- **Volvo**

Wenn Sie mehrere Fahrzeuge aus verschiedenen Marken besitzen, können Sie mehrere Abschnitte konfigurieren.

### 2. Verbindung zu den Online-Diensten des Herstellers
Jeder Automobilhersteller bietet einen Online-Dienst an, mit dem Sie aus der Ferne auf die Daten Ihres Fahrzeugs zugreifen können. Um sich zu verbinden, müssen Sie Ihre Anmeldeinformationen angeben.

#### Erforderliche Informationen:
Für Seat, Cupra, Skoda, Volkswagen und Tronity:
- **Marke**: Die Marke des Herstellers.
- **Benutzername**: Die E-Mail-Adresse, die zum Anmelden bei den Diensten des Herstellers verwendet wird.
- **Passwort**: Das Passwort für Ihr Herstellerkonto.
- **PIN-Code**: Ein 4-stelliger Code, der für den Remote-Zugriff auf bestimmte Fahrzeugfunktionen erforderlich ist.
- **Aktualisierungsintervall**: Definiert, wie oft (in Sekunden) die Fahrzeugdaten aktualisiert werden.
  - **Warnung:** Eine zu häufige Einstellung der Aktualisierungsrate kann die von den Herstellern festgelegten API-Anforderungsgrenzen überschreiten, was zu vorübergehenden Zugriffsbeschränkungen führen kann.

⚠️ Sie können 2 Konten für 2 verschiedene Marken oder 2 Autos derselben Marke verwenden, die nicht mit demselben Konto verknüpft sind.

Für Volvo:
- **API-Schlüssel primär**: Primärschlüssel der Volvo-API.
- **API-Schlüssel sekundär**: Sekundärschlüssel der Volvo-API.
- **Fahrzeug-Token**: Zugriffstoken für das Fahrzeug.
- **Fahrzeugstandort-Token**: Zugriffstoken für den Standort-Endpunkt.
- **Aktualisierungsintervall**: Definiert, wie oft (in Sekunden) die Fahrzeugdaten aktualisiert werden.
  - **Warnung:** Eine zu häufige Einstellung der Aktualisierungsrate kann die von den Herstellern festgelegten API-Anforderungsgrenzen überschreiten, was zu vorübergehenden Zugriffsbeschränkungen führen kann.

### 3. MQTT-Konfiguration (Pflicht)
Sie müssen **MQTT** verwenden, um Fahrzeugdaten an Home Assistant zu senden. Konfigurieren Sie diese Einstellungen:
- **Benutzername**: MQTT-Broker-Anmeldung
- **Passwort**: Passwort des MQTT-Brokers
- **Broker-Adresse**: IP oder Domainname des MQTT-Servers

⚠️ Wenn Sie MQTT in Home Assistant noch nicht verwenden, können Sie beispielsweise [Mosquito-Addon UND MQTT-Integration](https://www.home-assistant.io/integrations/mqtt) hinzufügen. 

### 4. WEBUI
Sie können http//x.x.x.x:4000 besuchen. Das WEBUI von Carconnectivity:
- **Benutzername**: anmeldung
- **Passwort**: passwort
- **WEBUI-Port**: 4000

### 5. Protokollierungsstufe
Definieren Sie die Menge an Informationen, die in Logs aufgezeichnet werden:
- **Info**: Zeigt allgemeine Betriebsinformationen an.
- **Warnung**: Zeigt nur Warnungen an.
- **Fehler**: Zeigt nur Fehlermeldungen an.
- **Debug**: Zeigt zusätzliche Details, die für die Fehlersuche nützlich sind.

### 6. API-Protokollierungsstufe
Definieren Sie die Menge an Informationen, die in Logs aufgezeichnet werden:
- **Info**: Zeigt allgemeine Betriebsinformationen an.
- **Warnung**: Zeigt nur Warnungen an.
- **Fehler**: Zeigt nur Fehlermeldungen an.
- **Debug**: Zeigt zusätzliche Details, die für die Fehlersuche nützlich sind.

## Beste Praktiken
- **Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen.**
- **Teilen Sie Ihre Anmeldeinformationen nicht.**
- **Passen Sie das Aktualisierungsintervall an, um sicherzustellen, dass die API-Anforderungsgrenzen nicht überschritten werden. Die Grenze scheint bei ca. 1000 Anfragen/Tag zu liegen.**
- **Verwenden Sie die Protokollierungsstufe "Debug" nur zur Fehlersuche.**

---

Wenn Sie Fragen haben oder während der Konfiguration auf Probleme stoßen, beziehen Sie sich auf die Moduldokumentation. 
Wenn Sie einen Fehler finden, öffnen Sie bitte ein Issue.