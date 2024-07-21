local smoking = false

function smokeBong()
    local playerPed = PlayerPedId() 
    local coords = GetEntityCoords(playerPed) 

    ESX.ShowNotification("Rozpalasz wiaderko")
    local ad = "anim@safehouse@bong" 
    local anim = "bong_stage3"

    if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) and not smoking then
        smoking = true
        
        while not HasAnimDictLoaded(ad) do
            RequestAnimDict(ad)
            Wait(1)
        end


        local bongModel = GetHashKey("prop_ld_flow_bottle")
        RequestModel(bongModel)
        while not HasModelLoaded(bongModel) do
            Wait(1)
        end

        local bongProp = CreateObject(bongModel, coords.x, coords.y, coords.z + 2, true, true, true)


        AttachEntityToEntity(bongProp, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, -0.02, 0.01, 95.0, 190.0, 180.0, true, true, false, true, 1, true)
        
        local lighterModel = GetHashKey("p_cs_lighter_01")
        RequestModel(lighterModel)
        while not HasModelLoaded(lighterModel) do
            Wait(1)
        end

        local lighterProp = CreateObject(lighterModel, coords.x, coords.y, coords.z + 2, true, true, true)

        AttachEntityToEntity(lighterProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.02, 0.0, 70.0, 0.0, 170.0, true, true, false, true, 1, true)

        SetFollowPedCamViewMode(4)

        
        TaskPlayAnim(playerPed, ad, anim, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, false, false, false)


        Wait(9000)
        

        DeleteObject(bongProp)
        DeleteObject(lighterProp)
        StopAnimTask(playerPed, ad, anim, 1.0)

        ESX.ShowNotification("Ostro cie porobiło")
        Effect()
        
        SetFollowPedCamViewMode(1)
        
        smoking = false
    end
end

function Effect()
    StartScreenEffect("DrugsMichaelAliensFight", 0, false)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    PlaySoundFromEntity(-1, "DrugsMichaelAliensFightIn", PlayerPedId() , "PLAYER_SWITCH_CUSTOM_SOUNDSET", true, 0)
    Citizen.Wait(30000) 

    
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetPedMotionBlur(playerPed, false)
    StopAllScreenEffects()

    ClearPedTasksImmediately(PlayerPedId())
end

RegisterNetEvent("kriss:jebnijTloka", smokeBong)

