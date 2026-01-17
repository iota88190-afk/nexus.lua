-- 🧠 BRAINROT AUTO TP - DELTA PC EMULATOR 🧠
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local basePosition = Vector3.new(0, 10, 0)

-- Supprime ancien GUI
pcall(function()
    player.PlayerGui:FindFirstChild("BrainrotAutoTP"):Destroy()
end)

-- GUI pour Delta PC
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotAutoTP"
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Coins arrondis
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame

-- Titre
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(255, 100, 255)
title.Text = "🧠 BRAINROT AUTO TP - DELTA PC"
title.TextColor3 = Color3.white
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = title

-- Bouton Save
local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.6, 0, 0, 20)
saveBtn.Position = UDim2.new(0.02, 0, 0, 30)
saveBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
saveBtn.Text = "💾 SAVE BASE POSITION"
saveBtn.TextColor3 = Color3.white
saveBtn.TextScaled = true
saveBtn.Font = Enum.Font.Gotham
saveBtn.Parent = frame

local saveBtnCorner = Instance.new("UICorner")
saveBtnCorner.CornerRadius = UDim.new(0, 5)
saveBtnCorner.Parent = saveBtn

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.35, 0, 0, 20)
status.Position = UDim2.new(0.63, 0, 0, 30)
status.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
status.Text = "⚡ ACTIVE"
status.TextColor3 = Color3.white
status.TextScaled = true
status.Font = Enum.Font.GothamBold
status.Parent = frame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 5)
statusCorner.Parent = status

-- Info
local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, 0, 0, 15)
info.Position = UDim2.new(0, 0, 0, 55)
info.BackgroundTransparency = 1
info.Text = "Ramasse un brainrot = Téléportation automatique"
info.TextColor3 = Color3.fromRGB(200, 200, 200)
info.TextScaled = true
info.Font = Enum.Font.Gotham
info.Parent = frame

-- Fonction TP optimisée pour Delta PC
local function deltaAutoTP()
    spawn(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            -- Méthode Delta PC Emulator
            local hrp = char.HumanoidRootPart
            hrp.CFrame = CFrame.new(basePosition)
            
            -- Animation du status
            status.Text = "🧠 TÉLÉPORTÉ!"
            status.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
            
            wait(2)
            status.Text = "⚡ ACTIVE"
            status.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        end
    end)
end

-- Save position
saveBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        basePosition = char.HumanoidRootPart.Position
        saveBtn.Text = "✅ POSITION SAUVÉE!"
        saveBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        
        spawn(function()
            wait(2)
            saveBtn.Text = "💾 SAVE BASE POSITION"
            saveBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        end)
    end
end)

-- Détection optimisée pour Delta PC
local function onToolAdded(tool)
    if tool:IsA("Tool") then
        deltaAutoTP()
    end
end

-- Connexions multiples pour Delta PC Emulator
player.Backpack.ChildAdded:Connect(onToolAdded)

-- Setup character
local function setupCharacter(char)
    if char then
        char.ChildAdded:Connect(onToolAdded)
    end
end

player.CharacterAdded:Connect(setupCharacter)
if player.Character then
    setupCharacter(player.Character)
end

print("🧠 BRAINROT AUTO TP - DELTA PC EMULATOR LOADED!")
print("⚡ Téléportation automatique activée!")
print("💾 Sauvegarde ta position avec le bouton!")
