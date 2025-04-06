![Unterstützt aarch64-Architektur][aarch64-shield]  
![Unterstützt amd64-Architektur][amd64-shield]  
![Unterstützt armhf-Architektur][armhf-shield]  
![Unterstützt armv7-Architektur][armv7-shield]  
![Unterstützt i386-Architektur][i386-shield]  
[![GitHub-Quellcode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![GitHub-Version (neueste nach Datum)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![GitHub-Issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Home Assistant Add-on: CarConnectivity  

|         | Stabil                                                                                                                             | Edge                                                                                                                                           |  
| ------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![GitHub-Version (neueste nach Datum)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker-Image-Version (neueste semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  


# CarConnectivity-Addon Konfigurationsanleitung  

## Einführung  

Das **CarConnectivity-Addon**-Modul ermöglicht es Ihnen, Informationen über Ihr Fahrzeug von kompatiblen Herstellerservices abzurufen. Diese Anleitung erklärt, wie das Modul korrekt konfiguriert wird.  
Ich packe einfach das [ausgezeichnete Werk von Till](https://github.com/tillsteinbach/CarConnectivity) ein.  

Sein Werk ist auch als Docker-Images verfügbar. Wenn Sie Home Assistant als eigenständigen Docker verwenden, können Sie es direkt nutzen.  

**⚠️ Das Projekt befindet sich noch in der Entwicklung, mit der Rückentwicklung der API, die abgeschlossen werden muss, und der Kommunikation mit MQTT/Home Assistant, die angepasst werden muss. ⚠️**  

![Verbundene Autos als MQTT-Gerät](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Repository hinzufügen  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Allgemeine Konfiguration  

Füllen Sie nur die Einstellungen für die Marken von Fahrzeugen aus, die Sie besitzen. **Lassen Sie alle anderen Felder leer.**  

### 1. Auswahl Ihrer Fahrzeugmarke  
Wählen Sie den Hersteller, der Ihrem Fahrzeug aus den unterstützten Marken entspricht:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Wenn Sie mehrere Fahrzeuge unterschiedlicher Marken besitzen, können Sie mehrere Abschnitte konfigurieren.  

### 2. Verbindung zu den Online-Diensten des Herstellers  
Jeder Automobilhersteller bietet einen Onlinedienst an, der es Ihnen ermöglicht, auf die Daten Ihres Fahrzeugs aus der Ferne zuzugreifen. Um eine Verbindung herzustellen, müssen Sie Ihre Anmeldeinformationen bereitstellen.  

#### Erforderliche Informationen:  
- **Marke**: Die Marke des Herstellers.  
- **Benutzername**: Die E-Mail-Adresse, die zum Anmelden beim Dienst des Herstellers verwendet wird.  
- **Passwort**: Das Passwort für Ihr Herstellerkonto.  
- **PIN-Code**: Ein 4-stelliger Code, der für den Fernzugriff auf bestimmte Fahrzeugmerkmale erforderlich ist.  
- **Aktualisierungsintervall**: Definiert, wie oft (in Sekunden) die Daten des Fahrzeugs aktualisiert werden.  
  - **Warnung:** Das Einstellen einer zu häufigen Aktualisierungsrate kann die von den Herstellern festgelegten API-Anforderungsgrenzen überschreiten, was zu vorübergehenden Zugriffsrestriktionen führt.  

⚠️ Sie können 2 Konten für 2 unterschiedliche Marken oder 2 Autos derselben Marke verwenden, die nicht mit demselben Konto verknüpft sind.  

### 3. MQTT-Konfiguration (Obligatorisch)  
Sie müssen **MQTT** verwenden, um Fahrzeugdaten an Home Assistant zu senden, konfigurieren Sie diese Einstellungen:  
- **Benutzername**: MQTT-Broker-Anmeldung  
- **Passwort**: MQTT-Broker-Passwort  
- **Broker-Adresse**: IP oder Domain-Name des MQTT-Servers  

⚠️ Wenn Sie MQTT in Home Assistant noch nicht verwenden, können Sie beispielsweise [Mosquito-Addon UND MQTT-Integration](https://www.home-assistant.io/integrations/mqtt) hinzufügen.  

### 4. WEBUI  
Sie können http//x.x.x.x:4000 Die WEBUI von Carconnectivity besuchen:  
- **Benutzername**: anmeldung  
- **Passwort**: passwort  
- **WEBUI-Port**: 4000  

![WEBUI-Ansicht](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Protokollierungsstufe  
Definieren Sie die Menge an Informationen, die in den Protokollen aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warnung**: Zeigt nur Warnungen an.  
- **Fehler**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details an, die für die Fehlersuche nützlich sind.  

### 6. API-Protokollierungsstufe  
Definieren Sie die Menge an Informationen, die in den Protokollen aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warnung**: Zeigt nur Warnungen an.  
- **Fehler**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details an, die für die Fehlersuche nützlich sind.  

### 7. Expertenmodus  
Der Expertenmodus ermöglicht die Verwendung aller nativen Carconnectivity-Funktionen, einschließlich der Funktionen, die nicht über die grafische Oberfläche verfügbar sind, solange die entsprechenden Funktionen von den Add-on-Binärdateien unterstützt werden.  

⚠️ Warnung:  
Dieser Modus deaktiviert alle Inhaltsvalidierungs- und Sicherheitsprüfungen. Infolgedessen kann selbst ein kleiner Fehler (wie eine ungültige JSON-Syntax) dazu führen, dass das Add-on nicht korrekt gestartet wird.  

Der Expertenmodus ist nur für fortgeschrittene Benutzer gedacht.  
Um ihn sicher zu verwenden, müssen Sie:  

Mit der JSON-Syntax und -Struktur vertraut sein.  

Der Expertenmodus ermöglicht die Verwendung einer benutzerdefinierten Konfigurationsdatei. Wenn dieser Modus aktiviert ist, kann der Benutzer eine Datei mit dem Namen /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json bereitstellen, die die gewünschten Einstellungen enthält. Diese ersetzt vollständig die Konfiguration aus der grafischen Oberfläche, die in /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json verfügbar ist. Das Verzeichnis /addon_configs/1b1291d4_carconnectivity-addon/ wird möglicherweise nicht im Home Assistant-Dateisystem angezeigt. Wenn dies der Fall ist, sollte der Supervisor neu gestartet werden.  

Bitte konsultieren Sie die offizielle Carconnectivity-Dokumentation für die Liste der unterstützten Funktionen und erwarteten Parameter.  

## Beste Praktiken  
- **Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen.**  
- **Teilen Sie Ihre Anmeldedaten nicht.**  
- **Passen Sie das Aktualisierungsintervall an, um die API-Anforderungsgrenzen nicht zu überschreiten. Denken Sie daran, die Grenze scheint etwa 1000 req/Tag zu betragen.**  
- **Verwenden Sie nur bei der Fehlersuche die Protokollierungsstufe "Debug".**  

---  

Wenn Sie Fragen haben oder während der Konfiguration auf Probleme stoßen, konsultieren Sie die Moduldokumentation.  
Wenn Sie einen Fehler finden, öffnen Sie bitte ein Problem.  