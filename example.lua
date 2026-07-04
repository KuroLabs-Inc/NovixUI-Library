--[[
    ============================================
         NovixUI - Complete Example Script
    ============================================

    This example demonstrates all features of the NovixUI library.
    Load this script in your Roblox executor to see the UI in action.

--]]

-- ============================================
-- 1. LOAD THE LIBRARY
-- ============================================
local NovixUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KuroLabs-Inc/NovixUI-Library/refs/heads/main/NovixUI_Library.lua"))()
-- Or if you have the file locally:
-- local NovixUI = require(path.to.NovixUI_Library)

-- ============================================
-- 2. CREATE THE MAIN WINDOW
-- ============================================
local Window = NovixUI:MakeGui({
    NameHub = "NovixUI",
    Description = "Example Hub",
    Color = Color3.fromRGB(138, 43, 226), -- Purple accent
    ["Tab Width"] = 130,
    Image = "17681429652" -- rbxassetid for toggle button icon
})

-- ============================================
-- 3. CREATE TABS
-- ============================================

-- ==================== COMBAT TAB ====================
local CombatTab = Window:CreateTab({
    Name = "Combat",
    Icon = "rbxassetid://16932740082"
})

local CombatSection = CombatTab:AddSection("Combat Settings")

-- Aimbot Toggle
local AimbotToggle = CombatSection:AddToggle({
    Title = "Aimbot",
    Title2 = "Silent",
    Content = "Automatically lock onto nearest enemy player",
    Default = false,
    Callback = function(Value)
        print("[Aimbot] State:", Value)
        -- Your aimbot logic here
    end
})

-- ESP Toggle
local ESPToggle = CombatSection:AddToggle({
    Title = "Player ESP",
    Content = "See all players through walls",
    Default = false,
    Callback = function(Value)
        print("[ESP] State:", Value)
    end
})

-- FOV Slider
local FOVSlider = CombatSection:AddSlider({
    Title = "Aimbot FOV",
    Content = "Field of view radius for aimbot targeting",
    Min = 30,
    Max = 500,
    Default = 120,
    Increment = 10,
    Callback = function(Value)
        print("[FOV] Set to:", Value)
    end
})

-- Aim Part Dropdown
local AimPartDropdown = CombatSection:AddDropdown({
    Title = "Aim Part",
    Content = "Which body part to target",
    Multi = false,
    Options = {"Head", "Torso", "HumanoidRootPart", "Left Arm", "Right Arm"},
    Default = "Head",
    Callback = function(Value)
        print("[Aim Part] Selected:", Value)
    end
})

-- ==================== PLAYER TAB ====================
local PlayerTab = Window:CreateTab({
    Name = "Player",
    Icon = "rbxassetid://16932740082"
})

local CharacterSection = PlayerTab:AddSection("Character")

-- WalkSpeed Slider
local WalkSpeedSlider = CharacterSection:AddSlider({
    Title = "Walk Speed",
    Content = "Adjust how fast your character moves",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
        print("[WalkSpeed] Set to:", Value)
    end
})

-- JumpPower Slider
local JumpPowerSlider = CharacterSection:AddSlider({
    Title = "Jump Power",
    Content = "Adjust how high your character jumps",
    Min = 50,
    Max = 300,
    Default = 50,
    Increment = 5,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = Value
        end
        print("[JumpPower] Set to:", Value)
    end
})

-- Fly Toggle
local FlyToggle = CharacterSection:AddToggle({
    Title = "Fly",
    Content = "Enable flying mode",
    Default = false,
    Callback = function(Value)
        print("[Fly] State:", Value)
        -- Your fly logic here
    end
})

-- God Mode Toggle
local GodModeToggle = CharacterSection:AddToggle({
    Title = "God Mode",
    Content = "Become invincible to all damage",
    Default = false,
    Callback = function(Value)
        print("[God Mode] State:", Value)
    end
})

-- ==================== TELEPORT TAB ====================
local TeleportTab = Window:CreateTab({
    Name = "Teleport",
    Icon = "rbxassetid://16932740082"
})

local TeleportSection = TeleportTab:AddSection("Locations")

-- Teleport to Player Input
local TPInput = TeleportSection:AddInput({
    Title = "Teleport to Player",
    Content = "Enter a player's username to teleport to them",
    Default = "",
    Callback = function(Value)
        local target = game.Players:FindFirstChild(Value)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local localPlayer = game.Players.LocalPlayer
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                localPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                NovixUI:MakeNotify({
                    Title = "Teleport",
                    Description = "Success",
                    Content = "Teleported to " .. Value,
                    Color = Color3.fromRGB(0, 255, 100),
                    Time = 0.5,
                    Delay = 3
                })
            end
        else
            NovixUI:MakeNotify({
                Title = "Teleport",
                Description = "Error",
                Content = "Player "" .. Value .. "" not found!",
                Color = Color3.fromRGB(255, 50, 50),
                Time = 0.5,
                Delay = 3
            })
        end
    end
})

-- Teleport Dropdown
local LocationDropdown = TeleportSection:AddDropdown({
    Title = "Quick Teleport",
    Content = "Select a predefined location",
    Multi = false,
    Options = {"Spawn", "Shop", "Bank", "Arena", "Secret Base"},
    Default = "Spawn",
    Callback = function(Value)
        print("[Teleport] Selected location:", Value)
        -- Your teleport logic here based on Value
        NovixUI:MakeNotify({
            Title = "Teleport",
            Description = "Success",
            Content = "Teleported to " .. Value,
            Color = Color3.fromRGB(0, 255, 100),
            Time = 0.5,
            Delay = 3
        })
    end
})

