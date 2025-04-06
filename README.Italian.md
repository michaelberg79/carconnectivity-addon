![Supporta architettura aarch64][aarch64-shield]  
![Supporta architettura amd64][amd64-shield]  
![Supporta architettura armhf][armhf-shield]  
![Supporta architettura armv7][armv7-shield]  
![Supporta architettura i386][i386-shield]  
[![Codice sorgente GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![Rilascio GitHub (ultimo per data)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![Problemi GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Add-on Home Assistant: CarConnectivity  

|         | Stabile                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![Rilascio GitHub (ultimo per data)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (ultima semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guide tradotte  

| ![Bandiera Francese](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png) | ![Bandiera Italiana](https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1280px-Flag_of_Italy.svg.png) | ![Bandiera Tedesca](https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/1280px-Flag_of_Germany.svg.png) | ![Bandiera Spagnola](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/1280px-Flag_of_Spain.svg.png) | ![Bandiera Polacca](https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/1280px-Flag_of_Poland.svg.png) | ![Bandiera Portoghese](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png) |  
|---------|-----------|-----------|-----------|-----------|-----------|  
| [README.French.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.French.md) | [README.Italian.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Italian.md) | [README.German.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.German.md) | [README.Spanish.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Spanish.md) | [README.Polish.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Polish.md) | [README.Portuguese.md](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Portuguese.md) |  

## Introduzione  

Il modulo **CarConnectivity-Addon** consente di connettersi e recuperare informazioni sul proprio veicolo dai servizi online dei produttori compatibili. Questa guida spiega come configurare correttamente il modulo.  
Sto semplicemente impacchettando il [lavoro eccellente fatto da Till.](https://github.com/tillsteinbach/CarConnectivity)  

Il suo lavoro è anche disponibile come immagini docker. Quindi, se stai utilizzando Home Assistant come docker stand-alone, puoi usarlo direttamente anche tu.  

**⚠️Il progetto è ancora in fase di sviluppo, con ingegneria inversa dell'api da completare e comunicazione con MQTT/Home assistant da adattare.⚠️**  

![Auto connesse come dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Aggiungi repository  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configurazione generale  

Compila solo le impostazioni per i marchi di veicoli che possiedi. **Lascia tutti gli altri campi vuoti.**  

### 1. Selezione del marchio del veicolo  
Scegli il produttore corrispondente al tuo veicolo tra i marchi supportati:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Se possiedi più veicoli di marchi diversi, puoi configurare più sezioni.  

### 2. Connessione ai servizi online del produttore  
Ogni produttore di auto fornisce un servizio online che consente di accedere ai dati del tuo veicolo da remoto. Per connetterti, devi fornire le tue credenziali di accesso.  

#### Informazioni richieste:  
- **Marca**: Il marchio del produttore.  
- **Nome utente**: L'indirizzo email utilizzato per effettuare il login nel servizio del produttore.  
- **Password**: La password per il tuo account del produttore.  
- **Codice PIN**: Un codice a 4 cifre richiesto per l'accesso remoto a determinate funzionalità del veicolo.  
- **Intervallo di aggiornamento**: Definisce la frequenza (in secondi) con cui i dati del veicolo vengono aggiornati.  
  - **Avviso:** Impostare un intervallo di aggiornamento troppo frequente può superare i limiti delle richieste API imposti dal produttore, risultando in restrizioni temporanee di accesso.  

⚠️ Puoi utilizzare 2 account per 2 marchi diversi o 2 auto dello stesso marchio che non sono collegate allo stesso account.  

### 3. Configurazione MQTT (Obbligatoria)  
Devi utilizzare **MQTT** per inviare i dati del veicolo a home assistant, configura queste impostazioni:  
- **Nome utente**: Accesso al broker MQTT  
- **Password**: Password del broker MQTT  
- **Indirizzo Broker**: IP o nome di dominio del server MQTT  

⚠️ Se non stai già utilizzando MQTT su Home assistant, puoi aggiungere, ad esempio, [Mosquito addon E integrazione MQTT](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI  
Puoi visitare http//x.x.x.x:4000 Il WEBUI da Carconnectivity:  
- **Nome utente**: login  
- **Password**: password  
- **PORTA WEBUI**: 4000  

![Visualizzazione WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Livello di registrazione  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Mostra informazioni operative generali.  
- **Warning**: Mostra solo avvisi.  
- **Error**: Mostra solo messaggi di errore.  
- **Debug**: Mostra dettagli aggiuntivi utili per la risoluzione dei problemi.  

### 6. Livello di registrazione API  
Definisci la quantità di informazioni registrate nei log:  
- **Info**: Mostra informazioni operative generali.  
- **Warning**: Mostra solo avvisi.  
- **Error**: Mostra solo messaggi di errore.  
- **Debug**: Mostra dettagli aggiuntivi utili per la risoluzione dei problemi.  

### 7. Modalità Esperto  
La modalità esperto consente di utilizzare tutte le funzioni native di Carconnectivity, comprese quelle non disponibili tramite l'interfaccia grafica, a condizione che le funzioni corrispondenti siano supportate dai file binari dell'add-on.  

⚠️ Avviso:  
Questa modalità disabilita tutta la convalida del contenuto e i controlli di sicurezza. Di conseguenza, anche un piccolo errore (come una sintassi JSON non valida) può impedire il corretto avvio dell'add-on.  

La modalità esperto è destinata solo a utenti avanzati.  
Per utilizzarla in modo sicuro, devi:  

Essere familiare con la sintassi e la struttura JSON.  

La modalità esperto consente l'utilizzo di un file di configurazione personalizzato. Quando questa modalità è attivata, l'utente può fornire un file chiamato /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json contenente le impostazioni desiderate. Questo sostituisce completamente la configurazione dall'interfaccia grafica, che sarà disponibile in /addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json. La directory /addon_configs/1b1291d4_carconnectivity-addon/ potrebbe non apparire nel file system di Home Assistant. Se questo è il caso, il supervisor dovrebbe essere riavviato.  

Fai riferimento alla documentazione ufficiale di Carconnectivity per l'elenco delle funzioni supportate e dei parametri attesi.  

## Migliori pratiche  
- **Compila solo le impostazioni per i marchi di veicoli che possiedi.**  
- **Non condividere le tue credenziali di accesso.**  
- **Regola l'intervallo di aggiornamento per evitare di superare i limiti delle richieste API. Ricorda che il limite sembra essere di circa 1000 req/giorno**  
- **Utilizza il livello di registrazione "Debug" solo quando risolvi problemi.**  

---  

Se hai domande o riscontri problemi durante la configurazione, fai riferimento alla documentazione del modulo.  
Se trovi un bug, apri un problema.