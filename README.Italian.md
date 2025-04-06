# Guida alla Configurazione del CarConnectivity-Addon

## Introduzione

Il modulo **CarConnectivity-Addon** consente di connettersi e recuperare informazioni sul proprio veicolo dai servizi online dei produttori compatibili. Questa guida spiega come configurare correttamente il modulo.  
Sto semplicemente impacchettando il [lavoro eccellente svolto da Till.](https://github.com/tillsteinbach/CarConnectivity)

Il suo lavoro è disponibile anche come immagini docker. Quindi, se stai utilizzando Home Assistant come docker autonomo, puoi usarlo direttamente.

**⚠️Il progetto è ancora in fase di sviluppo, con l'ingegneria inversa dell'api da completare e la comunicazione con MQTT/Home assistant da adattare.⚠️**

## Aggiungi repository

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configurazione Generale

Compila solo le impostazioni per i marchi di veicoli che possiedi. **Lascia vuoti tutti gli altri campi.**

### 1. Selezionare il Marchio del Tuo Veicolo
Scegli il produttore corrispondente al tuo veicolo tra i marchi supportati:
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**
- **Volvo**

Se possiedi più veicoli di marchi diversi, puoi configurare più sezioni.

### 2. Connessione ai Servizi Online del Produttore
Ogni produttore di automobili fornisce un servizio online che consente di accedere ai dati del proprio veicolo da remoto. Per connetterti, devi fornire le tue credenziali di accesso.

#### Informazioni Richieste:
Per Seat, Cupra, Skoda, Volkswagen e Tronity:
- **Marchio**: Il marchio del produttore.
- **Nome Utente**: L'indirizzo email utilizzato per accedere al servizio del produttore.
- **Password**: La password per il tuo account del produttore.
- **Codice PIN**: Un codice di 4 cifre richiesto per l'accesso remoto a determinate funzionalità del veicolo.
- **Intervallo di Aggiornamento**: Definisce con quale frequenza (in secondi) i dati del veicolo vengono aggiornati.
  - **Attenzione:** Impostare una frequenza di aggiornamento troppo elevata potrebbe superare i limiti di richiesta API imposti dal produttore, risultando in restrizioni temporanee di accesso.

⚠️ Puoi utilizzare 2 account per 2 marchi diversi o 2 auto dello stesso marchio che non sono collegate allo stesso account.

Per volvo:
- **API Key primaria**: Chiave API primaria di Volvo.
- **API Key secondaria**: Chiave API secondaria di Volvo.
- **Token Veicolo**: Token di accesso per il veicolo.
- **Token Posizione Veicolo**: Token di accesso per l'endpoint della posizione.
- **Intervallo di Aggiornamento**: Definisce con quale frequenza (in secondi) i dati del veicolo vengono aggiornati.
  - **Attenzione:** Impostare una frequenza di aggiornamento troppo elevata potrebbe superare i limiti di richiesta API imposti dal produttore, risultando in restrizioni temporanee di accesso.

### 3. Configurazione MQTT (Obbligatoria)
Devi utilizzare **MQTT** per inviare i dati del veicolo a home assistant, configura queste impostazioni:
- **Nome Utente**: Accesso al broker MQTT
- **Password**: Password del broker MQTT
- **Indirizzo Broker**: IP o nome di dominio del server MQTT

⚠️ Se non stai già utilizzando MQTT su Home assistant, puoi aggiungere, ad esempio, [Mosquito addon E integrazione MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Puoi visitare http//x.x.x.x:4000 La WEBUI di Carconnectivity:
- **Nome Utente**: login
- **Password**: password
- **Porta WEBUI**: 4000

### 5. Livello di Registrazione
Definisci la quantità di informazioni registrate nei log:
- **Info**: Mostra informazioni operative generali.
- **Warning**: Mostra solo avvisi.
- **