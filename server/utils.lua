TriggerEvent('esx:getSharedObject', function(sharedObject)
  ESX = sharedObject;
end);

function GetPlayerFullName(identifier, cb) 
  if not identifier then 
    return;
  end
  
  MySQL.query('SELECT firstname, lastname FROM users WHERE identifier = ?', { identifier }, function(result)
    if result and result[1] then
      cb(result[1].firstname, result[1].lastname);
    end
  end);
end

function GetPlayerJob(source)
  return ESX.GetPlayerFromId(source).getJob();
end