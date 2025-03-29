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

# Home Assistant Add-on: CarConnectivity  

|         | Stabile                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![Rilascio GitHub (ultimo per data)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Versione immagine Docker (ultimo semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guida alla configurazione di CarConnectivity-Addon  

## Introduzione  

Il modulo **CarConnectivity-Addon** ti consente di connetterti e recuperare informazioni sul tuo veicolo dai servizi online dei produttori compatibili. Questa guida spiega come configurare correttamente il modulo.  
Sto semplicemente impacchettando il [lavoro eccellente svolto da Till.](https://github.com/tillsteinbach/CarConnectivity)  

Il suo lavoro è disponibile anche come immagini docker. Quindi, se stai utilizzando Home Assistant come docker autonomo, puoi usarlo direttamente.  

**⚠️Il progetto è ancora in fase di sviluppo, con l'ingegneria inversa dell'api da completare e la comunicazione con MQTT/Home assistant da adattare.⚠️**  

![Auto connesse come dispositivo MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Aggiungi repository  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configurazione generale  

Compila solo le impostazioni per i marchi di veicoli che possiedi. **Lascia vuoti tutti gli altri campi.**  

### 1. Selezionare il marchio del tuo veicolo  
Scegli il produttore corrispondente al tuo veicolo dai marchi supportati:  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Se possiedi più veicoli di marchi diversi, puoi configurare più sezioni.  

### 2. Connessione ai servizi online del produttore  
Ogni produttore di auto fornisce un servizio online che ti consente di accedere ai dati del tuo veicolo da remoto. Per connetterti, devi fornire le tue credenziali di accesso.  

#### Informazioni richieste:  
- **Marca**: Il marchio del produttore.  
- **Nome utente**: L'indirizzo email utilizzato per accedere al servizio del produttore.  
- **Password**: La password per il tuo account del