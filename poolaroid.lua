--[[
    ██████╗  ██████╗  ██████╗ ██╗      █████╗ ██████╗  ██████╗ ██╗██████╗ 
    ██╔══██╗██╔═══██╗██╔═══██╗██║     ██╔══██╗██╔══██╗██╔═══██╗██║██╔══██╗
    ██████╔╝██║   ██║██║   ██║██║     ███████║██████╔╝██║   ██║██║██║  ██║
    ██╔═══╝ ██║   ██║██║   ██║██║     ██╔══██║██╔══██╗██║   ██║██║██║  ██║
    ██║     ╚██████╔╝╚██████╔╝███████╗██║  ██║██║  ██║╚██████╔╝██║██████╔╝
    ╚═╝      ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝╚═════╝ 
    
    Nome: POOLAROID
    Versão: Stealth (sem hooks perigosos)
]]

print("[POOLAROID] Iniciando...")

-- ==================== SERVIÇOS ====================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
print("[POOLAROID] LocalPlayer: " .. LocalPlayer.Name)

-- ==================== CONFIGURAÇÕES ====================
local POOLAROID = {
    AutoSteal = false,
    SpeedEnabled = false,
    NoclipEnabled = false,
    FullBright = false,
    SpeedValue = 60,
    AutoStealDelay = 0.3,
    EggKeyword = "Egg",
    OriginalWalkSpeed = 16,
}

-- ==================== FUNÇÕES AUXILIARES ====================
local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getHRP()
    local char = getCharacter()
    return char:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = getCharacter()
    return char:FindFirstChildOfClass("Humanoid")
end

-- ==================== CRIAÇÃO DO MENU ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "POOLAROID"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
print("[POOLAROID] GUI criada")

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 70, 0, 70)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -35)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ToggleBtn.TextColor3 = Color3.fromRGB(0, 220, 255)
ToggleBtn.Text = "POOL\nAROID"
ToggleBtn.TextSize = 13
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Parent = ScreenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = ToggleBtn

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 220, 255)
stroke.Thickness = 2
stroke.Parent = ToggleBtn

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 420)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = MainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 220, 255)
mainStroke.Thickness = 1.5
mainStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 55)
Title.BackgroundTransparency = 1
Title.Text = "🎯 POOLAROID"
Title.TextColor3 = Color3.fromRGB(0, 220, 255)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 50)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Auto Steal • Teleport • Speed"
Subtitle.TextColor3 = Color3.fromRGB(150, 150, 170)
Subtitle.TextSize = 12
Subtitle.Font = Enum.Font.Gotham
Subtitle.Parent = MainFrame

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -20, 1, -90)
Scroll.Position = UDim2.new(0, 10, 0, 80)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 220, 255)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Scroll

local function criarBotao(nome, cor, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.BackgroundColor3 = cor or Color3.fromRGB(40, 40, 55)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = nome
    btn.TextSize = 15
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.Parent = Scroll
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        callback(btn)
    end)
    
    return btn
end

-- ==================== FUNÇÕES ====================

local function toggleSpeed(btn)
    POOLAROID.SpeedEnabled = not POOLAROID.SpeedEnabled
    local hum = getHumanoid()
    if hum then
        hum.WalkSpeed = POOLAROID.SpeedEnabled and POOLAROID.SpeedValue or POOLAROID.OriginalWalkSpeed
    end
    btn.Text = "🏃 Speed: " .. (POOLAROID.SpeedEnabled and "ON" or "OFF")
    btn.BackgroundColor3 = POOLAROID.SpeedEnabled and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

local function toggleNoclip(btn)
    POOLAROID.NoclipEnabled = not POOLAROID.NoclipEnabled
    btn.Text = "👻 Noclip: " .. (POOLAROID.NoclipEnabled and "ON" or "OFF")
    btn.BackgroundColor3 = POOLAROID.NoclipEnabled and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

local function toggleFullBright(btn)
    POOLAROID.FullBright = not POOLAROID.FullBright
    if POOLAROID.FullBright then
        Lighting.Brightness = 3
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(180, 180, 180)
    else
        Lighting.Brightness = 1
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    end
    btn.Text = "💡 Full Bright: " .. (POOLAROID.FullBright and "ON" or "OFF")
    btn.BackgroundColor3 = POOLAROID.FullBright and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

local function encontrarOvo()
    local ovoMaisProximo = nil
    local distanciaMinima = math.huge
    local hrp = getHRP()
    
    if not hrp then return nil end
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and string.find(string.lower(obj.Name), string.lower(POOLAROID.EggKeyword)) then
            local distancia = (obj.Position - hrp.Position).Magnitude
            if distancia < distanciaMinima then
                distanciaMinima = distancia
                ovoMaisProximo = obj
            end
        end
    end
    
    return ovoMaisProximo
end

local function teleportParaOvo(btn)
    local ovo = encontrarOvo()
    local hrp = getHRP()
    
    if ovo and hrp then
        hrp.CFrame = CFrame.new(ovo.Position + Vector3.new(0, 3, 0))
        btn.Text = "✅ Teleportado!"
        task.wait(1)
        btn.Text = "🎯 Ir até o Ovo"
    else
        btn.Text = "❌ Ovo não encontrado"
        task.wait(1.5)
        btn.Text = "🎯 Ir até o Ovo"
    end
end

local function toggleAutoSteal(btn)
    POOLAROID.AutoSteal = not POOLAROID.AutoSteal
    btn.Text = "🥚 Auto Steal: " .. (POOLAROID.AutoSteal and "ON" or "OFF")
    btn.BackgroundColor3 = POOLAROID.AutoSteal and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

-- Loop Auto Steal (SEM fireproximityprompt por segurança)
task.spawn(function()
    while task.wait(POOLAROID.AutoStealDelay) do
        if POOLAROID.AutoSteal then
            local ovo = encontrarOvo()
            local hrp = getHRP()
            
            if ovo and hrp then
                hrp.CFrame = CFrame.new(ovo.Position + Vector3.new(0, 3, 0))
            end
        end
    end
end)

-- Loop Noclip
RunService.Stepped:Connect(function()
    if POOLAROID.NoclipEnabled then
        local char = getCharacter()
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- Anti-AFK
LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

-- ==================== BOTÕES ====================

criarBotao("🥚 Auto Steal: OFF", Color3.fromRGB(40, 40, 55), toggleAutoSteal)
criarBotao("🎯 Ir até o Ovo", Color3.fromRGB(40, 40, 55), teleportParaOvo)
criarBotao("🏃 Speed: OFF", Color3.fromRGB(40, 40, 55), toggleSpeed)
criarBotao("👻 Noclip: OFF", Color3.fromRGB(40, 40, 55), toggleNoclip)
criarBotao("💡 Full Bright: OFF", Color3.fromRGB(40, 40, 55), toggleFullBright)

criarBotao("❌ Fechar Menu", Color3.fromRGB(120, 40, 40), function()
    MainFrame.Visible = false
end)

-- ==================== TOGGLE MENU ====================
ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- ==================== DRAG ====================
local dragging, dragStart, startPos

ToggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or 
       input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = ToggleBtn.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or 
                     input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        ToggleBtn.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or 
       input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if POOLAROID.SpeedEnabled then
        local hum = getHumanoid()
        if hum then
            hum.WalkSpeed = POOLAROID.SpeedValue
        end
    end
end)

print("╔═══════════════════════════════════╗")
print("║   🎯 POOLAROID CARREGADO          ║")
print("║   Toque em POOLAROID para abrir   ║")
print("╚═══════════════════════════════════╝")
