local QBCore = exports['qb-core']:GetCoreObject()

for k, v in pairs(Config.locations) do
    for i, location in pairs(v) do
        exports['qb-target']:AddBoxZone(k..i, vector3(location.button.x, location.button.y, location.button.z), 1.0, 1.0, {
            name = location.name,
            heading = location.button.w,
            debugPoly = false,
            minZ = location.button.z-1,
            maxZ = location.button.z+1,
        }, {
            options = {
                {
                    label = "Elevator",
                    action = function(entity) 
                        print(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent("re2-elevator:client:showElevatorMenu", {["location"] = k,["index"]=i})
                      end,
                },
            },
            distance = 2
        })
    end
end



RegisterNetEvent('re2-elevator:client:showElevatorMenu', function(data)
    local Locations = Config.locations[data['location']]
    local Elv = {{
        header = data['location'].." Elevator",
        isMenuHeader = true, -- Set to true to make a nonclickable title
    },}
    for i, v in pairs(Locations) do
        local txt =""
        local isDisable = false
        if i ==data['index'] then
            txt="You Are Here"
            isDisable=true
        else
            txt=""
            isDisable=false
        end
        local tempData= {
            header = v.name,
            txt = txt,
            disabled = isDisable,
			params = {
                isServer = false,
                
                event = "re2-elevator:client:teleportTo",
                args = {
                    loc = v['teleport'],
                }
            }
        }
        table.insert(Elv, tempData)
    end
    
    exports['qb-menu']:openMenu(Elv)
end)

RegisterNetEvent('re2-elevator:client:teleportTo', function(data)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then
        QBCore.Functions.Progressbar("Call_The_Lift", "Please Wait for Elevator", 5000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@apt_trans@elevator",
            anim = "elev_1",
            flags = 16,
        }, {}, {}, function() -- Done
            StopAnimTask(ped, "anim@apt_trans@elevator", "elev_1", 1.0)
            DoScreenFadeOut(500)
            Wait(1000)
            if Config.UseSoundEffect then
                TriggerServerEvent("InteractSound_SV:PlayOnSource", "LiftSoundBellRing", 0.05)
            end
            SetEntityCoords(ped, data.loc.x, data.loc.y, data.loc.z, 0, 0, 0, false)
            SetEntityHeading(ped, data.loc.w)
            Wait(1000)
            DoScreenFadeIn(600)
            
        end)
    end
    
end)