-- ==================== MISC TAB ====================
local MiscTab = Window:CreateTab({
    Name = "Misc",
    Icon = "rbxassetid://16932740082"
})

local MiscSection = MiscTab:AddSection("Miscellaneous")

-- Auto Farm Toggle
local AutoFarmToggle = MiscSection:AddToggle({
    Title = "Auto Farm",
    Content = "Automatically collect resources",
    Default = false,
    Callback = function(Value)
        print("[Auto Farm] State:", Value)
    end
})

-- Auto Clicker Toggle
local AutoClickerToggle = MiscSection:AddToggle({
    Title = "Auto Clicker",
    Content = "Automatically clicks at high speed",
    Default = false,
    Callback = function(Value)
        print("[Auto Clicker] State:", Value)
    end
})

-- Click Speed Slider
local ClickSpeedSlider = MiscSection:AddSlider({
    Title = "Click Speed",
    Content = "Clicks per second for auto clicker",
    Min = 1,
    Max = 50,
    Default = 10,
    Increment = 1,
    Callback = function(Value)
        print("[Click Speed] Set to:", Value, "CPS")
    end
})

-- Anti-AFK Toggle
local AntiAfkToggle = MiscSection:AddToggle({
    Title = "Anti-AFK",
    Content = "Prevents being kicked for inactivity",
    Default = false,
    Callback = function(Value)
        print("[Anti-AFK] State:", Value)
    end
})

-- Info Paragraph
local InfoParagraph = MiscSection:AddParagraph({
    Title = "Information",
    Content = "Use this tab for miscellaneous features. Toggle switches to enable/disable features. Use sliders to adjust values. All settings are saved for the current session only."
})

-- ==================== SETTINGS TAB ====================
local SettingsTab = Window:CreateTab({
    Name = "Settings",
    Icon = "rbxassetid://16932740082"
})

local SettingsSection = SettingsTab:AddSection("Configuration")

-- Theme Dropdown
local ThemeDropdown = SettingsSection:AddDropdown({
    Title = "UI Theme",
    Content = "Change the accent color of the UI",
    Multi = false,
    Options = {"Purple", "Blue", "Red", "Green", "Pink", "Orange"},
    Default = "Purple",
    Callback = function(Value)
        local colorMap = {
            Purple = Color3.fromRGB(138, 43, 226),
            Blue = Color3.fromRGB(0, 120, 255),
            Red = Color3.fromRGB(255, 50, 50),
            Green = Color3.fromRGB(0, 200, 100),
            Pink = Color3.fromRGB(255, 0, 255),
            Orange = Color3.fromRGB(255, 140, 0)
        }
        print("[Theme] Changed to:", Value)
        -- Note: Changing theme dynamically requires recreating the UI
        -- or implementing dynamic color updates in the library
    end
})

-- Reset Character Button
local ResetButton = SettingsSection:AddButton({
    Title = "Reset Character",
    Content = "Respawn your character at spawn point",
    Icon = "rbxassetid://16932740082",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character:BreakJoints()
        end
        NovixUI:MakeNotify({
            Title = "Character",
            Description = "Reset",
            Content = "Character has been reset!",
            Color = Color3.fromRGB(255, 170, 0),
            Time = 0.5,
            Delay = 3
        })
    end
})

-- Rejoin Button
local RejoinButton = SettingsSection:AddButton({
    Title = "Rejoin Server",
    Content = "Rejoin the current server",
    Icon = "rbxassetid://16932740082",
    Callback = function()
        NovixUI:MakeNotify({
            Title = "Server",
            Description = "Rejoining",
            Content = "Rejoining server...",
            Color = Color3.fromRGB(0, 170, 255),
            Time = 0.5,
            Delay = 3
        })
        -- TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end
})

-- Credits Paragraph
local CreditsParagraph = SettingsSection:AddParagraph({
    Title = "Credits",
    Content = "NovixUI - Modern Roblox UI Library. Originally based on FlurioreLib. Redesigned and improved for better user experience."
})

-- ============================================
-- 4. WELCOME NOTIFICATION
-- ============================================
NovixUI:MakeNotify({
    Title = "NovixUI",
    Description = "Welcome",
    Content = "Example script loaded successfully! Explore all tabs and features. Use the X button to destroy the UI with confirmation.",
    Color = Color3.fromRGB(138, 43, 226),
    Time = 0.5,
    Delay = 8
})

-- Second notification for demo
NovixUI:MakeNotify({
    Title = "Tip",
    Description = "Controls",
    Content = "Drag the top bar to move. Resize from bottom-right corner. Use the floating button to toggle visibility.",
    Color = Color3.fromRGB(0, 170, 255),
    Time = 0.5,
    Delay = 10
})

-- ============================================
-- 5. UTILITY FUNCTIONS (Optional)
-- ============================================

-- Example: Programmatically set values
-- AimbotToggle:Set(true)
-- FOVSlider:Set(200)
-- ThemeDropdown:Set("Blue")

-- Example: Get current values
-- print("Current WalkSpeed:", WalkSpeedSlider.Value)
-- print("Aimbot Enabled:", AimbotToggle.Value)

-- Example: Add options dynamically
-- LocationDropdown:AddOption("New Location")
-- LocationDropdown:Refresh({"Spawn", "Shop", "New Location"}, "Spawn")

-- Example: Clear dropdown
-- LocationDropdown:Clear()

print("[NovixUI] Example script loaded successfully!")
