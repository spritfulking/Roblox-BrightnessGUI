-- Made by Ybo

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local lighting = game:GetService("Lighting")

local brightnessEnabled = false
local brightnessValue = 2
local originalSettings = {}
local connection

local function saveOriginalSettings()
    originalSettings = {
        Brightness = lighting.Brightness,
        ClockTime = lighting.ClockTime,
        FogEnd = lighting.FogEnd,
        GlobalShadows = lighting.GlobalShadows,
        Ambient = lighting.Ambient,
        OutdoorAmbient = lighting.OutdoorAmbient
    }
end

local function applyBrightness()
    if brightnessEnabled then
        lighting.Brightness = brightnessValue
        lighting.ClockTime = 14
        lighting.FogEnd = 100000
        lighting.GlobalShadows = false
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        
        for _, obj in pairs(lighting:GetChildren()) do
            if obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or 
               obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") then
                obj.Enabled = false
            end
        end
    else
        for setting, value in pairs(originalSettings) do
            lighting[setting] = value
        end
        
        for _, obj in pairs(lighting:GetChildren()) do
            if obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or 
               obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") then
                obj.Enabled = true
            end
        end
    end
end

local function showIntro(callback)
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "IntroGui"
    introGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local introLabel = Instance.new("TextLabel")
    introLabel.Size = UDim2.new(0, 300, 0, 100)
    introLabel.Position = UDim2.new(0.5, -150, 0.5, -50)
    introLabel.BackgroundTransparency = 1
    introLabel.Text = "made by Ybo"
    introLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    introLabel.TextSize = 32
    introLabel.Font = Enum.Font.SourceSansBold
    introLabel.TextTransparency = 1
    introLabel.Parent = introGui
    
    introGui.Parent = playerGui
    
    TweenService:Create(introLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()
    
    wait(2)
    
    TweenService:Create(introLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        TextTransparency = 1
    }):Play()
    
    wait(1)
    introGui:Destroy()
    callback()
end

local function createGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BrightnessGui"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 300, 0, 180)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = mainFrame
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(60, 60, 80)
    mainStroke.Thickness = 2
    mainStroke.Parent = mainFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = "Brightness Control"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 12)
    titleCorner.Parent = titleLabel
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 120, 0, 35)
    toggleButton.Position = UDim2.new(0.5, -60, 0, 55)
    toggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 16
    toggleButton.Font = Enum.Font.SourceSansBold
    toggleButton.Parent = mainFrame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleButton
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Name = "SliderBg"
    sliderBg.Size = UDim2.new(0, 250, 0, 8)
    sliderBg.Position = UDim2.new(0.5, -125, 0, 110)
    sliderBg.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    sliderBg.BorderSizePixel = 0
    sliderBg.Parent = mainFrame
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(0, 4)
    sliderBgCorner.Parent = sliderBg
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.Size = UDim2.new(0.5, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBg
    
    local sliderFillCorner = Instance.new("UICorner")
    sliderFillCorner.CornerRadius = UDim.new(0, 4)
    sliderFillCorner.Parent = sliderFill
    
    local sliderButton = Instance.new("TextButton")
    sliderButton.Name = "SliderButton"
    sliderButton.Size = UDim2.new(0, 20, 0, 20)
    sliderButton.Position = UDim2.new(0.5, -10, 0.5, -10)
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.BorderSizePixel = 0
    sliderButton.Text = ""
    sliderButton.Parent = sliderBg
    
    local sliderButtonCorner = Instance.new("UICorner")
    sliderButtonCorner.CornerRadius = UDim.new(1, 0)
    sliderButtonCorner.Parent = sliderButton
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "ValueLabel"
    valueLabel.Size = UDim2.new(1, 0, 0, 25)
    valueLabel.Position = UDim2.new(0, 0, 0, 135)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = "Brightness: 2.0"
    valueLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    valueLabel.TextSize = 14
    valueLabel.Font = Enum.Font.SourceSans
    valueLabel.Parent = mainFrame
    
    local madeByLabel = Instance.new("TextLabel")
    madeByLabel.Name = "MadeBy"
    madeByLabel.Size = UDim2.new(1, 0, 0, 20)
    madeByLabel.Position = UDim2.new(0, 0, 1, -20)
    madeByLabel.BackgroundTransparency = 1
    madeByLabel.Text = "made by Ybo"
    madeByLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    madeByLabel.TextSize = 12
    madeByLabel.Font = Enum.Font.SourceSans
    madeByLabel.Parent = mainFrame
    
    local dragging = false
    local dragInput, mousePos, framePos
    
    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = mainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            local newPos = UDim2.new(
                framePos.X.Scale, framePos.X.Offset + delta.X,
                framePos.Y.Scale, framePos.Y.Offset + delta.Y
            )
            TweenService:Create(mainFrame, TweenInfo.new(0.1), {Position = newPos}):Play()
        end
    end)
    
    toggleButton.MouseButton1Click:Connect(function()
        brightnessEnabled = not brightnessEnabled
        
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        if brightnessEnabled then
            toggleButton.Text = "ON"
            TweenService:Create(toggleButton, tweenInfo, {
                BackgroundColor3 = Color3.fromRGB(50, 220, 100)
            }):Play()
            applyBrightness()
        else
            toggleButton.Text = "OFF"
            TweenService:Create(toggleButton, tweenInfo, {
                BackgroundColor3 = Color3.fromRGB(220, 50, 50)
            }):Play()
            applyBrightness()
        end
        
        TweenService:Create(toggleButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 115, 0, 33)}):Play()
        wait(0.1)
        TweenService:Create(toggleButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 120, 0, 35)}):Play()
    end)
    
    local draggingSlider = false
    
    sliderButton.MouseButton1Down:Connect(function()
        draggingSlider = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = false
        end
    end)
    
    RunService.RenderStepped:Connect(function()
        if draggingSlider then
            local mousePos = UserInputService:GetMouseLocation()
            local sliderPos = sliderBg.AbsolutePosition
            local sliderSize = sliderBg.AbsoluteSize
            
            local relativePos = math.clamp(mousePos.X - sliderPos.X, 0, sliderSize.X)
            local percentage = relativePos / sliderSize.X
            
            brightnessValue = math.clamp(percentage * 4, 0, 4)
            
            sliderButton.Position = UDim2.new(percentage, -10, 0.5, -10)
            sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            valueLabel.Text = string.format("Brightness: %.1f", brightnessValue)
            
            if brightnessEnabled then
                applyBrightness()
            end
        end
    end)
    
    screenGui.Parent = playerGui
    
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 300, 0, 180)
    }):Play()
    
    return screenGui
end

saveOriginalSettings()

showIntro(function()
    createGui()
    
    connection = RunService.RenderStepped:Connect(function()
        if brightnessEnabled then
            if lighting.Brightness ~= brightnessValue then
                lighting.Brightness = brightnessValue
            end
            if lighting.ClockTime ~= 14 then
                lighting.ClockTime = 14
            end
        end
    end)
    
    player.CharacterRemoving:Connect(function()
        if connection then
            connection:Disconnect()
        end
    end)
end)
