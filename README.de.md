![Supports aarch64 Architecture][aarch64-shield]![Supports amd64 Architecture][amd64-shield]![Supports armhf Architecture][armhf-shield]![Supports armv7 Architecture][armv7-shield]![Supports i386 Architecture][i386-shield][![GitHub sourcecode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)[![GitHub issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg

[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg

[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg

[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# `Home Assistant Add-on: CarConnectivity`

|         | `Stable`                                                                                                                                                                                                     | `Edge`                                                                                                                                                                                                                                                          |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# Übersetzte Führer

[![French](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/FR.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.fr.md)[![Italian](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/IT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.it.md)[![German](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/DE.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.de.md)[![Spanish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/ES.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.es.md)[![Polish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PL.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pl.md)[![Portuguese](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pt.md)[![English](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/US.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.md)

## Einführung

`CarConnectivity-Addon`Ermöglicht die Verbindung und Abruf von Informationen über Ihr Fahrzeug von den Online -Diensten der kompatiblen Hersteller. In diesem Handbuch wird erläutert, wie das Modul ordnungsgemäß konfiguriert wird.
Ich verpackt einfach[Die Arbeit (ausgezeichnet) von Till.](https://github.com/tillsteinbach/CarConnectivity)

Seine Arbeiten sind auch als Docker -Bilder verfügbar. Also, wenn Sie verwenden`Home Assistant`als eigenständiger`docker`Sie können es auch direkt verwenden.

**⚠️Das Projekt befindet sich noch in der Entwicklung,`reverse engineering`der API, die fertiggestellt werden soll und die Kommunikation mit MQTT/Home Assistant angepasst wird.**

## Repository hinzufügen

[![\`Addon Home Assistant\`](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

![image](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)

## Allgemeine Konfiguration

Füllen Sie nur die Einstellungen für die Marken von Fahrzeugen aus, die Sie besitzen.**Lassen Sie alle anderen Felder leer.**

### 1. Wählen Sie Ihre Fahrzeugmarke aus

Wählen Sie den Hersteller aus, der Ihrem Fahrzeug aus den unterstützten Marken entspricht:

-   `Seat`
-   `Cupra`
-   `Skoda`
-   `Volkswagen`
-   `Tronity`
-   `Volvo`

Wenn Sie mehrere Fahrzeuge aus verschiedenen Marken besitzen, können Sie mehrere Abschnitte konfigurieren.

### 2.. Verbinden Sie sich mit den Online -Diensten des Herstellers

Jeder Autohersteller bietet einen Online -Service an, mit dem Sie die Daten Ihres Fahrzeugs remote zugreifen können. Um eine Verbindung herzustellen, müssen Sie Ihre Anmeldeinformationen angeben.

#### Erforderliche Informationen:

Für`seat`,`Cupra`, Skoda, Volkswagen and Tronity:

-   `Brand`: Die Marke des Herstellers.
-   `Username`: Die E -Mail -Adresse, mit der sich der Herstellerdienst angemeldet hat.
-   `Password`: Das Passwort für Ihr Herstellerkonto.
-   `PIN Code`: Ein 4-stelliger Code, der für den Fernzugriff auf bestimmte Fahrzeugmerkmale erforderlich ist.
-   `Refresh Interval`: Definiert, wie oft (in Sekunden) die Daten des Fahrzeugs aktualisiert werden.
-   `Warning:`Das zu häufiges Einstellen einer Aktualisierungsrate kann die vom Hersteller auferlegten API -Anforderungsgrenzen überschreiten, was zu temporären Zugriffsbeschränkungen führt.

⚠️ Sie können 2 Konten für 2 verschiedene Marken oder 2 Autos derselben Marke verwenden, die nicht mit demselben Konto verbunden sind.

Für Volvo:

-   `API Key primary`: Volvo API Primärschlüssel.
-   `API Key secondary`: Volvo API Sekundärschlüssel.
-   `Vehicule Token`: Zugang zu Token für das Fahrzeug.
-   `Vehicule Location Token`: Zugang zu Token für den Standortendpunkt.
-   `Refresh Interval`: Definiert, wie oft (in Sekunden) die Daten des Fahrzeugs aktualisiert werden.
-   `Warning:`Das zu häufiges Einstellen einer Aktualisierungsrate kann die vom Hersteller auferlegten API -Anforderungsgrenzen überschreiten, was zu temporären Zugriffsbeschränkungen führt.

### 3.. MQTT -Konfiguration (obligatorisch)

Sie müssen verwenden`MQTT`Fahrzeugdaten an senden an`Home Assistant`Konfigurieren Sie diese Einstellungen:

-   `Username`: MQTT Broker Login
-   `Password`: MQTT Broker Passwort
-   `Broker Address`: IP- oder Domänenname des MQTT -Servers

⚠️ Wenn Sie MQTT noch nicht verwenden`Home Assistant`Sie können zum Beispiel hinzufügen,[`Mosquito Addon`Und`MQTT integration`](https://www.home-assistant.io/integrations/mqtt)

### 4.`WEBUI`

Sie können auf das Original zugreifen`WEBUI`Aus "Carconnektivität mit Eindringen von Home Assistant.
Sie können Ihre eigenen Zugriffsanmeldeinformationen definieren:

-   `Username`: Login
-   `Password`: Passwort

![image](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui.png)

### 5. Protokollierungsstufe

Definieren Sie die Menge an Informationen, die in Protokollen aufgezeichnet wurden:

-   `Info`: Zeigt allgemeine Betriebsinformationen an.
-   `Warning`: Zeigt nur Warnungen an.
-   `Error`: Zeigt nur Fehlermeldungen an.
-   `Debug`: Zeigt zusätzliche Details an, die für die Fehlerbehebung nützlich sind.

### 6. API -Protokollierungsstufe

Definieren Sie die Menge an Informationen, die in Protokollen aufgezeichnet wurden:

-   `Info`: Zeigt allgemeine Betriebsinformationen an.
-   `Warning`: Zeigt nur Warnungen an.
-   `Error`: Zeigt nur Fehlermeldungen an.
-   `Debug`: Zeigt zusätzliche Details an, die für die Fehlerbehebung nützlich sind.

### 7. Expertenmodus

Der Expertenmodus ermöglicht die Verwendung aller nativen Carconnektivitätsfunktionen, einschließlich derer, die nicht über die grafische Schnittstelle verfügbar sind-solange die entsprechenden Funktionen durch die Add-On-Binärdateien unterstützt werden.

⚠️ Warnung:
Dieser Modus deaktiviert alle Inhaltsvalidierung und Sicherheitskontrollen. Infolgedessen kann selbst ein kleiner Fehler (z. B. eine ungültige JSON-Syntax) verhindern, dass das Add-On korrekt startet.

Der Expertenmodus ist nur für fortgeschrittene Benutzer gedacht.
Um es sicher zu verwenden, müssen Sie:

Seien Sie mit der JSON -Syntax und der Struktur vertraut.

Der Expertenmodus ermöglicht die Verwendung einer benutzerdefinierten Konfigurationsdatei. Wenn dieser Modus aktiviert ist, kann der Benutzer eine mit dem Namen namens Datei bereitstellen`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json`enthält die gewünschten Einstellungen. Dies ersetzt die Konfiguration vollständig aus der grafischen Schnittstelle, die in verfügbar ist`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json`. Das Verzeichnis`/addon_configs/1b1291d4_carconnectivity-addon/`kann nicht in der erscheinen`Home Assistant`Dateisystem. Wenn dies der Fall ist, sollte der Vorgesetzte neu gestartet werden.

In der offiziellen Dokumentation von Carconnectivity finden Sie die Liste der unterstützten Funktionen und erwarteten Parameter.

## Best Practices

-   **Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen.**
-   \***\*Teilen Sie Ihre Login -Anmeldeinformationen nicht. \*\***
-   **Passen Sie das Aktualisierungsintervall an, um die Überschreitung von API -Anforderungsgrenzen zu vermeiden. Denken Sie daran, die Grenze scheint ungefähr 1000 REQ/Day zu sein.**
-   **Verwenden Sie das "Debug" -Protokollierungsebene nur bei Problembehebungsproblemen.**\`\*\*

* * *

Wenn Sie Fragen während der Konfiguration haben oder Probleme haben, lesen Sie die Moduldokumentation.
Wenn Sie einen Fehler finden, öffnen Sie bitte ein Problem.
