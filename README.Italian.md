![Supporta Architettura aarch64][aarch64-shield]  
![Supporta Architettura amd64][amd64-shield]  
![Supporta Architettura armhf][armhf-shield]  
![Supporta Architettura armv7][armv7-shield]  
![Supporta Architettura i386][i386-shield]  
[![Codice sorgente GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![GitHub release (ultimo per data)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![Problemi GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Add-on Home Assistant: CarConnectivity  

|         | Stabile                                                                                                                       | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Versione| [![GitHub release (ultimo per data)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (semver più recente)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guida Configurazione CarConnectivity-Addon  

## Introduzione  

Il modulo **CarConnectivity-Addon** consente di connettersi e recuperare informazioni sul proprio veicolo dai servizi online dei produttori compatibili. Questa guida spiega come configurare correttamente il modulo.  
Sto semplicemente impacchettando [l'eccellente lavoro di Till.](https://github.com/tillsteinbach/CarConnectivity)  

Il suo lavoro è disponibile anche come immagine Docker. Quindi, se stai utilizzando Home Assistant come Docker autonomo, puoi usarlo direttamente.  

**⚠️Il progetto è ancora in fase di sviluppo, con il reverse engineering delle API da completare e la comunicazione con MQTT/Home Assistant da adattare.⚠️**  

![Auto connessa come dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Aggiungere il repository  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configurazione Generale  

Compila solo le impostazioni relative ai marchi di veicoli che possiedi. **Lascia tutti gli altri campi vuoti.**  

### 1. Selezionare il Marchio del Proprio Veicolo  
Scegli il produttore corrispondente al tuo veicolo nella lista dei marchi supportati:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Se possiedi più veicoli di diversi marchi, puoi configurare più sezioni.  

### 2. Collegamento ai Servizi Online del Produttore  
Ogni produttore di automobili offre un servizio online che consente di accedere ai dati del veicolo da remoto. Per connettersi, è necessario fornire le proprie credenziali di accesso.  

#### Informazioni Richieste:  
- **Marchio**: Il marchio del produttore.  
- **Username**: L'indirizzo email utilizzato per accedere al servizio del produttore.  
- **Password**: La password per l'account del produttore.  
- **Codice PIN**: Un codice PIN a 4 cifre richiesto per l'accesso remoto a determinate funzioni del veicolo.  
- **Intervallo di Aggiornamento**: Definisce la frequenza (in secondi) con cui vengono aggiornati i dati del veicolo.  
  - **Avviso:** Impostare un intervallo di aggiornamento troppo frequente potrebbe superare i limiti di richieste API imposti dal produttore, causando restrizioni temporanee di accesso.  

⚠️ Puoi utilizzare 2 account per 2 marchi diversi o 2 auto dello stesso marchio non collegate al medesimo account.  

### 3. Configurazione MQTT (Obbligatoria)  
È necessario utilizzare **MQTT** per inviare i dati del veicolo a Home Assistant; configura queste impostazioni:  
- **Username**: Login del broker MQTT  
- **Password**: Password del broker MQTT  
- **Indirizzo del Broker**: IP o nome del dominio del server MQTT  

⚠️ Se non stai già utilizzando MQTT su Home Assistant, puoi aggiungere, ad esempio, [Mosquitto addon E integrazione MQTT](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI  
Puoi visitare http//x.x.x.x:4000 Il WEBUI di CarConnectivity:  
- **Username**: login  
- **Password**: password  
- **Porta WEBUI**: 4000  

![Vista WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Livello di Registrazione Log  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Mostra informazioni generali di funzionamento.  
- **Avviso**: Mostra solo gli avvisi.  
- **Errore**: Mostra solo messaggi di errore.  
- **Debug**: Mostra dettagli aggiuntivi utili per la risoluzione dei problemi.  

### 6. Livello di Registrazione Log API  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Mostra informazioni generali di funzionamento.  
- **Avviso**: Mostra solo gli avvisi.  
- **Errore**: Mostra solo messaggi di errore.  
- **Debug**: Mostra dettagli aggiuntivi utili per la risoluzione dei problemi.  

## Migliori Pratiche  
- **Compila solo le impostazioni relative ai marchi di veicoli che possiedi.**  
- **Non condividere le tue credenziali di accesso.**  
- **Regola l'intervallo di aggiornamento per evitare di superare i limiti di richieste API. Ricorda che il limite sembra essere circa 1000 richieste/giorno.**  
- **Utilizza il livello di registrazione "Debug" solo per la risoluzione dei problemi.**  

---  

Se hai domande o riscontri problemi durante la configurazione, consulta la documentazione del modulo.  
Se trovi un bug, per favore apri un problema.  