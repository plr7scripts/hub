-- Carrega a biblioteca Elerium v2
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library"))()

-- Cria a janela
local window = library:AddWindow("Farm GUI", {
    main_color = Color3.fromRGB(40, 120, 200),
    min_size = Vector2.new(300, 200),
    can_resize = false
})

-- Cria aba de funcionalidades
local features = window:AddTab("Main")
features:Show()

-- Variável global
_G.farm = false

-- Botão Start
features:AddButton("Start Farming", function()
    if _G.farm then return end
    _G.farm = true
    
    task.spawn(function()
        while _G.farm do
            -- Mesmos argumentos do seu script original
            game:GetService("ReplicatedStorage")
                :WaitForChild("Remotes")
                :WaitForChild("DigEvent")
                :FireServer("hello")
            
            game:GetService("ReplicatedStorage")
                :WaitForChild("Remotes")
                :WaitForChild("SpinPrizeEvent")
                :FireServer(4)


                    
            task.wait(0.00001)
        end
    end)
end)

-- Botão Stop
features:AddButton("Stop Farming", function()
    _G.farm = false
end)
