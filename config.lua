Config = {}

-- Interaction
Config.InteractKey = 38 -- E
Config.InteractDistance = 2.0
Config.MarkerDistance = 30.0
Config.ProgressTime = 8000 -- ms

-- Gestion des ressources
Config.Cooldown = 5 * 60 * 1000 -- 5 minutes
Config.RewardItem = 'wood'
Config.RewardAmount = { min = 1, max = 3 }
Config.RequireWeapon = nil -- Exemple: 'WEAPON_HATCHET'

-- Affichage
Config.ShowBlips = true
Config.BlipSprite = 679 -- tronc d'arbre
Config.BlipColor = 2
Config.BlipLabel = 'Bois - Cayo Perico'

Config.Debug = false

-- Points de récolte (Cayo Perico)
Config.Trees = {
    { coords = vector3(5065.35, -4595.44, 2.8), heading = 210.0 },
    { coords = vector3(5103.12, -4619.77, 2.9), heading = 190.0 },
    { coords = vector3(5132.47, -4684.03, 2.4), heading = 130.0 },
    { coords = vector3(5208.61, -4705.12, 5.2), heading = 150.0 },
    { coords = vector3(5255.84, -4761.39, 8.5), heading = 110.0 },
    { coords = vector3(5206.22, -4789.77, 8.8), heading = 70.0 },
}

Config.Locale = {
    prompt = 'Appuyez sur ~INPUT_PICKUP~ pour couper du bois',
    busy = 'Vous êtes déjà en train de couper.',
    cooldown = 'Cet arbre se repose encore.',
    reward = 'Vous avez obtenu %sx bois.',
    noReward = "Récolte terminée, mais aucun système d'inventaire n'a répondu.",
    tooFar = "Vous êtes trop loin de l'arbre.",
}
