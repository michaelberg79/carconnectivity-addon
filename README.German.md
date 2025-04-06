# CarConnectivity-Addon Konfigurationshandbuch

## Einführung

Das **CarConnectivity-Addon** Modul ermöglicht es Ihnen, Informationen über Ihr Fahrzeug von kompatiblen Herstellerservices abzurufen und zu verbinden. Dieses Handbuch erklärt, wie das Modul richtig konfiguriert wird.  
Ich stelle einfach das [ausgezeichnete Werk von Till zusammen.](https://github.com/tillsteinbach/CarConnectivity)

Seine Arbeit ist auch als Docker-Images verfügbar. Wenn Sie Home Assistant als eigenständigen Docker verwenden, können Sie es auch direkt nutzen.

**⚠️Das Projekt befindet sich noch in der Entwicklung, wobei das Reverse Engineering der API abgeschlossen und die Kommunikation mit MQTT/Home Assistant angepasst werden muss.⚠️**

## Repository hinzufügen

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Allgemeine Konfiguration

Füllen Sie nur die Einstellungen für die Marken von Fahrzeugen aus, die Sie besitzen. **Lassen Sie alle anderen Felder leer.**

### 1. Auswahl Ihrer Fahrzeugmarke
Wählen Sie den Hersteller, der Ihrem Fahrzeug entspricht, aus den unterstützten Marken aus:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  
- **Volvo**  

Wenn Sie mehrere Fahrzeuge von verschiedenen Marken besitzen, können Sie mehrere Abschnitte konfigurieren.

### 2. Verbindung zu den Online-Services des Herstellers
Jeder Autohersteller bietet einen Online-Service, der es Ihnen ermöglicht, auf die Daten Ihres Fahrzeugs remote zuzugreifen. Um sich zu verbinden, müssen Sie Ihre Anmeldeinformationen angeben.

#### Erforderliche Informationen:  
Für Seat, Cupra, Skoda, Volkswagen und Tronity:  
- **Marke**: Die Marke des Herstellers.  
- **Benutzername**: Die E-Mail-Adresse, die zum Anmelden am Service des Herstellers verwendet wird.  
- **Passwort**: Das Passwort für Ihr Herstellerkonto.  
- **PIN-Code**: Ein 4-stelliger Code, der für den Remote-Zugriff auf bestimmte Fahrzeugfunktionen erforderlich ist.  
- **Aktualisierungsintervall**: Definiert, wie oft (in Sekunden) die Fahrzeugdaten aktualisiert werden.  
  - **Warnung:** Ein zu häufiges Aktualisierungsintervall kann die von dem Hersteller festgelegten API-Anforderungsgrenzen überschreiten, was zu vorübergehenden Zugriffsbeschränkungen führt.  

⚠️ Sie können 2 Konten für 2 verschiedene Marken oder 2 Fahrzeuge derselben Marke verwenden, die nicht mit demselben Konto verknüpft sind.  

Für Volvo:  
- **API-Schlüssel primär**: Primärschlüssel der Volvo API.  
- **API-Schlüssel sekundär**: Sekundärschlüssel der Volvo API.  
- **Fahrzeugtoken**: Zugangstoken für das Fahrzeug.  
- **Fahrzeugstandorttoken**: Zugangstoken für den Standortendpunkt.  
- **Aktualisierungsintervall**: Definiert, wie oft (in Sekunden) die Fahrzeugdaten aktualisiert werden.  
  - **Warnung:** Ein zu häufiges Aktualisierungsintervall kann die von dem Hersteller festgelegten API-Anforderungsgrenzen überschreiten, was zu vorübergehenden Zugriffsbeschränkungen führt.  

### 3. MQTT-Konfiguration (Obligatorisch)
Sie müssen **MQTT** verwenden, um Fahrzeugdaten an Home Assistant zu senden, konfigurieren Sie diese Einstellungen:  
- **Benutzername**: Anmeldedaten des MQTT-Brokers  
- **Passwort**: Passwort des MQTT-Brokers  
- **Broker-Adresse**: IP oder Domainname des MQTT-Servers  

⚠️ Wenn Sie MQTT in Home Assistant noch nicht verwenden, können Sie beispielsweise [Mosquito-Addon UND MQTT-Integration hinzufügen](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI
Sie können http//x.x.x.x:4000 Die WEBUI von CarConnectivity besuchen:  
- **Benutzername**: login  
- **Passwort**: password  
- **WEBUI-Port**: 4000  

### 5. Protokollierungsstufe
Definieren Sie die Menge an Informationen, die in Protokollen aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warnung**: Zeigt nur Warnungen an.  
- **Fehler**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details, die bei der Fehlersuche nützlich sind.  

### 6. API-Protokollierungsstufe
Definieren Sie die Menge an Informationen, die in Protokollen aufgezeichnet werden:  
- **Info**: Zeigt allgemeine Betriebsinformationen an.  
- **Warnung**: Zeigt nur Warnungen an.  
- **Fehler**: Zeigt nur Fehlermeldungen an.  
- **Debug**: Zeigt zusätzliche Details, die bei der Fehlersuche nützlich sind.  

### 7. Expertenmodus
Der Expertenmodus ermöglicht die Nutzung aller nativen CarConnectivity-Funktionen, einschließlich derjenigen, die nicht über die grafische Benutzeroberfläche verfügbar sind—solange die entsprechenden Funktionen von den Add-On-Binärdateien unterstützt werden.  

⚠️ Warnung:  
Dieser Modus deaktiviert alle Inhaltsvalidierungen und Sicherheitsprüfungen. Daher kann selbst ein kleiner Fehler (wie eine ungültige JSON-Syntax) verhindern, dass das Add-On korrekt gestartet wird.

Der Expertenmodus ist nur für fortgeschrittene Benutzer gedacht.  
Um ihn sicher zu verwenden, müssen Sie:  

Mit der JSON-Syntax und -Struktur vertraut sein.  

Der Expertenmodus erlaubt die Verwendung einer benutzerdefinierten Konfigurationsdatei. Wenn dieser Modus aktiviert ist, kann der Benutzer eine Datei mit dem Namen /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json bereitstellen, die die gewünschten Einstellungen enthält. Dies ersetzt vollständig die Konfiguration aus der grafischen Benutzeroberfläche, die unter /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json verfügbar sein wird. Das Verzeichnis /addon_configs/1b1291d4_carconnectivity-addon/ ist möglicherweise nicht im Dateisystem von Home Assistant sichtbar. Ist dies der Fall, sollte der Supervisor neu gestartet werden.

Bitte konsultieren Sie die offizielle CarConnectivity-Dokumentation für die Liste der unterstützten Funktionen und der erwarteten Parameter.

## Beste Praktiken  
- **Füllen Sie nur die Einstellungen für die Fahrzeugmarken aus, die Sie besitzen.**  
- **Teilen Sie Ihre Anmeldeinformationen nicht.**  
- **Passen Sie das Aktualisierungsintervall an, um zu vermeiden, dass die API-Anforderungsgrenzen überschritten werden. Beachten Sie, die Grenze scheint etwa 1000 Anfragen/Tag zu sein.**  
- **Verwenden Sie die Protokollstufe "Debug" nur, wenn Sie Probleme beheben.**  

---  

Wenn Sie Fragen haben oder während der Konfiguration auf Probleme stoßen, konsultieren Sie die Dokumentation zum Modul.  
Wenn Sie einen Fehler finden, öffnen Sie bitte ein Issue.  