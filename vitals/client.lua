local VitalsHud

function OnPackageStart()
    VitalsHud = CreateWebUI(0, 0, 0, 0, 0, 28)
    SetWebAlignment(VitalsHud, 1.0, 0.0)
    SetWebAnchors(VitalsHud, 0.0, 0.0, 1.0, 1.0)
    LoadWebFile(VitalsHud, "http://asset/orpui/vitals/ui/index.html")
    SetWebVisibility(VitalsHud, WEB_HITINVISIBLE)
    
	ShowHealthHUD(false)
    ShowWeaponHUD(false)
end
AddEvent("OnPackageStart", OnPackageStart)

function updateVitalsHud()
    local player = GetPlayerId()
    local health = GetPlayerHealth()
    local hunger = GetPlayerPropertyValue(player, "hunger") or 100
    local thirst = GetPlayerPropertyValue(player, "thirst") or 100
    local menuOpened = 0

    ExecuteWebJS(VitalsHud, "SetVitals("..health..", "..hunger..", "..thirst..", "..menuOpened..");")
end

function hideVitalsHug()
    SetWebVisibility(VitalsHud, WEB_HIDDEN)
end

function showVitalsHud()
    SetWebVisibility(VitalsHud, WEB_HITINVISIBLE)
end

AddFunctionExport("hideVitalsHug", hideVitalsHug)
AddFunctionExport("showVitalsHud", showVitalsHud)