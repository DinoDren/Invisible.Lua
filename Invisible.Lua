

local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Invisible = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
main.Position = UDim2.new(0.352757543, 0, 0.357429713, 0)
main.Size = UDim2.new(0, 308, 0, 161)
main.Active = true
main.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = main

Title.Name = "Title"
Title.Parent = main
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Size = UDim2.new(0, 308, 0, 43)
Title.Font = Enum.Font.SourceSans
Title.Text = "Simple Invisible Script GUI Made By DINIO#1390"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000
Title.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 12)
UICorner_2.Parent = Title

Invisible.Name = "Invisible"
Invisible.Parent = main
Invisible.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Invisible.Position = UDim2.new(0.175324678, 0, 0.447204947, 0)
Invisible.Size = UDim2.new(0, 200, 0, 50)
Invisible.Font = Enum.Font.SourceSans
Invisible.Text = "Enable Invisible"
Invisible.TextColor3 = Color3.fromRGB(255, 255, 255)
Invisible.TextSize = 20.000

UICorner_3.CornerRadius = UDim.new(0, 12)
UICorner_3.Parent = Invisible

-- Scripts:

local function SMSZ_fake_script() -- Invisible.LocalScript 
	local script = Instance.new('LocalScript', Invisible)

	script.Parent.MouseButton1Click:connect(function()
		local removeNametags = false -- remove custom billboardgui nametags from hrp, could trigger anticheat
	
		local plr = game:GetService("Players").LocalPlayer
		local character = plr.Character
		local hrp = character.HumanoidRootPart
		local old = hrp.CFrame
	
		if not character:FindFirstChild("LowerTorso") or character.PrimaryPart ~= hrp then
			return print("unsupported")
		end
	
		if removeNametags then
			local tag = hrp:FindFirstChildOfClass("BillboardGui")
			if tag then tag:Destroy() end
	
			hrp.ChildAdded:Connect(function(item)
				if item:IsA("BillboardGui") then
					task.wait()
					item:Destroy()
				end
			end)
		end
	
		local newroot = character.LowerTorso.Root:Clone()
		hrp.Parent = workspace
		character.PrimaryPart = hrp
		character:MoveTo(Vector3.new(old.X,9e9,old.Z))
		hrp.Parent = character
		task.wait(0.5)
		newroot.Parent = hrp
		hrp.CFrame = old
	end)
	
end
coroutine.wrap(SMSZ_fake_script)()
