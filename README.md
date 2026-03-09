# ⚔️ New World Online

> *Un projet de serveur Garry's Mod médiéval-fantastique, entièrement fait main.*

**New World Online** (NWO) est avant tout un **projet de développement** — une vitrine technique construite sur **Garry's Mod**. L'objectif est de concevoir, de zéro, un ensemble de systèmes de jeu cohérents dans un univers médiéval-fantastique. Chaque joueur incarne **un seul et unique personnage**, persistant entre les sessions, dans une expérience orientée **solo ou coopération**.

---

## 🌍 Le concept

Un monde médiéval-fantastique comme toile de fond, avec des systèmes pensés pour être complets et robustes : personnage unique par joueur, économie, magie, guildes, combats. Chaque brique est développée sur-mesure, sans dépendance à des solutions tierces.

---

## 🔧 Systèmes développés

| Système | Description | État |
|---------|-------------|------|
| 🧍 Personnage | Un personnage unique et persistant par joueur | ✅ En cours |
| ⚔️ Combat | Affrontements solo ou en coopération | 🔜 Prévu |
| 🏰 Guildes / Factions | Créer ou rejoindre une organisation | 🔜 Prévu |
| 🪙 Économie | Marché, transactions, gestion des ressources | 🔜 Prévu |
| 🔮 Magie / Classes | Progression et spécialisation du personnage | 🔜 Prévu |
| 📜 Quêtes / Events | Contenu dynamique et événements en jeu | 🔜 Prévu |
| 🎒 Craft / Inventaire | Fabrication d'objets et gestion de l'inventaire | 🔜 Prévu |
| 🗺️ Maps | Cartes entièrement sur-mesure — textures, modèles et assets 100% personnalisés | 🚧 En création |

---

## 📦 Prérequis

NWO repose sur **GLibs** qui nécessite l'installation de la DLL **MySQLoo** sur le serveur.

Téléchargez la version correspondant à votre système :

| Plateforme | Lien |
|------------|------|
| Windows 32 bits | [gmsv_mysqloo_win32.dll](https://github.com/FredyH/MySQLOO/releases/latest/download/gmsv_mysqloo_win32.dll) |
| Windows 64 bits | [gmsv_mysqloo_win64.dll](https://github.com/FredyH/MySQLOO/releases/latest/download/gmsv_mysqloo_win64.dll) |
| Linux 32 bits | [gmsv_mysqloo_linux.dll](https://github.com/FredyH/MySQLOO/releases/latest/download/gmsv_mysqloo_linux.dll) |
| Linux 64 bits | [gmsv_mysqloo_linux64.dll](https://github.com/FredyH/MySQLOO/releases/latest/download/gmsv_mysqloo_linux64.dll) |

Placez le fichier dans le dossier `garrysmod/lua/bin/` de votre serveur.

> Sans MySQLoo, GLibs ne pourra pas charger son module MySQL. Le module SQLite reste fonctionnel sans cette dépendance.

---

## 🏗️ Comment c'est construit

NWO est développé entièrement en **Lua**, le langage de script natif de Garry's Mod. Aucun framework existant n'a été utilisé — tout repose sur une bibliothèque personnelle appelée **GLibs** (intégrée au framework **GPYMOUSSS**), conçue de façon généraliste pour simplifier et automatiser les tâches longues et répétitives dans tout type de projet Garry's Mod lourd — gamemodes, addons complexes, systèmes persistants.

Elle embarque :
- Un **système d'interface graphique** responsive, adapté à toutes les résolutions
- Une **couche base de données** abstraite compatible SQLite et MySQL
- Un **système d'animations** et de transitions sur tous les menus
- Une architecture **modulaire** : chaque fonctionnalité est un bloc indépendant et rechargeable

---

## 📸 Aperçu

> *Les captures d'écran et vidéos arriveront au fil du développement.*

---

## 📌 État du projet

> 🔧 Version `0.0.0` — *Developer build*  
> Le monde n'a pas encore de nom. Il est en train d'être créé.

---

*New World Online — un monde qui se construit un système à la fois.*