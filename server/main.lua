local trees = {}
local oxInventory = nil
local ESX = nil
local QBCore = nil

local function debugPrint(...)
    if Config.Debug then
        print('[cayo_wood]', ...)
    end
end

local function initDependencies()
    if GetResourceState('ox_inventory') == 'started' then
        oxInventory = exports.ox_inventory
    end

    if GetResourceState('es_extended') == 'started' then
        ESX = exports.es_extended:getSharedObject()
    end

    if GetResourceState('qb-core') == 'started' then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end

local function initTrees()
    trees = {}
    for i = 1, #Config.Trees do
        trees[i] = { available = true, nextReady = 0 }
    end
end

local function giveReward(source)
    local amount = math.random(Config.RewardAmount.min, Config.RewardAmount.max)

    if oxInventory and oxInventory.AddItem then
        local added = oxInventory:AddItem(source, Config.RewardItem, amount)
        return added, amount
    end

    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.addInventoryItem(Config.RewardItem, amount)
            return true, amount
        end
    end

    if QBCore then
        local player = QBCore.Functions.GetPlayer(source)
        if player then
            player.Functions.AddItem(Config.RewardItem, amount)
            return true, amount
        end
    end

    return false, amount
end

local function setTreeCooldown(index)
    local tree = trees[index]
    if not tree then return end

    tree.available = false
    tree.nextReady = os.time() + math.floor(Config.Cooldown / 1000)
    TriggerClientEvent('cayo_wood:updateTree', -1, index, tree)

    SetTimeout(Config.Cooldown, function()
        tree.available = true
        tree.nextReady = 0
        TriggerClientEvent('cayo_wood:updateTree', -1, index, tree)
    end)
end

RegisterNetEvent('cayo_wood:requestState', function()
    local src = source
    TriggerClientEvent('cayo_wood:syncTrees', src, trees)
end)

RegisterNetEvent('cayo_wood:harvest', function(index)
    local src = source
    local treeConfig = Config.Trees[index]
    local tree = trees[index]

    if not treeConfig or not tree then
        debugPrint('Arbre inconnu :', index)
        return
    end

    if not tree.available then
        TriggerClientEvent('cayo_wood:harvestResult', src, false, Config.Locale.cooldown)
        return
    end

    local ped = GetPlayerPed(src)
    if not ped or ped == 0 then return end

    local playerCoords = GetEntityCoords(ped)
    local distance = #(playerCoords - treeConfig.coords)
    if distance > (Config.InteractDistance + 3.0) then
        TriggerClientEvent('cayo_wood:harvestResult', src, false, Config.Locale.tooFar)
        return
    end

    if Config.RequireWeapon then
        local weapon = GetSelectedPedWeapon(ped)
        if weapon ~= GetHashKey(Config.RequireWeapon) then
            TriggerClientEvent('cayo_wood:harvestResult', src, false, ('Vous devez utiliser %s.'):format(Config.RequireWeapon))
            return
        end
    end

    setTreeCooldown(index)

    local success, amount = giveReward(src)
    if success then
        TriggerClientEvent('cayo_wood:harvestResult', src, true, string.format(Config.Locale.reward, amount))
    else
        TriggerClientEvent('cayo_wood:harvestResult', src, true, Config.Locale.noReward)
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    initDependencies()
    initTrees()
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    trees = {}
end)
