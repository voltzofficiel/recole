local treeState = {}
local harvesting = false

local function debugPrint(...)
    if Config.Debug then
        print('[cayo_wood]', ...)
    end
end

local function notify(message)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(false, false)
end

local function showHelpText(message)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandDisplayHelp(0, false, false, 0)
end

local function isTreeAvailable(index)
    local state = treeState[index]
    if not state then return true end
    return state.available ~= false
end

local function ensureStateTable(states)
    treeState = states or {}
    for i = 1, #Config.Trees do
        treeState[i] = treeState[i] or { available = true }
    end
end

RegisterNetEvent('cayo_wood:syncTrees', function(states)
    ensureStateTable(states)
    debugPrint(('Synchronisation des arbres (%s)'):format(#treeState))
end)

RegisterNetEvent('cayo_wood:updateTree', function(index, data)
    treeState[index] = data
end)

RegisterNetEvent('cayo_wood:harvestResult', function(success, message)
    harvesting = false
    if message then
        notify(message)
    end
end)

local function startHarvest(index, tree)
    if harvesting then
        notify(Config.Locale.busy)
        return
    end

    harvesting = true
    local ped = PlayerPedId()

    if Config.RequireWeapon then
        local currentWeapon = GetSelectedPedWeapon(ped)
        if currentWeapon ~= GetHashKey(Config.RequireWeapon) then
            harvesting = false
            notify(('Vous devez utiliser %s.'):format(Config.RequireWeapon))
            return
        end
    end

    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_HAMMERING', 0, true)
    local startTime = GetGameTimer()
    local finished = true

    while GetGameTimer() - startTime < Config.ProgressTime do
        Wait(0)
        DisableControlAction(0, 73, true) -- INPUT_VEH_DUCK pour éviter d'annuler
        local distance = #(GetEntityCoords(ped) - tree.coords)
        if distance > (Config.InteractDistance + 2.0) then
            finished = false
            break
        end
    end

    ClearPedTasks(ped)

    if finished then
        TriggerServerEvent('cayo_wood:harvest', index)
    else
        harvesting = false
        notify(Config.Locale.tooFar)
    end
end

CreateThread(function()
    TriggerServerEvent('cayo_wood:requestState')

    if Config.ShowBlips then
        for _, tree in ipairs(Config.Trees) do
            local blip = AddBlipForCoord(tree.coords.x, tree.coords.y, tree.coords.z)
            SetBlipSprite(blip, Config.BlipSprite)
            SetBlipColour(blip, Config.BlipColor)
            SetBlipScale(blip, 0.7)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(Config.BlipLabel)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

CreateThread(function()
    while true do
        local waitTime = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for index, tree in ipairs(Config.Trees) do
            local distance = #(coords - tree.coords)
            if distance < Config.MarkerDistance then
                waitTime = 0
                local available = isTreeAvailable(index)
                local markerColor = available and { 0, 200, 0 } or { 200, 140, 0 }
                DrawMarker(1, tree.coords.x, tree.coords.y, tree.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.6, markerColor[1], markerColor[2], markerColor[3], 150, false, true, 2, false, nil, nil, false)

                if distance <= Config.InteractDistance then
                    showHelpText(Config.Locale.prompt)
                    if IsControlJustReleased(0, Config.InteractKey) then
                        if available then
                            startHarvest(index, tree)
                        else
                            notify(Config.Locale.cooldown)
                        end
                    end
                end
            end
        end

        Wait(waitTime)
    end
end)
