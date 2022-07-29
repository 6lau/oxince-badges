local playerNames = {};
local rateLimited = {};

Citizen.CreateThread(function()
  print(string.format('^5%s^0: %s', GetCurrentResourceName(), 'Script made by ^5github.com/oxince^0 -> DC: oxince#1337'));
  
  RegisterNetEvent('oxince-badge:playerConnected', function()
    local source = source;
    local identifier = GetIdentifier(source);
    local playerJob = GetPlayerJob(source);

    GetPlayerFullName(identifier, function(firstname, lastname)
      playerNames[source] = string.format('%s %s', firstname, lastname);
    end);
  end);

  RegisterNetEvent('oxince-badge:displayToNearbyPlayers', function()
    local source = source;

    if rateLimited[source] then
      return;
    end

    local playerPed = GetPlayerPed(source);
    local playerCoords = GetEntityCoords(playerPed);
    local playerJob = GetPlayerJob(source);
    
    if playerNames[source] and playerJob then
      for i = 1, #Config.Jobs do
        local currentJob = Config.Jobs[i];
        if currentJob.name == playerJob.name then
          TriggerClientEvent('oxince-badge:display', -1, playerCoords, playerNames[source], playerJob, currentJob.image);
          return;
        end
      end
    end

    rateLimited[source] = true;
    SetTimeout(function()
      rateLimited[source] = false
    end, 3 * 1000);
  end);
end);

function GetIdentifier(source)
  local playerIdentifiers = GetPlayerIdentifiers(source);
  for key, value in pairs(playerIdentifiers) do
    if string.find(value, 'license:') then
      return value;
    end
  end
  return false;
end