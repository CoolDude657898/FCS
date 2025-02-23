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

    local logoFadeInTween = tweenService:Create(fcsIcon, TweenInfo.new(1, Enum.EasingStyle.Quint), {ImageTransparency = 0})
    local logoFadeOutTween = tweenService:Create(fcsIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1})

    local creditsFadeInTween = tweenService:Create(menuGui.Credits.Credits, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0})
    local stadiumFadeInTween = tweenService:Create(menuGui.Stadium.Stadium, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0})
    local headerFadeInTween = tweenService:Create(menuGui.HeadCaption, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0})
    local subheaderFadeInTween = tweenService:Create(menuGui.SubCaption, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0})

    logoFadeInTween:Play()

    logoFadeInTween.Completed:Connect(function()
        task.wait(1)
        logoFadeOutTween:Play()
    end)

    logoFadeOutTween.Completed:Connect(function()
        creditsFadeInTween:Play()
        stadiumFadeInTween:Play()
        headerFadeInTween:Play()
        subheaderFadeInTween:Play()
    end)
end

-- Create effects when hovering over buttons
local function buttonHoverEffects(button)
    if button.Name == "Stadium" or button.Name == "Credits" then
        button.MouseEnter:Connect(function()
            local sizeAndColorTween = tweenService:Create(button.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.181, 0, 0.109, 0), BackgroundTransparency = 0})
            local tipsFadeInTween = tweenService:Create(button.Parent.Tips, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0})
            tipsFadeInTween:Play()
            sizeAndColorTween:Play()
        end)

        button.MouseLeave:Connect(function()
            local sizeAndColorTween = tweenService:Create(button.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.17, 0, 0.086, 0), BackgroundTransparency = 1})
            local tipsFadeOutTween = tweenService:Create(button.Parent.Tips, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1})
            tipsFadeOutTween:Play()
            sizeAndColorTween:Play()
        end)
    end
end

local function buttonClickEffects(button)

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

