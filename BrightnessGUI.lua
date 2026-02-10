-- Fullbright Script with Professional GUI
-- Made by yb0

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FullbrightGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Add Corner Radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Create Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Fullbright Tool"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

-- Create Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0, 30)
statusLabel.Position = UDim2.new(0, 0, 0, 60)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Disabled"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 18
statusLabel.Font = Enum.Font.SourceSans
statusLabel.Parent = mainFrame

-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0, 120)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
toggleButton.Text = "Enable Fullbright"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 20
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.Parent = mainFrame

-- Add Corner to Button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = toggleButton

-- Create Made By Label (shown initially)
local madeByLabel = Instance.new("TextLabel")
madeByLabel.Name = "MadeByLabel"
madeByLabel.Size = UDim2.new(1, 0, 1, 0)
madeByLabel.BackgroundTransparency = 1
madeByLabel.Text = "Made by yb0"
madeByLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
madeByLabel.TextSize = 16
madeByLabel.Font = Enum.Font.SourceSansItalic
madeByLabel.Parent = mainFrame

-- Variables
local isEnabled = false
local originalBrightness = Lighting.Brightness
local originalAmbient = Lighting.Ambient
local originalOutdoorAmbient = Lighting.OutdoorAmbient
local originalFogEnd = Lighting.FogEnd
local originalFogStart = Lighting.FogStart
local isGuiVisible = false

-- Tween Info
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- Functions
local function enableFullbright()
    Lighting.Brightness = 1
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    Lighting.FogEnd = 100000
    Lighting.FogStart = 0
    statusLabel.Text = "Status: Enabled"
    toggleButton.Text = "Disable Fullbright"
    toggleButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
end

local function disableFullbright()
    Lighting.Brightness = originalBrightness
    Lighting.Ambient = originalAmbient
    Lighting.OutdoorAmbient = originalOutdoorAmbient
    Lighting.FogEnd = originalFogEnd
    Lighting.FogStart = originalFogStart
    statusLabel.Text = "Status: Disabled"
    toggleButton.Text = "Enable Fullbright"
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
end

local function toggleFullbright()
    isEnabled = not isEnabled
    if isEnabled then
        enableFullbright()
    else
        disableFullbright()
    end
end

local function showGui()
    if not isGuiVisible then
        isGuiVisible = true
        madeByLabel.Visible = true
        titleLabel.Visible = false
        statusLabel.Visible = false
        toggleButton.Visible = false
        local tween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 300, 0, 200)})
        tween:Play()
        wait(2) -- Show "Made by yb0" for 2 seconds
        madeByLabel.Visible = false
        titleLabel.Visible = true
        statusLabel.Visible = true
        toggleButton.Visible = true
    end
end

local function hideGui()
    if isGuiVisible then
        isGuiVisible = false
        local tween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
        tween:Play()
        tween.Completed:Wait()
        mainFrame.Visible = false
    end
end

local function toggleGui()
    if isGuiVisible then
        hideGui()
    else
        mainFrame.Visible = true
        showGui()
    end
end

-- Event Connections
toggleButton.MouseButton1Click:Connect(toggleFullbright)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        toggleGui()
    end
end)

-- Initialize
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Visible = false
