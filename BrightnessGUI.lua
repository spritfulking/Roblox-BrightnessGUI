local _G = getfenv()
local a,b,c,d,e=string,table,getfenv,require,type
local f,g,h,i,j=math,game:GetService,coroutine,loadstring,task
local k,l,m,n,o=j.wait,g("Players"),g("TweenService"),g("RunService"),g("Lighting")
local p,q,r,s,t=g("UserInputService"),l.LocalPlayer,_G.assert,i,k

if not q then return end
local u=q:WaitForChild("PlayerGui")

local v=function()
    local w=Instance.new("ScreenGui")
    w.Name="GUI_"..tostring(f.random(999,9999))
    w.ResetOnSpawn=false
    
    local x=Instance.new("Frame")
    x.Name="Main"
    x.Size=UDim2.new(0,0,0,0)
    x.Position=UDim2.new(0.5,0,0.5,0)
    x.AnchorPoint=Vector2.new(0.5,0.5)
    x.BackgroundColor3=Color3.fromRGB(30,15,60)
    x.BackgroundTransparency=0.1
    x.BorderSizePixel=0
    
    local y=Instance.new("UICorner")
    y.CornerRadius=UDim.new(0,12)
    y.Parent=x
    
    local z=Instance.new("UIStroke")
    z.Color=Color3.fromRGB(100,50,180)
    z.Thickness=2
    z.Parent=x
    
    local A=Instance.new("Frame")
    A.Name="Header"
    A.Size=UDim2.new(1,0,0,50)
    A.BackgroundColor3=Color3.fromRGB(60,30,120)
    A.BorderSizePixel=0
    
    local B=Instance.new("UICorner")
    B.CornerRadius=UDim.new(0,12)
    B.Parent=A
    
    local C=Instance.new("TextLabel")
    C.Size=UDim2.new(1,-20,1,0)
    C.Position=UDim2.new(0,10,0,0)
    C.BackgroundTransparency=1
    C.Text="Brightness Control Panel"
    C.TextColor3=Color3.fromRGB(255,255,255)
    C.TextSize=18
    C.Font=Enum.Font.GothamBold
    C.TextXAlignment=Enum.TextXAlignment.Left
    C.Parent=A
    
    A.Parent=x
    
    local D=Instance.new("TextLabel")
    D.Name="Signature"
    D.Size=UDim2.new(1,-20,0,25)
    D.Position=UDim2.new(0,10,0,60)
    D.BackgroundTransparency=1
    D.Text="Created by yb0"
    D.TextColor3=Color3.fromRGB(180,150,220)
    D.TextSize=14
    D.Font=Enum.Font.Gotham
    D.Parent=x
    
    local E=Instance.new("Frame")
    E.Name="Content"
    E.Size=UDim2.new(1,-20,1,-120)
    E.Position=UDim2.new(0,10,0,90)
    E.BackgroundTransparency=1
    E.Parent=x
    
    local F=Instance.new("Frame")
    F.Size=UDim2.new(1,0,0,60)
    F.BackgroundTransparency=1
    F.Parent=E
    
    local G=Instance.new("TextLabel")
    G.Size=UDim2.new(0.6,0,0.5,0)
    G.BackgroundTransparency=1
    G.Text="Brightness Mode"
    G.TextColor3=Color3.fromRGB(255,255,255)
    G.TextSize=14
    G.Font=Enum.Font.Gotham
    G.TextXAlignment=Enum.TextXAlignment.Left
    G.Parent=F
    
    local H=Instance.new("TextButton")
    H.Size=UDim2.new(0,80,0,30)
    H.Position=UDim2.new(1,-80,0.5,-15)
    H.AnchorPoint=Vector2.new(1,0.5)
    H.BackgroundColor3=Color3.fromRGB(80,40,160)
    H.Text="ENABLED"
    H.TextColor3=Color3.fromRGB(255,255,255)
    H.TextSize=12
    H.Font=Enum.Font.GothamBold
    H.AutoButtonColor=false
    H.Parent=F
    
    local I=Instance.new("UICorner")
    I.CornerRadius=UDim.new(0,6)
    I.Parent=H
    
    local J=Instance.new("Frame")
    J.Size=UDim2.new(1,0,0,80)
    J.Position=UDim2.new(0,0,0,70)
    J.BackgroundTransparency=1
    J.Parent=E
    
    local K=Instance.new("TextLabel")
    K.Size=UDim2.new(1,0,0,30)
    K.BackgroundTransparency=1
    K.Text="Brightness Level"
    K.TextColor3=Color3.fromRGB(255,255,255)
    K.TextSize=14
    K.Font=Enum.Font.Gotham
    K.TextXAlignment=Enum.TextXAlignment.Left
    K.Parent=J
    
    local L=Instance.new("TextLabel")
    L.Name="ValueDisplay"
    L.Size=UDim2.new(0.3,0,0,30)
    L.Position=UDim2.new(0.7,0,0,0)
    L.BackgroundTransparency=1
    L.Text="2.0"
    L.TextColor3=Color3.fromRGB(180,150,220)
    L.TextSize=16
    L.Font=Enum.Font.GothamBold
    L.TextXAlignment=Enum.TextXAlignment.Right
    L.Parent=J
    
    local M=Instance.new("Frame")
    M.Name="SliderTrack"
    M.Size=UDim2.new(1,0,0,8)
    M.Position=UDim2.new(0,0,0,40)
    M.BackgroundColor3=Color3.fromRGB(50,25,100)
    M.BorderSizePixel=0
    M.Parent=J
    
    local N=Instance.new("UICorner")
    N.CornerRadius=UDim.new(0,4)
    N.Parent=M
    
    local O=Instance.new("Frame")
    O.Name="SliderFill"
    O.Size=UDim2.new(0.5,0,1,0)
    O.BackgroundColor3=Color3.fromRGB(120,80,200)
    O.BorderSizePixel=0
    O.Parent=M
    
    local P=Instance.new("UICorner")
    P.CornerRadius=UDim.new(0,4)
    P.Parent=O
    
    local Q=Instance.new("TextButton")
    Q.Name="SliderThumb"
    Q.Size=UDim2.new(0,20,0,20)
    Q.Position=UDim2.new(0.5,-10,0.5,-10)
    Q.BackgroundColor3=Color3.fromRGB(255,255,255)
    Q.Text=""
    Q.AutoButtonColor=false
    Q.Parent=M
    
    local R=Instance.new("UICorner")
    R.CornerRadius=UDim.new(0,10)
    R.Parent=Q
    
    local S=Instance.new("Frame")
    S.Size=UDim2.new(1,0,0,60)
    S.Position=UDim2.new(0,0,0,160)
    S.BackgroundTransparency=1
    S.Parent=E
    
    local T=Instance.new("TextLabel")
    T.Size=UDim2.new(1,0,0,30)
    T.BackgroundTransparency=1
    T.Text="Fog Density"
    T.TextColor3=Color3.fromRGB(255,255,255)
    T.TextSize=14
    T.Font=Enum.Font.Gotham
    T.TextXAlignment=Enum.TextXAlignment.Left
    T.Parent=S
    
    local U=Instance.new("TextLabel")
    U.Name="FogValue"
    U.Size=UDim2.new(0.3,0,0,30)
    U.Position=UDim2.new(0.7,0,0,0)
    U.BackgroundTransparency=1
    U.Text="0.5"
    U.TextColor3=Color3.fromRGB(180,150,220)
    U.TextSize=16
    U.Font=Enum.Font.GothamBold
    U.TextXAlignment=Enum.TextXAlignment.Right
    U.Parent=S
    
    local V=Instance.new("Frame")
    V.Name="FogTrack"
    V.Size=UDim2.new(1,0,0,6)
    V.Position=UDim2.new(0,0,0,40)
    V.BackgroundColor3=Color3.fromRGB(50,25,100)
    V.BorderSizePixel=0
    V.Parent=S
    
    local W=Instance.new("UICorner")
    W.CornerRadius=UDim.new(0,3)
    W.Parent=V
    
    local X=Instance.new("Frame")
    X.Name="FogFill"
    X.Size=UDim2.new(0.5,0,1,0)
    X.BackgroundColor3=Color3.fromRGB(150,200,255)
    X.BorderSizePixel=0
    X.Parent=V
    
    local Y=Instance.new("UICorner")
    Y.CornerRadius=UDim.new(0,3)
    Y.Parent=X
    
    local Z=Instance.new("TextButton")
    Z.Size=UDim2.new(0,30,0,30)
    Z.Position=UDim2.new(1,-35,0,10)
    Z.BackgroundTransparency=1
    Z.Text="X"
    Z.TextColor3=Color3.fromRGB(255,255,255)
    Z.TextSize=20
    Z.Font=Enum.Font.GothamBold
    Z.Parent=x
    
    x.Parent=w
    w.Parent=u
    
    local _,a0,a1,a2,a3=true,2.0,0.5,false,false
    
    local function a4(a5,a6,a7,a8,a9)
        local aa=TweenInfo.new(a7 or 0.4,a8 or Enum.EasingStyle.Quad,a9 or Enum.EasingDirection.Out)
        local ab=m:Create(a5,aa,a6)
        ab:Play()
        return ab
    end
    
    local function a3()
        if _ then
            o.Brightness=a0
            o.GlobalShadows=false
            o.ClockTime=14
            o.ExposureCompensation=0.3
            o.OutdoorAmbient=Color3.fromRGB(200,200,220)
            o.FogColor=Color3.fromRGB(170,180,210)
            o.FogEnd=1000-(a1*800)
            o.FogStart=5
            H.BackgroundColor3=Color3.fromRGB(80,40,160)
            H.Text="ENABLED"
        else
            o.Brightness=1
            o.GlobalShadows=true
            o.FogEnd=100000
            H.BackgroundColor3=Color3.fromRGB(40,20,80)
            H.Text="DISABLED"
        end
    end
    
    local function a2(ac)
        a0=math.clamp(ac,0.1,5.0)
        L.Text=string.format("%.1f",a0)
        O.Size=UDim2.new((a0-0.1)/4.9,0,1,0)
        Q.Position=UDim2.new((a0-0.1)/4.9,-10,0.5,-10)
        a3()
    end
    
    local function ad(ae)
        a1=math.clamp(ae,0,1)
        U.Text=string.format("%.2f",a1)
        X.Size=UDim2.new(a1,0,1,0)
        a3()
    end
    
    local function af()
        a4(x,{Size=UDim2.new(0,350,0,320),BackgroundTransparency=0.1},0.6,Enum.EasingStyle.Back)
        t(0.3)
        a4(D,{TextTransparency=0},1)
        t(0.5)
        local ag={F,J,S}
        for ah,ai in ipairs(ag) do
            for aj,ak in ipairs(ai:GetChildren()) do
                if ak:IsA("TextLabel") then
                    ak.TextTransparency=1
                    a4(ak,{TextTransparency=0},0.4)
                end
            end
            t(0.1)
        end
    end
    
    Q.MouseButton1Down:Connect(function()
        a2=true
        a4(Q,{Size=UDim2.new(0,22,0,22)},0.1)
    end)
    
    M.InputBegan:Connect(function(al)
        if al.UserInputType==Enum.UserInputType.MouseButton1 then
            a2=true
            local am=al.Position.X-M.AbsolutePosition.X
            local an=(am/M.AbsoluteSize.X)*4.9+0.1
            a2(an)
        end
    end)
    
    V.InputBegan:Connect(function(al)
        if al.UserInputType==Enum.UserInputType.MouseButton1 then
            a3=true
            local am=al.Position.X-V.AbsolutePosition.X
            local an=am/V.AbsoluteSize.X
            ad(an)
        end
    end)
    
    p.InputEnded:Connect(function(al)
        if al.UserInputType==Enum.UserInputType.MouseButton1 then
            if a2 then
                a2=false
                a4(Q,{Size=UDim2.new(0,20,0,20)},0.1)
            end
            if a3 then
                a3=false
            end
        end
    end)
    
    p.InputChanged:Connect(function(al)
        if a2 and al.UserInputType==Enum.UserInputType.MouseMovement then
            local am=al.Position.X-M.AbsolutePosition.X
            local an=(am/M.AbsoluteSize.X)*4.9+0.1
            a2(an)
        end
        if a3 and al.UserInputType==Enum.UserInputType.MouseMovement then
            local am=al.Position.X-V.AbsolutePosition.X
            local an=am/V.AbsoluteSize.X
            ad(an)
        end
    end)
    
    H.MouseButton1Click:Connect(function()
        _=not _
        if _ then
            a4(H,{
                BackgroundColor3=Color3.fromRGB(80,40,160),
                TextColor3=Color3.fromRGB(255,255,255)
            },0.2)
            H.Text="ENABLED"
        else
            a4(H,{
                BackgroundColor3=Color3.fromRGB(40,20,80),
                TextColor3=Color3.fromRGB(200,200,200)
            },0.2)
            H.Text="DISABLED"
        end
        a3()
    end)
    
    Z.MouseButton1Click:Connect(function()
        a4(x,{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1},0.4)
        t(0.4)
        w:Destroy()
    end)
    
    H.MouseEnter:Connect(function()
        a4(H,{
            BackgroundColor3=_ and Color3.fromRGB(100,60,180) or Color3.fromRGB(60,40,100)
        },0.2)
    end)
    
    H.MouseLeave:Connect(function()
        a4(H,{
            BackgroundColor3=_ and Color3.fromRGB(80,40,160) or Color3.fromRGB(40,20,80)
        },0.2)
    end)
    
    local ao=false
    local ap=Vector2.new(0,0)
    local aq=x.Position
    
    A.InputBegan:Connect(function(al)
        if al.UserInputType==Enum.UserInputType.MouseButton1 then
            ao=true
            ap=Vector2.new(al.Position.X,al.Position.Y)
            aq=x.Position
        end
    end)
    
    A.InputEnded:Connect(function(al)
        if al.UserInputType==Enum.UserInputType.MouseButton1 then
            ao=false
        end
    end)
    
    p.InputChanged:Connect(function(al)
        if ao and al.UserInputType==Enum.UserInputType.MouseMovement then
            local ar=Vector2.new(al.Position.X,al.Position.Y)-ap
            x.Position=UDim2.new(
                aq.X.Scale,
                aq.X.Offset+ar.X,
                aq.Y.Scale,
                aq.Y.Offset+ar.Y
            )
        end
    end)
    
    p.InputBegan:Connect(function(al)
        if al.KeyCode==Enum.KeyCode.F2 then
            if x.Size==UDim2.new(0,350,0,320) then
                a4(x,{Size=UDim2.new(0,0,0,0)},0.3)
            else
                af()
            end
        end
    end)
    
    af()
    a2(2.0)
    ad(0.5)
    a3()
end

v()
