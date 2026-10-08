print(("from ryguyz14 have fun with it :) "))
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// UI SETUP
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "CloneAutoSayUI"

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 180, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0, 200)
ToggleButton.Text = "Auto Say: OFF"
ToggleButton.TextScaled = true
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- red when off
ToggleButton.BorderSizePixel = 3
ToggleButton.BorderColor3 = Color3.fromRGB(140, 0, 255) -- neon purple border
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

--// STATE
local autoOn = false
local loopRunning = false

--// LOOP FUNCTION
local function autoLoop()
    if loopRunning then return end
    loopRunning = true

    while autoOn do
        TextChatService.TextChannels.RBXGeneral:SendAsync("clone a")
        task.wait(0.5) -- speed (change if you want)
    end

    loopRunning = false
end

--// BUTTON LOGIC
ToggleButton.MouseButton1Click:Connect(function()
    autoOn = not autoOn

    if autoOn then
        ToggleButton.Text = "Auto Say: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- green
        autoLoop()
    else
        ToggleButton.Text = "Auto Say: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- red
    end
end)
