-- ==========================================================
-- VXT ULTIMATE PREMIUM TROLL GUI (MONOCHROME MAC EDITION)
-- ==========================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Hapus GUI lama jika ada
local playerGui = player:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("TrollPanelPro") then
    playerGui.TrollPanelPro:Destroy()
end

-- === MEMBUAT GUI UTAMA ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TrollPanelPro"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Tombol Minimize Bulat (Premium Dark Mode Logo "> T" Sesuai Gambar)
local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 55, 0, 40)
miniBtn.Position = UDim2.new(0, 15, 0, 100)
miniBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
miniBtn.Text = "> T"
miniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
miniBtn.TextSize = 16
miniBtn.Font = Enum.Font.GothamBold
miniBtn.Parent = screenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 8)
miniCorner.Parent = miniBtn

-- Frame Utama (Panel VXT Style - Dimensi Sesuai Screenshot)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 560, 0, 420)
mainFrame.Position = UDim2.new(0.5, -280, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
mainFrame.Visible = false
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = mainFrame

miniBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- === ELEMEN DEKORASI MAC OS (Tiga Bulatan Kiri Atas) ===
local macDots = Instance.new("Frame", mainFrame)
macDots.Size = UDim2.new(0, 60, 0, 15)
macDots.Position = UDim2.new(0, 15, 0, 15)
macDots.BackgroundTransparency = 1

local dotClose = Instance.new("Frame", macDots)
dotClose.Size = UDim2.new(0, 10, 0, 10)
dotClose.BackgroundColor3 = Color3.fromRGB(255, 95, 85)
Instance.new("UICorner", dotClose).CornerRadius = UDim.new(1, 0)

local dotMin = Instance.new("Frame", macDots)
dotMin.Size = UDim2.new(0, 10, 0, 10)
dotMin.Position = UDim2.new(0, 15, 0, 0)
dotMin.BackgroundColor3 = Color3.fromRGB(255, 190, 46)
Instance.new("UICorner", dotMin).CornerRadius = UDim.new(1, 0)

-- === SIDEBAR KIRI (Sesuai Gambar Referensi) ===
local sideBar = Instance.new("Frame", mainFrame)
sideBar.Size = UDim2.new(0, 160, 1, -40)
sideBar.Position = UDim2.new(0, 0, 0, 40)
sideBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
sideBar.BorderSizePixel = 0

-- Teks Brand "vertex" di Atas Sidebar
local brandText = Instance.new("TextLabel", sideBar)
brandText.Size = UDim2.new(1, -20, 0, 20)
brandText.Position = UDim2.new(0, 15, 0, 10)
brandText.BackgroundTransparency = 1
brandText.Text = "vertex"
brandText.TextColor3 = Color3.fromRGB(255, 255, 255)
brandText.Font = Enum.Font.GothamBold
brandText.TextSize = 18
brandText.TextXAlignment = Enum.TextXAlignment.Left

local subBrandText = Instance.new("TextLabel", sideBar)
subBrandText.Size = UDim2.new(1, -20, 0, 15)
subBrandText.Position = UDim2.new(0, 15, 0, 30)
subBrandText.BackgroundTransparency = 1
subBrandText.Text = "discord.gg/vxt"
subBrandText.TextColor3 = Color3.fromRGB(100, 100, 100)
subBrandText.Font = Enum.Font.Gotham
subBrandText.TextSize = 11
subBrandText.TextXAlignment = Enum.TextXAlignment.Left

-- Garis Pembatas Kiri
local lineSeparator = Instance.new("Frame", sideBar)
lineSeparator.Size = UDim2.new(1, 0, 0, 1)
lineSeparator.Position = UDim2.new(0, 0, 0, 55)
lineSeparator.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
lineSeparator.BorderSizePixel = 0

-- Container Tombol Navigasi Menu
local tabContainer = Instance.new("Frame", sideBar)
tabContainer.Size = UDim2.new(1, -20, 1, -140)
tabContainer.Position = UDim2.new(0, 10, 0, 70)
tabContainer.BackgroundTransparency = 1

local layoutTabs = Instance.new("UIListLayout")
layoutTabs.Padding = UDim.new(0, 6)
layoutTabs.Parent = tabContainer

-- Area Konten Kanan (Header Judul Tab + Background Utama)
local headerBar = Instance.new("Frame", mainFrame)
headerBar.Size = UDim2.new(1, -160, 0, 50)
headerBar.Position = UDim2.new(0, 160, 0, 0)
headerBar.BackgroundTransparency = 1

local titleLabel = Instance.new("TextLabel", headerBar)
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Main"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local contentArea = Instance.new("Frame", mainFrame)
contentArea.Size = UDim2.new(1, -180, 1, -70)
contentArea.Position = UDim2.new(0, 170, 0, 60)
contentArea.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 10)

