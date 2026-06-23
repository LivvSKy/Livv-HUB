-- ==========================================================
-- LIVV HUB - PREMIUM MONOCHROME EDITION (DRAGGABLE LINGKARAN & ADMIN TAB UPDATE)
-- ==========================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Hapus GUI lama jika ada (Reset Total)
local playerGui = player:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("LivvHubPanel") then
    playerGui.LivvHubPanel:Destroy()
end

-- === MEMBUAT GUI UTAMA ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LivvHubPanel"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = math.huge -- Mengharuskan UI berada di paling depan dari segala UI Roblox
screenGui.Parent = playerGui

-- === TOMBOL MINIMIZE BULAT & BISA DIGESER (DRAGGABLE) ===
local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 50, 0, 50) -- Mengubah ukuran menjadi lingkaran proporsional 50x50
miniBtn.Position = UDim2.new(0, 15, 0, 120)
miniBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
miniBtn.Text = "L"
miniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
miniBtn.TextSize = 16
miniBtn.Font = Enum.Font.GothamBold
miniBtn.Parent = screenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(1, 0) -- Bulat Sempurna (Lingkaran)
miniCorner.Parent = miniBtn

-- Fitur Geser (Draggable) untuk Tombol Minimize Lingkaran
local dragToggle = nil
local dragStart = nil
local startPos = nil

local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    game:GetService("TweenService"):Create(miniBtn, TweenInfo.new(0.1), {Position = position}):Play()
end

miniBtn.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragToggle = true
        dragStart = input.Position
        startPos = miniBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

miniBtn.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        if dragToggle then
            updateInput(input)
        end
    end
end)

-- Frame Utama (Panel Livv Hub)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 550, 0, 380)
mainFrame.Position = UDim2.new(0.5, -275, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
mainFrame.Visible = false
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

miniBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- === SIDEBAR KIRI INTERAKTIF ===
local sideBar = Instance.new("Frame", mainFrame)
sideBar.Size = UDim2.new(0, 150, 1, 0)
sideBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
sideBar.BorderSizePixel = 0

local sideCorner = Instance.new("UICorner")
sideCorner.CornerRadius = UDim.new(0, 10)
sideCorner.Parent = sideBar

local sideCover = Instance.new("Frame", sideBar)
sideCover.Size = UDim2.new(0, 20, 1, 0)
sideCover.Position = UDim2.new(1, -20, 0, 0)
sideCover.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
sideCover.BorderSizePixel = 0

-- Nama Hub
local brandText = Instance.new("TextLabel", sideBar)
brandText.Size = UDim2.new(1, -20, 0, 45)
brandText.Position = UDim2.new(0, 15, 0, 5)
brandText.BackgroundTransparency = 1
brandText.Text = "Livv Hub"
brandText.TextColor3 = Color3.fromRGB(255, 255, 255)
brandText.Font = Enum.Font.GothamBold
brandText.TextSize = 18
brandText.TextXAlignment = Enum.TextXAlignment.Left

-- Container Tab Navigasi (Sidebar Menu)
local tabContainer = Instance.new("Frame", sideBar)
tabContainer.Size = UDim2.new(1, -16, 1, -70)
tabContainer.Position = UDim2.new(0, 8, 0, 55)
tabContainer.BackgroundTransparency = 1

local layoutTabs = Instance.new("UIListLayout")
layoutTabs.Padding = UDim.new(0, 4)
layoutTabs.Parent = tabContainer

-- Area Header Kanan
local headerBar = Instance.new("Frame", mainFrame)
headerBar.Size = UDim2.new(1, -150, 0, 50)
headerBar.Position = UDim2.new(0, 150, 0, 0)
headerBar.BackgroundTransparency = 1

local titleLabel = Instance.new("TextLabel", headerBar)
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Main"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 15
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Container Konten Utama Sebelah Kanan
local contentArea = Instance.new("Frame", mainFrame)
contentArea.Size = UDim2.new(1, -165, 1, -65)
contentArea.Position = UDim2.new(0, 157, 0, 55)
contentArea.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 8)

