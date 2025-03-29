![Prend en charge l'architecture aarch64][aarch64-shield]  
![Prend en charge l'architecture amd64][amd64-shield]  
![Prend en charge l'architecture armhf][armhf-shield]  
![Prend en charge l'architecture armv7][armv7-shield]  
![Prend en charge l'architecture i386][i386-shield]  
[![Code source GitHub](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)  
[![Version GitHub (la plus récente par date)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)  
[![Issues GitHub](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)  

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg  
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg  
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg  
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg  
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg  

# Add-on Home Assistant : CarConnectivity  

|         | Stable                                                                                                                         | Edge                                                                                                                                         |  
| ------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |  
| Version | [![Version Docker GitHub (la plus récente par date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Version de l'image Docker (dernier semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |  

# Guide de Configuration de l'Add-on CarConnectivity  

## Introduction  

Le module **CarConnectivity-Addon** vous permet de connecter et de récupérer des informations sur votre véhicule auprès des services en ligne de constructeurs compatibles. Ce guide explique comment configurer correctement le module.  
Je me contente d'empaqueter le [travail excellent réalisé par Till.](https://github.com/tillsteinbach/CarConnectivity)  

Son travail est également disponible sous forme d'images docker. Ainsi, si vous utilisez Home Assistant comme un docker autonome, vous pouvez également l'utiliser directement.  

**⚠️ Le projet est encore en développement, avec l'ingénierie inverse de l'API à compléter et la communication avec MQTT/Home Assistant à adapter. ⚠️**  

![Voiture connectée comme appareil MQTT](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/mqtt_device.png)  

## Ajouter un dépôt  

[![Add-on Home Assistant](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)  

## Configuration Générale  

Ne renseignez que les paramètres des marques de véhicules que vous possédez. **Laissez tous les autres champs vides.**  

### 1. Sélection de la Marque de Votre Véhicule  
Choisissez le constructeur correspondant à votre véhicule parmi les marques prises en charge :  
- **Seat**  
- **Cupra**  
- **Skoda**  
- **Volkswagen**  
- **Tronity**  

Si vous possédez plusieurs véhicules de différentes marques, vous pouvez configurer plusieurs sections.  

### 2. Connexion aux Services en Ligne du Constructeur  
Chaque constructeur automobile fournit un service en ligne qui vous permet d'accéder à distance aux données de votre véhicule. Pour vous connecter, vous devez fournir vos identifiants de connexion.  

#### Informations Requises :  
- **Marque** : La marque du constructeur.  
- **Nom d'utilisateur** : L'adresse e-mail utilisée pour se connecter au service du constructeur.  
- **Mot de passe** : Le mot de passe de votre compte constructeur.  
- **Code PIN** : Un code à 4 chiffres requis pour accéder à distance à certaines fonctionnalités du véhicule.  
- **Intervalle de Rafraîchissement** : Définit la fréquence (en secondes) de mise à jour des données du véhicule.  
  - **Avertissement :** Définir une fréquence de rafraîchissement trop élevée peut dépasser les limites de requêtes API imposées par le constructeur, entraînant des restrictions d'accès temporaires.  

⚠️ Vous pouvez utiliser 2 comptes pour 2 marques différentes ou 2 voitures d'une même marque qui ne sont pas liées au même compte.  

### 3. Configuration MQTT (Obligatoire)  
Vous devez utiliser **MQTT** pour envoyer les données du véhicule à Home Assistant, configurez ces paramètres :  
- **Nom d'utilisateur** : Identifiant du broker MQTT  
- **Mot de passe** : Mot de passe du broker MQTT  
- **Adresse du Broker** : IP ou nom de domaine du serveur MQTT  

⚠️ Si vous n'utilisez pas encore MQTT sur Home Assistant, vous pouvez ajouter par exemple [l'add-on Mosquitto ET l'intégration MQTT](https://www.home-assistant.io/integrations/mqtt)  

### 4. WEBUI  
Vous pouvez visiter http//x.x.x.x:4000 la WEBUI de CarConnectivity :  
- **Nom d'utilisateur** : login  
- **Mot de passe** : mot de passe  
- **Port WEBUI** : 4000  

![Vue WEBUI](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/img/webui_view.jpeg)  

### 5. Niveau de Journalisation  
Définissez la quantité d'informations enregistrées dans les journaux :  
- **Info** : Affiche des informations générales de fonctionnement.  
- **Warning** : Affiche uniquement les avertissements.  
- **Error** : Affiche uniquement les messages d'erreur.  
- **Debug** : Affiche des détails supplémentaires utiles pour le dépannage.  

### 6. Niveau de Journalisation API  
Définissez la quantité d'informations enregistrées dans les journaux :  
- **Info** : Affiche des informations générales de fonctionnement.  
- **Warning** : Affiche uniquement les avertissements.  
- **Error** : Affiche uniquement les messages d'erreur.  
- **Debug** : Affiche des détails supplémentaires utiles pour le dépannage.  

## Meilleures Pratiques  
- **Ne renseignez que les paramètres pour les marques de véhicules que vous possédez.**  
- **Ne partagez pas vos identifiants de connexion.**  
- **Adaptez l'intervalle de rafraîchissement pour éviter de dépasser les limites de requêtes API. Rappelez-vous que la limite semble être d'environ 1000 requêtes/jour.**  
- **Utilisez le niveau de journalisation "Debug" uniquement pour résoudre les problèmes.**  

---  

Si vous avez des questions ou rencontrez des problèmes lors de la configuration, reportez-vous à la documentation du module.  
Si vous trouvez un bug, veuillez ouvrir une issue.  