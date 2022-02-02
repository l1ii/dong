local DongAdmin = Instance.new("ScreenGui")
local Boot = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Description = Instance.new("TextLabel")
local Continue = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Delete = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local Main = Instance.new("Frame")
local CmdBar = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")

DongAdmin.Name = "DongAdmin"
DongAdmin.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
DongAdmin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Boot.Name = "Boot"
Boot.Parent = DongAdmin
Boot.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Boot.Position = UDim2.new(0.324528277, 0, 0.349693239, 0)
Boot.Size = UDim2.new(0.349999994, 0, 0.300000012, 0)
Boot.Visible = false

Title.Name = "Title"
Title.Parent = Boot
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 0, 0.0867075622, 0)
Title.Size = UDim2.new(1, 0, 0.200000003, 0)
Title.Font = Enum.Font.GothamSemibold
Title.Text = "DONG ADMIN"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Description.Name = "Description"
Description.Parent = Boot
Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description.BackgroundTransparency = 1.000
Description.Position = UDim2.new(0.0996226445, 0, 0.286298573, 0)
Description.Size = UDim2.new(0.800000012, 0, 0.300000012, 0)
Description.Font = Enum.Font.Gotham
Description.Text = "Dong admin is a script created by bIue#2958. Note that this script is only useable on Prison Life created by Aesthetical. Join the discord server by using the \"discord\" command"
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextSize = 15.000
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left

Continue.Name = "Continue"
Continue.Parent = Boot
Continue.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Continue.Position = UDim2.new(0.188679233, 0, 0.678936541, 0)
Continue.Size = UDim2.new(0.300000012, 0, 0.200000003, 0)
Continue.Font = Enum.Font.Gotham
Continue.Text = "I understand"
Continue.TextColor3 = Color3.fromRGB(255, 255, 255)
Continue.TextSize = 18.000

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Continue

Delete.Name = "Delete"
Delete.Parent = Boot
Delete.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Delete.Position = UDim2.new(0.510188639, 0, 0.678936541, 0)
Delete.Size = UDim2.new(0.300000012, 0, 0.200000003, 0)
Delete.Font = Enum.Font.Gotham
Delete.Text = "Delete GUI"
Delete.TextColor3 = Color3.fromRGB(255, 0, 0)
Delete.TextSize = 18.000

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = Delete

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = Boot

Main.Name = "Main"
Main.Parent = DongAdmin
Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Main.BackgroundTransparency = 1.000
Main.Position = UDim2.new(-3.53902578e-08, 0, -2.23517418e-08, 0)
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Visible = false

CmdBar.Name = "CmdBar"
CmdBar.Parent = Main
CmdBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CmdBar.Position = UDim2.new(0.200000003, 0, 0.919018388, 0)
CmdBar.Size = UDim2.new(0.600000024, 0, 0.0500000007, 0)

UICorner_4.CornerRadius = UDim.new(0, 3)
UICorner_4.Parent = CmdBar

TextBox.Parent = CmdBar
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 0.999
TextBox.Position = UDim2.new(0.013836477, 0, 0.0981595069, 0)
TextBox.Size = UDim2.new(0.970000029, 0, 0.800000012, 0)
TextBox.Font = Enum.Font.Gotham
TextBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
TextBox.PlaceholderText = "Command here"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left

-- Modules

local modules = {}

do -- Commands
	local script = Instance.new('ModuleScript', CmdBar)
	script.Name = "Commands"
	local function module_script()
		local Players = game:GetService("Players")
		local Player = Players.LocalPlayer
		
		local cmds = {
			admins = {Player};
			lk = {Players};
		}
		
		function cmds.GetPlayer(name: string)
			if not name then return end
			local Yes = {}
			for _,Player in ipairs(game.Players:GetPlayers()) do
				if string.lower(Player.Name):match(string.lower(name)) or string.lower(Player.DisplayName):match(string.lower(name)) then
					table.insert(Yes, Player)
				end
			end
			if #Yes > 0 then
				return Yes[1]
			elseif #Yes < 1 then
				return nil
			end
		end
		
		function cmds.Give(name: string)
			workspace.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[name].ITEMPICKUP)
		end
		
		function cmds.Kill(target: Player)
			pcall(function()
				if not target or target.Character:FindFirstChild("ForceField") then return end
				if target.TeamColor.Name == Player.TeamColor.Name then
					local savedcf = Player.Character.HumanoidRootPart.CFrame
					local savedcamcf = workspace.CurrentCamera.CFrame
					workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
					Player.Character.HumanoidRootPart.CFrame = savedcf
					workspace.CurrentCamera.CFrame = savedcamcf
				end
				local Head = target.Character.Head
				local Remington = Player.Character:FindFirstChild("Remington 870") or Player.Backpack:FindFirstChild("Remington 870")
				if not Remington then cmds.Give("Remington 870") end
				Remington = Player.Character:FindFirstChild("Remington 870") or Player.Backpack:FindFirstChild("Remington 870")
				if Remington and Head then
					game.ReplicatedStorage.ShootEvent:FireServer({{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head},{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head},{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head};{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head};{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head};{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head};{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head};{["RayObject"] = Ray.new(Vector3.new(), Vector3.new()),["Distance"] = 0,["Cframe"] = CFrame.new(),["Hit"] = Head}}, Remington)
				end
				Remington.Parent = Player.Character
				Player.Character.Humanoid:UnequipTools()
				game.Players.LocalPlayer.Character:FindFirstChild("Remington 870"):Destroy()
			end)
		end
		
		return cmds
	end
	modules[script] = module_script
end

-- Scripts

function CommandBarHandler()
	local script = Instance.new('LocalScript', CmdBar)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	
	local Frame = script.Parent
	local TextBox = Frame:WaitForChild("TextBox")
	
	local cmds = require(Frame.Commands)
	
	local SavedPos = Frame.Position
	local OffPos = Frame.Position + UDim2.fromScale(0, 0.2)
	
	Frame.Position = OffPos
	
	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode["Semicolon"] and script.Parent.Parent.Visible then
			TextBox:CaptureFocus()
			TweenService:Create(Frame, TweenInfo.new(0.5), {Position = SavedPos}):Play()
			game:GetService("RunService").RenderStepped:Wait()
			TextBox.Text = ""
		end
	end)
	
	TextBox.FocusLost:Connect(function()
		TextBox.Text = ""
		TweenService:Create(Frame, TweenInfo.new(0.5), {Position = OffPos}):Play()
		print("Entered")
	end)
end

coroutine.wrap(CommandBarHandler)()

function OnExecute()
	local script = Instance.new('LocalScript', DongAdmin)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	local gui = script.Parent
	local Boot = gui:WaitForChild("Boot")
	local Main = gui:WaitForChild("Main")
	
	Boot.Visible = true
	Main.Visible = false
	
	Boot.Continue.Activated:Connect(function()
		Boot:Destroy()
		Main.Visible = true
	end)
	
	Boot.Delete.Activated:Connect(function()
		gui:Destroy()
	end)
end

coroutine.wrap(OnExecute)()