local mainTab = Instance.new("ScrollingFrame", contentArea); mainTab.Size = UDim2.new(1,0,1,0); mainTab.BackgroundTransparency = 1; mainTab.ScrollBarThickness = 2
local targetTab = Instance.new("ScrollingFrame", contentArea); targetTab.Size = UDim2.new(1,0,1,0); targetTab.BackgroundTransparency = 1; targetTab.ScrollBarThickness = 2; targetTab.Visible = false
local adminTab = Instance.new("ScrollingFrame", contentArea); adminTab.Size = UDim2.new(1,0,1,0); adminTab.BackgroundTransparency = 1; adminTab.ScrollBarThickness = 2; adminTab.Visible = false

local layoutMain = Instance.new("UIListLayout", mainTab); layoutMain.Padding = UDim.new(0, 8); layoutMain.HorizontalAlignment = Enum.HorizontalAlignment.Center
local layoutTarget = Instance.new("UIListLayout", targetTab); layoutTarget.Padding = UDim.new(0, 8); layoutTarget.HorizontalAlignment = Enum.HorizontalAlignment.Center
local layoutAdmin = Instance.new("UIListLayout", adminTab); layoutAdmin.Padding = UDim.new(0, 8); layoutAdmin.HorizontalAlignment = Enum.HorizontalAlignment.Center

Instance.new("Frame", mainTab).Size = UDim2.new(1, 0, 0, 2)
Instance.new("Frame", targetTab).Size = UDim2.new(1, 0, 0, 2)
Instance.new("Frame", adminTab).Size = UDim2.new(1, 0, 0, 2)

-- Sistem Pembuatan Navigasi Tab Klik
local function createTabButton(text)
    local btn = Instance.new("TextButton", tabContainer)
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    btn.Text = "   " .. text
    btn.TextColor3 = Color3.fromRGB(160, 160, 160)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    return btn
end

local btnTabMain = createTabButton("Main")
local btnTabTarget = createTabButton("Target")
local btnTabAdmin = createTabButton("Admin") -- Menambahkan Tab Admin ke sidebar menu

local function switchTab(tabCode)
    mainTab.Visible = (tabCode == "main")
    targetTab.Visible = (tabCode == "target")
    adminTab.Visible = (tabCode == "admin")
    
    titleLabel.Text = tabCode:gsub("^%l", string.upper)
    
    btnTabMain.BackgroundColor3 = (tabCode == "main") and Color3.fromRGB(22, 22, 22) or Color3.fromRGB(10, 10, 10)
    btnTabMain.TextColor3 = (tabCode == "main") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 160)
    
    btnTabTarget.BackgroundColor3 = (tabCode == "target") and Color3.fromRGB(22, 22, 22) or Color3.fromRGB(10, 10, 10)
    btnTabTarget.TextColor3 = (tabCode == "target") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 160)
    
    btnTabAdmin.BackgroundColor3 = (tabCode == "admin") and Color3.fromRGB(22, 22, 22) or Color3.fromRGB(10, 10, 10)
    btnTabAdmin.TextColor3 = (tabCode == "admin") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 160)
end

btnTabMain.MouseButton1Click:Connect(function() switchTab("main") end)
btnTabTarget.MouseButton1Click:Connect(function() switchTab("target") end)
btnTabAdmin.MouseButton1Click:Connect(function() switchTab("admin") end)
switchTab("main")


-- === FUNGSI BANTUAN KONTROL: TOGGLE ON / OFF ===
local function createToggle(parent, labelText, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 45)
    container.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.7, 0, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(230, 230, 230)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = container

    local switchBg = Instance.new("TextButton")
    switchBg.Size = UDim2.new(0, 46, 0, 22)
    switchBg.Position = UDim2.new(1, -58, 0.5, -11)
    switchBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    switchBg.Text = ""
    switchBg.Parent = container
    local sCorner = Instance.new("UICorner", switchBg)
    sCorner.CornerRadius = UDim.new(1, 0)

    local switchDot = Instance.new("Frame", switchBg)
    switchDot.Size = UDim2.new(0, 16, 0, 16)
    switchDot.Position = UDim2.new(0, 3, 0.5, -8)
    switchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", switchDot).CornerRadius = UDim.new(1, 0)

    local isOn = false
    switchBg.MouseButton1Click:Connect(function()
        isOn = not isOn
        if isOn then
            switchBg.BackgroundColor3 = Color3.fromRGB(100, 180, 60)
            switchDot.Position = UDim2.new(1, -19, 0.5, -8)
            callback(true)
        else
            switchBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            switchDot.Position = UDim2.new(0, 3, 0.5, -8)
            callback(false)
        end
    end)
