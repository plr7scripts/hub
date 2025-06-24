-- Script para usar em executor como Synapse, KRNL, etc.
local player = game.Players.LocalPlayer

-- Apaga a GUI se já existir (evita duplicação)
pcall(function()
    player:WaitForChild("PlayerGui"):FindFirstChild("FarmGui"):Destroy()
end)

-- Cria a interface
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FarmGui"
screenGui.ResetOnSpawn = false

local startButton = Instance.new("TextButton", screenGui)
startButton.Size = UDim2.new(0, 120, 0, 40)
startButton.Position = UDim2.new(0, 20, 0, 20)
startButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
startButton.Text = "Start"
startButton.TextSize = 18

local stopButton = Instance.new("TextButton", screenGui)
stopButton.Size = UDim2.new(0, 120, 0, 40)
stopButton.Position = UDim2.new(0, 150, 0, 20)
stopButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
stopButton.Text = "Stop"
stopButton.TextSize = 18

-- Função do loop
local function startFarm()
    if _G.farm then return end -- já está rodando
    _G.farm = true

    task.spawn(function()
        while _G.farm do
            -- Argumento 1: "hello"
            local args1 = {
                [1] = "hello"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DigEvent"):FireServer(unpack(args1))

            -- Argumento 2: 10
            local args2 = {
                [1] = 10
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args2))

            task.wait(0.00001)
        end
    end)
end

local function stopFarm()
    _G.farm = false
end

-- Conectar botões
startButton.MouseButton1Click:Connect(startFarm)
stopButton.MouseButton1Click:Connect(stopFarm)
