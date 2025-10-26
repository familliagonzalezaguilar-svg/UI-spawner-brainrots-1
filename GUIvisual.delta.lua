local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaBrainrotUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 150)
Frame.Position = UDim2.new(0.5, -110, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Delta Brainrot Spawner"
Title.TextColor3 = Color3.fromRGB(255, 255, 50)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, -30, 0, 40)
Button.Position = UDim2.new(0, 15, 0, 40)
Button.Text = "Spawnear Delta Brainrot"
Button.BackgroundColor3 = Color3.fromRGB(60, 200, 60)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.Parent = Frame

-- Función para crear un modelo visual simple
local function spawnVisualModel(tipo)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local part = Instance.new("Part")
    part.Size = Vector3.new(2,2,2)
    part.Anchored = true
    part.CanCollide = false
    part.Position = char.HumanoidRootPart.Position + Vector3.new(3, 2, 0)
    part.Parent = workspace

    local label = Instance.new("BillboardGui")
    label.Size = UDim2.new(0,100,0,40)
    label.Adornee = part
    label.Parent = part
    label.AlwaysOnTop = true

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.Text = tipo
    text.TextColor3 = Color3.new(1,1,1)
    text.Font = Enum.Font.GothamBold
    text.TextScaled = true
    text.Parent = label

    if tipo == "Strawberry Elephant" then
        part.BrickColor = BrickColor.new("Bright red")
        part.Material = Enum.Material.SmoothPlastic
    elseif tipo == "Meowl" then
        part.BrickColor = BrickColor.new("Pastel Blue")
        part.Material = Enum.Material.Neon
    end

    -- Se borra solo después de 15 segundos
    game:GetService("Debris"):AddItem(part, 15)
end

Button.MouseButton1Click:Connect(function()
    if Frame:FindFirstChild("OptionElephant") or Frame:FindFirstChild("OptionMeowl") then
        return
    end

    local OptionElephant = Instance.new("TextButton")
    OptionElephant.Name = "OptionElephant"
    OptionElephant.Size = UDim2.new(1, -30, 0, 35)
    OptionElephant.Position = UDim2.new(0, 15, 0, 85)
    OptionElephant.Text = "Strawberry Elephant"
    OptionElephant.BackgroundColor3 = Color3.fromRGB(255, 120, 120)
    OptionElephant.TextColor3 = Color3.new(1, 1, 1)
    OptionElephant.Font = Enum.Font.GothamBold
    OptionElephant.TextSize = 15
    OptionElephant.Parent = Frame

    OptionElephant.MouseButton1Click:Connect(function()
        spawnVisualModel("Strawberry Elephant")
        OptionElephant:Destroy()
        if Frame:FindFirstChild("OptionMeowl") then Frame.OptionMeowl:Destroy() end
    end)

    local OptionMeowl = Instance.new("TextButton")
    OptionMeowl.Name = "OptionMeowl"
    OptionMeowl.Size = UDim2.new(1, -30, 0, 35)
    OptionMeowl.Position = UDim2.new(0, 15, 0, 120)
    OptionMeowl.Text = "Meowl"
    OptionMeowl.BackgroundColor3 = Color3.fromRGB(120, 120, 255)
    OptionMeowl.TextColor3 = Color3.new(1, 1, 1)
    OptionMeowl.Font = Enum.Font.GothamBold
    OptionMeowl.TextSize = 15
    OptionMeowl.Parent = Frame

    OptionMeowl.MouseButton1Click:Connect(function()
        spawnVisualModel("Meowl")
        OptionMeowl:Destroy()
        if Frame:FindFirstChild("OptionElephant") then Frame.OptionElephant:Destroy() end
    end)
end)