end


-- === FUNGSI BANTUAN KONTROL: SLIDER BAR + TEXTBOX INPUT ===
local function createSlider(parent, labelText, minVal, maxVal, defaultVal, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 55)
    container.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.4, 0, 0, 25)
    lbl.Position = UDim2.new(0, 12, 0, 2)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(230, 230, 230)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = container

    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(0, 45, 0, 20)
    inputBox.Position = UDim2.new(1, -58, 0, 6)
    inputBox.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputBox.Font = Enum.Font.GothamBold
    inputBox.TextSize = 11
    inputBox.Text = tostring(defaultVal)
    inputBox.Parent = container
    Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 4)

    local sliderTrack = Instance.new("TextButton")
    sliderTrack.Size = UDim2.new(1, -24, 0, 5)
    sliderTrack.Position = UDim2.new(0, 12, 0, 36)
    sliderTrack.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    sliderTrack.Text = ""
    sliderTrack.Parent = container
    Instance.new("UICorner", sliderTrack).CornerRadius = UDim.new(1, 0)

    local sliderBtn = Instance.new("Frame", sliderTrack)
    sliderBtn.Size = UDim2.new(0, 14, 0, 14)
    sliderBtn.Position = UDim2.new(0, 0, 0.5, -7)
    sliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", sliderBtn).CornerRadius = UDim.new(1, 0)

    local function updateSliderPosition(value)
        local clamped = math.clamp(value, minVal, maxVal)
        local percent = (clamped - minVal) / (maxVal - minVal)
        sliderBtn.Position = UDim2.new(percent, -7, 0.5, -7)
        inputBox.Text = tostring(math.floor(clamped))
        callback(clamped)
    end

    updateSliderPosition(defaultVal)

    local dragging = false
    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local relativeX = input.Position.X - sliderTrack.AbsolutePosition.X
            local percent = math.clamp(relativeX / sliderTrack.AbsoluteSize.X, 0, 1)
            local finalVal = minVal + (percent * (maxVal - minVal))
            updateSliderPosition(finalVal)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    inputBox.FocusLost:Connect(function()
        local val = tonumber(inputBox.Text)
        if val then updateSliderPosition(val) else updateSliderPosition(defaultVal) end
    end)
end


-- ==========================================================
-- ISI KONTEN DI DALAM TAB MAIN
-- ==========================================================

-- 1. Fly Feature
local flyBodyVelocity = nil
local flyLoop = nil
createToggle(mainTab, "Fly (Terbang Kamera)", function(state)
    if state then
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
            if not flyBodyVelocity then
                flyBodyVelocity = Instance.new("BodyVelocity")
                flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                flyBodyVelocity.Parent = char.HumanoidRootPart
            end
            if not flyLoop then
                flyLoop = RunService.RenderStepped:Connect(function()
                    if flyBodyVelocity and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                        local humanoid = char.Humanoid
                        local moveDir = humanoid.MoveDirection
                        if moveDir.Magnitude > 0 then
                            local camLook = camera.CFrame.LookVector
                            local camRight = camera.CFrame.RightVector
                            local localMove = char.HumanoidRootPart.CFrame:VectorToObjectSpace(moveDir)
                            local finalVelocity = (camLook * -localMove.Z) + (camRight * localMove.X)
                            
                            flyBodyVelocity.Velocity = finalVelocity.Unit * 60
                        else
                            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        end
                        char.HumanoidRootPart.CFrame = CFrame.new(char.HumanoidRootPart.Position, char.HumanoidRootPart.Position + camera.CFrame.LookVector)
                    end
                end)
            end
        end
    else
        if flyBodyVelocity then flyBodyVelocity:Destroy() flyBodyVelocity = nil end
        if flyLoop then flyLoop:Disconnect() flyLoop = nil end
    end
end)

