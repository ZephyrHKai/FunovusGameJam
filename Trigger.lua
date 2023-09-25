
-- LIBRARIES
local core = require("core")

-- VARIABLES

-- GLOBALS
local GLOBAL = {
    round = 0,
    score = 0,
    are_enemies_spawning = false,
    hero = DCEI.FindUnit("MyHero"),
    game_instance = 1,
    Mouse_Pos = {x = 0, y = 0}
}

-- TRIGGERS

function OnMapStart()
    core.HideDefaultUi()
end

function FireDelayedBlast()
    DCEI.CastAbilityAtPosition("Delayed Blast", GLOBAL.hero, GLOBAL.Mouse_Pos.x, GLOBAL.Mouse_Pos.y)
end

function OnMouseMove(player_id, mouse_position)
    GLOBAL.Mouse_Pos = mouse_position
end

local once = true
function Update()
    -- if(once)
    -- then
    --     region = DCEI.FindRegion("region_0")
    --     pos = DCEI.GetUnitPosition2D(GLOBAL.hero)
    --     if(DCEI.CheckPointInRegion(region, pos.x, pos.y))
    --     then
    --         once = false
    --         -- local title = "Careful!"
    --         -- local body = (
    --         --     "Welcome! Hero!\n" ..
    --         --     "Enemies ahead!\n" ..
    --         --      "Try to defeat them!" 
    --         --             )     
    --         -- local button_text = "Continue"
    --         DCEI.LogMessage("Hi")
            
    --         -- DCEI.ShowMessageWithButtonText(title, body, button_text) 
    --     end
    -- end
    DCEI.LogMessage("Hi")
end


DCEI.TriggerAddMappedKeyDownEvent("DelayedBlast", FireDelayedBlast)



-- INITIALIZE
DCEI.StartMouseTracking(1)

DCEI.TriggerAddTimerEventElapsed(OnMapStart, 0)
DCEI.TriggerAddTimerEventPeriodicIndefinite(Update, 0.1)
DCEI.TriggerAddOnMouseWorldPositionTrackingEvent(OnMouseMove)
DCEI.SetCameraFocusUnit(GLOBAL.hero,1)







local unit_type = DCEI.Unit("Standard RangedUnit")
local x, y = 16, 23
local unit = DCEI.CreateUnit(1, 1, unit_type, x, y)
local hp = DCEI.GetHealth(unit)
local max_hp = DCEI.GetMaxHealth(unit)
DCEI.LogMessage(unit_type .. " has " .. hp .. "/" .. max_hp .. " hp currently.")

local behavior_name = DCEI.Behavior("Enemy LevelUp")
DCEI.ApplyBehaviorToSelf(unit, behavior_name, int count = 1)
DCEI.LogMessage(unit_type .. " has " .. hp .. "/" .. max_hp .. " hp currently.")

local button_elp = DCEI.CreateButtonFrame(DCEI.GetUiRootFrame())
DCEI.SetFrameSize(button, 120, 60)
local text = DCEI.CreateTextFrame(button)
DCEI.SetTextFrameText(text, "Enemy Levelup")





--behaviorName = DCEI.GetUnitBehaviorList
--DCEI.ApplyBehaviorToUnit(unit, unit, unit, string behaviorName, int count = 1)




-- local title = "Message Title"
-- local body = (
--     "This is a message box. It pauses the game.\n" ..
--     "It supports multiple lines.\n" ..
--     "And also <color=yellow>rich text</color><size=125%>!</size></color><size=175%>!</size></color><size=125%>!</size>\n" ..
--     "It also supports images, but you can't use custom images yet so this is of limited use."
-- )     
-- local button_text = "Continue"

-- DCEI.ShowMessageWithButtonText(title, body, button_text) 