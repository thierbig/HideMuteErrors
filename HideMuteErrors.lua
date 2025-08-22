-- Hide UIErrorsFrame and mute error sounds on login for WotLK 3.3.5a
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    if UIErrorsFrame and UIErrorsFrame.Hide then
        UIErrorsFrame:Hide()
        -- In case another addon tries to re-show it later
        if not UIErrorsFrame._HideErrorsHooked then
            UIErrorsFrame:HookScript("OnShow", function(self) self:Hide() end)
            UIErrorsFrame._HideErrorsHooked = true
        end
    end
    -- Mute error message sounds
    SetCVar("Sound_EnableErrorSpeech", 0)
    -- Confirm it loaded
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00HideErrors loaded: UI error text and sounds hidden.|r")
end)

-- Optional toggle: /hideerrors on|off
SLASH_HIDEERRORS1 = "/hideerrors"
SlashCmdList["HIDEERRORS"] = function(msg)
    msg = (msg or ""):lower()
    if msg == "on" then
        if UIErrorsFrame then
            UIErrorsFrame._HideErrorsHooked = nil
            UIErrorsFrame:Show()
            SetCVar("Sound_EnableErrorSpeech", 1)
            DEFAULT_CHAT_FRAME:AddMessage("|cffffff00HideErrors: UI error text and sounds shown.|r")
        end
    else
        if UIErrorsFrame then
            UIErrorsFrame:Hide()
            if not UIErrorsFrame._HideErrorsHooked then
                UIErrorsFrame:HookScript("OnShow", function(self) self:Hide() end)
                UIErrorsFrame._HideErrorsHooked = true
            end
            SetCVar("Sound_EnableErrorSpeech", 0)
            DEFAULT_CHAT_FRAME:AddMessage("|cffffff00HideErrors: UI error text and sounds hidden.|r")
        end
    end
end