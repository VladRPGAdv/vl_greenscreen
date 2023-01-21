vRP = Proxy.getInterface("vRP")

local CreateThread = Citizen.CreateThread
local cam
local isInGreenScreen = false


-- CreateThread(function()

--     while true do
--         Wait(1000)

--         while isGreenGreenActive do
--             Wait(1)
--             DrawMarker(43, VL.GreenScreenLocation[1], VL.GreenScreenLocation[2], VL.GreenScreenLocation[3] + 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 100.0, 100.0, -900.0, 0, 255, 0, 255, false, false, 2, nil, nil, false)
--         end

--     end

-- end)

RegisterCommand("greenscreen", function()
    if not isInGreenScreen then
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        SetCamCoord(cam, VL.CoordsTOTP[1], VL.CoordsTOTP[2], VL.CoordsTOTP[3])
        PointCamAtCoord(cam, VL.VehicleSpawn[1], VL.VehicleSpawn[2], VL.VehicleSpawn[3])
        RenderScriptCams(1, 0, 0, 1, 1)
        isInGreenScreen = true

        FreezeEntityPosition(PlayerPedId(), true)
        
        isGreenGreenActive = true
        vRP.notify({"Se incarca..."})

        Wait(1000)

        Citizen.CreateThread(function()
            while isGreenGreenActive do
                Wait(1)
                DrawMarker(43, VL.GreenScreenLocation[1], VL.GreenScreenLocation[2], VL.GreenScreenLocation[3] + 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 100.0, 100.0, -900.0, 0, 255, 0, 255, false, false, 2, nil, nil, false)
            end
        end)
        
        vRP.notify({"Esti in greenscreen"})
        DisplayRadar(false)
        for k,v in pairs(VL.VehiclesToScreenshot) do
            Wait(1000)

            local ModelHash = v
            RequestModel(ModelHash)
            while not HasModelLoaded(ModelHash) do
                Citizen.Wait(1)
            end
            local Vehicle = CreateVehicle(ModelHash, VL.VehicleSpawn[1], VL.VehicleSpawn[2], VL.VehicleSpawn[3], 278.737457, true, true, true)
            FreezeEntityPosition(Vehicle, true)

            if GetVehicleClass(Vehicle) == 14 then SetCamCoord(cam, VL.CoordsTOTP[1]+5, VL.CoordsTOTP[2], VL.CoordsTOTP[3])
            elseif GetVehicleClass(Vehicle) == 8 then SetCamCoord(cam, VL.CoordsTOTP[1]-2, VL.CoordsTOTP[2], VL.CoordsTOTP[3])
            elseif GetVehicleClass(Vehicle) == 20 then SetCamCoord(cam, VL.CoordsTOTP[1]+3, VL.CoordsTOTP[2], VL.CoordsTOTP[3])
            else SetCamCoord(cam, VL.CoordsTOTP[1], VL.CoordsTOTP[2], VL.CoordsTOTP[3]) end

            Wait(1000)

            exports['screenshot-basic']:requestScreenshotUpload(VL.webhook, 'files[]', function(data)end)

            Wait(1000)

            DeleteVehicle(Vehicle)
        end

        if VL.HelpMessage then
            TriggerServerEvent("vl:triggerHelpMessage")
        end

        DestroyCam(cam, false)
        SetCamActive(cam, false)
        RenderScriptCams(0, false, 100, false, false)
        FreezeEntityPosition(PlayerPedId(), false)
        isGreenGreenActive = false
        DisplayRadar(true)
    else
        vRP.notify({"Esti deja intr-un proces de fotografiere"})
    end
end)