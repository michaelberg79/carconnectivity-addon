![Supports aarch64 Architecture][aarch64-shield]![Supports amd64 Architecture][amd64-shield]![Supports armhf Architecture][armhf-shield]![Supports armv7 Architecture][armv7-shield]![Supports i386 Architecture][i386-shield][![GitHub sourcecode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/Pulpyyyy/carconnectivity-addon/)[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/releases/latest)[![GitHub issues](https://img.shields.io/github/issues/Pulpyyyy/carconnectivity-addon)](https://github.com/Pulpyyyy/carconnectivity-addon/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg

[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg

[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg

[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# `Home Assistant Add-on: CarConnectivity`

|         | `Stable`                                                                                                                                                                                                     | `Edge`                                                                                                                                                                                                                                                          |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version | [![GitHub release (latest by date)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/pulpyyyy/carconnectivity-addon/releases) | [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/pulpyyyy/carconnectivity-addon-edge-amd64?&sort=date&label=&style=for-the-badge)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/carconnectivity-addon-edge/CHANGELOG.md) |

# Guides traduits

[![French](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/FR.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.fr.md)[![Italian](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/IT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.it.md)[![German](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/DE.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.de.md)[![Spanish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/ES.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.es.md)[![Polish](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PL.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pl.md)[![Portuguese](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/PT.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.pt.md)[![English](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/US.svg)](https://github.com/Pulpyyyy/carconnectivity-addon/blob/main/README.md)

## Introduction

`CarConnectivity-Addon`Vous permet de connecter et de récupérer des informations sur votre véhicule à partir des services en ligne des fabricants compatibles. Ce guide explique comment configurer correctement le module.
Je suis simplement emballé[Le travail (excellent) fait par Till.](https://github.com/tillsteinbach/CarConnectivity)

Son travail est également disponible sous forme d'images Docker. Donc si vous utilisez`Home Assistant`En tant que autonome`docker`, you can directly use it too.

**⚠️ Le projet est toujours en cours de développement,`reverse engineering`de l'API à terminer et la communication avec MQTT / Assistant à domicile à adapter.**

## Ajouter le référentiel

[![\`Addon Home Assistant\`](https://raw.githubusercontent.com/Pulpyyyy/carconnectivity-addon/refs/heads/main/.github/img/addon-ha.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPulpyyyy%2Fcarconnectivity-addon)

## Configuration générale

Remplissez uniquement les paramètres des marques de véhicules que vous possédez.**Laissez tous les autres champs vides.**

### 1. Sélection de votre marque de véhicule

Choisissez le fabricant correspondant à votre véhicule dans les marques prises en charge:

-   `Seat`
-   `Cupra`
-   `Skoda`
-   `Volkswagen`
-   `Tronity`
-   `Volvo`

Si vous possédez plusieurs véhicules à partir de différentes marques, vous pouvez configurer plusieurs sections.

### 2. Connexion aux services en ligne du fabricant

Chaque constructeur automobile fournit un service en ligne qui vous permet d'accéder aux données de votre véhicule à distance. Pour vous connecter, vous devez fournir vos informations d'identification de connexion.

#### Informations requises:

Pour`seat`,`Cupra`, Skoda, Volkswagen et Tronity:

-   `Brand`: La marque du fabricant.
-   `Username`: L'adresse e-mail utilisée pour se connecter au service du fabricant.
-   `Password`: Le mot de passe de votre compte fabricant.
-   `PIN Code`: Un code à 4 chiffres requis pour l'accès à distance à certaines fonctionnalités du véhicule.
-   `Refresh Interval`: Définit la fréquence à la mise à jour des données du véhicule.
-   `Warning:`La définition d'un taux de rafraîchissement trop fréquemment peut dépasser les limites de demande de l'API imposées par le fabricant, ce qui entraîne des restrictions d'accès temporaires.

⚠️ Vous pouvez utiliser 2 comptes pour 2 marques différentes ou 2 voitures d'une même marque qui ne sont pas liées au même compte.

Pour Volvo:

-   `API Key primary`: Clé primaire de l'API Volvo.
-   `API Key secondary`: Clé secondaire de l'API Volvo.
-   `Vehicule Token`: Jeton d'accès pour le véhicule.
-   `Vehicule Location Token`: Jeton d'accès pour le point de terminaison de l'emplacement.
-   `Refresh Interval`: Définit la fréquence à la mise à jour des données du véhicule.
-   `Warning:`La définition d'un taux de rafraîchissement trop fréquemment peut dépasser les limites de demande de l'API imposées par le fabricant, ce qui entraîne des restrictions d'accès temporaires.

### 3. Configuration MQTT (obligatoire)

Vous devez utiliser`MQTT`pour envoyer des données de véhicule à`Home Assistant`, Configurez ces paramètres:

-   `Username`: Connexion du courtier MQTT
-   `Password`: Mot de passe du courtier MQTT
-   `Broker Address`: IP ou nom de domaine du serveur MQTT

⚠️ Si vous n'utilisez pas déjà MQTT`Home Assistant`, vous pouvez ajouter, par exemple,[`Mosquito Addon`et`MQTT integration`](https://www.home-assistant.io/integrations/mqtt)

### 4.`WEBUI`

Vous pouvez visiter http // x.x.x.x: 4000 le`WEBUI`depuis`Carconnectivity`:

-   `Username`: se connecter
-   `Password`: mot de passe
-   `WEBUI Port`: 4000

### 5. Niveau de journalisation

Définissez la quantité d'informations enregistrées dans les journaux:

-   `Info`: Affiche des informations opérationnelles générales.
-   `Warning`: Affiche uniquement les avertissements.
-   `Error`: Affiche uniquement les messages d'erreur.
-   `Debug`: Affiche des détails supplémentaires utiles pour le dépannage.

### 6. Niveau de journalisation de l'API

Définissez la quantité d'informations enregistrées dans les journaux:

-   `Info`: Affiche des informations opérationnelles générales.
-   `Warning`: Affiche uniquement les avertissements.
-   `Error`: Affiche uniquement les messages d'erreur.
-   `Debug`: Affiche des détails supplémentaires utiles pour le dépannage.

### 7. Mode expert

Le mode expert permet d'utiliser toutes les fonctions de carconnectivité native, y compris celles non disponibles via l'interface graphique, tant que les fonctions correspondantes sont prises en charge par les binaires complémentaires.

⚠️ AVERTISSEMENT:
Ce mode désactive toutes les vérifications de la validation et de la sécurité du contenu. En conséquence, même une petite erreur (comme une syntaxe JSON non valide) peut empêcher le module complémentaire de se lancer correctement.

Le mode expert est uniquement destiné aux utilisateurs avancés.
Pour l'utiliser en toute sécurité, vous devez:

Familiarisez-vous avec la syntaxe et la structure JSON.

Le mode expert permet d'utiliser un fichier de configuration personnalisé. Lorsque ce mode est activé, l'utilisateur peut fournir un fichier nommé`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.expert.json`contenant les paramètres souhaités. Cela remplace complètement la configuration à partir de l'interface graphique, qui sera disponible en`/addon_configs/1b1291d4_carconnectivity-addon/carconnectivity.UI.json`. Le répertoire`/addon_configs/1b1291d4_carconnectivity-addon/`peut ne pas apparaître dans le`Home Assistant` file system. If this is the case, the supervisor should be restarted.

Reportez-vous à la documentation officielle de carconnectivité pour la liste des fonctions prises en charge et des paramètres attendus.

## Meilleures pratiques

-   **Remplissez uniquement les paramètres des marques de véhicules que vous possédez.**
-   \***\* Ne partagez pas vos informations d'identification de connexion. \*\***
-   **Ajustez l'intervalle de rafraîchissement pour éviter de dépasser les limites de demande d'API. N'oubliez pas que la limite semble être d'environ 1000 req / jour.**
-   **Utilisez le niveau de journalisation "de débogage" uniquement lors du dépannage des problèmes.**\`\*\*

* * *

Si vous avez des questions ou des problèmes de rencontre pendant la configuration, reportez-vous à la documentation du module.
Si vous trouvez un bogue, veuillez ouvrir un problème.
