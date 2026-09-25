local fn = function(arg)
    local genv = typeof(getgenv) == "function" and getgenv() or _G
    if type(genv.MouseDebugPrint) == "function" then
        pcall(genv.MouseDebugPrint, arg)
    end
end

local v

local function fn2()
    local response = nil

    local function fn2()
        if type(response) == "string" and #response > 0 then
            return response
        end
        response =
            game:HttpGet("https://pastefy.app/dVXJ7rW2/raw")
        return response
    end

    local function fn3()
        local mouseHubSaeCleanup = (typeof(getgenv) == "function" and getgenv() or _G).MouseHubSaeCleanup

        if type(mouseHubSaeCleanup) == "function" then
            pcall(mouseHubSaeCleanup)
        end

        local tbl = { game:GetService("CoreGui") }

        if typeof(gethui) == "function" then
            local ok, result = pcall(gethui)
            ok = ok and typeof(result) == "Instance"

            if ok then
                table.insert(tbl, result)
            end
        end

        local tbl2 = {
            Settings = true,
            MouseLeftCenter = true,
            MouseLibrarySettings = true,
            MouseLibraryLauncher = true,
        }
        local n = 0

        for _, v2 in ipairs(tbl) do
            for _, child in ipairs(v2:GetChildren()) do
                if
                    child:IsA("ScreenGui")
                    and (child:GetAttribute("MouseLibraryOwned") == true or tbl2[child.Name])
                then
                    pcall(function()
                        child:Destroy()
                    end)

                    n = n + 1
                end
            end
        end

        if n > 0 then
            fn("cleared " .. n .. " leftover Mouse UI screens")
        end
    end

    local function fn4()
        local chunk, v2 = loadstring((fn2()))
        assert(chunk, v2)
        local v3 = chunk()
        assert(type(v3) == "function", "Mouse Library bootstrap is invalid.")
        local v4 = table.create(45)
        local n = 1

        for i = 1, 90, 2 do
            v4[n] = string.char(
                bit32.bxor(
                    tonumber(
                        string.sub(
                            "306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00",
                            i,
                            i + 1
                        ),
                        16
                    ),
                    string.byte("s9K!2vQ#", (n - 1) % 8 + 1)
                )
            )
            n = n + 1
        end

        return v3(table.concat(v4))
    end

    local str = "unknown"

    for i = 1, 6 do
        task.wait()
        pcall(fn3)
        local ok, result = pcall(fn4)
        ok = ok and type(result) == "table"
        if ok then
            return result
        end
        str = tostring(result)

        if type(str) == "string" and string.find(str, "HttpGet", 1, true) then
            response = nil
        end

        fn("library load attempt " .. i .. " failed: " .. str)
        task.wait(1 + i * 0.5)
    end

    error("Mouse Library failed to load: " .. str, 0)
end