-- Halaman Scroll Konten Dalam Tab
local mainTab = Instance.new("ScrollingFrame", contentArea); mainTab.Size = UDim2.new(1,0,1,0); mainTab.BackgroundTransparency = 1; mainTab.ScrollBarThickness = 3
local targetTab = Instance.new("ScrollingFrame", contentArea); targetTab.Size = UDim2.new(1,0,1,0); targetTab.BackgroundTransparency = 1; targetTab.ScrollBarThickness = 3; targetTab.Visible = false

local layoutMain = Instance.new("UIListLayout", mainTab); layoutMain.Padding = UDim.new(0, 10); layoutMain.HorizontalAlignment = Enum.HorizontalAlignment.Center
local layoutTarget = Instance.new("UIListLayout", targetTab); layoutTarget.Padding = UDim.new(0, 10); layoutTarget.HorizontalAlignment = Enum.HorizontalAlignment.Center

Instance.new("Frame", mainTab).Size = UDim2.new(1, 0, 0, 5)
Instance.new("Frame", targetTab).Size = UDim2.new(1, 0, 0, 5)

-- Fungsi Pindah Halaman Tab
local function createTabButton(text)
    local btn = Instance.new("TextButton", tabContainer)
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    btn.Text = "      " .. text
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local btnTabMain = createTabButton("Main")
local btnTabTarget = createTabButton("Target")

local function switchTab(toMain)
    mainTab.Visible = toMain
    targetTab.Visible = not toMain
    titleLabel.Text = toMain and "Main" or "Target"
    btnTabMain.BackgroundColor3 = toMain and Color3.fromRGB(28, 28, 28) or Color3.fromRGB(15, 15, 15)
    btnTabMain.TextColor3 = toMain and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
    btnTabTarget.BackgroundColor3 = not toMain and Color3.fromRGB(28, 28, 28) or Color3.fromRGB(15, 15, 15)
    btnTabTarget.TextColor3 = not toMain and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
end
btnTabMain.MouseButton1Click:Connect(function() switchTab(true) end)
btnTabTarget.MouseButton1Click:Connect(function() switchTab(false) end)
switchTab(true) -- Default Aktif Pertama

-- PROFILE CARD PLAYER DI KIRI BAWAH (Sesuai Gambar)
local profileCard = Instance.new("Frame", sideBar)
profileCard.Size = UDim2.new(1, -20, 0, 50)
profileCard.Position = UDim2.new(0, 10, 1, -60)
profileCard.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Instance.new("UICorner", profileCard).CornerRadius = UDim.new(0, 8)

local avatarImg = Instance.new("ImageLabel", profileCard)
avatarImg.Size = UDim2.new(0, 34, 0, 34)
avatarImg.Position = UDim2.new(0, 8, 0, 8)
avatarImg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
avatarImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&x=150&y=150"
Instance.new("UICorner", avatarImg).CornerRadius = UDim.new(1, 0)

local nameLabel = Instance.new("TextLabel", profileCard)
nameLabel.Size = UDim2.new(1, -50, 0, 15)
nameLabel.Position = UDim2.new(0, 48, 0, 10)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = player.DisplayName
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextSize = 11
nameLabel.TextXAlignment = Enum.TextXAlignment.Left

local userLabel = Instance.new("TextLabel", profileCard)
userLabel.Size = UDim2.new(1, -50, 0, 12)
userLabel.Position = UDim2.new(0, 48, 0, 25)
userLabel.BackgroundTransparency = 1
userLabel.Text = "@" .. player.Name
userLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
userLabel.Font = Enum.Font.Gotham
userLabel.TextSize = 9
userLabel.TextXAlignment = Enum.TextXAlignment.Left


