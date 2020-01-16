-- local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

local SpeakingHud

function OnPackageStart()
    SpeakingHud = CreateWebUI(0, 0, 0, 0, 0, 28)
    SetWebAlignment(SpeakingHud, 1.0, 0.0)
    SetWebAnchors(SpeakingHud, 0.0, 0.0, 1.0, 1.0)
    LoadWebFile(SpeakingHud, "http://asset/orpui/speaking/ui/index.html")
    SetWebVisibility(SpeakingHud, WEB_HIDDEN)
    
	ShowHealthHUD(false)
    ShowWeaponHUD(false)
end
AddEvent("OnPackageStart", OnPackageStart)

function updateSpeakingHud()
    local player = GetPlayerId()

    print(IsPlayerTalking(player))

    if IsPlayerTalking(player) then
        showSpeakingHud()
    else
        hideSpeakingHud()
    end
end

function hideSpeakingHud()
    SetWebVisibility(SpeakingHud, WEB_HIDDEN)
end

function showSpeakingHud()
    SetWebVisibility(SpeakingHud, WEB_HITINVISIBLE)
end

AddFunctionExport("hideSpeakingHud", hideSpeakingHud)
AddFunctionExport("showSpeakingHud", showSpeakingHud)