v = fn2()
assert(
    type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function",
    "Mouse Library returned an invalid API."
)
v.ManualQuickDefaults = {
    PinnedFeatures = { "Player > Movement > Speed Boost", "Player > Movement > Boost Speed" },
    Keybinds = { ["Player > Movement > Speed Boost"] = "Q" },
    PinGroups = {},
    LeftCenterHidden = true,
}
local genv2 = typeof(getgenv) == "function" and getgenv() or _G
genv2.MouseLib = v
local v2 = v:CreateWindow({ 
    Name = "Mouse Hub - Steal An Egg", 
    DefaultTab = "Farm",
    -- Cores Personalizadas (Amarelo e Azul)
    Theme = {
        Accent = Color3.fromRGB(255, 215, 0),       -- Amarelo
        Main = Color3.fromRGB(15, 30, 60),          -- Azul Escuro (Fundo)
        Secondary = Color3.fromRGB(25, 45, 85),     -- Azul Médio
        Outline = Color3.fromRGB(0, 120, 255),      -- Azul Claro
        Text = Color3.fromRGB(255, 255, 255),
        PlaceholderText = Color3.fromRGB(200, 200, 200)
    }
})
local defaultTab = v2:GetDefaultTab()
genv2.MouseHub_Window = v2
genv2.MouseHub_DefaultTab = defaultTab
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local CollectionService = game:GetService("CollectionService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local localPlayer = Players.LocalPlayer
local networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")
genv2.MouseHub_Window = v2
genv2.MouseHub_DefaultTab = defaultTab
local fn3

fn3 = function(arg)
    local ok, result = pcall(function()
        return require(arg())
    end)

    if not ok then
        result = ok
    end

    local v3 = result or nil
    return v3
end

local tbl

tbl = {
    EggState = fn3(function()
        return ReplicatedStorage.Client.EggState
    end),
    AreaEggs = fn3(function()
        return ReplicatedStorage.Shared.Types.AreaEggs
    end),
    ToolGameplayGuard = fn3(function()
        return ReplicatedStorage.Client.ToolGameplayGuard
    end),
    Assets = fn3(function()
        return ReplicatedStorage.Data.Assets
    end),
    Guards = fn3(function()
        return ReplicatedStorage.Data.Guards
    end),
    EggRecords = fn3(function()
        return ReplicatedStorage.Shared.Util.EggRecords
    end),
    Mutations = fn3(function()
        return ReplicatedStorage.Shared.Modules.Mutations
    end),
    Save = fn3(function()
        return ReplicatedStorage.Shared.Save
    end),
    FuseKernel = fn3(function()
        return ReplicatedStorage.Shared.Util.FuseKernel
    end),
    AreaEggCycle = fn3(function()
        return ReplicatedStorage.Shared.Util.AreaEggCycle
    end),
    AreaEggResetWall = fn3(function()
        return ReplicatedStorage.Client.AreaEggResetWall
    end),
    AreaEggResetCycle = fn3(function()
        return ReplicatedStorage.Data.AreaEggResetCycle
    end),
    Gears = fn3(function()
        return ReplicatedStorage.Data.Gears
    end),
    Areas = fn3(function()
        return ReplicatedStorage.Data.Areas
    end),
    LimitedEgg = fn3(function()
        return ReplicatedStorage.Data.LimitedEgg
    end),
    BrainrotEgg = fn3(function()
        return ReplicatedStorage.Data.BrainrotEgg
    end),
    MonsterEgg = fn3(function()
        return ReplicatedStorage.Data.MonsterEgg
    end),
}

local v3 = (function()
    if typeof(gethui) == "function" then
        local ok, result = pcall(gethui)
        if ok and typeof(result) == "Instance" then
            return result
        end
    end
    return CoreGui
end)()
local fn5

do
    local v4 = Random.new()
    local str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    fn5 = function()
        local v5 = v4:NextInteger(12, 20)
        local v6 = table.create(v5)

        for i = 1, v5 do
            local v7 = v4:NextInteger(1, #str)
            v6[i] =
                string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", v7, v7)
        end

        return table.concat(v6)
    end
end

local fn6, fn7

do
    local tbl2 = {}

    fn6 = function(arg)
        table.insert(tbl2, arg)
    end

    local str = "All"

    fn7 = function(arg)
        if type(arg) ~= "table" then
            return arg
        end
        local value = rawget(arg, "Instance")
        if typeof(value) ~= "Instance" then
            return arg
        end
        local flag = false

        local function fn8(arg2)
            if flag then
                return
            end

            if arg2.Text == "None" then
                flag = true
                arg2.Text = str
                flag = false
            end
        end

        local function fn9(arg2)
            if not arg2:IsA("TextLabel") or arg2.Name ~= "Value" then
                return
            end
            fn8(arg2)

            local connection = arg2:GetPropertyChangedSignal("Text"):Connect(function()
                fn8(arg2)
            end)

            fn6(function()
                pcall(function()
                    connection:Disconnect()
                end)
            end)
        end

        for _, descendant in ipairs(value:GetDescendants()) do
            fn9(descendant)
        end

        local connection = value.DescendantAdded:Connect(fn9)

        fn6(function()
            pcall(function()
                connection:Disconnect()
            end)
        end)

        return arg
    end

    local genv = typeof(getgenv) == "function" and getgenv() or _G
    local mouseHubSaeCleanup = genv.MouseHubSaeCleanup

    if type(mouseHubSaeCleanup) == "function" then
        pcall(mouseHubSaeCleanup)
    end

    genv.MouseHubSaeCleanup = function()
        for i = #tbl2, 1, -1 do
            pcall(tbl2[i])
        end

        table.clear(tbl2)
    end
end

do
    local n = 0
    local fn8 = nil

    fn8 = function(arg, arg2)
        local n2 = arg2 or 0

        if type(arg) == "table" then
            if 3 < n2 then
                return
            end
            local n3 = 0

            for k, v4 in pairs(arg) do
                n3 = n3 + 1

                if not (n3 > 20) then
                    fn8(k, n2 + 1)
                    fn8(v4, n2 + 1)
                    continue
                end

                break
            end
        elseif typeof(arg) == "Instance" then
            pcall(arg.GetFullName, arg)
        else
            n = n + #tostring(arg)
        end
    end

    local tbl2 = {}

    local function fn9(arg)
        local n2 = #tbl2 + 1
        tbl2[n2] = arg
    end

    local function fn10()
        for _, v4 in ipairs(tbl2) do
            pcall(function()
                v4:Disconnect()
            end)
        end

        table.clear(tbl2)
    end

    local function fn11()
        fn10()

        for _, v4 in ipairs({
            "RE/GearSatchel/Lost",
            "RE/GearSatchel/Gained",
            "RE/RigSync/ProbeSatchel",
            "RE/RigSync/SeedSatchel",
            "RE/RigSync/CorrectionBegan",
            "RE/RigSync/Refresh",
            "RE/ToolTrigger/Trigger",
            "RE/BatSwing/Trigger",
        }) do
            local v5 = networking:FindFirstChild(v4)

            if v5 and v5:IsA("RemoteEvent") then
                fn9(v5.OnClientEvent:Connect(function(...)
                    fn8({ ... })
                end))
            end
        end

        local function fn11(arg)
            if not arg then
                return
            end

            fn9(arg.ChildRemoved:Connect(function(arg2)
                if arg2:IsA("Tool") then
                    fn8({ arg2.Name, arg2.Parent })
                end
            end))

            fn9(arg.ChildAdded:Connect(function(arg2)
                if arg2:IsA("Tool") then
                    fn8({ arg2.Name })
                end
            end))
        end

        fn11(localPlayer:FindFirstChildOfClass("Backpack"))

        fn9(localPlayer.ChildAdded:Connect(function(arg)
            if arg:IsA("Backpack") then
                fn11(arg)
            end
        end))

        task.spawn(function()
            pcall(function()
                local v4 = require(ReplicatedStorage.Shared.Save).Get()
                fn8({ v4.GearInventory, v4.Inventory }, 2)
            end)

            if type(getgc) == "function" then
                pcall(function()
                    for _, v4 in ipairs(getgc(false)) do
                        if type(v4) == "function" and islclosure(v4) then
                            pcall(debug.info, v4, "n")
                        end
                    end
                end)
            end
        end)
    end

    local genv = typeof(getgenv) == "function" and getgenv() or _G
    genv.MouseToolKeeper = fn11
    task.defer(fn11)
    fn6(fn10)
end

local tbl2

do
    local n = 0.35
    local n2 = 5
    local tbl3 = {}
    local flag = true

    tbl2 = {
        Add = function(arg)
            local tbl4 = { Run = arg, Gap = n, Idle = n2, Repeat = false, Hold = 0 }
            table.insert(tbl3, tbl4)
            return tbl4
        end,
        Wake = function()
            flag = true
        end,
        Backoff = function(arg, arg2)
            if arg then
                arg.Hold = tonumber(arg2) or 6
            end
        end,
    }

    local connection = RunService.Heartbeat:Connect(function(arg)
        local v4 = flag
        flag = false

        for _, v5 in ipairs(tbl3) do
            v5.Gap = v5.Gap + arg
            v5.Idle = v5.Idle + arg

            if 0 < v5.Hold then
                v5.Hold = v5.Hold - arg
            elseif v5.Gap >= n and (v4 or v5.Repeat or v5.Idle >= n2) then
                v5.Gap = 0
                v5.Idle = 0
                local ok, result = pcall(v5.Run, v5)
                ok = ok and result == true
                v5.Repeat = ok
            end
        end
    end)

    fn6(function()
        connection:Disconnect()
    end)
end

local v4 = defaultTab:CreateSection({ Name = "Dr Scramble Event", Expanded = false })
local v5 = defaultTab:CreateSection({ Name = "Auto Steal", Expanded = true })
local v6 = defaultTab:CreateSection({ Name = "Auto Place Egg", Expanded = false })
local v7 = defaultTab:CreateSection({ Name = "Auto Treadmill", Expanded = false })
local v8 = defaultTab:CreateSection({ Name = "Auto Hatch & Equip", Expanded = false })
local v9 = defaultTab:CreateSection({ Name = "Auto Sell", Expanded = false })
local v10 = defaultTab:CreateSection({ Name = "Auto Fuse Machine", Expanded = false })
local v11 = defaultTab:CreateSection({ Name = "Auto Favorite", Expanded = false })
local v12 = defaultTab:CreateSection({ Name = "Auto Rift & Boss", Expanded = false })
local tbl3 = { Paused = false }

do
    local n = 0.5
    local v13 = nil
    local tbl4 = nil
    local tbl5 = {}
    local flag = false
    local n2 = 0

    local function fn8()
        for i = #tbl5, 1, -1 do
            local v14 = tbl5[i]

            if v14 and v14.Connected then
                v14:Disconnect()
            end

            tbl5[i] = nil
        end
    end

    local function fn9()
        fn8()
        local v14 = v13
        local v15 = tbl4
        v13 = nil
        tbl4 = nil
        if not v14 or not v14.Parent or not v15 then
            return
        end

        pcall(function()
            v14.BreakJointsOnDeath = v15.BreakJointsOnDeath
            v14.RequiresNeck = v15.RequiresNeck
            v14:SetStateEnabled(Enum.HumanoidStateType.Dead, v15.DeadEnabled)
        end)
    end

    local function fn10(arg)
        if not arg or not arg.Parent then
            return false
        end

        local flag2 = pcall(function()
            arg.BreakJointsOnDeath = false
            arg.RequiresNeck = false
            arg:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end) and arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(
            Enum.HumanoidStateType.Dead
        ) == false

        return flag2
    end

    local function fn11(arg)
        if tbl3.Paused or arg ~= v13 or not arg or not arg.Parent or flag then
            return false
        end
        local maxHealth = arg.MaxHealth
        if maxHealth <= 0 then
            return false
        end

        if maxHealth == math.huge or arg.Health >= maxHealth then
            return true
        end
        flag = true

        local ok = pcall(function()
            arg.Health = maxHealth
        end)

        flag = false
        ok = ok and arg.Health >= maxHealth
        return ok
    end

    local function fn12(arg)
        if arg == v13 and arg and arg.Parent then
            return true
        end
        fn9()
        if not arg or not arg:IsA("Humanoid") or not arg.Parent then
            return false
        end
        v13 = arg
        tbl4 = {
            BreakJointsOnDeath = arg.BreakJointsOnDeath,
            RequiresNeck = arg.RequiresNeck,
            DeadEnabled = arg:GetStateEnabled(Enum.HumanoidStateType.Dead),
        }
        if not fn10(arg) then
            fn9()
            return false
        end
        fn11(arg)
        local n3 = #tbl5 + 1

        tbl5[n3] = arg.HealthChanged:Connect(function()
            fn11(arg)
        end)

        local n4 = #tbl5 + 1

        tbl5[n4] = arg:GetPropertyChangedSignal("MaxHealth"):Connect(function()
            fn11(arg)
        end)

        local n5 = #tbl5 + 1

        tbl5[n5] = arg.StateChanged:Connect(function(arg2, arg3)
            if arg3 == Enum.HumanoidStateType.Dead and not tbl3.Paused then
                fn10(arg)
                fn11(arg)
            end
        end)

        n2 = os.clock()
        return true
    end

    local function fn13()
        local character = localPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid") or nil
        return humanoid
    end

    local connection = localPlayer.CharacterAdded:Connect(function()
        task.defer(function()
            fn12(fn13())
        end)
    end)

    local connection2 = RunService.Heartbeat:Connect(function()
        local now = os.clock()
        if tbl3.Paused or now - n2 < n then
            return
        end
        n2 = now
        local v14 = fn13()
        if v14 ~= v13 then
            fn12(v14)
            return
        end

        if v14 then
            fn10(v14)
            fn11(v14)
        end
    end)

    task.defer(function()
        fn12(fn13())
    end)

    fn6(function()
        if connection then
            connection:Disconnect()
        end

        if connection2 then
            connection2:Disconnect()
        end

        fn9()
    end)
end

local tbl4
local tbl5 = { "bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade" }

tbl4 = {
    Steal = { Active = false, LastFinishedAt = 0, Carrying = false },
    Movement = {
        Owner = nil,
        PlaceWanted = false,
        StealFirst = false,
        MutationWanted = false,
        FracturedWanted = false,
    },
    AntiGuard = {
        Enabled = false,
        Busy = false,
        BusySince = 0,
        HitArms = 0,
        Handle = nil,
        Render = nil,
    },
    IsBatTool = function(arg)
        if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
            return false
        end

        if arg:GetAttribute("IsBat") == true then
            return true
        end
        local attribute = arg:GetAttribute("GearName")

        if type(attribute) == "string" then
            local gears = tbl.Gears
            local directory = type(gears) == "table" and gears.Directory or nil
            local flag = type(directory) == "table" and directory[attribute] or nil
            local flag2 = type(flag) == "table" and flag.BatControllerData ~= nil
            return flag2
        end

        if arg:GetAttribute("ItemType") ~= nil then
            return false
        end
        local v13 = string.lower(arg.Name)

        for _, v14 in ipairs(tbl5) do
            if string.find(v13, v14, 1, true) then
                return true
            end
        end

        return false
    end,
}

tbl4.FindBat = function()
    local character = localPlayer.Character
    local tool = character and character:FindFirstChildWhichIsA("Tool")
    if tbl4.IsBatTool(tool) then
        return tool
    end
    local backpack = localPlayer:FindFirstChildOfClass("Backpack")

    if backpack then
        for _, child in ipairs(backpack:GetChildren()) do
            if tbl4.IsBatTool(child) then
                return child
            end
        end
    end

    if character then
        for _, child in ipairs(character:GetChildren()) do
            if tbl4.IsBatTool(child) then
                return child
            end
        end
    end

    return nil
end

tbl4.IsNight = function()
    local areaEggCycle = tbl.AreaEggCycle
    if type(areaEggCycle) ~= "table" or type(areaEggCycle.IsNightPhase) ~= "function" then
        return false
    end
    local ok, result = pcall(areaEggCycle.IsNightPhase, workspace:GetServerTimeNow())
    ok = ok and result == true
    return ok
end

tbl4.WallSealed = function()
    local areaEggResetWall = tbl.AreaEggResetWall
    if type(areaEggResetWall) ~= "table" or type(areaEggResetWall.IsSealed) ~= "function" then
        return false
    end
    local ok, result = pcall(areaEggResetWall.IsSealed)
    ok = ok and result == true
    return ok
end

tbl4.WallOpenDelay = function()
    local areaEggResetCycle = tbl.AreaEggResetCycle
    if type(areaEggResetCycle) ~= "table" then
        return 5
    end
    local n = tonumber(areaEggResetCycle.WallCountdownDelayAfterDayStartsSeconds) or 2
    local n2 = tonumber(areaEggResetCycle.WallCountdownSeconds) or 3
    return n + n2
end

tbl4.ClaimMovement = function(arg)
    local movement = tbl4.Movement
    if
        movement.Owner == nil
        or movement.Owner == arg
        or movement.Owner == "treadmill" and arg ~= "treadmill"
        or movement.Owner == "scramble" and arg == "steal"
    then
        movement.Owner = arg
        return true
    end
    return false
end

tbl4.ReleaseMovement = function(arg)
    if tbl4.Movement.Owner == arg then
        tbl4.Movement.Owner = nil
    end
end

do
    local tbl6 = { "Humanoid Swap", "Disable Monitor" }
    tbl4.ShieldMethods = tbl6
    local v13 = tbl6[1]
    local tbl7 = {}
    local tbl8 = {}
    local connection = nil
    local n = 0
    local tbl9 = { Original = nil, Clone = nil, Links = {} }
    local connection2 = nil
    local tbl10 = {}

    local function fn8()
        for _, v14 in ipairs(tbl10) do
            task.defer(function()
                pcall(v14)
            end)
        end
    end

    tbl4.OnHumanoidChanged = function(arg)
        table.insert(tbl10, arg)
        local tbl11 = { Connected = true }

        tbl11.Disconnect = function()
            tbl11.Connected = false
            local v14 = table.find(tbl10, arg)

            if v14 then
                table.remove(tbl10, v14)
            end
        end

        return tbl11
    end

    local function fn9(arg)
        pcall(function()
            local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
            playerScripts = playerScripts and playerScripts:FindFirstChild("PlayerModule")

            if playerScripts then
                local controls = require(playerScripts):GetControls()

                if type(controls) == "table" then
                    controls.humanoid = arg
                end
            end
        end)
    end

    local function fn10(arg)
        local animate = arg and arg:FindFirstChild("Animate")

        if animate and animate:IsA("LocalScript") then
            task.spawn(function()
                animate.Enabled = false
                task.wait()
                animate.Enabled = true
            end)
        end
    end

    local function fn11()
        for _, v14 in ipairs(tbl9.Links) do
            pcall(function()
                v14:Disconnect()
            end)
        end

        table.clear(tbl9.Links)
    end

    tbl4.UndoSwap = function()
        fn11()
        local character = localPlayer.Character
        local original = tbl9.Original
        local clone = tbl9.Clone
        local v14 = tbl9
        tbl9.Original = nil
        v14.Clone = nil

        if
            original
            and clone
            and character
            and original.Parent == nil
            and clone.Parent == character
        then
            original.Parent = character
            workspace.CurrentCamera.CameraSubject = original
            fn9(original)

            pcall(function()
                clone:Destroy()
            end)

            fn10(character)
            fn8()
        end
    end

    local tbl11 = {
        [Enum.HumanoidStateType.Running] = true,
        [Enum.HumanoidStateType.RunningNoPhysics] = true,
        [Enum.HumanoidStateType.Landed] = true,
    }

    tbl4.Grounded = function(arg)
        if not arg then
            arg = localPlayer.Character
            arg = arg and arg:FindFirstChildOfClass("Humanoid")
        end

        if not arg or arg.Health <= 0 or arg.FloorMaterial == Enum.Material.Air then
            return false
        end
        return tbl11[arg:GetState()] == true
    end

    tbl4.ShieldPaused = false

    local function fn12()
        local character = localPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then
            return
        end

        if tbl9.Clone and tbl9.Clone.Parent == character then
            return
        end

        if not tbl4.Grounded(humanoid) then
            return
        end
        local clone = humanoid:Clone()
        humanoid.Parent = nil
        clone.Parent = character
        workspace.CurrentCamera.CameraSubject = clone
        fn9(clone)
        fn10(character)
        local v14 = tbl9
        tbl9.Original = humanoid
        v14.Clone = clone
        fn8()
        local animator = humanoid:FindFirstChildOfClass("Animator")
        local animator2 = clone:FindFirstChildOfClass("Animator")

        if animator and animator2 then
            table.insert(
                tbl9.Links,
                animator.AnimationPlayed:Connect(function(arg)
                    local animation = arg.Animation
                    if not animation or clone.Parent == nil then
                        return
                    end

                    local ok, result = pcall(function()
                        return animator2:LoadAnimation(animation)
                    end)

                    local v15 = result
                    if not ok or not v15 then
                        return
                    end

                    pcall(function()
                        v15.Priority = arg.Priority
                        v15.Looped = arg.Looped
                        local speed = arg.Speed
                        v15:Play(0.05, math.max(arg.WeightTarget, 0.01), speed)
                    end)

                    local connection3 = nil

                    connection3 = arg.Stopped:Connect(function()
                        connection3:Disconnect()

                        pcall(function()
                            v15:Stop(0.1)
                        end)
                    end)
                end)
            )
        end

        table.insert(
            tbl9.Links,
            clone.Died:Connect(function()
                fn11()
                local v15 = tbl9
                tbl9.Original = nil
                v15.Clone = nil
                local character2 = localPlayer.Character

                if character2 and humanoid.Parent == nil then
                    humanoid.Parent = character2
                    workspace.CurrentCamera.CameraSubject = humanoid
                    fn9(humanoid)
                    fn8()
                end

                pcall(function()
                    clone:Destroy()
                end)

                humanoid.Health = 0
            end)
        )
    end

    local function fn13()
        if type(getconnections) ~= "function" then
            return
        end

        for _, v14 in ipairs({
            RunService.Heartbeat,
            RunService.PreSimulation,
            RunService.PostSimulation,
        }) do
            local ok, result = pcall(getconnections, v14)
            local v15 = result
            ok = ok and type(v15) == "table"

            if ok then
                for _, v16 in ipairs(v15) do
                    local ok2, result2 = pcall(function()
                        return v16.Function
                    end)

                    local flag = ok2 and type(result2) == "function"
                    local flag2 = false
                    local result3 = nil

                    if flag then
                        flag2, result3 = pcall(debug.info, result2, "s")
                    end

                    flag2 = flag2 and string.find(tostring(result3), "UGI", 1, true)

                    if flag2 then
                        local ok3, result4 = pcall(function()
                            return v16.Enabled
                        end)

                        if not ok3 or result4 ~= false then
                            if
                                pcall(function()
                                    v16:Disable()
                                end)
                            then
                                table.insert(tbl8, v16)
                            end
                        end
                    end
                end
            end
        end
    end

    local function fn14()
        if connection then
            connection:Disconnect()
            connection = nil
        end

        if connection2 then
            connection2:Disconnect()
            connection2 = nil
        end

        for _, v14 in ipairs(tbl8) do
            pcall(function()
                v14:Enable()
            end)
        end

        table.clear(tbl8)
    end

    local function fn15()
        if tbl4.ShieldPaused then
            return
        end

        if v13 == tbl6[1] then
            fn12()
        else
            fn13()
        end
    end

    local function fn16()
        fn15()
        n = 0

        connection = RunService.Heartbeat:Connect(function(arg)
            n = n + arg
            local character = localPlayer.Character
            local flag = v13 == tbl6[1]

            if flag then
                flag = not (tbl9.Clone and character and tbl9.Clone.Parent == character)
            end

            local v14 = n
            flag = flag and 0.25
            flag = flag or 3

            if flag <= v14 then
                n = 0
                fn15()
            end
        end)

        connection2 = localPlayer.CharacterAdded:Connect(function(arg)
            fn11()
            local v14 = tbl9
            tbl9.Original = nil
            v14.Clone = nil
            if v13 ~= tbl6[1] then
                return
            end

            task.spawn(function()
                arg:WaitForChild("Humanoid", 10)
                task.wait(1)
                local flag = connection

                if connection then
                    flag = localPlayer.Character == arg
                end

                if flag then
                    fn15()
                end
            end)
        end)
    end

    tbl4.Swapped = function()
        if v13 ~= tbl6[1] then
            return true
        end
        local character = localPlayer.Character
        local flag = tbl9.Clone ~= nil and character ~= nil and tbl9.Clone.Parent == character
        return flag
    end

    tbl4.Shield = function(arg, arg2)
        local v14 = tbl7
        v14[arg] = arg2 == true or nil
        if next(tbl7) == nil then
            fn14()
            return
        end

        if connection then
            return
        end
        fn16()
    end

    tbl4.SetShieldMethod = function(arg)
        if not table.find(tbl6, arg) or arg == v13 then
            return
        end
        local flag = connection ~= nil
        fn14()
        v13 = arg
        flag = flag and next(tbl7) ~= nil

        if flag then
            fn16()
        end
    end

    fn6(fn14)
end

tbl4.Shield("load", true)

tbl4.Toggle = function(arg, arg2)
    if type(arg) ~= "table" then
        return arg2 == true
    end

    local ok, result = pcall(function()
        local controller = arg._controller
        local flag = type(controller) == "table"
            and type(controller.GetValue) == "function"
            and controller.GetValue()
        return flag
    end)

    ok = ok and type(result) == "boolean"
    if ok then
        return result
    end

    for _, v13 in ipairs({ "Get", "GetValue" }) do
        local ok2, result2 = pcall(function()
            return arg[v13]
        end)

        local v14 = result2
        ok2 = ok2 and type(v14) == "function"

        if ok2 then
            local ok3, result3 = pcall(v14, arg)
            ok3 = ok3 and type(result3) == "boolean"
            if ok3 then
                return result3
            end
        end
    end

    return arg2 == true
end

tbl4.Root = function()
    local character = localPlayer.Character
    character = character and character:FindFirstChild("HumanoidRootPart")
    local v13 = character and character:IsDescendantOf(workspace)

    if not v13 then
        character = v13
    end

    character = character or nil
    return character
end

tbl4.PlacedPoints = function()
    local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
    local tbl6 = {}
    if not placedEggRenders then
        return tbl6
    end
    local str = tostring(localPlayer.UserId)

    for _, child in ipairs(placedEggRenders:GetChildren()) do
        if string.find(child.Name, str, 1, true) then
            local ok, result = pcall(function()
                local pivot = child:IsA("Model") and child:GetPivot() or child.CFrame
                return pivot
            end)

            if ok then
                table.insert(tbl6, result.Position)
            end
        end
    end

    return tbl6
end

tbl4.OwnPlot = function()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then
        return nil
    end

    for _, child in ipairs(plots:GetChildren()) do
        local plotSign = child:FindFirstChild("PlotSign")
        plotSign = plotSign and plotSign:FindFirstChild("PlayerPlotSign")
        plotSign = plotSign and plotSign:FindFirstChild("Frame")
        plotSign = plotSign and plotSign:FindFirstChild("PlayerName")

        if plotSign and plotSign:IsA("TextLabel") then
            local v13 = string.lower(plotSign.Text)
            if
                v13 == string.lower(localPlayer.Name)
                or v13 == string.lower(localPlayer.DisplayName)
            then
                return child
            end
            continue
        end
    end

    return nil
end

local function fn8()
    local v13 = tbl4.PlacedPoints()
    if #v13 == 0 then
        return nil
    end
    local vector = Vector3.new(0, 0, 0)

    for _, v14 in ipairs(v13) do
        vector = vector + v14
    end

    return vector / #v13
end

tbl4.PenAnchor = function()
    local v13 = fn8()
    if v13 then
        return v13
    end
    local v14 = tbl4.OwnPlot()
    if not v14 then
        return nil
    end
    local toUpdate = v14:FindFirstChild("ToUpdate")
    toUpdate = toUpdate and toUpdate:FindFirstChild("StarterPen")
    local centerPoint = toUpdate or v14:FindFirstChild("CenterPoint")
    if not centerPoint then
        return nil
    end

    local ok, result = pcall(function()
        local pivot = centerPoint:IsA("Model") and centerPoint:GetPivot() or centerPoint.CFrame
        return pivot
    end)

    ok = ok and result.Position
    ok = ok or nil
    return ok
end

tbl4.Plot = function()
    local v13 = tbl4.OwnPlot()
    if v13 then
        return v13
    end
    local plots = workspace:FindFirstChild("Plots")
    local v14 = fn8()
    if not plots or not v14 then
        return nil
    end
    local huge = math.huge
    local v15 = nil

    for _, child in ipairs(plots:GetChildren()) do
        local ok, result, result2 = pcall(function()
            return child:GetBoundingBox()
        end)

        local v16 = result
        local v17 = result2
        ok = ok and v16
        ok = ok and v17

        if ok then
            local v18 = v16:PointToObjectSpace(v14)
            local n = v17.X / 2
            local flag = math.abs(v18.X) <= n

            if flag then
                local n2 = v17.Z / 2
                flag = math.abs(v18.Z) <= n2
            end

            if flag then
                return child
            end
            local magnitude = (v16.Position - v14).Magnitude

            if magnitude < huge then
                v15 = child
                huge = magnitude
            end
        end
    end

    if v15 and huge <= 60 then
        return v15
    end
    return nil
end

tbl4.Belt = function()
    local v13 = tbl4.Plot()
    if not v13 then
        return nil
    end
    local treadmillBottom = v13:FindFirstChild("TreadmillBottom")
    if treadmillBottom and treadmillBottom:IsA("BasePart") then
        return treadmillBottom
    end
    local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
    clientTreadmillRenders = clientTreadmillRenders
        and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. v13.Name)
    local primaryPart

    if clientTreadmillRenders then
        local boundingBoxPart = clientTreadmillRenders:FindFirstChild("BoundingBoxPart")

        if boundingBoxPart then
            primaryPart = boundingBoxPart
        else
            primaryPart = clientTreadmillRenders:IsA("Model") and clientTreadmillRenders.PrimaryPart
        end

        primaryPart = primaryPart or clientTreadmillRenders:FindFirstChildWhichIsA("BasePart")
    else
        primaryPart = clientTreadmillRenders
    end

    if primaryPart then
        return primaryPart
    end
    local treadmillUpgrade = v13:FindFirstChild("TreadmillUpgrade")
    treadmillUpgrade = treadmillUpgrade and treadmillUpgrade:FindFirstChildWhichIsA("BasePart")
    treadmillUpgrade = treadmillUpgrade or nil
    return treadmillUpgrade
end

tbl4.DistanceTo = function(arg)
    local v13 = tbl4.Root()
    if not v13 or not arg then
        return math.huge
    end
    return (v13.Position - arg).Magnitude
end

do
    local tbl6 = {}
    local n = 0

    local function fn9()
        local v13 = tbl4.Plot()
        if not v13 then
            return {}
        end
        local tbl7 = {}

        for _, v14 in ipairs({ "TreadmillBottom", "TreadmillUpgrade" }) do
            local v15 = v13:FindFirstChild(v14)

            if v15 then
                if v15:IsA("BasePart") then
                    table.insert(tbl7, v15)
                else
                    for _, descendant in ipairs(v15:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            table.insert(tbl7, descendant)
                        end
                    end
                end
            end
        end

        local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
        clientTreadmillRenders = clientTreadmillRenders
            and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. v13.Name)

        if clientTreadmillRenders then
            for _, descendant in ipairs(clientTreadmillRenders:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    table.insert(tbl7, descendant)
                end
            end
        end

        return tbl7
    end

    local function fn10()
        for _, v13 in ipairs(fn9()) do
            if not tbl6[v13] then
                tbl6[v13] = {
                    CFrame = v13.CFrame,
                    CanTouch = v13.CanTouch,
                    CanCollide = v13.CanCollide,
                    Transparency = v13.Transparency,
                }

                pcall(function()
                    v13.CanTouch = false
                    v13.CanCollide = false
                    v13.Transparency = 1
                    v13.CFrame = v13.CFrame - Vector3.new(0, 120, 0)
                end)
            end
        end
    end

    local function fn11()
        for k, v13 in pairs(tbl6) do
            if k and k.Parent then
                pcall(function()
                    k.CFrame = v13.CFrame
                    k.CanTouch = v13.CanTouch
                    k.CanCollide = v13.CanCollide
                    k.Transparency = v13.Transparency
                end)
            end
        end

        table.clear(tbl6)
    end

    tbl4.HoldBelt = function()
        n = n + 1
        fn10()
    end

    tbl4.ReleaseBelt = function()
        n = math.max(0, n - 1)

        if n == 0 then
            fn11()
        end
    end

    tbl4.BeltHeld = function()
        return n > 0
    end

    tbl4.RefreshBeltHide = function()
        if n > 0 then
            fn10()
        end
    end

    fn6(function()
        n = 0
        fn11()
    end)

    tbl4.LeaveBelt = function()
        local rfTreadmillAskDoff = networking:FindFirstChild("RF/Treadmill/AskDoff")

        if rfTreadmillAskDoff and rfTreadmillAskDoff:IsA("RemoteFunction") then
            pcall(rfTreadmillAskDoff.InvokeServer, rfTreadmillAskDoff)
        end
    end

    tbl4.Treadmill = { Riding = false }

    tbl4.ResetBelt = function()
        n = 0
        fn11()
    end

    tbl4.OnBelt = function()
        local v13 = tbl4.Belt()
        if not v13 or tbl6[v13] then
            return false
        end
        local v14 = tbl4.Root()
        if not v14 then
            return false
        end
        local v15 = v13.CFrame:PointToObjectSpace(v14.Position)
        local n2 = v13.Size.X / 2 + 2
        local flag = math.abs(v15.X) <= n2
        local flag2

        if flag then
            local n3 = v13.Size.Z / 2 + 2
            flag2 = math.abs(v15.Z) <= n3
        else
            flag2 = flag
        end

        flag2 = flag2 and v15.Y >= -2
        flag2 = flag2 and v15.Y <= v13.Size.Y / 2 + 8
        return flag2
    end
end

tbl4.ExitBelt = function()
    tbl4.Treadmill.Riding = false
    tbl4.LeaveBelt()
    local character = localPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        pcall(function()
            humanoid.Jump = true
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end

    task.wait(0.35)
end

tbl4.Flying = false
tbl4.Driving = 0

tbl4.BeginFlight = function()
    tbl4.Flying = true
    local character = localPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.PlatformStand = true

        pcall(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end)
    end

    return tbl4.Root() ~= nil
end

tbl4.SetFlightVelocity = function(arg)
    local v13 = tbl4.Root()

    if v13 then
        v13.AssemblyLinearVelocity = arg
        v13.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
end

tbl4.EndFlight = function()
    tbl4.Flying = false
    local v13 = tbl4.Root()

    if v13 then
        pcall(function()
            v13.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            v13.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end)
    end

    local character = localPlayer.Character
    character = character and character:FindFirstChildOfClass("Humanoid")

    if character then
        character.PlatformStand = false
    end
end

do
    local tbl6 = {
        Enum.HumanoidStateType.FallingDown,
        Enum.HumanoidStateType.Ragdoll,
        Enum.HumanoidStateType.Physics,
        Enum.HumanoidStateType.Seated,
        Enum.HumanoidStateType.PlatformStanding,
    }
    local tbl7 = {}
    local flag = false

    tbl4.GodMode = function(arg)
        local character = localPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if not character or not humanoid then
            return
        end

        if arg then
            flag = true

            for _, v13 in ipairs(tbl6) do
                pcall(function()
                    humanoid:SetStateEnabled(v13, false)
                end)
            end

            pcall(function()
                humanoid.BreakJointsOnDeath = false
            end)

            for _, descendant in ipairs(character:GetDescendants()) do
                if descendant:IsA("BasePart") and tbl7[descendant] == nil then
                    tbl7[descendant] = descendant.CanCollide

                    pcall(function()
                        descendant.CanCollide = false
                    end)
                end
            end
        elseif flag then
            flag = false

            for _, v13 in ipairs(tbl6) do
                pcall(function()
                    humanoid:SetStateEnabled(v13, true)
                end)
            end

            for k, v13 in pairs(tbl7) do
                if k and k.Parent then
                    pcall(function()
                        k.CanCollide = v13
                    end)
                end
            end

            table.clear(tbl7)
        end
    end
end

tbl4.GodTick = function()
    local character = localPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid and humanoid.Health < humanoid.MaxHealth then
        pcall(function()
            humanoid.Health = humanoid.MaxHealth
        end)
    end
end

tbl4.StopWalking = function()
    local character = localPlayer.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid and humanoidRootPart then
        pcall(function()
            humanoid:MoveTo(humanoidRootPart.Position)
            humanoid:Move(Vector3.new(0, 0, 0), false)
        end)
    end
end

local function fn9(arg, arg2, arg3, arg4)
    local n = tonumber(arg2) or 6
    local n2 = tonumber(arg3) or 10
    local n3 = 0
    local position = nil
    local n4 = 0
    local n5 = 0

    while n3 < n2 do
        if type(arg4) == "function" and arg4() then
            tbl4.StopWalking()
            return false
        end
        local character = localPlayer.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        character = character and character:FindFirstChildOfClass("Humanoid")
        if not humanoidRootPart or not character or character.Health <= 0 then
            return false
        end

        if (humanoidRootPart.Position - arg).Magnitude <= n then
            tbl4.StopWalking()
            return true
        end

        if position and (humanoidRootPart.Position - position).Magnitude < 1 then
            n4 = n4 + 0.2
        else
            n4 = 0
        end

        position = humanoidRootPart.Position
        n5 = math.max(0, n5 - 0.2)

        if n4 >= 0.8 and n5 <= 0 then
            tbl4.LeaveBelt()

            pcall(function()
                character.Jump = true
            end)

            n4 = 0
            n5 = 1.5
        end

        character:MoveTo(arg)
        n3 = n3 + task.wait(0.2)
    end

    tbl4.StopWalking()
    return tbl4.DistanceTo(arg) <= n
end

tbl4.WalkTo = function(arg, arg2, arg3, arg4)
    tbl4.Driving = tbl4.Driving + 1
    local ok, result = pcall(fn9, arg, arg2, arg3, arg4)
    tbl4.Driving = math.max(0, tbl4.Driving - 1)
    ok = ok and result == true
    return ok
end

local fn10
local tbl6 =
    { Boss = "Fractured", GreatBloom = "Spirit Bloom", Sakura = "Bloom", Monstrous = "Parasite" }

task.spawn(function()
    local mutations = tbl.Mutations

    local ok, result = pcall(function()
        return mutations.All()
    end)

    local v13 = result

    if ok and type(v13) == "table" then
        for k, v14 in pairs(v13) do
            local flag = type(v14) == "table"
            local id

            if flag then
                id = v14.Id or k
            else
                id = flag
            end

            id = id or nil
            local label = type(v14) == "table" and v14.Label or nil

            if id ~= nil and type(label) == "string" and label ~= "" then
                tbl6[tostring(id)] = label
            end
        end
    end
end)

fn10 = function(arg)
    local str = tbl6[tostring(arg)] or tostring(arg)
    return str
end

local tbl7, tbl8, tbl9, tbl10, n, tbl11, tbl12, tbl13, n2, n3
local n4, fn11, v13, v14, v15, v16, v17, str, str2, flag
local n5, tbl14, v18, fn12, fn13

do
    local tbl15, flag2, tbl16, n6, v19

    do
        local tbl17 = {
            "Forest",
            "Desert",
            "Snow",
            "Lake",
            "Jungle",
            "Volcano",
            "Prehistoric",
            "Cosmic",
            "Abyss Ocean",
            "Cherry Blossom",
            "Light Dark",
            "Titan Temple",
        }
        local tbl18 = {}

        for _, v20 in ipairs(tbl17) do
            tbl18[v20] = true
        end

        task.spawn(function()
            local eggState = tbl.EggState

            local ok, result = pcall(function()
                return eggState.ReadFieldEggs()
            end)

            ok = ok and type(result) == "table"
            ok = ok and type(result.Records) == "table"

            if ok then
                for _, v20 in pairs(result.Records) do
                    local areaId = type(v20) == "table" and v20.AreaId or nil

                    if type(areaId) == "string" and not tbl18[areaId] then
                        tbl18[areaId] = true
                        table.insert(tbl17, areaId)
                    end
                end
            end
        end)

        tbl7 = { "Any" }
        tbl8 = { Any = 0 }
        local tbl19 = {}
        local directory = tbl.Assets and tbl.Assets.Directory

        if type(directory) == "table" then
            for _, v20 in pairs(directory) do
                local rarity = type(v20) == "table" and v20.Rarity or nil
                local flag3 = type(rarity) == "table"

                if flag3 then
                    local v21 = tonumber
                    local rarityNumber = rarity.RarityNumber or rarity.Rank
                    flag3 = v21(rarityNumber)
                end

                flag3 = flag3 or nil

                if flag3 then
                    local v21 = tbl19[flag3]
                    local v22

                    if v21 then
                        v22 = v21
                    else
                        local v23 = tostring
                        local displayName = rarity.DisplayName or rarity._id or flag3
                        v22 = v23(displayName)
                    end

                    tbl19[flag3] = v22
                end
            end
        end

        if next(tbl19) == nil then
            tbl19 = {
                "Common",
                "Uncommon",
                "Rare",
                "Epic",
                "Legendary",
                "Mythic",
                "Cosmic",
                "Secret",
                "Eternal",
                "Divine",
            }
        end

        local tbl20 = {}

        for k in pairs(tbl19) do
            table.insert(tbl20, k)
        end

        table.sort(tbl20)

        for _, v20 in ipairs(tbl20) do
            table.insert(tbl7, tbl19[v20])
            tbl8[tbl19[v20]] = v20
        end

        tbl9 = { "Best Rarity", "Biggest Weight", "Best Mutation", "Highest Value", "Lowest Value" }
        tbl10 = {}
        n = 0
        tbl15 = {}
        tbl11 = {}
        tbl12 = {}
        tbl13 = {}
        tbl4.Steal.RiftPriority = false
        tbl4.Steal.RiftNeeds = {}
        flag2 = false
        tbl16 = {}
        n6 = 0
        v19 = tbl9[4]
        n2 = 400
        n3 = 27.4
        n4 = 400
        fn11 = nil

        v13 = v5:CreateToggle({
            Name = "Auto Steal",
            Default = false,
            Callback = function()
                if fn11 then
                    fn11()
                end
            end,
        })

        for _, v20 in ipairs(tbl17) do
            tbl10[v20] = true
        end

        fn7(v5:CreateMultiDropdown({
            Name = "Target Areas",
            Options = tbl17,
            Default = tbl17,
            Callback = function(arg)
                local tbl21 = {}

                if type(arg) == "table" then
                    for k, v20 in pairs(arg) do
                        if v20 == true and type(k) == "string" then
                            tbl21[k] = true
                        elseif type(v20) == "string" then
                            tbl21[v20] = true
                        end
                    end
                end

                if next(tbl21) == nil then
                    for _, v20 in ipairs(tbl17) do
                        tbl21[v20] = true
                    end
                end

                tbl10 = tbl21
            end,
        }))
    end

    v5:CreateDropdown({
        Name = "Min Rarity",
        Note = "Steal eggs of the chosen rarity and every rarity above it",
        Options = tbl7,
        Default = tbl7[1],
        Callback = function(arg)
            local n7 = tbl8[arg] or 0
            n = n7
        end,
    })

    do
        local tbl17 = {
            ["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
            ["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
            ["B/s"] = { Min = 0, Max = 100, Mult = 1000000000 },
        }
        local v20 = nil
        local n7 = 0
        local str3 = "M/s"

        local function fn14(arg, arg2)
            if arg ~= nil then
                local max = math.max
                local floor = math.floor
                local num = tonumber(arg) or n7
                n7 = max(0, floor(num))
            end

            if arg2 ~= nil then
                str3 = tostring(arg2)
            end

            local ms = tbl17[str3] or tbl17["M/s"]
            n6 = n7 * ms.Mult
        end

        v20 = v5:CreateSlider({
            Name = "Min Value To Steal",
            Note = "Skip eggs worth less than this (0 = off)",
            Min = 0,
            Max = 1000,
            Default = 0,
            AllowDecimals = false,
            Increment = 1,
            Unit = {
                Default = "M/s",
                Selector = true,
                Options = { "K/s", "M/s", "B/s" },
                ColorEnabled = true,
                Colors = {
                    Number = Color3.fromRGB(255, 255, 255),
                    Suffix = Color3.fromRGB(255, 215, 0), -- Amarelo nos sufixos
                },
                Callback = function(arg)
                    local ms = tbl17[arg] or tbl17["M/s"]
                    local setRange = v20

                    if v20 then
                        setRange = v20.SetRange
                    end

                    if setRange then
                        v20:SetRange(ms.Min, ms.Max)
                        local min = tonumber(v20:Get()) or ms.Min
                        local min2 = ms.Min
                        local max = ms.Max
                        local n8 = math.clamp(math.floor(min + 0.5), min2, max)

                        if n8 ~= min then
                            str3 = tostring(arg)
                            v20:Set(n8)
                            return
                        end

                        fn14(n8, arg)
                    else
                        fn14(nil, arg)
                    end
                end,
            },
            Callback = function(arg)
                fn14(arg, nil)
            end,
        })
    end

    do
        local tbl17 = {}
        local tbl18 = {}
        local directory = tbl.Assets and tbl.Assets.Directory
        local tbl19 = {}

        if type(directory) == "table" then
            for k, v20 in pairs(directory) do
                local rarity = type(v20) == "table" and v20.Rarity or nil
                local flag3 = type(rarity) == "table"
                local v21

                if flag3 then
                    local v22 = tonumber
                    local rarityNumber = rarity.RarityNumber or rarity.Rank
                    v21 = v22(rarityNumber)
                else
                    v21 = flag3
                end

                local v22 = v21 or nil

                if v22 then
                    local insert = table.insert
                    local tbl20 = { Category = tostring(k) }
                    local v23 = tostring
                    local displayName = v20.DisplayName or k
                    tbl20.Name = v23(displayName)
                    tbl20.Rarity = v22
                    local v24 = tostring
                    local displayName2 = rarity.DisplayName or rarity._id or v22
                    tbl20.RarityName = v24(displayName2)
                    insert(tbl19, tbl20)
                end
            end
        end

        table.sort(tbl19, function(arg, arg2)
            if arg.Rarity ~= arg2.Rarity then
                return arg.Rarity > arg2.Rarity
            end
            return arg.Name < arg2.Name
        end)

        for _, v20 in ipairs(tbl19) do
            local str3 = string.format("%s [%s]", v20.Name, v20.RarityName)

            if tbl18[str3] then
                str3 = string.format("%s [%s] (%s)", v20.Name, v20.RarityName, v20.Category)
            end

            table.insert(tbl17, str3)
            tbl18[str3] = v20.Category
        end

        fn7(v5:CreateMultiDropdown({
            Name = "Target Specific Eggs",
            Note = "Only steal these eggs (empty = all)",
            Options = tbl17,
            Default = {},
            Callback = function(arg)
                local tbl20 = {}

                if type(arg) == "table" then
                    for k, v20 in pairs(arg) do
                        local flag3 = v20 == true and type(k) == "string"

                        if not flag3 then
                            k = flag3
                        end

                        k = k or type(v20) == "string" and v20
                        k = k or nil

                        if k and tbl18[k] then
                            tbl20[tbl18[k]] = true
                        end
                    end
                end

                tbl15 = tbl20
            end,
        }))
    end

    do
        local n7 = 30
        local v20 = nil
        local flag3 = false
        local n8 = 0

        local function fn14()
            local tbl17 = {}
            local save = tbl.Save

            if type(save) == "table" and type(save.Get) == "function" then
                local ok, result = pcall(save.Get)
                ok = ok and type(result) == "table"

                if ok then
                    local v21 = pairs
                    local inventory = result.Inventory or {}

                    for _, v22 in v21(inventory) do
                        if type(v22) == "table" and v22.Category ~= nil then
                            tbl17[tostring(v22.Category)] = true
                        end
                    end

                    local v22 = pairs
                    local eggInventory = result.EggInventory or {}

                    for _, v23 in v22(eggInventory) do
                        if type(v23) == "table" and v23.AssetCategory ~= nil then
                            tbl17[tostring(v23.AssetCategory)] = true
                        end
                    end
                end
            end

            return tbl17
        end

        local function fn15()
            local rfRiftAskState = networking:FindFirstChild("RF/Rift/AskState")
            if not rfRiftAskState or not rfRiftAskState:IsA("RemoteFunction") then
                return
            end
            local ok, result = pcall(rfRiftAskState.InvokeServer, rfRiftAskState)
            if not ok or type(result) ~= "table" or type(result.Requirements) ~= "table" then
                return
            end
            local v21 = fn14()
            local tbl17 = {}

            for _, v22 in pairs(result.Requirements) do
                if not v21[tostring(v22)] then
                    tbl17[tostring(v22)] = true
                end
            end

            tbl4.Steal.RiftNeeds = tbl17
        end

        tbl2.Add(function()
            if not tbl4.Steal.RiftPriority or flag3 or os.clock() < n8 then
                return false
            end
            flag3 = true
            n8 = os.clock() + n7

            task.spawn(function()
                pcall(fn15)
                flag3 = false
            end)

            return false
        end)

        local function fn16()
            local riftNeeds = tbl4.Steal.RiftNeeds
            if not tbl4.Steal.RiftPriority or next(riftNeeds) == nil then
                return
            end
            local v21 = fn14()
            local flag4 = false

            for k in pairs(riftNeeds) do
                if v21[k] then
                    riftNeeds[k] = nil
                    flag4 = true
                end
            end

            if flag4 then
                tbl2.Wake()
            end
        end

        local save = tbl.Save

        if type(save) == "table" and type(save.FieldSignal) == "function" then
            for _, v21 in ipairs({ "EggInventory", "Inventory" }) do
                local ok, result = pcall(save.FieldSignal, v21)
                ok = ok and type(result) == "table"
                ok = ok and type(result.Connect) == "function"

                if ok then
                    local ok2, result2 = pcall(result.Connect, result, function()
                        task.defer(fn16)
                    end)

                    ok2 = ok2 and result2

                    if ok2 then
                        fn6(function()
                            pcall(function()
                                result2:Disconnect()
                            end)
                        end)
                    end
                end
            end
        end

        v20 = v5:CreateToggle({
            Name = "Steal Missing Rift Eggs",
            Note = "Steal eggs the Rift recipe needs, after your filtered targets",
            Default = false,
            Callback = function()
                tbl4.Steal.RiftPriority = tbl4.Toggle(v20, false) == true
                n8 = 0

                if not tbl4.Steal.RiftPriority then
                    tbl4.Steal.RiftNeeds = {}
                end

                tbl2.Wake()
            end,
        })
    end

    do
        local n7 = 5
        local n8 = 5
        local n9 = 60
        local v20 = nil
        local v21 = nil
        local n10 = 0
        local n11 = 0
        local flag3 = false
        local tbl17 = {}

        local function fn14()
            local save = tbl.Save

            if type(save) == "table" and type(save.Get) == "function" then
                local ok, result = pcall(save.Get)
                ok = ok and type(result) == "table"
                if ok then
                    return result
                end
            end

            return nil
        end

        local function fn15()
            local v22 = fn14()
            local directory = tbl.Areas and tbl.Areas.Directory
            local directory2 = tbl.Assets and tbl.Assets.Directory
            if not v22 or type(directory) ~= "table" or type(directory2) ~= "table" then
                return
            end
            local index = type(v22.Index) == "table" and v22.Index or {}
            local tbl18 = {}
            local v23 = pairs
            local inventory = v22.Inventory or {}

            for _, v24 in v23(inventory) do
                if type(v24) == "table" and v24.Category ~= nil then
                    tbl18[tostring(v24.Category)] = true
                end
            end

            local v24 = pairs
            local eggInventory = v22.EggInventory or {}

            for _, v25 in v24(eggInventory) do
                if type(v25) == "table" and v25.AssetCategory ~= nil then
                    tbl18[tostring(v25.AssetCategory)] = true
                end
            end

            local tbl19 = {}

            for _, v25 in pairs(directory) do
                local flag4 = type(v25) == "table" and type(v25.Rarity) == "table"

                if flag4 then
                    local v26 = tonumber
                    local rarityNumber = v25.Rarity.RarityNumber or v25.Rarity.Rank
                    flag4 = v26(rarityNumber)
                end

                flag4 = flag4 or 0
                local v26 = pairs
                local dropTable = type(v25) == "table" and v25.DropTable or {}

                for _, v27 in v26(dropTable) do
                    local flag5 = type(v27) == "table" and v27[1] or nil
                    local n12 = type(v27) == "table" and tonumber(v27[2]) or 0
                    local flag6 = flag5 ~= nil and directory2[flag5] or nil

                    if type(flag6) == "table" and n12 > 0 and flag6.DontRoll ~= true then
                        local str3 = tostring(flag5)
                        local flag7 = index[flag5] ~= true and not tbl18[str3]
                        local flag8

                        if flag7 then
                            flag8 = tbl19[str3] == nil or flag4 > tbl19[str3]
                        else
                            flag8 = flag7
                        end

                        if flag8 then
                            tbl19[str3] = flag4
                        end
                    end
                end
            end

            tbl16 = tbl19
        end

        local function fn16(arg, ...)
            local v22 = networking:FindFirstChild(arg)
            if not v22 or not v22:IsA("RemoteFunction") then
                return false
            end
            local ok, result = pcall(v22.InvokeServer, v22, ...)
            ok = ok and result ~= false
            return ok
        end

        local function fn17(arg, arg2)
            local tbl18 = {}
            if type(arg) ~= "table" then
                return tbl18
            end

            for _, v22 in ipairs(arg2) do
                local flag4 = arg

                for _, v23 in ipairs(v22) do
                    flag4 = type(flag4) == "table" and flag4[v23]
                    flag4 = flag4 or nil
                end

                local v23 = ipairs
                local flag5 = type(flag4) == "table"

                if not flag5 then
                    flag4 = flag5
                end

                local tbl19 = flag4 or {}

                for _, v24 in v23(tbl19) do
                    if type(v24) == "table" and v24.AssetId ~= nil then
                        table.insert(tbl18, v24.AssetId)
                    end
                end
            end

            return tbl18
        end

        local tbl18 = {
            {
                Id = "LimitedEgg",
                Gear = "GravityDisruptor",
                Module = "LimitedEgg",
                Lists = { { "Entries" }, { "MechaReroll", "Entries" } },
            },
            {
                Id = "BrainrotEgg",
                Gear = "BeeLauncher",
                Module = "BrainrotEgg",
                Lists = { { "Entries" } },
            },
            {
                Id = "MonsterEgg",
                Gear = "BeeLauncher",
                Module = "MonsterEgg",
                Lists = { { "Entries" }, { "MechaEntries" } },
            },
        }

        local function fn18()
            local v22 = fn14()
            if not v22 then
                return
            end
            local index = type(v22.Index) == "table" and v22.Index or {}
            local indexClaimedCategories = type(v22.IndexClaimedCategories) == "table"
                    and v22.IndexClaimedCategories
                or {}

            for k, v23 in pairs(index) do
                if v23 == true and indexClaimedCategories[k] ~= true then
                    fn16("RF/Codex/AskRedeemAll")
                    break
                end
            end

            local gearInventory = type(v22.GearInventory) == "table" and v22.GearInventory or {}

            for _, v23 in ipairs(tbl18) do
                local flag4 = (tonumber(gearInventory[v23.Gear]) or 0) <= 0

                if flag4 then
                    local now = os.clock()
                    local n12 = tbl17[v23.Id] or 0
                    flag4 = now >= n12
                end

                if flag4 then
                    local v24 = fn17(tbl[v23.Module], v23.Lists)
                    local flag5 = #v24 > 0

                    for _, v25 in ipairs(v24) do
                        if index[v25] ~= true then
                            flag5 = false
                            break
                        end
                    end

                    if flag5 then
                        tbl17[v23.Id] = os.clock() + n9
                        fn16("RF/Codex/AskRedeemLimitedEgg", v23.Id)
                    end
                end
            end
        end

        tbl2.Add(function()
            local now = os.clock()
            local flag4 = flag2

            if flag2 then
                flag4 = now >= n10
            end

            if flag4 then
                n10 = now + n7
                pcall(fn15)
            end

            if not flag3 and now >= n11 and tbl4.Toggle(v21, false) then
                flag3 = true
                n11 = now + n8

                task.spawn(function()
                    pcall(fn18)
                    flag3 = false
                end)
            end

            return false
        end)

        v20 = v5:CreateToggle({
            Name = "Steal Missing Index Eggs",
            Note = "Also steal eggs missing from your index, highest area first",
            Default = false,
            Callback = function()
                flag2 = tbl4.Toggle(v20, false) == true
                n10 = 0

                if not flag2 then
                    tbl16 = {}
                end

                tbl2.Wake()
            end,
        })

        v21 = v5:CreateToggle({
            Name = "Auto Claim Index",
            Note = "Claim index rewards as soon as they unlock",
            Default = false,
            Callback = function()
                n11 = 0
                tbl2.Wake()
            end,
        })
    end

    v5:CreateDropdown({
        Name = "Steal Priority",
        Options = tbl9,
        Default = tbl9[4],
        Callback = function(arg)
            if table.find(tbl9, arg) then
                v19 = arg
            end
        end,
    })

    v14 = v5:CreateSlider({
        Name = "Tween Speed",
        Min = 100,
        Max = 1000,
        Default = 400,
        Increment = 10,
        Unit = "studs/s",
        Callback = function(arg)
            local clamp = math.clamp
            local n7 = tonumber(arg) or 400
            local v20 = clamp(n7, 100, 1000)
            n2 = v20
            n4 = v20
        end,
    })

    tbl4.AntiGuard.PanelHandle = v5:CreateToggle({
        Name = "Anti Guard V1",
        Note = "Not recommended to use with Auto Steal",
        Default = false,
        Callback = function(arg)
            if type(arg) ~= "boolean" then
                arg = tbl4.Toggle(tbl4.AntiGuard.PanelHandle, false)
            end

            tbl4.AntiGuard.PanelShown = arg

            if tbl4.AntiGuard.ShowPanel then
                pcall(tbl4.AntiGuard.ShowPanel, arg)
            end
        end,
    })

    v15 = nil
    v16 = nil
    v17 = nil
    str = "None"
    str2 = "Idle"
    flag = false
    n5 = 0
    tbl14 = {}
    local n7
    n7 = 20
    v18 = nil

    fn12 = function(arg)
        local flag3 = arg ~= n5 or not tbl4.Toggle(v15, false)
        return flag3
    end

    local fn14

    do
        local tbl17 = {}

        local function fn15(arg)
            if type(arg) ~= "number" or tbl17[arg] then
                return
            end
            tbl17[arg] = true

            task.delay(math.max(0, arg - workspace:GetServerTimeNow()) + 0.05, function()
                tbl
