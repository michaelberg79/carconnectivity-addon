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

# Home Assistant Add-on: CarConnectivity

|         | Stable                                                                                                                         | Edge                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Version | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# Translated guides

<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.French.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Italian.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1280px-Flag_of_Italy.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.German.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/1280px-Flag_of_Germany.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Spanish.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/1280px-Flag_of_Spain.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Polish.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/1280px-Flag_of_Poland.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.Portuguese.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png" width="40" height="30"></a> 
<a href="https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.md"><img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg" width="40" height="30"></a>



# Guide de configuration de CarConnectivity-Addon

## Introduction

Le module **CarConnectivity-Addon** vous permet de connecter et de récupérer des informations sur votre véhicule à partir des services en ligne des fabricants compatibles. Ce guide explique comment configurer correctement le module.
Je regroupe simplement le [travail excellent réalisé par Till.](https://github.com/tillsteinbach/CarConnectivity)

Son travail est également disponible sous forme d'images docker. Donc, si vous utilisez Home Assistant en tant que docker autonome, vous pouvez également l'utiliser directement.

**⚠️Le projet est encore en développement, avec l'ingénierie inverse de l'api à compléter et la communication avec MQTT/Home assistant à adapter.⚠️**

## Ajouter un dépôt

[![Addon Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuration générale

Remplissez uniquement les paramètres pour les marques de véhicules que vous possédez. **Laissez tous les autres champs vides.**

### 1. Sélectionner votre marque de véhicule
Choisissez le fabricant correspondant à votre véhicule parmi les marques prises en charge :
- **Seat**
- **Cupra**
- **Skoda**
- **Volkswagen**
- **Tronity**
- **Volvo**

Si vous possédez plusieurs véhicules de marques différentes, vous pouvez configurer plusieurs sections.

### 2. Connexion aux services en ligne du fabricant
Chaque fabricant de voiture fournit un service en ligne qui vous permet d'accéder à vos données de véhicule à distance. Pour vous connecter, vous devez fournir vos identifiants de connexion.

#### Informations requises :
Pour Seat, Cupra, Skoda, Volkswagen et Tronity :
- **Marque** : La marque du fabricant.
- **Nom d'utilisateur** : L'adresse e-mail utilisée pour se connecter au service du fabricant.
- **Mot de passe** : Le mot de passe de votre compte fabricant.
- **Code PIN** : Un code à 4 chiffres requis pour l'accès à distance à certaines fonctionnalités du véhicule.
- **Intervalle de rafraîchissement** : Définit la fréquence (en secondes) à laquelle les données du véhicule sont mises à jour.
  - **Avertissement :** Définir un taux de rafraîchissement trop fréquent peut dépasser les limites de demande de l'API imposées par le fabricant, entraînant des restrictions d'accès temporaires.

⚠️ Vous pouvez utiliser 2 comptes pour 2 marques différentes ou 2 voitures d'une même marque qui ne sont pas liées au même compte.

Pour volvo :
- **Clé API principale** : Clé API principale de Volvo.
- **Clé API secondaire** : Clé API secondaire de Volvo.
- **Jeton de véhicule** : Jeton d'accès pour le véhicule.
- **Jeton de localisation du véhicule** : Jeton d'accès pour le point de terminaison de localisation.
- **Intervalle de rafraîchissement** : Définit la fréquence (en secondes) à laquelle les données du véhicule sont mises à jour.
  - **Avertissement :** Définir un taux de rafraîchissement trop fréquent peut dépasser les limites de demande de l'API imposées par le fabricant, entraînant des restrictions d'accès temporaires.

### 3. Configuration MQTT (Obligatoire)
Vous devez utiliser **MQTT** pour envoyer les données du véhicule à l'assistant domestique, configurez ces paramètres :
- **Nom d'utilisateur** : Identifiant du courtier MQTT
- **Mot de passe** : Mot de passe du courtier MQTT
- **Adresse du courtier** : IP ou nom de domaine du serveur MQTT

⚠️ Si vous n'utilisez pas déjà MQTT sur Home assistant, vous pouvez ajouter, par exemple, [l'addon Mosquito ET l'intégration MQTT](https://www.home-assistant.io/integrations/mqtt) 

### 4. WEBUI
Vous pouvez visiter http//x.x.x.x:4000 La WEBUI de Carconnectivity :
- **Nom d'utilisateur** : login
- **Mot de passe** : mot de passe
- **Port WEBUI** : 4000

### 5. Niveau de journalisation
Définissez la quantité d'informations enregistrées dans les journaux :
- **Info** : Affiche des informations générales sur le fonctionnement.
- **Avertissement** : Affiche uniquement les avertissements.
- **Erreur** : Affiche uniquement les messages d'erreur.
- **Debug** : Affiche des détails supplémentaires utiles pour le dépannage.

### 6. Niveau de journalisation de l'API
Définissez la quantité d'informations enregistrées dans les journaux :
- **Info** : Affiche des informations générales sur le fonctionnement.
- **Avertissement** : Affiche uniquement les avertissements.
- **Erreur** : Affiche uniquement les messages d'erreur.
- **Debug** : Affiche des détails supplémentaires utiles pour le dépannage.

## Meilleures pratiques
- **Remplissez uniquement les paramètres pour les marques de véhicules que vous possédez.**
- **Ne partagez pas vos identifiants de connexion.**
- **Ajustez l'intervalle de rafraîchissement pour éviter de dépasser les limites de demande de l'API. La limite semble être d'environ 1000 req/jour**
- **Utilisez le niveau de journalisation "Debug" uniquement lors du dépannage des problèmes.**

---

Si vous avez des questions ou rencontrez des problèmes lors de la configuration, consultez la documentation du module.
Si vous trouvez un bug, veuillez ouvrir un problème.