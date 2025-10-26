local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Intentar obtener el RemoteEvent
local remote = ReplicatedStorage:FindFirstChild("SpawnBrainrot")

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
        if remote then
            remote:FireServer("Strawberry Elephant")
        else
            print("No existe el RemoteEvent SpawnBrainrot")
        end
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
        if remote then
            remote:FireServer("Meowl")
        else
            print("No existe el RemoteEvent SpawnBrainrot")
        end
        OptionMeowl:Destroy()
        if Frame:FindFirstChild("OptionElephant") then Frame.OptionElephant:Destroy() end
    end)
end)