-- === FUNGSI BANTUAN MEMBUAT TOMBOL KONTROL FITUR (JANGAN DIUBAH AGAR MUDAH COPY PASTE) ===
local function createControl(parent, labelText)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.95, 0, 0, 70)
    container.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 30)
    lbl.BackgroundTransparency = 1
    lbl.Text = "   " .. labelText
    lbl.TextColor3 = Color3.fromRGB(240, 240, 240)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = container

    local btnExec = Instance.new("TextButton")
    btnExec.Size = UDim2.new(0.45, 0, 0, 28)
    btnExec.Position = UDim2.new(0.025, 0, 0, 34)
    btnExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btnExec.Text = "Execute"
    btnExec.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnExec.Font = Enum.Font.GothamBold
    btnExec.TextSize = 12
    btnExec.Parent = container
    Instance.new("UICorner", btnExec).CornerRadius = UDim.new(0, 6)

    local btnStop = Instance.new("TextButton")
    btnStop.Size = UDim2.new(0.45, 0, 0, 28)
    btnStop.Position = UDim2.new(0.525, 0, 0, 34)
    btnStop.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    btnStop.Text = "Stop"
    btnStop.TextColor3 = Color3.fromRGB(140, 140, 140)
    btnStop.Font = Enum.Font.GothamBold
    btnStop.TextSize = 12
    btnStop.Parent = container
    Instance.new("UICorner", btnStop).CornerRadius = UDim.new(0, 6)

    return btnExec, btnStop
end


-- ==========================================================
-- ISI KONTEN DI DALAM TAB MAIN (UPGRADE & FITUR UTAMA)
-- ==========================================================

-- 1. Fly (Terbang mengikuti arah kamera secara penuh + WASD/Analog)
local flyExec, flyStop = createControl(mainTab, "Fly (Terbang Kamera)")
local flyBodyVelocity = nil
local flyLoop = nil

flyExec.MouseButton1Click:Connect(function()
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
        flyExec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flyExec.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)
flyStop.MouseButton1Click:Connect(function()
    if flyBodyVelocity then flyBodyVelocity:Destroy() flyBodyVelocity = nil end
    if flyLoop then flyLoop:Disconnect() flyLoop = nil end
    flyExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    flyExec.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- 2. Noclip
local noclipExec, noclipStop = createControl(mainTab, "Noclip (Tembus Dinding)")
local noclipLoop = nil

noclipExec.MouseButton1Click:Connect(function()
    if not noclipLoop then
        noclipLoop = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
        noclipExec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        noclipExec.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)
noclipStop.MouseButton1Click:Connect(function()
    if noclipLoop then noclipLoop:Disconnect() noclipLoop = nil end
    noclipExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    noclipExec.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- 3. ESP & NAMA (Auto Apply On Respawn)
local espExec, espStop = createControl(mainTab, "ESP & Name (Melihat Pemain)")
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

espExec.MouseButton1Click:Connect(function()
    espActive = true
    espExec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    espExec.TextColor3 = Color3.fromRGB(0, 0, 0)
    for _, p in pairs(Players:GetPlayers()) do applyESP(p) end
    playerConnections["PlayerAdded"] = Players.PlayerAdded:Connect(function(np) applyESP(np) end)
end)
espStop.MouseButton1Click:Connect(function()
    espActive = false
    espExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    espExec.TextColor3 = Color3.fromRGB(255, 255, 255)
    for k, v in pairs(playerConnections) do if typeof(v) == "RBXScriptConnection" then v:Disconnect() end end
    playerConnections = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then
            if p.Character:FindFirstChild("TrollESP") then p.Character.TrollESP:Destroy() end
            if p.Character:FindFirstChild("TrollName") then p.Character.TrollName:Destroy() end
        end
    end
end)

-- 4. Invincible (Kekebalan FF + Auto HP Loop)
local invExec, invStop = createControl(mainTab, "Invincible (Kekebalan 100 HP)")
local hpLoop = nil

invExec.MouseButton1Click:Connect(function()
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
    invExec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    invExec.TextColor3 = Color3.fromRGB(0, 0, 0)
end)
invStop.MouseButton1Click:Connect(function()
    if player.Character then
        local ff = player.Character:FindFirstChildOfClass("ForceField")
        if ff then ff:Destroy() end
    end
    if hpLoop then hpLoop:Disconnect() hpLoop = nil end
    invExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    invExec.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- 5. Set Speed User
local speedExec, speedStop = createControl(mainTab, "Set WalkSpeed Pengguna")
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0.9, 0, 0, 25)
speedInput.Position = UDim2.new(0.05, 0, 0, 5)
speedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.PlaceholderText = "Ketik Angka Speed (Default: 16)"
speedInput.Text = "50"
speedInput.Font = Enum.Font.Gotham
speedInput.Parent = speedExec.Parent
Instance.new("UICorner", speedInput).CornerRadius = UDim.new(0, 4)

speedExec.Position = UDim2.new(0.025, 0, 0, 35)
speedStop.Position = UDim2.new(0.525, 0, 0, 35)

speedExec.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = tonumber(speedInput.Text) or 16
        speedExec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        speedExec.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)
speedStop.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = 16 end
    speedExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    speedExec.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- [FITUR BARU] 6. Set Jump Power User (Sama Mekanismenya Seperti Speed)
local jumpExec, jumpStop = createControl(mainTab, "Set JumpPower Pengguna")
local jumpInput = Instance.new("TextBox")
jumpInput.Size = UDim2.new(0.9, 0, 0, 25)
jumpInput.Position = UDim2.new(0.05, 0, 0, 5)
jumpInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpInput.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpInput.PlaceholderText = "Ketik Angka Jump Power (Default: 50)"
jumpInput.Text = "100"
jumpInput.Font = Enum.Font.Gotham
jumpInput.Parent = jumpExec.Parent
Instance.new("UICorner", jumpInput).CornerRadius = UDim.new(0, 4)

jumpExec.Position = UDim2.new(0.025, 0, 0, 35)
jumpStop.Position = UDim2.new(0.525, 0, 0, 35)

jumpExec.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local hum = player.Character.Humanoid
        hum.UseJumpPower = true -- Memastikan game menggunakan nilai jump power murni
        hum.JumpPower = tonumber(jumpInput.Text) or 50
        jumpExec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        jumpExec.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)
