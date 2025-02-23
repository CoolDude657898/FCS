-- Services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")

-- Variables
local player = players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local menuGui = player.PlayerGui:WaitForChild("MenuGui")

-- Initialize Camera
local function initializeCamera()
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = game.Workspace.Cameras.StarterCamera.CFrame
end

-- Fade FCS logo in and out
local function fcsLogoFade()
    local fcsIcon = menuGui.FCSIcon

    fcsIcon.ImageTransparency = 1

    local fadeInTween = tweenService:Create(fcsIcon, TweenInfo.new(1, Enum.EasingStyle.Quint), {ImageTransparency = 0})
    local fadeOutTween = tweenService:Create(fcsIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1})
    local menuFadeInTween = tweenService:Create(menuGui.MenuReference, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {GroupTransparency = 0, Position = UDim2.new(0,0,0,0)})

    fadeInTween:Play()

    fadeInTween.Completed:Connect(function()
        task.wait(1)
        fadeOutTween:Play()
    end)

    fadeOutTween.Completed:Connect(function()
        menuFadeInTween:Play()
    end)
end

-- Create effects when hovering over buttons
local function buttonHoverEffects(button)
    
end

local function main()
    initializeCamera()
    fcsLogoFade()

    for _, button in pairs(menuGui:GetDescendants()) do
        if button:IsA("TextButton") then
            buttonHoverEffects(button)
        end
    end
end

main()

