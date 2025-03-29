![Unterstützt aarch64 Architektur][aarch64-shield]  
![Unterstützt amd64 Architektur][amd64-shield]  
![Unterstützt armhf Architektur][armhf-shield]  
![Unterstützt armv7 Architektur][armv7-shield]  
![Unterstützt i386 Architektur][i386-shield]  
[![GitHub Quellcode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![GitHub Veröffentlichung (neueste nach Datum)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![GitHub Issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Home Assistant Add-on: CarConnectivity  

|         | Stabil                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![GitHub Veröffentlichung (neueste nach Datum)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (neueste Semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# CarConnectivity-Addon Konfigurationsanleitung  

## Einführung  
Das Modul **CarConnectivity-Addon** ermöglicht es, eine Verbindung herzustellen und Informationen über Ihr Fahrzeug von den Online-Diensten kompatibler Hersteller abzurufen. Dieser Leitfaden erklärt, wie das Modul ordnungsgemäß konfiguriert wird.  
Ich stelle lediglich die [hervorragende Arbeit von Till](https://github.com/tillsteinbach/CarConnectivity) in einem Paket bereit.  

Seine Arbeit ist auch als Docker-Images verfügbar. Wenn Sie Home Assistant als eigenständige Docker-Installation verwenden, können Sie diese direkt nutzen.  

**⚠️Das Projekt befindet sich noch in Entwicklung, mit abgeschlossener Rückwärtsentwicklung der API und Anpassung an die Kommunikation mit MQTT/Home Assistant.⚠️**  

![Verbundenes Auto als MQTT-Gerät](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Repository hinzufügen  
[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Allgemeine Konfiguration  
Füllen Sie nur die Einstellungen für die Marken Ihrer Fahrzeuge aus. **Lassen Sie alle anderen Felder leer.**  

### 1. Auswahl Ihrer Fahrzeugmarke  
Wählen Sie den Hersteller entsprechend Ihres Fahrzeugs aus den unterstützten Marken:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Wenn Sie mehrere Fahrzeuge unterschiedlicher Marken besitzen, können Sie mehrere Abschnitte konfigurieren.  

### 2. Verbindung zu den Online-Diensten des Herstellers  
Jeder Automobilhersteller bietet einen Online-Dienst an, der Ihnen den Zugriff auf die Fahrzeugdaten aus der Ferne ermöglicht. Um sich zu verbinden, müssen Sie Ihre Zugangsdaten angeben.  

#### Erforderliche Informationen:  
- **Marke**: Die Marke des Herstellers.  
- **Benutzername**: Die E-Mail-Adresse, mit der Sie sich beim Dienst des Herstellers anmelden.  
- **Passwort**: Das Passwort für Ihr Herstellerkonto.  
- **PIN-Code**: Ein 4-stelliger Code, der für den Fernzugriff auf bestimmte Fahrzeugfunktionen erforderlich ist.  
- **Aktualisierungsintervall**: Gibt an, wie oft (in Sekunden) die Fahrzeugdaten aktualisiert werden.  
  - **Warnung:** Wenn die Aktualisierungsrate zu oft eingestellt wird, können die von den Herstellern auferlegten API-Anfragerichtlinien überschritten werden, was zu einer vorübergehenden Zugriffsbeschränkung führt.  

⚠️ Sie können 2 Konten für 2 verschiedene Marken oder 2 Autos derselben Marke verwenden, die nicht mit demselben Konto verknüpft sind.  

### 3. MQTT-Konfiguration (erforderlich)  
Sie müssen **MQTT** verwenden, um Fahrzeugdaten an Home Assistant zu senden. Konfigurieren Sie folgende Einstellungen:  
- **Benutzername**: MQTT-Broker-Login  
- **Passwort**: MQTT-Broker-Passwort  
- **Broker-Adresse**: IP- oder Domain-Name des MQTT-Servers  

⚠️ Wenn Sie MQTT noch nicht in Home Assistant verwenden, können Sie z. B. [Mosquito-Addon UND MQTT-Integration](https://www.home-assistant.io/integrations/mqtt) hinzufügen.  

### 4. WEBUI  
Sie können die WEBUI von Carconnectivity unter http//x.x.x.x:4000 besuchen:  
- **Benutzername**: Login  
- **Passwort**: Passwort  
- **WEBUI-Port**: 4000  

![WEBUI-Ansicht](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Protokollierungsstufe  
Definieren Sie die Menge an Informationen, die in den Protokollen aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warning**: Zeigt nur Warnungen an.  
- **Error**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details an, die für die Fehlersuche nützlich sind.  

### 6. API-Protokollierungsstufe  
Definieren Sie die Menge an Informationen, die in den Protokollen aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warning**: Zeigt nur Warnungen an.  
- **Error**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details an, die für die Fehlersuche nützlich sind.  

## Best Practices  
- **Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen.**  
- **Teilen Sie Ihre Zugangsdaten nicht.**  
- **Passen Sie das Aktualisierungsintervall an, um die API-Anforderungsgrenzen nicht zu überschreiten. Denken Sie daran, dass das Limit etwa 1000 Anfragen/Tag zu sein scheint.**  
- **Verwenden Sie die Protokollierungsstufe "Debug" nur bei der Fehlersuche.**  

---  

Wenn Sie Fragen haben oder während der Konfiguration auf Probleme stoßen, lesen Sie die Dokumentation zum Modul.  
Wenn Sie einen Fehler finden, öffnen Sie bitte ein Issue.  