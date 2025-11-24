# Récolte de bois - Cayo Perico

Une ressource FiveM standalone pour ajouter des points de coupe de bois sur Cayo Perico. Inclut l'affichage des marqueurs/blips, une animation simple, une mise en attente avec cooldown par arbre et une distribution de récompenses compatible ox_inventory, ESX et QBCore.

## Installation

1. Copiez ce dossier dans `resources/[local]` (ou tout autre répertoire de ressources).
2. Ajoutez `ensure recole` à votre `server.cfg`.
3. Vérifiez que vos items d'inventaire incluent l'objet configuré (par défaut `wood`).

## Configuration rapide

- **config.lua** :
  - `Config.Trees` : positions de chaque arbre sur Cayo Perico.
  - `Config.Cooldown` : temps de réapparition d'un arbre en millisecondes (par défaut 5 minutes).
  - `Config.ProgressTime` : durée de l'animation de coupe en millisecondes.
  - `Config.RewardItem` / `Config.RewardAmount` : item et quantité donnée par récolte.
  - `Config.RequireWeapon` : définir une arme obligatoire (ex. `WEAPON_HATCHET`) ou laisser `nil`.
  - `Config.ShowBlips` / `Config.MarkerDistance` / `Config.InteractDistance` : affichage et portée des interactions.

## Fonctionnement

- Les arbres disponibles affichent un marqueur vert et un blip court-range.
- Le joueur se place proche du tronc et appuie sur **E** pour lancer l'animation de coupe.
- À la fin de l'animation, le serveur valide la distance, applique un cooldown sur l'arbre et distribue la récompense via l'inventaire détecté (ox_inventory > ESX > QBCore). Si aucun inventaire n'est détecté, un message informe qu'aucun item n'a pu être ajouté.

## Adaptation

- Ajoutez ou déplacez des points de coupe directement dans `Config.Trees` avec des `vector3(...)`.
- Activez le mode debug (`Config.Debug = true`) pour obtenir des messages serveur et client.
- Les textes affichés sont centralisés dans `Config.Locale` pour une traduction rapide.
