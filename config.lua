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
    { coords = vector3(4483.12, -4445.32, 4.7), heading = 210.0 },
    { coords = vector3(4510.45, -4482.75, 4.9), heading = 192.0 },
    { coords = vector3(4541.87, -4515.63, 4.8), heading = 205.0 },
    { coords = vector3(4582.3, -4528.92, 4.6), heading = 180.0 },
    { coords = vector3(4615.24, -4471.21, 4.5), heading = 165.0 },
    { coords = vector3(4662.13, -4439.12, 4.4), heading = 150.0 },
    { coords = vector3(4703.54, -4455.78, 5.0), heading = 140.0 },
    { coords = vector3(4725.9, -4498.63, 5.2), heading = 160.0 },
    { coords = vector3(4762.33, -4540.15, 6.1), heading = 170.0 },
    { coords = vector3(4805.11, -4581.44, 6.2), heading = 188.0 },
    { coords = vector3(4842.55, -4619.22, 6.3), heading = 200.0 },
    { coords = vector3(4885.77, -4650.13, 6.5), heading = 210.0 },
    { coords = vector3(4920.8, -4688.5, 6.7), heading = 220.0 },
    { coords = vector3(4955.44, -4720.33, 6.9), heading = 200.0 },
    { coords = vector3(4992.18, -4749.66, 7.1), heading = 185.0 },
    { coords = vector3(5035.37, -4765.88, 7.3), heading = 175.0 },
    { coords = vector3(5072.4, -4790.11, 7.4), heading = 160.0 },
    { coords = vector3(5110.77, -4822.56, 8.0), heading = 145.0 },
    { coords = vector3(5154.22, -4838.65, 8.2), heading = 130.0 },
    { coords = vector3(5190.61, -4859.14, 8.3), heading = 120.0 },
    { coords = vector3(5224.45, -4875.02, 8.4), heading = 110.0 },
    { coords = vector3(5258.12, -4890.44, 8.6), heading = 95.0 },
    { coords = vector3(5295.55, -4905.21, 8.7), heading = 85.0 },
    { coords = vector3(5328.34, -4932.77, 9.0), heading = 75.0 },
    { coords = vector3(5362.44, -4950.55, 9.2), heading = 60.0 },
    { coords = vector3(5398.12, -4971.31, 9.3), heading = 45.0 },
    { coords = vector3(5425.44, -4935.98, 9.1), heading = 30.0 },
    { coords = vector3(5402.31, -4892.12, 9.0), heading = 25.0 },
    { coords = vector3(5370.12, -4855.45, 9.0), heading = 15.0 },
    { coords = vector3(5333.88, -4820.77, 8.8), heading = 355.0 },
    { coords = vector3(5288.65, -4792.31, 8.7), heading = 340.0 },
    { coords = vector3(5244.55, -4765.01, 8.5), heading = 330.0 },
    { coords = vector3(5202.11, -4740.56, 8.2), heading = 320.0 },
    { coords = vector3(5158.77, -4710.22, 7.8), heading = 310.0 },
    { coords = vector3(5115.3, -4691.14, 7.3), heading = 300.0 },
    { coords = vector3(5070.44, -4672.55, 6.9), heading = 290.0 },
    { coords = vector3(5032.13, -4640.11, 6.2), heading = 280.0 },
    { coords = vector3(4995.22, -4610.44, 6.0), heading = 270.0 },
    { coords = vector3(4951.33, -4582.75, 5.7), heading = 260.0 },
    { coords = vector3(4910.45, -4550.33, 5.4), heading = 250.0 },
    { coords = vector3(4872.11, -4519.88, 5.0), heading = 240.0 },
    { coords = vector3(4832.77, -4485.22, 4.8), heading = 230.0 },
    { coords = vector3(4798.21, -4450.66, 4.7), heading = 220.0 },
    { coords = vector3(4762.45, -4418.34, 4.5), heading = 210.0 },
    { coords = vector3(4720.33, -4390.55, 4.4), heading = 200.0 },
    { coords = vector3(4680.44, -4362.77, 4.3), heading = 190.0 },
    { coords = vector3(4635.66, -4345.12, 4.2), heading = 180.0 },
}

Config.Locale = {
    prompt = 'Appuyez sur ~INPUT_PICKUP~ pour couper du bois',
    busy = 'Vous êtes déjà en train de couper.',
    cooldown = 'Cet arbre se repose encore.',
    reward = 'Vous avez obtenu %sx bois.',
    noReward = "Récolte terminée, mais aucun système d'inventaire n'a répondu.",
    tooFar = "Vous êtes trop loin de l'arbre.",
}
