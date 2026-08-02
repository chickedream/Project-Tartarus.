--!strict
--=============================================================================
-- [!] PROJECT TARTARUS - VIP KERNEL INJECTOR V9.9
-- [!] AUTHOR: Chickedream
-- [!] WARNING: HIGHLY ILLEGAL. USE AT YOUR OWN RISK.
--=============================================================================

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. СОЗДАЕМ "МРАЧНЫЙ" ИНТЕРФЕЙС
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TartarusInjector"
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local TerminalText = Instance.new("TextLabel")
TerminalText.Size = UDim2.new(0.8, 0, 0.8, 0)
TerminalText.Position = UDim2.new(0.1, 0, 0.1, 0)
TerminalText.BackgroundTransparency = 1
TerminalText.Font = Enum.Font.Code
TerminalText.TextColor3 = Color3.fromRGB(255, 0, 0)
TerminalText.TextSize = 24
TerminalText.TextXAlignment = Enum.TextXAlignment.Left
TerminalText.TextYAlignment = Enum.TextYAlignment.Top
TerminalText.Text = ""
TerminalText.Parent = MainFrame

-- Фейковые логи взлома
local fakeLogs = {
	"INITIALIZING TARTARUS ENGINE...",
	"BYPASSING ROBLOX BYFRON ANTI-CHEAT...",
	"SUCCESS: KERNEL LEVEL ACCESS GRANTED.",
	"INJECTING DLL PAYLOAD INTO MEMORY...",
	"WARNING: NETWORK TRACE DETECTED!",
	"REROUTING IP THROUGH 7 PROXIES...",
	"DOWNLOADING SERVER DATABASE...",
	"DECRYPTING ADMIN PASSWORDS...",
	"EXECUTING FATAL PAYLOAD IN 3...",
	"2...",
	"1...",
	"SYSTEM COMPROMISED."
}

-- Музыка (Кевин Маклауд - Monkeys Spinning Monkeys, классическая веселая музыка)
local HappyMusic = Instance.new("Sound")
HappyMusic.SoundId = "rbxassetid://5977997931" 
HappyMusic.Volume = 1
HappyMusic.Looped = true
HappyMusic.Parent = ScreenGui

-- Звук глитча для атмосферы (опционально)
local GlitchSound = Instance.new("Sound")
GlitchSound.SoundId = "rbxassetid://8287792147"
GlitchSound.Volume = 0.5
GlitchSound.Parent = ScreenGui

---------------------------------------------------------
-- ФАЗА 1: СТРАШНЫЙ ВЗЛОМ
---------------------------------------------------------
task.wait(1)
GlitchSound:Play()

for _, logText in ipairs(fakeLogs) do
	TerminalText.Text = TerminalText.Text .. "\n> " .. logText
	task.wait(math.random(10, 40) / 100) -- Случайная задержка для реалистичности
end

task.wait(1)

---------------------------------------------------------
-- ФАЗА 2: ЦВЕТОЧКИ И РАДУГА! (THE TWIST)
---------------------------------------------------------
GlitchSound:Stop()
HappyMusic:Play()

-- Мгновенно меняем дизайн на милый
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 182, 193) -- Розовый пастельный
TerminalText.Font = Enum.Font.FredokaOne -- Милый пухлый шрифт
TerminalText.TextColor3 = Color3.fromRGB(255, 255, 255)
TerminalText.TextSize = 60
TerminalText.TextXAlignment = Enum.TextXAlignment.Center
TerminalText.TextYAlignment = Enum.TextYAlignment.Center
TerminalText.Text = "💖 СУПЕР МИЛЫЙ ИНЖЕКТОР ДРУЖБЫ УСПЕШНО ЗАПУЩЕН! 💖\n🌸 ОБНИМАШКИ АКТИВИРОВАНЫ! 🌸"

-- Добавляем радужный градиент на фон
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)),
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 223, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 255, 100)),
	ColorSequenceKeypoint.new(0.75, Color3.fromRGB(100, 200, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
})
Gradient.Parent = TerminalText

-- Функция анимации радуги
task.spawn(function()
	local offset = 0
	while RunService.RenderStepped:Wait() do
		offset = (offset + 0.01) % 1
		Gradient.Offset = Vector2.new(offset, 0)
	end
end)

-- Функция генерации падающих цветочков
local emojis = {"🌸", "🌻", "🎀", "💖", "🦄", "✨", "🌼"}

task.spawn(function()
	while task.wait(0.1) do
		-- Создаем цветочек
		local flower = Instance.new("TextLabel")
		flower.BackgroundTransparency = 1
		flower.Text = emojis[math.random(1, #emojis)]
		flower.TextSize = math.random(40, 80)
		flower.Position = UDim2.new(math.random(0, 100)/100, 0, -0.1, 0)
		flower.Rotation = math.random(-45, 45)
		flower.ZIndex = 10
		flower.Parent = MainFrame
		
		-- Анимируем его падение вниз
		local fallTime = math.random(2, 5)
		local tween = TweenService:Create(flower, TweenInfo.new(fallTime, Enum.EasingStyle.Linear), {
			Position = UDim2.new(flower.Position.X.Scale, 0, 1.2, 0),
			Rotation = math.random(-360, 360)
		})
		
		tween:Play()
		
		-- Удаляем цветочек после падения, чтобы не засорять память
		Debris:AddItem(flower, fallTime + 0.5)
	end
end)
