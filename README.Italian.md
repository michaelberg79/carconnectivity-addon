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

# Guida all'aggiunta di Home Assistant: CarConnectivity  

|         | Stabile                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guida alla configurazione di CarConnectivity-Addon  

## Introduzione  

Il modulo **CarConnectivity-Addon** ti consente di connetterti e recuperare informazioni sul tuo veicolo dai servizi online di produttori compatibili. Questa guida spiega come configurare correttamente il modulo.  
Sto semplicemente impacchettando il [lavoro eccellente svolto da Till.](https://github.com/tillsteinbach/CarConnectivity)  

Il suo lavoro è disponibile anche come immagini docker. Quindi, se stai utilizzando Home Assistant come docker autonomo, puoi usarlo direttamente anche tu.  

**⚠️Il progetto è ancora in fase di sviluppo, con l'ingegneria inversa dell'api da completare e la comunicazione con MQTT/Home Assistant da adattare.⚠️**  

![Auto connesse come dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Aggiungi repository  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configurazione generale  

Compila solo le impostazioni per i marchi di veicoli che possiedi. **Lascia vuoti tutti gli altri campi.**  

### 1. Selezionare il marchio del veicolo  
Scegli il produttore corrispondente al tuo veicolo dai marchi supportati:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Se possiedi più veicoli di marchi diversi, puoi configurare più sezioni.  

### 2. Connessione ai servizi online del produttore  
Ogni produttore di automobili offre un servizio online che ti consente di accedere ai dati del tuo veicolo da remoto. Per connetterti, devi fornire le tue credenziali di accesso.  

#### Informazioni richieste:  
- **Marca**: Il marchio del produttore.  
- **Nome utente**: L'indirizzo email utilizzato per accedere al servizio del produttore.  
- **Password**: La password per il tuo account del produttore.  
- **Codice PIN**: Un codice di 4 cifre richiesto per l'accesso remoto a determinate funzionalità del veicolo.  
- **Intervallo di aggiornamento**: Definisce con quale frequenza (in secondi) i dati del veicolo vengono aggiornati.  
  - **Avvertenza:** Impostare una frequenza di aggiornamento troppo elevata potrebbe superare i limiti di richiesta API imposti dal produttore, risultando in restrizioni di accesso temporanee.  

⚠️ Puoi utilizzare 2 account per 2 marchi diversi o 2 auto dello stesso marchio che non sono collegate allo stesso account.  

### 3. Configurazione MQTT (Obbligatoria)  
Devi utilizzare **MQTT** per inviare i dati del veicolo a Home Assistant, configura queste impostazioni:  
- **Nome utente**: accesso al broker MQTT  
- **Password**: password del broker MQTT  
- **Indirizzo broker**: IP o nome di dominio del server MQTT  

⚠️ Se non stai già utilizzando MQTT su Home Assistant, puoi aggiungere, ad esempio, [l'addon Mosquito E L'integrazione MQTT](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI  
Puoi visitare http//x.x.x.x:4000 Il WEBUI di Carconnectivity:  
- **Nome utente**: accesso  
- **Password**: password  
- **Porta WEBUI**: 4000  

![Visualizzazione WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Livello di registrazione  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Visualizza informazioni generali sulle operazioni.  
- **Warning**: Visualizza solo avvisi.  
- **Error**: Visualizza solo messaggi di errore.  
- **Debug**: Visualizza dettagli aggiuntivi utili per la risoluzione dei problemi.  

### 6. Livello di registrazione API  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Visualizza informazioni generali sulle operazioni.  
- **Warning**: Visualizza solo avvisi.  
- **Error**: Visualizza solo messaggi di errore.  
- **Debug**: Visualizza dettagli aggiuntivi utili per la risoluzione dei problemi.  

### 7. Modalità Esperto  
La modalità esperto consente l'uso di tutte le funzioni native di Carconnectivity, comprese quelle non disponibili tramite l'interfaccia grafica, a condizione che le funzioni corrispondenti siano supportate dai file binari dell'addon.  

⚠️ Avvertenza:  
Questa modalità disabilita tutte le convalide dei contenuti e i controlli di sicurezza. Di conseguenza, anche un piccolo errore (come una sintassi JSON non valida) può impedire al componente aggiuntivo di avviarsi correttamente.  

La modalità esperto è destinata solo agli utenti avanzati.  
Per usarla in sicurezza, devi:  

Essere a conoscenza della sintassi e della struttura JSON.  

La modalità esperto consente l'uso di un file di configurazione personalizzato. Quando questa modalità è attivata, l'utente può fornire un file denominato /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json contenente le impostazioni desiderate. Questo sostituisce completamente la configurazione dell'interfaccia grafica, che sarà disponibile in /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json. La directory /addon_configs/1b1291d4_carconnectivity-addon/ potrebbe non apparire nel file system di Home Assistant. Se questo è il caso, il supervisore deve essere riavviato.  

Fai riferimento alla documentazione ufficiale di Carconnectivity per l'elenco delle funzioni supportate e dei parametri attesi.  

## Migliori pratiche  
- **Compila solo le impostazioni per i marchi di veicolo che possiedi.**  
- **Non condividere le tue credenziali di accesso.**  
- **Regola l'intervallo di aggiornamento per evitare di superare i limiti di richiesta API. Ricorda, il limite sembra essere di circa 1000 req/giorno**  
- **Usa il livello di registrazione "Debug" solo quando risolvi i problemi.**  

---  

Se hai domande o riscontri problemi durante la configurazione, fai riferimento alla documentazione del modulo.  
Se trovi un bug, apri un problema.