# Guida alla configurazione del CarConnectivity-Addon

## Introduzione

Il **modulo CarConnectivity-Addon** ti consente di connetterti e recuperare informazioni sul tuo veicolo dai servizi online dei produttori compatibili. Questa guida spiega come configurare correttamente il modulo.
Sto semplicemente confezionando il [lavoro eccellente svolto da Till.](https://github.com/tillsteinbach/CarConnectivity)

Il suo lavoro è disponibile anche come immagini docker. Quindi, se stai usando Home Assistant come docker autonomo, puoi usarlo direttamente.

**⚠️Il progetto è ancora in fase di sviluppo, con l'ingegneria inversa dell'api da completare e la comunicazione con MQTT/Home assistant da adattare.⚠️**

## Aggiungi repository

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configurazione generale

Compila solo le impostazioni per i marchi di veicoli di cui sei proprietario. **Lascia vuoti tutti gli altri campi.**

### 1. Selezionare il marchio del tuo veicolo
Scegli il produttore corrispondente al tuo veicolo tra i marchi supportati:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**
- **Volvo**

Se possiedi più veicoli di marchi diversi, puoi configurare più sezioni.

### 2. Connessione ai servizi online del produttore
Ogni produttore di auto fornisce un servizio online che consente di accedere ai dati del tuo veicolo da remoto. Per connetterti, devi fornire le tue credenziali di accesso.

#### Informazioni richieste:
Per Seat, Cupra, Skoda, Volkswagen e Tronity:
- **Marca**: Il marchio del produttore.
- **Nome utente**: L'indirizzo email utilizzato per accedere al servizio del produttore.
- **Password**: La password per il tuo account del produttore.
- **Codice PIN**: Un codice a 4 cifre richiesto per l'accesso remoto a determinate funzionalità del veicolo.
- **Intervallo di aggiornamento**: Definisce ogni quanto (in secondi) i dati del veicolo vengono aggiornati.
  - **Attenzione:** Impostare un tasso di aggiornamento troppo frequente potrebbe superare i limiti di richiesta API imposti dal produttore, causando restrizioni temporanee all'accesso.

⚠️ Puoi utilizzare 2 account per 2 marchi diversi o 2 auto dello stesso marchio che non sono collegate allo stesso account.

Per volvo:
- **API Key primary**: Chiave API primaria Volvo.
- **API Key secondary**: Chiave API secondaria Volvo.
- **Vehicule Token**: Token di accesso per il veicolo.
- **Vehicule Location Token**: Token di accesso per l'endpoint della posizione.
- **Intervallo di aggiornamento**: Definisce ogni quanto (in secondi) i dati del veicolo vengono aggiornati.
  - **Attenzione:** Impostare un tasso di aggiornamento troppo frequente potrebbe superare i limiti di richiesta API imposti dal produttore, causando restrizioni temporanee all'accesso.

### 3. Configurazione MQTT (Obbligatoria)
Devi utilizzare **MQTT** per inviare i dati del veicolo a home assistant, configura queste impostazioni:
- **Nome utente**: Login del broker MQTT
- **Password**: Password del broker MQTT
- **Broker Address**: IP o nome a dominio del server MQTT

⚠️ Se non stai già utilizzando MQTT su Home assistant, puoi aggiungere, ad esempio, [Mosquito addon E INTEGRAZIONE MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Puoi visitare http//x.x.x.x:4000 La WEBUI di Carconnectivity:
- **Nome utente**: login
- **Password**: password
- **WEBUI Port**: 4000

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

## Migliori pratiche
- **Compila solo le impostazioni per i marchi di veicoli di cui sei proprietario.**
- **Non condividere le tue credenziali di accesso.**
- **Regola l'intervallo di aggiornamento per evitare di superare i limiti di richiesta API. Ricorda che il limite sembra essere di circa 1000 req/giorno**
- **Usa il livello di registrazione "Debug" solo quando risolvi problemi.**

---

Se hai domande o incontri problemi durante la configurazione, fai riferimento alla documentazione del modulo.
Se trovi un bug, ti preghiamo di aprire un problema.