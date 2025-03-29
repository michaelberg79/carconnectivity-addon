![Supporta l'Architettura aarch64][aarch64-shield]  
![Supporta l'Architettura amd64][amd64-shield]  
![Supporta l'Architettura armhf][armhf-shield]  
![Supporta l'Architettura armv7][armv7-shield]  
![Supporta l'Architettura i386][i386-shield]  
[![Codice sorgente GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![Versione release GitHub (ultima per data)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![Problemi su GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Add-on di Home Assistant: CarConnectivity  

|         | Stabile                                                                                                                        | Edge                                                                                                                                                   |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |  
| Versione | [![Versione release GitHub (ultima per data)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Versione Immagine Docker (ultimo semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guida alla Configurazione dell'Add-on CarConnectivity  

## Introduzione  

Il modulo **CarConnectivity-Addon** permette di connettersi e recuperare informazioni sul proprio veicolo dai servizi online dei produttori compatibili. Questa guida spiega come configurare correttamente il modulo.  
Sto semplicemente impacchettando il [lavoro eccellente svolto da Till.](https://github.com/tillsteinbach/CarConnectivity)  

Il suo lavoro è disponibile anche come immagini docker. Quindi, se utilizzi Home Assistant come docker autonomo, puoi utilizzarlo direttamente.  

**⚠️Il progetto è ancora in sviluppo, con l'ingegneria inversa delle API da completare e la comunicazione con MQTT/Home Assistant da adattare.⚠️**  

![Auto Connessa come dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Aggiungi repository  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configurazione Generale  

Compila solo le impostazioni relative ai marchi dei veicoli che possiedi. **Lascia tutti gli altri campi vuoti.**  

### 1. Selezione del Marchio del Veicolo  
Scegli il produttore corrispondente al tuo veicolo tra i marchi supportati:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Se possiedi più veicoli di marchi diversi, puoi configurare più sezioni.  

### 2. Connessione ai Servizi Online del Produttore  
Ogni produttore di auto fornisce un servizio online che consente di accedere ai dati del proprio veicolo in remoto. Per connettersi, è necessario fornire le credenziali di accesso.  

#### Informazioni Richieste:
- **Marchio**: Il marchio del produttore.  
- **Nome Utente**: L'indirizzo email utilizzato per accedere al servizio del produttore.  
- **Password**: La password per il proprio account presso il produttore.  
- **Codice PIN**: Un codice a 4 cifre necessario per l'accesso remoto a determinate funzionalità del veicolo.  
- **Intervallo di aggiornamento**: Definisce ogni quanto tempo (in secondi) vengono aggiornati i dati del veicolo.  
  - **Avvertenza:** Un intervallo di aggiornamento troppo frequente potrebbe superare i limiti di richieste API imposti dal produttore, comportando restrizioni temporanee di accesso.  

⚠️ Puoi utilizzare 2 account per 2 marchi diversi o 2 auto dello stesso marchio che non sono collegate allo stesso account.  

### 3. Configurazione MQTT (Obbligatoria)  
Per inviare i dati del veicolo a Home Assistant, è necessario utilizzare **MQTT** e configurare le seguenti impostazioni:  
- **Nome Utente**: Login broker MQTT  
- **Password**: Password broker MQTT  
- **Indirizzo Broker**: IP o nome a dominio del server MQTT  

⚠️ Se non stai già utilizzando MQTT su Home Assistant, puoi aggiungere, ad esempio, [Mosquito addon E integrazione MQTT](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI  
Puoi visitare http//x.x.x.x:4000 Il WEBUI da Carconnectivity:  
- **Nome Utente**: login  
- **Password**: password  
- **Porta WEBUI**: 4000  

![Vista WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Livello di Registrazione Log  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Mostra informazioni operative generali.  
- **Warning**: Mostra solo avvisi.  
- **Error**: Mostra solo messaggi di errore.  
- **Debug**: Mostra ulteriori dettagli utili per la risoluzione dei problemi.  

### 6. Livello di Registrazione Log API  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Mostra informazioni operative generali.  
- **Warning**: Mostra solo avvisi.  
- **Error**: Mostra solo messaggi di errore.  
- **Debug**: Mostra ulteriori dettagli utili per la risoluzione dei problemi.  

## Migliori Pratiche  
- **Compila solo le impostazioni per i marchi di veicoli che possiedi.**  
- **Non condividere le tue credenziali di accesso.**  
- **Regola l'intervallo di aggiornamento per evitare di superare i limiti di richieste API. Ricorda, il limite sembra essere circa 1000 richieste/giorno.**  
- **Utilizza il livello di registrazione "Debug" solo durante la risoluzione dei problemi.**  

---  

Se hai domande o riscontri problemi durante la configurazione, consulta la documentazione del modulo.  
Se trovi un bug, apri una segnalazione.  