jumpStop.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.JumpPower = 50 end
    jumpExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    jumpExec.TextColor3 = Color3.fromRGB(255, 255, 255)
end)


-- ==========================================================
-- ISI KONTEN DI DALAM TAB TARGET (DROPDOWN + UPGRADE FLING)
-- ==========================================================
local targetInput = Instance.new("TextBox")
targetInput.Size = UDim2.new(0.95, 0, 0, 35)
targetInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
targetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
targetInput.PlaceholderText = "Ketik Username Target Di Sini"
targetInput.Font = Enum.Font.Gotham
targetInput.Parent = targetTab
Instance.new("UICorner", targetInput).CornerRadius = UDim.new(0, 8)

-- Dropdown Modern Sesuai Mockup Gambar Rekomendasi
local ddButton = Instance.new("TextButton")
ddButton.Size = UDim2.new(0.95, 0, 0, 30)
ddButton.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
ddButton.Text = "Pilih dari Daftar Player ▼"
ddButton.TextColor3 = Color3.fromRGB(200, 200, 200)
ddButton.Font = Enum.Font.GothamBold
ddButton.Parent = targetTab
Instance.new("UICorner", ddButton).CornerRadius = UDim.new(0, 6)

local ddFrame = Instance.new("ScrollingFrame")
ddFrame.Size = UDim2.new(0.95, 0, 0, 100)
ddFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
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
                pBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                pBtn.Text = p.Name
                pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                pBtn.Font = Enum.Font.Gotham
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
local expExec, expStop = createControl(targetTab, "Explode Target")
expStop.Visible = false
expExec.Size = UDim2.new(0.95, 0, 0, 30)
expExec.Position = UDim2.new(0.025, 0, 0, 35)

expExec.MouseButton1Click:Connect(function()
    local target = getTargetPlayer()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local exp = Instance.new("Explosion", workspace)
        exp.Position = target.Character.HumanoidRootPart.Position
        exp.BlastRadius = 15
    end
end)

-- 2. Teleport Ke Target
local tpExec, tpStop = createControl(targetTab, "Teleport Ke Target")
tpStop.Visible = false
tpExec.Size = UDim2.new(0.95, 0, 0, 30)
tpExec.Position = UDim2.new(0.025, 0, 0, 35)

tpExec.MouseButton1Click:Connect(function()
    local target = getTargetPlayer()
    if target and target.Character and player.Character then
        local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
        local mHrp = player.Character:FindFirstChild("HumanoidRootPart")
        if tHrp and mHrp then mHrp.CFrame = tHrp.CFrame * CFrame.new(0, 0, 3) end
    end
end)

-- 3. Fling Target (Ultra Fast Sinus Vertical Loop Physics)
local flingExec, flingStop = createControl(targetTab, "Fling Target (Execute & Stop)")
local flingLoop = nil
local bAngular = nil

flingExec.MouseButton1Click:Connect(function()
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
        flingExec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flingExec.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)

flingStop.MouseButton1Click:Connect(function()
    if bAngular then bAngular:Destroy() bAngular = nil end
    if flingLoop then flingLoop:Disconnect() flingLoop = nil end
    flingExec.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    flingExec.TextColor3 = Color3.fromRGB(255, 255, 255)
end)
