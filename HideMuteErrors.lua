-- HideMuteErrors for WotLK 3.3.5a
-- Suppresses red error messages and mutes error sounds while preserving yellow quest progress, skill increase, and zone discovery messages
local HME = {}
HME.enabled = true

-- Create frame to handle events
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("UI_ERROR_MESSAGE")
f:RegisterEvent("UI_INFO_MESSAGE")

-- Function to check if a message is quest-related, skill increase, or zone discovery
local function isAllowedMessage(message)
    if not message or type(message) ~= "string" then return false end
    -- Quest progress/completion patterns
    if message:match("^%w+:%s*%d+%s*/%s*%d+$") then return true end -- e.g., "Boar Tusks: 3/10"
    if message:lower():match("objective.*complete") then return true end -- e.g., "Objective Complete: Kill X"
    if message:lower():match("quest.*complete") then return true end -- e.g., "Quest complete"
    -- Skill increase patterns
    if message:match("^Your skill in .+ has increased to %d+$") then return true end -- e.g., "Your skill in First Aid has increased to 150"
    if message:match("^You have gained the .+ skill%.?$") then return true end -- e.g., "You have gained the Mining skill"
    if message:match("^You have gained .+ proficiency%.?$") then return true end -- e.g., "You have gained Mining proficiency"
    -- Zone discovery patterns
    if message:match("^Discovered: .+$") then return true end -- e.g., "Discovered: Elwynn Forest"
    if message:match("^New location discovered!?$") then return true end -- e.g., "New location discovered!"
    return false
end

f:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Mute error sounds (affects only error-related sounds, not quest/skill/discovery)
        SetCVar("Sound_EnableErrorSpeech", 0)
        -- Clear any existing error messages to start fresh
        if UIErrorsFrame then
            UIErrorsFrame:Clear()
        end
        DEFAULT_CHAT_FRAME:AddMessage("|cffffff00HideMuteErrors loaded: Error text and sounds hidden, quest, skill, and discovery text preserved.|r")
        return
    end

    if HME.enabled and event == "UI_ERROR_MESSAGE" then
        -- Check for quest, skill, or discovery messages in UI_ERROR_MESSAGE (for private servers)
        local first, second = ...
        local message = second or first
        if type(message) == "string" and isAllowedMessage(message) then
            if UIErrorsFrame then
                UIErrorsFrame:AddMessage(message, 1.0, 1.0, 0.0, 1.0) -- Yellow color
            end
        end
        return -- Block all other UI_ERROR_MESSAGE events
    end

    if event == "UI_INFO_MESSAGE" then
        -- Only show allowed messages
        local _, message = ...
        if type(message) ~= "string" then
            message = select(1, ...)
        end
        if type(message) == "string" and isAllowedMessage(message) then
            if UIErrorsFrame then
                UIErrorsFrame:AddMessage(message, 1.0, 1.0, 0.0, 1.0) -- Yellow color
            end
        end
        return
    end
end)

-- Optional toggle: /hideerrors on|off
SLASH_HIDEERRORS1 = "/hideerrors"
SlashCmdList["HIDEERRORS"] = function(msg)
    msg = (msg or ""):lower()
    if msg == "on" then
        HME.enabled = false
        SetCVar("Sound_EnableErrorSpeech", 1)
        if UIErrorsFrame then
            UIErrorsFrame:Clear()
        end
        DEFAULT_CHAT_FRAME:AddMessage("|cffffff00HideMuteErrors: Error text and sounds enabled.|r")
    else
        HME.enabled = true
        SetCVar("Sound_EnableErrorSpeech", 0)
        if UIErrorsFrame then
            UIErrorsFrame:Clear()
        end
        DEFAULT_CHAT_FRAME:AddMessage("|cffffff00HideMuteErrors: Error text and sounds hidden, quest, skill, and discovery text preserved.|r")
    end
end
