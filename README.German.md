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