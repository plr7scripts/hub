_G.farm = true

while _G.farm do
local args = {
    [1] = "hello"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DigEvent"):FireServer(unpack(args))
local args = {
    [1] = 3
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
wait(0.00001)
end
