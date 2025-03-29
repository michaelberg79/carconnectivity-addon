![Prend en charge l'architecture aarch64][aarch64-shield]  
![Prend en charge l'architecture amd64][amd64-shield]  
![Prend en charge l'architecture armhf][armhf-shield]  
![Prend en charge l'architecture armv7][armv7-shield]  
![Prend en charge l'architecture i386][i386-shield]  
[![Code source GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![Version GitHub (dernière par date)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![Problèmes GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Add-on Home Assistant : CarConnectivity  

|         | Stable                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![Version GitHub (dernière par date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Version d'image Docker (dernière semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guide de configuration de CarConnectivity-Addon  

## Introduction  

Le module **CarConnectivity-Addon** vous permet de vous connecter et de récupérer des informations sur votre véhicule à partir des services en ligne des fabricants compatibles. Ce guide explique comment configurer correctement le module.  
Je regroupe simplement le [travail excellent réalisé par Till.](https://github.com/tillsteinbach/CarConnectivity)  

Son travail est également disponible sous forme d'images docker. Donc, si vous utilisez Home Assistant comme un docker autonome, vous pouvez l'utiliser directement aussi.  

**⚠️Le projet est encore en développement, avec l'ingénierie inverse de l'api à compléter et la communication avec MQTT/Home assistant à adapter.⚠️**  

![Voiture connectée en tant que dispositif MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Ajouter un dépôt  

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configuration générale  

Remplissez uniquement les paramètres pour les marques de véhicules que vous possédez. **Laissez tous les autres champs vides.**  

### 1. Sélection de la marque de votre véhicule  
Choisissez le fabricant correspondant à votre véhicule parmi les marques prises en charge :  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Si vous possédez plusieurs véhicules de différentes marques, vous pouvez configurer plusieurs sections.  

### 2. Connexion aux services en ligne du fabricant  
Chaque constructeur automobile propose un service en ligne qui vous permet d'accéder aux données de votre véhicule à distance. Pour vous connecter, vous devez fournir vos identifiants de connexion.  

#### Informations requises :  
- **Marque** : La marque du fabricant.  
- **Nom d'utilisateur** : L'adresse e-mail utilisée pour se connecter au service du fabricant.  
- **Mot de passe** : Le mot de passe de votre compte fabricant.  
- **Code PIN** : Un code à 4 chiffres requis pour l'accès à distance à certaines fonctionnalités du véhicule.  
- **Intervalle de rafraîchissement** : Déf