-- 2. Noclip Feature
local noclipLoop = nil
createToggle(mainTab, "Noclip (Tembus Dinding)", function(state)
    if state then
        if not noclipLoop then
            noclipLoop = RunService.Stepped:Connect(function()
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end)
        end
    else
        if noclipLoop then noclipLoop:Disconnect() noclipLoop = nil end
    end
end)

-- 3. ESP Feature (Auto Apply On Respawn Loop)
local espActive = false
local playerConnections = {}
local function applyESP(p)
    if p == player then return end
    local function onCharAdded(char)
        if not espActive then return end
        task.wait(0.5)
        if char and not char:FindFirstChild("TrollESP") then
            local hl = Instance.new("Highlight")
            hl.Name = "TrollESP"
            hl.FillColor = Color3.fromRGB(255, 255, 255)
            hl.Parent = char
            
            local bg = Instance.new("BillboardGui", char)
            bg.Name = "TrollName"
            bg.Size = UDim2.new(0, 100, 0, 50)
            bg.StudsOffset = Vector3.new(0, 3, 0)
            bg.AlwaysOnTop = true
            local tl = Instance.new("TextLabel", bg)
            tl.Size = UDim2.new(1,0,1,0)
            tl.BackgroundTransparency = 1
            tl.Text = p.Name
            tl.TextColor3 = Color3.fromRGB(255, 255, 255)
            tl.TextScaled = true
            tl.Font = Enum.Font.GothamBold
        end
    end
    if p.Character then onCharAdded(p.Character) end
    playerConnections[p] = p.CharacterAdded:Connect(onCharAdded)
end

createToggle(mainTab, "ESP & Name (Melihat Pemain)", function(state)
    if state then
        espActive = true
        for _, p in pairs(Players:GetPlayers()) do applyESP(p) end
        playerConnections["PlayerAdded"] = Players.PlayerAdded:Connect(function(np) applyESP(np) end)
    else
        espActive = false
        for k, v in pairs(playerConnections) do if typeof(v) == "RBXScriptConnection" then v:Disconnect() end end
        playerConnections = {}
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character then
                if p.Character:FindFirstChild("TrollESP") then p.Character.TrollESP:Destroy() end
                if p.Character:FindFirstChild("TrollName") then p.Character.TrollName:Destroy() end
            end
        end
    end
end)

-- 4. Invincible Feature
local hpLoop = nil
createToggle(mainTab, "Invincible (Kekebalan 100 HP)", function(state)
    if state then
        if player.Character and not player.Character:FindFirstChildOfClass("ForceField") then
            Instance.new("ForceField", player.Character)
        end
        if not hpLoop then
            hpLoop = RunService.Heartbeat:Connect(function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.Health = 100
                end
            end)
        end
    else
        if player.Character then
            local ff = player.Character:FindFirstChildOfClass("ForceField")
            if ff then ff:Destroy() end
        end
        if hpLoop then hpLoop:Disconnect() hpLoop = nil end
    end
end)

-- 5. WalkSpeed Slider
createSlider(mainTab, "Walk Speed Player", 16, 250, 16, function(value)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end)

-- 6. JumpPower Slider
createSlider(mainTab, "Jump Power Player", 50, 500, 50, function(value)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local hum = player.Character.Humanoid
        hum.UseJumpPower = true
        hum.JumpPower = value
    end
end)


-- ==========================================================
-- ISI KONTEN DI DALAM TAB TARGET
-- ==========================================================
local targetInput = Instance.new("TextBox")
targetInput.Size = UDim2.new(0.96, 0, 0, 32)
targetInput.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
targetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
targetInput.PlaceholderText = "Ketik Username Target Di Sini"
targetInput.Text = ""
targetInput.Font = Enum.Font.Gotham
targetInput.TextSize = 12
targetInput.Parent = targetTab
Instance.new("UICorner", targetInput).CornerRadius = UDim.new(0, 6)

local ddButton = Instance.new("TextButton")
ddButton.Size = UDim2.new(0.96, 0, 0, 28)
ddButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
ddButton.Text = "Pilih dari Daftar Player ▼"
ddButton.TextColor3 = Color3.fromRGB(200, 200, 200)
ddButton.Font = Enum.Font.GothamBold
ddButton.TextSize = 11
ddButton.Parent = targetTab
Instance.new("UICorner", ddButton).CornerRadius = UDim.new(0, 5)

