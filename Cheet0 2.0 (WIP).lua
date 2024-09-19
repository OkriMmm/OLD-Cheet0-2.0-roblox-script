local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Cheet0 2.0",
   LoadingTitle = "Cheet0",
   LoadingSubtitle = "Now in 2.0",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Cheet0", -- Create a custom folder for your hub/game
      FileName = "Cheet0 2.0"
   },
   Discord = {
      Enabled = false,
      Invite = "sirius", -- The Discord invite code, do not include discord.gg/
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Hello"
   }
})
local Tab = Window:CreateTab("Main", 4483364243) -- Title, Image
--ESP--
local Button = Tab:CreateButton({
   Name = "Esp",
   Callback = function()
      local Players = game:GetService("Players"):GetChildren()
      local highlight = Instance.new("Highlight")
      highlight.Name = "Highlight"
    


      for i, v in pairs(Players) do
         repeat wait() until v.Character
         local highlightClone = highlight:Clone()
         highlightClone.Adornee = v.Character
         highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
      end


      game.Players.PlayerAdded:Connect(function(player)
         repeat wait() until player.Character
         local highlightClone = highlight:Clone()
         highlightClone.Adornee = player.Character
         highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
      end)

   end,
})


local Tab = Window:CreateTab("Player", 6961018899) -- Title, Image
local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = { 250, 16 },
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(v)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Jumppower",
   Range = { 50, 320 },
   Increment = 10,
   Suffix = "Jumppower",
   CurrentValue = 10,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(v)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Fly Speed",
   Range = { 250, 10 },
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(s)
      _G.FlySpeed = s
   end,
})

local Button = Tab:CreateButton({
   Name = "Fly",
   Callback = function()
      spawn(function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/LegitH3x0R/Roblox-Scripts/main/AEBypassing/RootAnchor.lua"))()
  
         local UIS = game:GetService("UserInputService")
         local OnRender = game:GetService("RunService").RenderStepped
         
         local Player = game:GetService("Players").LocalPlayer
         local Character = Player.Character or Player.CharacterAdded:Wait()
         
         local Camera = workspace.CurrentCamera
         local Root = Character:WaitForChild("HumanoidRootPart")
         local C1, C2, C3;
         local Nav = {Flying = false, Forward = false, Backward = false, Left = false, Right = false}
         C1 = UIS.InputBegan:Connect(function(Input)
             if Input.UserInputType == Enum.UserInputType.Keyboard then
                 if Input.KeyCode == Enum.KeyCode.G then
                     Nav.Flying = not Nav.Flying
                     Root.Anchored = Nav.Flying
                 elseif Input.KeyCode == Enum.KeyCode.W then
                     Nav.Forward = true
                 elseif Input.KeyCode == Enum.KeyCode.S then
                     Nav.Backward = true
                 elseif Input.KeyCode == Enum.KeyCode.A then
                     Nav.Left = true
                 elseif Input.KeyCode == Enum.KeyCode.D then
                     Nav.Right = true
                 end
             end
         end)
         
         C2 = UIS.InputEnded:Connect(function(Input)
             if Input.UserInputType == Enum.UserInputType.Keyboard then
                 if Input.KeyCode == Enum.KeyCode.W then
                     Nav.Forward = false
                 elseif Input.KeyCode == Enum.KeyCode.S then
                     Nav.Backward = false
                 elseif Input.KeyCode == Enum.KeyCode.A then
                     Nav.Left = false
                 elseif Input.KeyCode == Enum.KeyCode.D then
                     Nav.Right = false
                 end
             end
         end)
         
         C3 = Camera:GetPropertyChangedSignal("CFrame"):Connect(function()
             if Nav.Flying then
                 Root.CFrame = CFrame.new(Root.CFrame.Position, Root.CFrame.Position + Camera.CFrame.LookVector)
             end
         end)
         
         while true do
             local Delta = OnRender:Wait()
             if Nav.Flying then
                 if Nav.Forward then
                     Root.CFrame = Root.CFrame + (Camera.CFrame.LookVector * (Delta * _G.FlySpeed))
                 end
                 if Nav.Backward then
                     Root.CFrame = Root.CFrame + (-Camera.CFrame.LookVector * (Delta * _G.FlySpeed))
                 end
                 if Nav.Left then
                     Root.CFrame = Root.CFrame + (-Camera.CFrame.RightVector * (Delta * _G.FlySpeed))
                 end
                 if Nav.Right then
                     Root.CFrame = Root.CFrame + (Camera.CFrame.RightVector * (Delta * _G.FlySpeed))
                 end
             end
         end
     end)
 end
})