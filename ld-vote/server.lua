
            
            local ESX, oylar	 = nil, {}
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            
            ESX.RegisterServerCallback("ld-vote:server:isVoted", function(source, cb)
                local xPlayer = ESX.GetPlayerFromId(source)
                if oylar[xPlayer.getIdentifier()] == nil then
                    cb(false)
                else
                    cb(true)
                end
            end)
            
            RegisterServerEvent("ld-vote:server:postedVote")
            AddEventHandler("ld-vote:server:postedVote", function(kim)
                local xPlayer = ESX.GetPlayerFromId(source)
                oylar[xPlayer.getIdentifier()] = "kullandi"
                if oylar[kim] == nil then
                    oylar[kim] = 1 
                else
                    oylar[kim] = oylar[kim] + 1
                end
                SaveResourceFile(GetCurrentResourceName(), "data.json", json.encode(oylar))
            end)
            
            CreateThread(function()
                local result = json.decode(LoadResourceFile(GetCurrentResourceName(), "data.json"))
            
                if result then
                    oylar = result
                end
            end)
            




       