local ddFrame = Instance.new("ScrollingFrame")
ddFrame.Size = UDim2.new(0.96, 0, 0, 90)
ddFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ddFrame.Visible = false
ddFrame.Parent = targetTab
Instance.new("UIListLayout", ddFrame)

ddButton.MouseButton1Click:Connect(function()
    ddFrame.Visible = not ddFrame.Visible
    if ddFrame.Visible then
        for _, child in pairs(ddFrame:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player then
                local pBtn = Instance.new("TextButton", ddFrame)
                pBtn.Size = UDim2.new(1, 0, 0, 25)
                pBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                pBtn.Text = p.Name
                pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                pBtn.Font = Enum.Font.Gotham
                pBtn.TextSize = 11
                pBtn.MouseButton1Click:Connect(function()
                    targetInput.Text = p.Name
                    ddFrame.Visible = false
                end)
            end
        end
    end
end)

local function getTargetPlayer()
    local name = string.lower(targetInput.Text)
    for _, p in pairs(Players:GetPlayers()) do
        if string.lower(string.sub(p.Name, 1, #name)) == name then return p end
    end
    return nil
end

-- 1. Explode Target
createToggle(targetTab, "Explode Target", function(state)
    if state then
        local target = getTargetPlayer()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local exp = Instance.new("Explosion", workspace)
            exp.Position = target.Character.HumanoidRootPart.Position
            exp.BlastRadius = 15
        end
    end
end)

-- 2. Teleport Ke Target
createToggle(targetTab, "Teleport Ke Target", function(state)
    if state then
        local target = getTargetPlayer()
        if target and target.Character and player.Character then
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            local mHrp = player.Character:FindFirstChild("HumanoidRootPart")
            if tHrp and mHrp then mHrp.CFrame = tHrp.CFrame * CFrame.new(0, 0, 3) end
        end
    end
end)

-- 3. Fling Target
local flingLoop = nil
local bAngular = nil
createToggle(targetTab, "Fling Target (Loop Physics)", function(state)
    if state then
        local target = getTargetPlayer()
        local char = player.Character
        if target and char and char:FindFirstChild("HumanoidRootPart") then
            if not bAngular then
                bAngular = Instance.new("BodyAngularVelocity")
                bAngular.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                bAngular.AngularVelocity = Vector3.new(0, 99999, 0)
                bAngular.Parent = char.HumanoidRootPart
            end
            if not flingLoop then
                flingLoop = RunService.Stepped:Connect(function()
                    if target.Character and target.Character:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart") then
                        local offsetOffsetY = math.sin(tick() * 150) * 7 
                        char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, offsetOffsetY, 0)
                    end
                end)
            end
        end
    else
        if bAngular then bAngular:Destroy() bAngular = nil end
        if flingLoop then flingLoop:Disconnect() flingLoop = nil end
    end
end)


-- ==========================================================
-- KHUSUS TAB ADMIN (HANYA SATU TOMBOL START, TANPA TOMBOL STOP)
-- ==========================================================
local adminContainer = Instance.new("Frame")
adminContainer.Size = UDim2.new(0.96, 0, 0, 50)
adminContainer.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
adminContainer.Parent = adminTab
Instance.new("UICorner", adminContainer).CornerRadius = UDim.new(0, 6)

local adminStartBtn = Instance.new("TextButton")
adminStartBtn.Size = UDim2.new(1, -20, 1, -16)
adminStartBtn.Position = UDim2.new(0, 10, 0, 8)
adminStartBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
adminStartBtn.Text = "[ Start Infinite Yield ]"
adminStartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
adminStartBtn.Font = Enum.Font.GothamBold
adminStartBtn.TextSize = 12
adminStartBtn.Parent = adminContainer
Instance.new("UICorner", adminStartBtn).CornerRadius = UDim.new(0, 5)

-- Eksekusi Loadstring Sekali Klik Tanpa Ada Opsi Stop Sesuai Permintaan
adminStartBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
end)
