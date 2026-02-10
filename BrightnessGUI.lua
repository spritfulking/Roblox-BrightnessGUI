-- Brightness Control GUI - Made By yb0
-- GitHub Loadstring Version
-- https://github.com/yb0scripts/BrightnessGUI

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Güvenlik kontrolü
if not player then
    return
end

-- Ana GUI fonksiyonu
local function CreateBrightnessGUI()
    -- Ana GUI'yi oluştur
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "yb0_BrightnessControl"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Enabled = true

    -- Ana çerçeve
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 0, 60)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.ClipsDescendants = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = mainFrame

    -- Başlık çerçevesi
    local titleFrame = Instance.new("Frame")
    titleFrame.Name = "TitleFrame"
    titleFrame.Size = UDim2.new(1, 0, 0, 50)
    titleFrame.Position = UDim2.new(0, 0, 0, 0)
    titleFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 120)
    titleFrame.BackgroundTransparency = 0.2
    titleFrame.BorderSizePixel = 0

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 15)
    titleCorner.Parent = titleFrame

    -- Başlık metni
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, 0, 1, 0)
    titleText.Position = UDim2.new(0, 0, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "🔆 Parlaklık Kontrol - yb0"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextSize = 18
    titleText.Font = Enum.Font.GothamBold
    titleText.Parent = titleFrame

    titleFrame.Parent = mainFrame

    -- İçerik çerçevesi
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -70)
    contentFrame.Position = UDim2.new(0, 10, 0, 60)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame

    -- Made By yb0 yazısı
    local madeByText = Instance.new("TextLabel")
    madeByText.Name = "MadeByText"
    madeByText.Size = UDim2.new(1, 0, 0, 30)
    madeByText.Position = UDim2.new(0, 0, 0, 10)
    madeByText.BackgroundTransparency = 1
    madeByText.Text = "✨ Made By yb0"
    madeByText.TextColor3 = Color3.fromRGB(200, 150, 255)
    madeByText.TextSize = 16
    madeByText.Font = Enum.Font.GothamSemibold
    madeByText.TextTransparency = 0
    madeByText.TextStrokeTransparency = 0.8
    madeByText.Parent = contentFrame

    -- On/Off butonu
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "ToggleFrame"
    toggleFrame.Size = UDim2.new(1, 0, 0, 60)
    toggleFrame.Position = UDim2.new(0, 0, 0, 50)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = contentFrame

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Name = "ToggleLabel"
    toggleLabel.Size = UDim2.new(0.6, 0, 1, 0)
    toggleLabel.Position = UDim2.new(0, 0, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = "Parlaklık Ayarı:"
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.TextSize = 16
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggleFrame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 50, 0, 30)
    toggleButton.Position = UDim2.new(1, -60, 0.5, -15)
    toggleButton.AnchorPoint = Vector2.new(1, 0.5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
    toggleButton.Text = "AÇIK"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 14
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.AutoButtonColor = false

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleButton

    toggleButton.Parent = toggleFrame

    -- Slider
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "SliderFrame"
    sliderFrame.Size = UDim2.new(1, 0, 0, 80)
    sliderFrame.Position = UDim2.new(0, 0, 0, 120)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Parent = contentFrame

    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Name = "SliderLabel"
    sliderLabel.Size = UDim2.new(1, 0, 0, 30)
    sliderLabel.Position = UDim2.new(0, 0, 0, 0)
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Text = "Parlaklık Seviyesi: 2.0"
    sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderLabel.TextSize = 16
    sliderLabel.Font = Enum.Font.Gotham
    sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    sliderLabel.Parent = sliderFrame

    local sliderTrack = Instance.new("Frame")
    sliderTrack.Name = "SliderTrack"
    sliderTrack.Size = UDim2.new(1, 0, 0, 8)
    sliderTrack.Position = UDim2.new(0, 0, 0, 40)
    sliderTrack.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
    sliderTrack.BorderSizePixel = 0

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 4)
    trackCorner.Parent = sliderTrack

    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.Size = UDim2.new(0.5, 0, 1, 0)
    sliderFill.Position = UDim2.new(0, 0, 0, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(150, 50, 220)
    sliderFill.BorderSizePixel = 0

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 4)
    fillCorner.Parent = sliderFill

    sliderFill.Parent = sliderTrack

    local sliderThumb = Instance.new("TextButton")
    sliderThumb.Name = "SliderThumb"
    sliderThumb.Size = UDim2.new(0, 20, 0, 20)
    sliderThumb.Position = UDim2.new(0.5, -10, 0.5, -10)
    sliderThumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderThumb.Text = ""
    sliderThumb.AutoButtonColor = false

    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(0, 10)
    thumbCorner.Parent = sliderThumb

    sliderThumb.Parent = sliderTrack
    sliderTrack.Parent = sliderFrame

    -- Kapatma butonu
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 10)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 24
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = mainFrame

    -- GUI'yi ekle
    mainFrame.Parent = screenGui
    screenGui.Parent = playerGui

    -- Değişkenler
    local brightnessEnabled = true
    local brightnessValue = 2.0
    local isSliding = false

    -- Animasyon fonksiyonu
    local function tween(object, properties, duration, easingStyle, easingDirection)
        local tweenInfo = TweenInfo.new(
            duration or 0.3,
            easingStyle or Enum.EasingStyle.Quad,
            easingDirection or Enum.EasingDirection.Out
        )
        local tweenObj = TweenService:Create(object, tweenInfo, properties)
        tweenObj:Play()
        return tweenObj
    end

    -- Açılış animasyonu
    tween(mainFrame, {Size = UDim2.new(0, 300, 0, 300)}, 0.5, Enum.EasingStyle.Back)
    
    -- Made By yb0 yazısını yavaşça kaybet
    delay(2, function()
        tween(madeByText, {TextTransparency = 1}, 1)
        wait(1)
        madeByText.Visible = false
    end)

    -- Parlaklık güncelleme
    local function updateBrightness()
        if brightnessEnabled then
            Lighting.Brightness = brightnessValue
            Lighting.GlobalShadows = false
            Lighting.ClockTime = 14
            toggleButton.Text = "AÇIK"
            toggleButton.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            toggleButton.Text = "KAPALI"
            toggleButton.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
        end
    end

    -- Slider güncelleme
    local function updateSlider(value)
        value = math.clamp(value, 0.1, 5)
        brightnessValue = math.floor(value * 10) / 10
        
        sliderLabel.Text = "Parlaklık Seviyesi: " .. string.format("%.1f", brightnessValue)
        sliderFill.Size = UDim2.new((brightnessValue - 0.1) / 4.9, 0, 1, 0)
        sliderThumb.Position = UDim2.new((brightnessValue - 0.1) / 4.9, -10, 0.5, -10)
        
        updateBrightness()
    end

    -- Slider kontrolü
    sliderThumb.MouseButton1Down:Connect(function()
        isSliding = true
        tween(sliderThumb, {Size = UDim2.new(0, 24, 0, 24)}, 0.1)
    end)

    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isSliding = true
            local xPos = input.Position.X - sliderTrack.AbsolutePosition.X
            local value = (xPos / sliderTrack.AbsoluteSize.X) * 4.9 + 0.1
            updateSlider(value)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and isSliding then
            isSliding = false
            tween(sliderThumb, {Size = UDim2.new(0, 20, 0, 20)}, 0.1)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if isSliding and input.UserInputType == Enum.UserInputType.MouseMovement then
            local xPos = input.Position.X - sliderTrack.AbsolutePosition.X
            local value = (xPos / sliderTrack.AbsoluteSize.X) * 4.9 + 0.1
            updateSlider(value)
        end
    end)

    -- Buton event'leri
    toggleButton.MouseButton1Click:Connect(function()
        brightnessEnabled = not brightnessEnabled
        updateBrightness()
        tween(toggleButton, {BackgroundColor3 = brightnessEnabled and Color3.fromRGB(120, 0, 180) or Color3.fromRGB(60, 0, 90)}, 0.2)
    end)

    closeButton.MouseButton1Click:Connect(function()
        tween(mainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        wait(0.3)
        screenGui:Destroy()
    end)

    -- Hover efektleri
    toggleButton.MouseEnter:Connect(function()
        tween(toggleButton, {BackgroundColor3 = brightnessEnabled and Color3.fromRGB(140, 20, 200) or Color3.fromRGB(80, 10, 110)}, 0.2)
    end)

    toggleButton.MouseLeave:Connect(function()
        tween(toggleButton, {BackgroundColor3 = brightnessEnabled and Color3.fromRGB(120, 0, 180) or Color3.fromRGB(60, 0, 90)}, 0.2)
    end)

    -- GUI'yi hareket ettirme
    local dragging = false
    local dragStart = Vector2.new(0, 0)
    local startPos = mainFrame.Position

    titleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = Vector2.new(input.Position.X, input.Position.Y)
            startPos = mainFrame.Position
        end
    end)

    titleFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- İlk ayarı uygula
    updateBrightness()
    updateSlider(2.0)

    -- F2 ile aç/kapat
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F2 then
            if screenGui.Parent then
                screenGui.Enabled = not screenGui.Enabled
            end
        end
    end)

    print("✅ Brightness GUI loaded successfully! - Made By yb0")
end

-- Script'i başlat
CreateBrightnessGUI()
