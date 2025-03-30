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

# Add-on Home Assistant : CarConnectivity

|         | Stable                                                                                                                         | Edge                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Version | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |


# Guide de Configuration de CarConnectivity-Addon

## Introduction

Le module **CarConnectivity-Addon** vous permet de connecter et de récupérer des informations sur votre véhicule à partir des services en ligne des fabricants compatibles. Ce guide explique comment configurer correctement le module.
Je regroupe simplement le [travail excellent réalisé par Till.](https://github.com/tillsteinbach/CarConnectivity)

Son travail est également disponible sous forme d'images docker. Donc, si vous utilisez Home Assistant en tant que docker autonome, vous pouvez également l'utiliser directement.

**⚠️Le projet est encore en développement, avec l'ingénierie inverse de l'api à compléter et la communication avec MQTT/Home assistant à adapter.⚠️**


![Voiture connectée en tant que dispositif MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)

## Ajouter le dépôt

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuration Générale

Remplissez uniquement les paramètres pour les marques de véhicules que vous possédez. **Laissez tous les autres champs vides.**

### 1. Sélection de la Marque de Votre Véhicule
Choisissez le fabricant correspondant à votre véhicule parmi les marques prises en charge :
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**

Si vous possédez plusieurs véhicules de différentes marques, vous pouvez configurer plusieurs sections.

### 2. Connexion aux Services en Ligne du Fabricant
Chaque constructeur automobile propose un service en ligne qui vous permet d'accéder aux données de votre véhicule à distance. Pour vous connecter, vous devez fournir vos identifiants de connexion.

#### Informations Requises :
- **Marque** : La marque du fabricant.
- **Nom d'utilisateur** : L'adresse e-mail utilisée pour se connecter au service du fabricant.
- **Mot de passe** : Le mot de passe de votre compte fabricant.
- **Code PIN** : Un code à 4 chiffres requis pour l'accès à distance à certaines fonctionnalités du véhicule.
- **Intervalle de Rafraîchissement** : Définit la fréquence (en secondes) à laquelle les données du véhicule sont mises à jour.
  - **Avertissement :** Définir un taux de rafraîchissement trop fréquent peut dépasser les limites de requêtes API imposées par le fabricant, entraînant des restrictions d