Citizen.CreateThread(function()
  while not NetworkIsSessionStarted() do
    Citizen.Wait(0);
  end

  TriggerServerEvent('oxince-badge:playerConnected');
end);

RegisterNetEvent('oxince-badge:display', function(targetCoords, targetName, targetJob, jobImage)
  local playerPed = PlayerPedId();
  local playerCoords = GetEntityCoords(playerPed);
  
  if GetDistanceBetweenCoords(playerCoords, targetCoords, false) >= Config.DisplayRadius then
    return;
  end

  SendNUIMessage({
    title = string.format(Config.Language['title'], targetJob.label, targetName),
    message = string.format(Config.Language['message'], targetJob.grade, targetJob.grade_label),
    img = jobImage
  });
end);

RegisterKeyMapping('keys-badge', 'Display Badge', 'keyboard', Config.BadgeKey);
RegisterCommand('keys-badge', function()
  TriggerServerEvent('oxince-badge:displayToNearbyPlayers');
end, false);