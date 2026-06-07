do
  ply = game.Players
  plr = ply.LocalPlayer
  Root = plr.Character.HumanoidRootPart
  replicated = game:GetService("ReplicatedStorage")
  Lv = game.Players.LocalPlayer.Data.Level.Value
  TeleportService = game:GetService("TeleportService")
  TW = game:GetService("TweenService")
  Lighting = game:GetService("Lighting")
  Enemies = workspace.Enemies
  vim1 = game:GetService("VirtualInputManager")
  vim2 = game:GetService("VirtualUser")
  TeamSelf = plr.Team
  plr:GetPropertyChangedSignal("Team"):Connect(function()
    TeamSelf = plr.Team
  end)
  RunSer = game:GetService("RunService")
  Stats = game:GetService("Stats")
  Energy = plr.Character.Energy.Value
  BringConnections = {}
  BossList = {}
  MaterialList = {}
  NPCList = {}
  shouldTween = false
  SoulGuitar = false
  KenTest = true
  debug = false
  Brazier1 = false
  Brazier2 = false
  Brazier3 = false
  Sec = 0.1
  ClickState = 0
  Num_self = 25
end

repeat local start = plr.PlayerGui:WaitForChild("Main"):WaitForChild("Loading") and game:IsLoaded() wait() until start

-- Anti AFK
if not getgenv().DC_AntiAFK_Connected then
  getgenv().DC_AntiAFK_Connected = true
  plr.Idled:Connect(function()
    pcall(function()
      vim2:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
      task.wait(1)
      vim2:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
  end)
end


World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089
World4 = game.PlaceId == 73902483975735

Sea = World1 or World2 or World3 or World4
Marines = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Marines") end
Pirates = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Pirates") end
if World1 then BossList = {"The Gorilla King","Bobby","The Saw","Yeti","Mob Leader","Vice Admiral","Saber Expert","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Ice Admiral","Greybeard"}
elseif World2 then BossList = {"Diamond","Jeremy","Orbitus","Don Swan","Smoke Admiral","Awakened Ice Admiral","Tide Keeper","Darkbeard","Cursed Captain","Order"}
elseif World3 then BossList = {"Stone","Hydra Leader","Kilo Admiral","Captain Elephant","Beautiful Pirate","Cake Queen","Dough King","Longma","Soul Reaper","Tyrant of the Skies"}
end
if World1 then MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif World2 then MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
elseif World3 then MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
end
local DoorBySea = {
    World1 = { -- Sea 1
        CFrame.new(-663.9844360351562, 10.661487579345703, 1702.4075927734375),
        CFrame.new(-569.425476, 10.6625795, 1555.19812, 0.965862036, 0, 0.259057134, 0, 1, 0, -0.259057134, 0, 0.965862036),
        CFrame.new(-615.751221, 10.6684809, 1477.42603, 0.499786854, 0, 0.866148472, 0, 1, 0, -0.866148472, 0, 0.499786854),
        CFrame.new(-1016.05951, 11.1554155, 1540.78235, -0.259074688, 0, 0.965857327, 0, 1, 0, -0.965857327, 0, -0.259074688),
        CFrame.new(-1089.28284, 10.6633625, 1604.43518, 0.866141319, 0, -0.499799222, 0, 1, 0, 0.499799222, 0, 0.866141319),
        CFrame.new(-1090.78882, 10.5735903, 1694.84729, 0.965862036, 0, 0.259057134, 0, 1, 0, -0.259057134, 0, 0.965862036),
        CFrame.new(-722.884277, 13.1791992, 1441.67004, 0.130574167, 0, 0.991438746, 0, 1, 0, -0.991438746, 0, 0.130574167),
        CFrame.new(-807.183594, 11.152545, 1488.5459, -0.259074688, 0, 0.965857327, 0, 1, 0, -0.965857327, 0, -0.259074688),
        CFrame.new(-879.806702, 11.1480875, 1457.44836, -0.965862155, 0, -0.259057134, 0, 1, 0, 0.259057134, 0, -0.965862155),
        CFrame.new(-931.028748, 12.3667698, 1788.7218, -0.130574584, 0, -0.991438746, 0, 1, 0, 0.991438746, 0, -0.130574584),
        CFrame.new(-743.997375, 9.12766838, 1771.24597, -0.965862155, 0, -0.259057134, 0, 1, 0, 0.259057134, 0, -0.965862155),
        CFrame.new(-502.915009, 11.1081972, 1534.43835, -0.965862155, 0, -0.259057134, 0, 1, 0, 0.259057134, 0, -0.965862155),
        CFrame.new(-567.464966, 11.2645111, 1387.86267, -0.499786854, 0, -0.866148472, 0, 1, 0, 0.866148472, 0, -0.499786854),
        CFrame.new(-1034.07739, 12.5107775, 1473.56006, 0.259074628, -0, -0.965857327, 0, 1, -0, 0.965857327, 0, 0.259074628),
        CFrame.new(-1176.11072, 11.1645613, 1551.41028, 0.866141319, -0, -0.499799222, 0, 1, -0, 0.499799222, 0, 0.866141319),
        CFrame.new(-1158.6062, 11.3645849, 1710.18604, 0.965862036, 0, 0.259057134, 0, 1, 0, -0.259057134, 0, 0.965862036)
    },
    World2 = { -- Sea 2
        CFrame.new(-61.5351906, 74.4224091, 402.107605, -0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, -0.707134247),
        CFrame.new(69.3701019, 75.8226624, 470.087311, 0.74314785, 0, -0.669127226, 0, 1, 0, 0.669127226, 0, 0.74314785),
        CFrame.new(-11.9682884, 74.4216156, 549.419861, -1, 0, 0, 0, 1, 0, 0, 0, -1),
        CFrame.new(-36.8832054, 74.4508743, 317.247559, 0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, 0.707134247),
        CFrame.new(-76.8325958, 75.8383408, 275.735626, 0.707134247, -3.30324547e-05, 0.707079291, -3.30324547e-05, 1, 7.97517787e-05, -0.707079291, -7.97517787e-05, 0.707134247),
        CFrame.new(-102.217758, 75.8358002, 250.35051, 0.707134247, -3.30324547e-05, 0.707079291, -3.30324547e-05, 1, 7.97517787e-05, -0.707079291, -7.97517787e-05, 0.707134247),
        CFrame.new(-127.249313, 75.833252, 225.318924, 0.707134247, -3.30324547e-05, 0.707079291, -3.30324547e-05, 1, 7.97517787e-05, -0.707079291, -7.97517787e-05, 0.707134247),
        CFrame.new(-264.754974, 75.823349, 154.394791, -0.694649816, 0, 0.719348073, 0, 1, 0, -0.719348073, 0, -0.694649816),
        CFrame.new(-638.131226, 75.6917343, 202.8134, -0.999848366, 0, -0.017436387, 0, 1, 0, 0.017436387, 0, -0.999848366),
        CFrame.new(-688.067505, 74.9095612, 393.773071, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247),
        CFrame.new(-623.880371, 74.8693466, 99.3358688, 0.707134247, 0.00017884915, 0.707079291, 1.93455853e-05, 0.99999994, -0.000272287783, -0.707079291, 0.000206222874, 0.707134247),
        CFrame.new(-709.502625, 75.6916504, 277.115509, -0.0175019503, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, -0.0175019503),
        CFrame.new(-749.345276, 75.8029709, 318.83078, -0.707134247, -0.00017884915, 0.707079291, 1.93455853e-05, 0.99999994, 0.000272287783, -0.707079291, 0.000206222874, -0.707134247),
        CFrame.new(-774.801147, 75.7933273, 344.286621, -0.707134247, -0.00017884915, 0.707079291, 1.93455853e-05, 0.99999994, 0.000272287783, -0.707079291, 0.000206222874, -0.707134247),
        CFrame.new(-799.691345, 75.7838898, 369.176849, -0.707134247, -0.00017884915, 0.707079291, 1.93455853e-05, 0.99999994, 0.000272287783, -0.707079291, 0.000206222874, -0.707134247),
        CFrame.new(-368.115631, 75.8233261, 156.40126, 0.719358087, 0, 0.694639385, 0, 1, 0, -0.694639385, 0, 0.719358087),
        CFrame.new(-412.784393, 74.4335785, 156.166626, 0, 0, 1, 0, 1, -0, -1, 0, 0),
        CFrame.new(-508.141083, 75.8170013, 155.627289, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    },
    World3 = { -- Sea 3
        CFrame.new(-12455.3896, 334.499054, -7698.82031, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247),
        CFrame.new(-12602.584, 334.555939, -7742.83398, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998339, 0, -0.939700902),
        CFrame.new(-12753.3633, 334.586975, -7700.92871, 0.173624322, 0, -0.984811783, 0, 1, 0, 0.984811783, 0, 0.173624322),
        CFrame.new(-12257.124, 334.613007, -7417.19434, -0.996191859, 0, -0.0871884301, 0, 1, 0, 0.0871884301, 0, -0.996191859),
        CFrame.new(-12179.9883, 335.293854, -7568.4043, 0.984812498, 0, 0.173621148, 0, 1, 0, -0.173621148, 0, 0.984812498),
        CFrame.new(-12307.4014, 335.27951, -7572.65381, -0.173624277, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, -0.173624277),
        CFrame.new(-12865.373, 335.293854, -7659.14648, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469),
        CFrame.new(-12773.7178, 335.287476, -7319.21484, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07),
        CFrame.new(-12540.7148, 335.287476, -7270.4917, -0.166172266, 0, -0.98609668, 0, 1, 0, 0.98609668, 0, -0.166172266)
    }
}
local Remotes = {
    RFSubmarineWorkerSpeak = replicated.Modules.Net["RF/SubmarineWorkerSpeak"],
    RFJobsRemoteFunction = replicated.Modules.Net["RF/JobsRemoteFunction"], 
    RFCraft = replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft")
}
local DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}
local RenMon = {"Snow Lurker","Arctic Warrior","Hidden Key","Awakened Ice Admiral"}
local CursedTables = {["Mob"] = "Mythological Pirate",["Mob2"] = "Cursed Skeleton","Hell's Messenger",["Mob3"] = "Cursed Skeleton","Heaven's Guardian"}
local Past = {"Part","SpawnLocation","Terrain","WedgePart","MeshPart"}
local BartMon = {"Swan Pirate","Jeremy"}
local CitizenTable = {"Forest Pirate","Captain Elephant"}
local Human_v3_Mob = {"Fajita","Jeremy","Diamond"}
local AllBoats = {"Beast Hunter","Lantern","Guardian","Grand Brigade","Dinghy","Sloop","The Sentinel"}
local mastery1 = {"Cookie Crafter"}
local mastery2 = {"Reborn Skeleton"}
local PosMsList = {["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625),["Pistol Billionaire"] = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625),["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.76270294189453, -730.1290893554688),["Dragon Crew Archer"] = CFrame.new(6625, 378, 244),["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375),["Venomous Assailant"] = CFrame.new(4902, 670, 39), ["Marine Commodore"] = CFrame.new(2401, 123, -7589),["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085),["Fishman Raider"] = CFrame.new(-10941, 332, -8760),["Fishman Captain"] = CFrame.new(-11035, 332, -9087),["Forest Pirate"] = CFrame.new(-13446, 413, -7760),["Mythological Pirate"] = CFrame.new(-13510, 584, -6987),["Jungle Pirate"] = CFrame.new(-11778, 426, -10592),["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565),["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963),["Living Zombie"] = CFrame.new(-10227, 421, 6161),["Demonic Soul"] = CFrame.new(-9579, 6, 6194),["Posessed Mummy"] = CFrame.new(-9579, 6, 6194),["Peanut Scout"] = CFrame.new(-1993, 187, -10103),["Peanut President"] = CFrame.new(-2215, 159, -10474),["Ice Cream Chef"] = CFrame.new(-877, 118, -11032),["Ice Cream Commander"] = CFrame.new(-877, 118, -11032),["Cookie Crafter"] = CFrame.new(-2021, 38, -12028),["Cake Guard"] = CFrame.new(-2024, 38, -12026),["Baking Staff"] = CFrame.new(-1932, 38, -12848),["Head Baker"] = CFrame.new(-1932, 38, -12848),["Cocoa Warrior"] = CFrame.new(95, 73, -12309),["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401),["Sweet Thief"] = CFrame.new(116, 36, -12478),["Candy Rebel"] = CFrame.new(47, 61, -12889),["Ghost"] = CFrame.new(5251, 5, 1111)}
EquipWeapon = function(text)
  if not text then return end
  if plr.Backpack:FindFirstChild(text) then
	plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(text))
  end
end
weaponSc = function(weapon)
  for __in, v in pairs(plr.Backpack:GetChildren()) do
    if v:IsA("Tool") then
      if v.ToolTip == weapon then EquipWeapon(v.Name) end
    end
  end
end
hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death),function() end)
hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC,function()end)
hookfunction(error, function()end)
hookfunction(warn, function()end)
local Rock = workspace:FindFirstChild("Rocks")
if Rock then Rock:Destroy()end
gay = (function()
  local lighting = game:GetService("Lighting")
  local lightingLayers = lighting:FindFirstChild("LightingLayers")
  if lightingLayers and game:GetService("Lighting") and game:GetService("Lighting") then
    local darkFog = lightingLayers:FindFirstChild("DarkFog")
    if darkFog then darkFog:Destroy() end
  end      
end)()
local Attack = {}
Attack.__index = Attack
Attack.Alive = function(model) if not model then return end local Humanoid = model:FindFirstChild("Humanoid") return Humanoid and Humanoid.Health > 0 end
Attack.Pos = function(model,dist) return (Root.Position - mode.Position).Magnitude <= dist end
Attack.Dist = function(model,dist) return (Root.Position - model:FindFirstChild("HumanoidRootPart").Position).Magnitude <= dist end
Attack.DistH = function(model,dist) return (Root.Position - model:FindFirstChild("HumanoidRootPart").Position).Magnitude > dist end
Attack.Kill = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
  EquipWeapon(_G.SelectWeapon)
  local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  if not Equipped then return end
  local ToolTip = Equipped.ToolTip
  if ToolTip == "Blox Fruit" then _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,10,0) * CFrame.Angles(0,math.rad(90),0)) else _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,0) * CFrame.Angles(0,math.rad(180),0))end
  if RandomCFrame then wait(.5)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(.5)_tp(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)) wait(.5)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30 ,0)) wait(.5)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(.5)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))end
  end
end
Attack.Kill2 = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
  EquipWeapon(_G.SelectWeapon)
  local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  local ToolTip = Equipped.ToolTip
  if ToolTip == "Blox Fruit" then _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,10,0) * CFrame.Angles(0,math.rad(90),0)) else _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,8) * CFrame.Angles(0,math.rad(180),0))end
  if RandomCFrame then wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30 ,0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))end
  end
end
Attack.KillSea = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
  EquipWeapon(_G.SelectWeapon)
  local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  local ToolTip = Equipped.ToolTip
  if ToolTip == "Blox Fruit" then _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,10,0) * CFrame.Angles(0,math.rad(90),0)) else notween(model.HumanoidRootPart.CFrame * CFrame.new(0,50,8)) wait(.85)notween(model.HumanoidRootPart.CFrame * CFrame.new(0,400,0)) wait(1)end
  end
end
Attack.Sword = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
  weaponSc("Sword")
  _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
  if RandomCFrame then wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30 ,0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))end
  end
end
Attack.Mas = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
    if model.Humanoid.Health <= HealthM then
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
      Useskills("Blox Fruit","Z")
      Useskills("Blox Fruit","X")
      Useskills("Blox Fruit","C")
    else
      weaponSc("Melee")
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
    end
  end
end
Attack.Masgun = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
    if model.Humanoid.Health <= HealthM then
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,35,8))
      Useskills("Gun","Z")
      Useskills("Gun","X")
    else
      weaponSc("Melee")
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
    end
  end
end
statsSetings = function(Num, value)
  if Num == "Melee" then
    if plr.Data.Points.Value ~= 0 then
      replicated.Remotes.CommF_:InvokeServer("AddPoint","Melee",value)
    end
  elseif Num == "Defense" then
    if plr.Data.Points.Value ~= 0 then
      replicated.Remotes.CommF_:InvokeServer("AddPoint","Defense",value)
    end
  elseif Num == "Sword" then
    if plr.Data.Points.Value ~= 0 then
      replicated.Remotes.CommF_:InvokeServer("AddPoint","Sword",value)
    end
  elseif Num == "Gun" then
    if plr.Data.Points.Value ~= 0 then
      replicated.Remotes.CommF_:InvokeServer("AddPoint","Gun",value)
    end
  elseif Num == "Devil" then
    if plr.Data.Points.Value ~= 0 then
      replicated.Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",value)
    end
  end
end
BringEnemy = function()
  if not _B then return end
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
	  if (v.PrimaryPart.Position - PosMon).Magnitude <= 300 then
	    v.PrimaryPart.CFrame = CFrame.new(PosMon)
		v.PrimaryPart.CanCollide = true;
		v:FindFirstChild("Humanoid").WalkSpeed = 0;
		v:FindFirstChild("Humanoid").JumpPower = 0;
		if v.Humanoid:FindFirstChild("Animator") then v.Humanoid.Animator:Destroy()end;
		plr.SimulationRadius = math.huge
	  end
	end                               
  end                    	
end
Useskills = function(weapon, skill)
  if weapon == "Melee" then
    weaponSc("Melee")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    elseif skill == "C" then
      vim1:SendKeyEvent(true, "C", false, game);
      vim1:SendKeyEvent(false, "C", false, game);
    end
  elseif weapon == "Sword" then
    weaponSc("Sword")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    end
  elseif weapon == "Blox Fruit" then
    weaponSc("Blox Fruit")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    elseif skill == "C" then
      vim1:SendKeyEvent(true, "C", false, game);
      vim1:SendKeyEvent(false, "C", false, game);        
    elseif skill == "V" then
      vim1:SendKeyEvent(true, "V", false, game);
      vim1:SendKeyEvent(false, "V", false, game);
    end
  elseif weapon == "Gun" then
    weaponSc("Gun")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    end
  end
  if weapon == "nil" and skill == "Y" then
    vim1:SendKeyEvent(true, "Y", false, game);
    vim1:SendKeyEvent(false, "Y", false, game);
  end
end
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
  local method = getnamecallmethod()
  local args = {...}    
    if tostring(method) == "FireServer" then
      if tostring(args[1]) == "RemoteEvent" then
        if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
          if (_G.FarmMastery_G and not SoulGuitar) or (_G.FarmMastery_Dev) or (_G.FarmBlazeEM) or (_G.Prehis_Skills) or (_G.SeaBeast1 or _G.FishBoat or _G.PGB or _G.Leviathan1 or _G.Complete_Trials) or (_G.AimMethod and ABmethod == "AimBots Skill") or (_G.AimMethod and ABmethod == "Auto Aimbots") then
            args[2] = MousePos
            return old(unpack(args))
          end
        end
      end
    end
  return old(...)
end)
GetConnectionEnemies = function(a)
  for i,v in pairs(replicated:GetChildren()) do
    if v:IsA("Model") and  ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
      return v
    end
  end
  for i,v in next,game.Workspace.Enemies:GetChildren() do
    if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a)  and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
      return v
    end
  end
end
LowCpu = function()
  local decalsyeeted = true
  local g = game
  local w = g.Workspace
  local l = g.Lighting
  local t = w.Terrain
  t.WaterWaveSize = 0
  t.WaterWaveSpeed = 0
  t.WaterReflectance = 0
  t.WaterTransparency = 0
  l.GlobalShadows = false
  l.FogEnd = 9e9
  l.Brightness = 0
  settings().Rendering.QualityLevel = "Level01"
  for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
      v.Material = "Plastic"
      v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
      v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
      v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
      v.BlastPressure = 1
      v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
      v.Enabled = false
    elseif v:IsA("MeshPart") then
      v.Material = "Plastic"
      v.Reflectance = 0
      v.TextureID = 10385902758728957
    end
  end
  for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
      e.Enabled = false
    end
  end
end
CheckF = function()
  if GetBP("Dragon-Dragon") or GetBP("Gas-Gas") or GetBP("Yeti-Yeti") or GetBP("Kitsune-Kitsune") or GetBP("T-Rex-T-Rex") then return true end
end
CheckBoat = function()
  for i, v in pairs(workspace.Boats:GetChildren()) do
    if tostring(v.Owner.Value) == tostring(plr.Name) then
      return v    
end;
  end;
  return false
end;
CheckEnemiesBoat = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "FishBoat") and v:FindFirstChild("Health").Value > 0 then
      return true    
end;
  end;
  return false
end;
CheckPirateGrandBrigade = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade") and v:FindFirstChild("Health").Value > 0 then
      return true
    end
  end
  return false
end
CheckShark = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if v.Name == "Shark" and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckTerrorShark = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if v.Name == "Terrorshark" and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckPiranha = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if v.Name == "Piranha" and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckFishCrew = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "Fish Crew Member" or v.Name == "Haunted Crew Member") and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckHauntedCrew = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "Haunted Crew Member") and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckSeaBeast = function()
  if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
    return true  
end;
  return false
end;
CheckLeviathan = function()
  if workspace.SeaBeasts:FindFirstChild("Leviathan") then
    return true  
end;
  return false
end;
UpdStFruit = function()
  for z,x in next, plr.Backpack:GetChildren() do
  StoreFruit = x:FindFirstChild("EatRemote", true)
    if StoreFruit then
      replicated.Remotes.CommF_:InvokeServer("StoreFruit",StoreFruit.Parent:GetAttribute("OriginalName"),
      plr.Backpack:FindFirstChild(x.Name))
    end
  end
end
collectFruits = function(Succes)
  if Succes then
    local Character = plr.Character
    for _,v1 in pairs(workspace:GetChildren()) do
    if string.find(v1.Name, "Fruit") then v1.Handle.CFrame = Character.HumanoidRootPart.CFrame end
    end
  end
end
Getmoon = function()
  if World1 then
    return Lighting.FantasySky.MoonTextureId
  elseif World2 then
    return Lighting.FantasySky.MoonTextureId
  elseif World3 then
    return Lighting.Sky.MoonTextureId
  end
end
DropFruits = function()
  for _,v3 in next, plr.Backpack:GetChildren() do
    if string.find(v3.Name, "Fruit") then
      EquipWeapon(v3.Name) wait(.1)
      if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(v3.Name) plr.Character:FindFirstChild(v3.Name).EatRemote:InvokeServer("Drop")
    end
  end
  for a,b2 in pairs(plr.Character:GetChildren()) do
    if string.find(b2.Name, "Fruit") then EquipWeapon(b2.Name) wait(.1)
    if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(b2.Name) plr.Character:FindFirstChild(b2.Name).EatRemote:InvokeServer("Drop")
    end
  end
end
GetBP = function(v)
  return plr.Backpack:FindFirstChild(v) or plr.Character:FindFirstChild(v)
end
GetIn = function(Name)
  for _ ,v1 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
    if type(v1) == "table" then
      if v1.Name == Name or plr.Character:FindFirstChild(Name) or plr.Backpack:FindFirstChild(Name) then
        return true
	 end
    end
  end
  return false
end
GetM = function(Name)
  for _,tab in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
    if type(tab) == "table" then
	  if tab.Type == "Material" then
	    if tab.Name == Name then
		  return tab.Count
	    end
	  end
    end
  end
return 0
end
GetWP = function(nametool)
  for _,v4 in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
    if type(v4) == "table" then
      if v4.Type == "Sword" then
        if v4.Name == nametool or plr.Character:FindFirstChild(nametool) or plr.Backpack:FindFirstChild(nametool) then
	     return true
	     end
	   end
      end
    end
  return false
end 
getInfinity_Ability = function(Method, Var)
  if not Root then return end
  if Method == "Soru" and Var then
    for _,gc in next, getgc() do
      if plr.Character.Soru then
        if ((typeof(gc) == "function") and (getfenv(gc).script == plr.Character.Soru)) then
          for _, v in next, getupvalues(gc) do
            if (typeof(v) == "table") then
              repeat wait(Sec) v.LastUse = 0 until not Var or (plr.Character.Humanoid.Health <= 0)
            end
          end
        end
      end
    end    
  elseif Method == "Energy" and Var then
    plr.Character.Energy.Changed:connect(function()
      if Var then plr.Character.Energy.Value = Energy end 
    end)
  elseif Method == "Observation" and Var then
    local VisionRadius = plr.VisionRadius
    VisionRadius.Value = math.huge
  end
end
Hop = function()
  pcall(function()
    for count = math.random(1, math.random(40, 75)), 100 do
      local remote = replicated.__ServerBrowser:InvokeServer(count)
	  for _, v in next, remote do
	  if tonumber(v['Count']) < 12 then TeleportService:TeleportToPlaceInstance(game.PlaceId, _) end
	  end    
    end
  end)
end
local block = Instance.new("Part", workspace)
block.Size = Vector3.new(1, 1, 1)
block.Name = "Rip_Indra"
block.Anchored = true
block.CanCollide = false
block.CanTouch = false
block.Transparency = 1
local blockfind = workspace:FindFirstChild(block.Name)
if blockfind and blockfind ~= block then blockfind:Destroy() end
task.spawn(function()while task.wait()do if block and block.Parent==workspace then if shouldTween then getgenv().OnFarm=true else getgenv().OnFarm=false end else getgenv().OnFarm=false end end end)
task.spawn(function()local a=game.Players.LocalPlayer;repeat task.wait()until a.Character and a.Character.PrimaryPart;block.CFrame=a.Character.PrimaryPart.CFrame;while task.wait()do pcall(function()if getgenv().OnFarm then if block and block.Parent==workspace then local b=a.Character and a.Character.PrimaryPart;if b and(b.Position-block.Position).Magnitude<=200 then b.CFrame=block.CFrame else block.CFrame=b.CFrame end end;local c=a.Character;if c then for d,e in pairs(c:GetChildren())do if e:IsA("BasePart")then e.CanCollide=false end end end else local c=a.Character;if c then for d,e in pairs(c:GetChildren())do if e:IsA("BasePart")then e.CanCollide=true end end end end end)end end)
_tp = function(target)
  local character = plr.Character
  if not character or not character:FindFirstChild("HumanoidRootPart") then return end
  local rootPart = character.HumanoidRootPart
  local distance = (target.Position - rootPart.Position).Magnitude
  local tweenInfo = TweenInfo.new(distance / 300, Enum.EasingStyle.Linear)
  local tween = game:GetService("TweenService"):Create(block, tweenInfo, {CFrame = target})
  if plr.Character.Humanoid.Sit == true then
    block.CFrame = CFrame.new(block.Position.X, target.Y, block.Position.Z)
  end
  tween:Play()
  task.spawn(function() while tween.PlaybackState == Enum.PlaybackState.Playing do if not shouldTween then tween:Cancel() break end task.wait(0.1) end end)
end

-- H闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?tween ri闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰缂傚倷闄嶉崹铏光偓?cho Tele to Saved CFrame (kh?ng d闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰缂傚倷闄嶉崹铏光偓?block)
_tpSmooth = function(target)
  local character = plr.Character
  if not character or not character:FindFirstChild("HumanoidRootPart") then return end
  local rootPart = character.HumanoidRootPart
  local distance = (target.Position - rootPart.Position).Magnitude
  if distance < 5 then return end
  
  -- T?o part t?m ?? tween
  local tempPart = Instance.new("Part")
  tempPart.Name = "TweenPart"
  tempPart.Size = Vector3.new(2, 2, 2)
  tempPart.CFrame = rootPart.CFrame
  tempPart.Anchored = true
  tempPart.CanCollide = false
  tempPart.Transparency = 1
  tempPart.Parent = workspace
  
  local tweenInfo = TweenInfo.new(distance / 350, Enum.EasingStyle.Linear)
  local tween = game:GetService("TweenService"):Create(tempPart, tweenInfo, {CFrame = target})
  
  local completed = false
  local conn = tween.Completed:Connect(function()
      completed = true
      conn:Disconnect()
  end)
  
  tween:Play()
  
  -- Update character position theo tempPart
  local startTime = tick()
  repeat
      task.wait(0.03)
      if character and character:FindFirstChild("HumanoidRootPart") then
          character.HumanoidRootPart.CFrame = tempPart.CFrame
      end
  until completed or (tick() - startTime) > (distance / 500 + 3)
  
  tempPart:Destroy()
end
TeleportToTarget = function(targetCFrame) if (targetCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 1000 then _tp(targetCFrame)else _tp(targetCFrame)end end
notween = function(p) plr.Character.HumanoidRootPart.CFrame = p end
function BTP(p)
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character.HumanoidRootPart
    local humanoid = player.Character.Humanoid
    local playerGui = player.PlayerGui.Main
    local targetPosition = p.Position
    local lastPosition = humanoidRootPart.Position
    repeat
        humanoid.Health = 0
        humanoidRootPart.CFrame = p
        playerGui.Quest.Visible = false
        if (humanoidRootPart.Position - lastPosition).Magnitude > 1 then
            lastPosition = humanoidRootPart.Position
            humanoidRootPart.CFrame = p
        end
        task.wait(0.5)
    until (p.Position - humanoidRootPart.Position).Magnitude <= 2000
end
local _GTable = _G
local _GenvTable = (getgenv and getgenv()) or _G
local _GGuard = false
local function Gv(key)
  local v = rawget(_GenvTable, key)
  if v ~= nil then return v end
  v = rawget(_GTable, key)
  if v ~= nil then return v end
  if _GGuard then return nil end
  _GGuard = true
  local ok1, res1 = pcall(function() return _GenvTable[key] end)
  local ok2, res2 = pcall(function() return _GTable[key] end)
  _GGuard = false
  if ok1 and res1 ~= nil then return res1 end
  if ok2 and res2 ~= nil then return res2 end
  return nil
end

local AnyEnabledKeys = {
  "SailBoat_Hydra","WardenBoss","AutoFactory","HighestMirage","HCM","PGB","Leviathan1","UPGDrago",
  "Complete_Trials","TpDrago_Prehis","BuyDrago","AutoFireFlowers","DT_Uzoth","AutoBerry","Prehis_Find",
  "Prehis_Skills","Prehis_DB","Prehis_DE","FarmBlazeEM","Dojoo","CollectPresent","AutoLawKak","TpLab",
  "AutoPhoenixF","AutoFarmChest","AutoHytHallow","LongsWord","BlackSpikey","AutoHolyTorch","TrainDrago",
  "AutoSaber","FarmMastery_Dev","CitizenQuest","AutoEctoplasm","KeysRen","Auto_Rainbow_Haki","obsFarm",
  "AutoBigmom","Doughv2","AuraBoss","Raiding","Auto_Cavender","TpPly","Bartilo_Quest","Level","AutoFarmLevelEnabled",
  "FarmEliteHunt","AutoZou","AutoFarm_Bone","AutoMaterial","CraftVM","FrozenTP","TPDoor","AcientOne",
  "AutoFarmNear","AutoRaidCastle","DarkBladev3","AutoFarmRaid","Auto_Cake_Prince","Addealer","TPNpc",
  "TwinHook","FindMirage","FarmChestM","Shark","TerrorShark","Piranha","MobCrew","SeaBeast1","FishBoat",
  "AutoPole","AutoPoleV2","Auto_SuperHuman","AutoDeathStep","Auto_SharkMan_Karate","Auto_Electric_Claw",
  "AutoDragonTalon","Auto_Def_DarkCoat","Auto_God_Human","Auto_Tushita","AutoMatSoul","AutoKenVTWO",
  "AutoSerpentBow","AutoFMon","Auto_Soul_Guitar","TPGEAR","AutoSaw","AutoTridentW2","Auto_StartRaid",
  "AutoEvoRace","AutoGetQuestBounty","MarinesCoat","TravelDres","Defeating","DummyMan","Auto_Yama",
  "Auto_SwanGG","SwanCoat","AutoEcBoss","Auto_Mink","Auto_Human","Auto_Skypiea","Auto_Fish","CDK_TS",
  "CDK_YM","CDK","AutoFarmGodChalice","AutoFistDarkness","AutoMiror","Teleport","AutoKilo",
  "AutoGetUsoap","Praying","TryLucky","AutoColShad","AutoUnHaki","Auto_DonAcces","AutoRipIngay",
  "DragoV3","DragoV1","SailBoats","FarmGodChalice","IceBossRen","Lvthan","beasthunter","DangerLV",
  "Relic123","tweenKitsune","Collect_Ember","AutofindKitIs","snaguine","TwFruits","tweenKitShrine",
  "Tp_LgS","Tp_MasterA","tweenShrine","FarmMastery_G","FarmMastery_S","AutoFarmBoss","AutoFarmAllBoss",
  "AutoFishSlap","FarmTyrant","FarmPhaBinh","UpgradeRaceV2","AutoSpawnCP","AutoBerryH","AutoChestBP",
  "FarmEliteHop","AutoHop_Dough","AutoDoughKing","AutoChipFruit","AutoChipBeli","StartEvent",
  "AutoTrickOrTreat","FarmUnboundWerewolf"
}

local function AnyEnabled()
  for _, key in ipairs(AnyEnabledKeys) do
    if Gv(key) then
      return true
    end
  end
  if AutoCollectEggs or AutoFarmChest then
    return true
  end
  if NextIs or senth or senth2 then
    return true
  end
  return false
end

spawn(function()
  while task.wait() do
    pcall(function()
      if AnyEnabled() then
        if IsCollectingEggs then return end
        shouldTween = true
        if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
          local Noclip = Instance.new("BodyVelocity")
          Noclip.Name = "BodyClip"
          Noclip.Parent = plr.Character.HumanoidRootPart
          Noclip.MaxForce = Vector3.new(100000,100000,100000)
          Noclip.Velocity = Vector3.new(0,0,0)
        end        
      if not plr.Character:FindFirstChild("highlight") then
    local Test = Instance.new("Highlight")
    Test.Name = "highlight"
    Test.Enabled = true
    Test.FillColor = Color3.fromRGB(255,165,0)
    Test.OutlineColor = Color3.fromRGB(255,0,0)
    Test.FillTransparency = 0.5
    Test.OutlineTransparency = 0.2
    Test.Parent = plr.Character
end
        for _, no in pairs(plr.Character:GetDescendants()) do if no:IsA("BasePart") then no.CanCollide = false end end
      else
        shouldTween = false
        if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy() end
        if plr.Character:FindFirstChild('highlight') then plr.Character:FindFirstChild('highlight'):Destroy() end	        
      end
    end)
  end
end)
QuestB=function()if World1 then if _G.FindBoss=="The Gorilla King"then bMon="The Gorilla King"Qname="JungleQuest"Qdata=3;PosQBoss=CFrame.new(-1601.6553955078,36.85213470459,153.38809204102)PosB=CFrame.new(-1088.75977,8.13463783,-488.559906,-0.707134247,0,0.707079291,0,1,0,-0.707079291,0,-0.707134247)elseif _G.FindBoss=="Bobby"then bMon="Bobby"Qname="BuggyQuest1"Qdata=3;PosQBoss=CFrame.new(-1140.1761474609,4.752049446106,3827.4057617188)PosB=CFrame.new(-1087.3760986328,46.949409484863,4040.1462402344)elseif _G.FindBoss=="The Saw"then bMon="The Saw"PosB=CFrame.new(-784.89715576172,72.427383422852,1603.5822753906)elseif _G.FindBoss=="Yeti"then bMon="Yeti"Qname="SnowQuest"Qdata=3;PosQBoss=CFrame.new(1386.8073730469,87.272789001465,-1298.3576660156)PosB=CFrame.new(1218.7956542969,138.01184082031,-1488.0262451172)elseif _G.FindBoss=="Mob Leader"then bMon="Mob Leader"PosB=CFrame.new(-2844.7307128906,7.4180502891541,5356.6723632813)elseif _G.FindBoss=="Vice Admiral"then bMon="Vice Admiral"Qname="MarineQuest2"Qdata=2;PosQBoss=CFrame.new(-5036.2465820313,28.677835464478,4324.56640625)PosB=CFrame.new(-5006.5454101563,88.032081604004,4353.162109375)elseif _G.FindBoss=="Saber Expert"then bMon="Saber Expert"PosB=CFrame.new(-1458.89502,29.8870335,-50.633564)elseif _G.FindBoss=="Warden"then bMon="Warden"Qname="ImpelQuest"Qdata=1;PosB=CFrame.new(5278.04932,2.15167475,944.101929,0.220546961,-4.49946401e-06,0.975376427,-1.95412576e-05,1,9.03162072e-06,-0.975376427,-2.10519756e-05,0.220546961)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Chief Warden"then bMon="Chief Warden"Qname="ImpelQuest"Qdata=2;PosB=CFrame.new(5206.92578,0.997753382,814.976746,0.342041343,-0.00062915677,0.939684749,0.00191645394,0.999998152,-2.80422337e-05,-0.939682961,0.00181045406,0.342041939)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Swan"then bMon="Swan"Qname="ImpelQuest"Qdata=3;PosB=CFrame.new(5325.09619,7.03906584,719.570679,-0.309060812,0,0.951042235,0,1,0,-0.951042235,0,-0.309060812)PosQBoss=CFrame.new(5191.86133,2.84020686,686.438721,-0.731384635,0,0.681965172,0,1,0,-0.681965172,0,-0.731384635)elseif _G.FindBoss=="Magma Admiral"then bMon="Magma Admiral"Qname="MagmaQuest"Qdata=3;PosQBoss=CFrame.new(-5314.6220703125,12.262420654297,8517.279296875)PosB=CFrame.new(-5765.8969726563,82.92064666748,8718.3046875)elseif _G.FindBoss=="Fishman Lord"then bMon="Fishman Lord"Qname="FishmanQuest"Qdata=3;PosQBoss=CFrame.new(61122.65234375,18.497442245483,1569.3997802734)PosB=CFrame.new(61260.15234375,30.950881958008,1193.4329833984)elseif _G.FindBoss=="Wysper"then bMon="Wysper"Qname="SkyExp1Quest"Qdata=3;PosQBoss=CFrame.new(-7861.947265625,5545.517578125,-379.85974121094)PosB=CFrame.new(-7866.1333007813,5576.4311523438,-546.74816894531)elseif _G.FindBoss=="Thunder God"then bMon="Thunder God"Qname="SkyExp2Quest"Qdata=3;PosQBoss=CFrame.new(-7903.3828125,5635.9897460938,-1410.923828125)PosB=CFrame.new(-7994.984375,5761.025390625,-2088.6479492188)elseif _G.FindBoss=="Cyborg"then bMon="Cyborg"Qname="FountainQuest"Qdata=3;PosQBoss=CFrame.new(5258.2788085938,38.526931762695,4050.044921875)PosB=CFrame.new(6094.0249023438,73.770050048828,3825.7348632813)elseif _G.FindBoss=="Ice Admiral"then bMon="Ice Admiral"Qdata=nil;PosQBoss=CFrame.new(1266.08948,26.1757946,-1399.57678,-0.573599219,0,-0.81913656,0,1,0,0.81913656,0,-0.573599219)PosB=CFrame.new(1266.08948,26.1757946,-1399.57678,-0.573599219,0,-0.81913656,0,1,0,0.81913656,0,-0.573599219)elseif _G.FindBoss=="Greybeard"then bMon="Greybeard"Qdata=nil;PosQBoss=CFrame.new(-5081.3452148438,85.221641540527,4257.3588867188)PosB=CFrame.new(-5081.3452148438,85.221641540527,4257.3588867188)end end;if World2 then if _G.FindBoss=="Diamond"then bMon="Diamond"Qname="Area1Quest"Qdata=3;PosQBoss=CFrame.new(-427.5666809082,73.313781738281,1835.4208984375)PosB=CFrame.new(-1576.7166748047,198.59265136719,13.724286079407)elseif _G.FindBoss=="Jeremy"then bMon="Jeremy"Qname="Area2Quest"Qdata=3;PosQBoss=CFrame.new(636.79943847656,73.413787841797,918.00415039063)PosB=CFrame.new(2006.9261474609,448.95666503906,853.98284912109)elseif _G.FindBoss=="Fajita"then bMon="Fajita"Qname="MarineQuest3"Qdata=3;PosQBoss=CFrame.new(-2441.986328125,73.359344482422,-3217.5324707031)PosB=CFrame.new(-2172.7399902344,103.32216644287,-4015.025390625)elseif _G.FindBoss=="Don Swan"then bMon="Don Swan"PosB=CFrame.new(2286.2004394531,15.177839279175,863.8388671875)elseif _G.FindBoss=="Smoke Admiral"then bMon="Smoke Admiral"Qname="IceSideQuest"Qdata=3;PosQBoss=CFrame.new(-5429.0473632813,15.977565765381,-5297.9614257813)PosB=CFrame.new(-5275.1987304688,20.757257461548,-5260.6669921875)elseif _G.FindBoss=="Awakened Ice Admiral"then bMon="Awakened Ice Admiral"Qname="FrostQuest"Qdata=3;PosQBoss=CFrame.new(5668.9780273438,28.519989013672,-6483.3520507813)PosB=CFrame.new(6403.5439453125,340.29766845703,-6894.5595703125)elseif _G.FindBoss=="Tide Keeper"then bMon="Tide Keeper"Qname="ForgottenQuest"Qdata=3;PosQBoss=CFrame.new(-3053.9814453125,237.18954467773,-10145.0390625)PosB=CFrame.new(-3795.6423339844,105.88877105713,-11421.307617188)elseif _G.FindBoss=="Darkbeard"then bMon="Darkbeard"Qdata=nil;PosQBoss=CFrame.new(3677.08203125,62.751937866211,-3144.8332519531)PosB=CFrame.new(3677.08203125,62.751937866211,-3144.8332519531)elseif _G.FindBoss=="Cursed Captaim"then bMon="Cursed Captain"Qdata=nil;PosQBoss=CFrame.new(916.928589,181.092773,33422)PosB=CFrame.new(916.928589,181.092773,33422)elseif _G.FindBoss=="Order"then bMon="Order"Qdata=nil;PosQBoss=CFrame.new(-6217.2021484375,28.047645568848,-5053.1357421875)PosB=CFrame.new(-6217.2021484375,28.047645568848,-5053.1357421875)end end;if World3 then if _G.FindBoss=="Stone"then bMon="Stone"Qname="PiratePortQuest"Qdata=3;PosQBoss=CFrame.new(-289.76705932617,43.819011688232,5579.9384765625)PosB=CFrame.new(-1027.6512451172,92.404174804688,6578.8530273438)elseif _G.FindBoss=="Hydra Leader"then bMon="Hydra Leader"Qname="AmazonQuest2"Qdata=3;PosQBoss=CFrame.new(5821.89794921875,1019.0950927734375,-73.71923065185547)PosB=CFrame.new(5821.89794921875,1019.0950927734375,-73.71923065185547)elseif _G.FindBoss=="Kilo Admiral"then bMon="Kilo Admiral"Qname="MarineTreeIsland"Qdata=3;PosQBoss=CFrame.new(2179.3010253906,28.731239318848,-6739.9741210938)PosB=CFrame.new(2764.2233886719,432.46154785156,-7144.4580078125)elseif _G.FindBoss=="Captain Elephant"then bMon="Captain Elephant"Qname="DeepForestIsland"Qdata=3;PosQBoss=CFrame.new(-13232.682617188,332.40396118164,-7626.01171875)PosB=CFrame.new(-13376.7578125,433.28689575195,-8071.392578125)elseif _G.FindBoss=="Beautiful Pirate"then bMon="Beautiful Pirate"Qname="DeepForestIsland2"Qdata=3;PosQBoss=CFrame.new(-12682.096679688,390.88653564453,-9902.1240234375)PosB=CFrame.new(5283.609375,22.56223487854,-110.78285217285)elseif _G.FindBoss=="Cake Queen"then bMon="Cake Queen"Qname="IceCreamIslandQuest"Qdata=3;PosQBoss=CFrame.new(-819.376709,64.9259796,-10967.2832,-0.766061664,0,0.642767608,0,1,0,-0.642767608,0,-0.766061664)PosB=CFrame.new(-678.648804,381.353943,-11114.2012,-0.908641815,0.00149294338,0.41757378,0.00837114919,0.999857843,0.0146408929,-0.417492568,0.0167988986,-0.90852499)elseif _G.FindBoss=="Longma"then bMon="Longma"Qdata=nil;PosQBoss=CFrame.new(-10238.875976563,389.7912902832,-9549.7939453125)PosB=CFrame.new(-10238.875976563,389.7912902832,-9549.7939453125)elseif _G.FindBoss=="Soul Reaper"then bMon="Soul Reaper"Qdata=nil;PosQBoss=CFrame.new(-9524.7890625,315.80429077148,6655.7192382813)PosB=CFrame.new(-9524.7890625,315.80429077148,6655.7192382813)end end end
QuestBeta = function()
  local Neta = QuestB()
  return {
    [0] = _G.FindBoss,
    [1] = bMon,
    [2] = Qdata,
    [3] = Qname,
    [4] = PosB
    }  
end
local function GetFarmLevel()
  local override = Gv("LevelFarmOverride")
  if type(override) == "number" then
    return override
  end
  local data = plr and plr:FindFirstChild("Data")
  local lvl = data and data:FindFirstChild("Level")
  if not (lvl and lvl.Value) then
    return nil
  end
  return lvl.Value
end

local function GetFarmLevelBySea()
  local lvl = GetFarmLevel()
  if not lvl then return nil end
  if World1 then
    return math.min(lvl, 650)
  elseif World2 then
    return math.min(lvl, 1450)
  elseif World3 then
    return math.min(lvl, 2800)
  end
  return lvl
end

QuestCheck=function()local a=GetFarmLevel();
if not a then
    Mon, Qdata, Qname, NameMon, PosM, PosQ = nil, nil, nil, nil, nil, nil
    return
end
TeamSelf = plr.Team
if World1 then
			if a == 1 or a <= 9 then
				if tostring(TeamSelf) == "Marines" then
					Mon = "Trainee"
					Qname = "MarineQuest"
					Qdata = 1;
					NameMon = "Trainee"
					PosM = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929)
					PosQ = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929)
				elseif tostring(TeamSelf) == "Pirates" then
					Mon = "Bandit"
					Qdata = 1;
					Qname = "BanditQuest1"
					NameMon = "Bandit"
					PosM = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
					PosQ = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
				end
			elseif a == 10 or a <= 14 then
				Mon = "Monkey"
				Qdata = 1;
				Qname = "JungleQuest"
				NameMon = "Monkey"
				PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				PosM = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
			elseif a == 15 or a <= 29 then
				Mon = "Gorilla"
				Qdata = 2;
				Qname = "JungleQuest"
				NameMon = "Gorilla"
				PosQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				PosM = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
			elseif a == 30 or a <= 39 then
				Mon = "Pirate"
				Qdata = 1;
				Qname = "BuggyQuest1"
				NameMon = "Pirate"
				PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
				PosM = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
			elseif a == 40 or a <= 59 then
				Mon = "Brute"
				Qdata = 2;
				Qname = "BuggyQuest1"
				NameMon = "Brute"
				PosQ = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
				PosM = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
			elseif a == 60 or a <= 74 then
				Mon = "Desert Bandit"
				Qdata = 1;
				Qname = "DesertQuest"
				NameMon = "Desert Bandit"
				PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
				PosM = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
			elseif a == 75 or a <= 89 then
				Mon = "Desert Officer"
				Qdata = 2;
				Qname = "DesertQuest"
				NameMon = "Desert Officer"
				PosQ = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
				PosM = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
			elseif a == 90 or a <= 99 then
				Mon = "Snow Bandit"
				Qdata = 1;
				Qname = "SnowQuest"
				NameMon = "Snow Bandit"
				PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
				PosM = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
			elseif a == 100 or a <= 119 then
				Mon = "Snowman"
				Qdata = 2;
				Qname = "SnowQuest"
				NameMon = "Snowman"
				PosQ = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
				PosM = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
			elseif a == 120 or a <= 149 then
				Mon = "Chief Petty Officer"
				Qdata = 1;
				Qname = "MarineQuest2"
				NameMon = "Chief Petty Officer"
				PosQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
			elseif a == 150 or a <= 174 then
				Mon = "Sky Bandit"
				Qdata = 1;
				Qname = "SkyQuest"
				NameMon = "Sky Bandit"
				PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
				PosM = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
			elseif a == 175 or a <= 189 then
				Mon = "Dark Master"
				Qdata = 2;
				Qname = "SkyQuest"
				NameMon = "Dark Master"
				PosQ = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
				PosM = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
			elseif a == 190 or a <= 209 then
				Mon = "Prisoner"
				Qdata = 1;
				Qname = "PrisonerQuest"
				NameMon = "Prisoner"
				PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
				PosM = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
			elseif a == 210 or a <= 249 then
				Mon = "Dangerous Prisoner"
				Qdata = 2;
				Qname = "PrisonerQuest"
				NameMon = "Dangerous Prisoner"
				PosQ = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
				PosM = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
			elseif a == 250 or a <= 274 then
				Mon = "Toga Warrior"
				Qdata = 1;
				Qname = "ColosseumQuest"
				NameMon = "Toga Warrior"
				PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
				PosM = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
			elseif a == 275 or a <= 299 then
				Mon = "Gladiator"
				Qdata = 2;
				Qname = "ColosseumQuest"
				NameMon = "Gladiator"
				PosQ = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
				PosM = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
			elseif a == 300 or a <= 324 then
				Boubty = false;
				Mon = "Military Soldier"
				Qdata = 1;
				Qname = "MagmaQuest"
				NameMon = "Military Soldier"
				PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
				PosM = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
			elseif a == 325 or a <= 374 then
				Mon = "Military Spy"
				Qdata = 2;
				Qname = "MagmaQuest"
				NameMon = "Military Spy"
				PosQ = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
				PosM = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
            elseif a == 375 or a <= 399 then
                Mon = "Fishman Warrior"
                Qdata = 1;
                Qname = "FishmanQuest"
                NameMon = "Fishman Warrior"
                PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                PosM = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif a == 400 or a <= 449 then
                Mon = "Fishman Commando"
                Qdata = 2;
                Qname = "FishmanQuest"
                NameMon = "Fishman Commando"
                PosQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                PosM = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif a == 450 or a <= 474 then
                Mon = "God's Guard"
                Qdata = 1;
                Qname = "SkyExp1Quest"
                NameMon = "God's Guard"
                PosQ = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
                PosM = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end
            elseif a == 475 or a <= 524 then
                Mon = "Shanda"
                Qdata = 2;
                Qname = "SkyExp1Quest"
                NameMon = "Shanda"
                PosQ = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
                PosM = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                end
			elseif a == 525 or a <= 549 then
				Mon = "Royal Squad"
				Qdata = 1;
				Qname = "SkyExp2Quest"
				NameMon = "Royal Squad"
				PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
			elseif a == 550 or a <= 624 then
				Mon = "Royal Soldier"
				Qdata = 2;
				Qname = "SkyExp2Quest"
				NameMon = "Royal Soldier"
				PosQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
			elseif a == 625 or a <= 649 then
				Mon = "Galley Pirate"
				Qdata = 1;
				Qname = "FountainQuest"
				NameMon = "Galley Pirate"
				PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
				PosM = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
			elseif a >= 650 then
				Mon = "Galley Captain"
				Qdata = 2;
				Qname = "FountainQuest"
				NameMon = "Galley Captain"
				PosQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
				PosM = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
			end
		elseif World2 then
			if a == 700 or a <= 724 then
				Mon = "Raider"
				Qdata = 1;
				Qname = "Area1Quest"
				NameMon = "Raider"
				PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
				PosM = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
			elseif a == 725 or a <= 774 then
				Mon = "Mercenary"
				Qdata = 2;
				Qname = "Area1Quest"
				NameMon = "Mercenary"
				PosQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
				PosM = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
			elseif a == 775 or a <= 799 then
				Mon = "Swan Pirate"
				Qdata = 1;
				Qname = "Area2Quest"
				NameMon = "Swan Pirate"
				PosQ = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
				PosM = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
			elseif a == 800 or a <= 874 then
				Mon = "Factory Staff"
				Qname = "Area2Quest"
				Qdata = 2;
				NameMon = "Factory Staff"
				PosQ = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
				PosM = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
			elseif a == 875 or a <= 899 then
				Mon = "Marine Lieutenant"
				Qdata = 1;
				Qname = "MarineQuest3"
				NameMon = "Marine Lieutenant"
				PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
				PosM = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
			elseif a == 900 or a <= 949 then
				Mon = "Marine Captain"
				Qdata = 2;
				Qname = "MarineQuest3"
				NameMon = "Marine Captain"
				PosQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
				PosM = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
			elseif a == 950 or a <= 974 then
				Mon = "Zombie"
				Qdata = 1;
				Qname = "ZombieQuest"
				NameMon = "Zombie"
				PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
				PosM = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
			elseif a == 975 or a <= 999 then
				Mon = "Vampire"
				Qdata = 2;
				Qname = "ZombieQuest"
				NameMon = "Vampire"
				PosQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
				PosM = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
			elseif a == 1000 or a <= 1049 then
				Mon = "Snow Trooper"
				Qdata = 1;
				Qname = "SnowMountainQuest"
				NameMon = "Snow Trooper"
				PosQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
				PosM = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
			elseif a == 1050 or a <= 1099 then
				Mon = "Winter Warrior"
				Qdata = 2;
				Qname = "SnowMountainQuest"
				NameMon = "Winter Warrior"
				PosQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
				PosM = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
			elseif a == 1100 or a <= 1124 then
				Mon = "Lab Subordinate"
				Qdata = 1;
				Qname = "IceSideQuest"
				NameMon = "Lab Subordinate"
				PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
				PosM = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
			elseif a == 1125 or a <= 1174 then
				Mon = "Horned Warrior"
				Qdata = 2;
				Qname = "IceSideQuest"
				NameMon = "Horned Warrior"
				PosQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
				PosM = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
			elseif a == 1175 or a <= 1199 then
				Mon = "Magma Ninja"
				Qdata = 1;
				Qname = "FireSideQuest"
				NameMon = "Magma Ninja"
				PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
				PosM = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
			elseif a == 1200 or a <= 1249 then
				Mon = "Lava Pirate"
				Qdata = 2;
				Qname = "FireSideQuest"
				NameMon = "Lava Pirate"
				PosQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
				PosM = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
			elseif a == 1250 or a <= 1274 then
				Mon = "Ship Deckhand"
				Qdata = 1;
				Qname = "ShipQuest1"
				NameMon = "Ship Deckhand"
				PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
				PosM = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
			elseif a == 1275 or a <= 1299 then
				Mon = "Ship Engineer"
				Qdata = 2;
				Qname = "ShipQuest1"
				NameMon = "Ship Engineer"
				PosQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
				PosM = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
			elseif a == 1300 or a <= 1324 then
				Mon = "Ship Steward"
				Qdata = 1;
				Qname = "ShipQuest2"
				NameMon = "Ship Steward"
				PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
				PosM = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
			elseif a == 1325 or a <= 1349 then
				Mon = "Ship Officer"
				Qdata = 2;
				Qname = "ShipQuest2"
				NameMon = "Ship Officer"
				PosQ = CFrame.new(968.80957, 125.092171, 33244.125)
				PosM = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
			elseif a == 1350 or a <= 1374 then
				Mon = "Arctic Warrior"
				Qdata = 1;
				Qname = "FrostQuest"
				NameMon = "Arctic Warrior"
				PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
				PosM = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
                if (getgenv().AutoFarmLevelEnabled) and (PosQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    BTP(PosM)
                end
			elseif a == 1375 or a <= 1424 then
				Mon = "Snow Lurker"
				Qdata = 2;
				Qname = "FrostQuest"
				NameMon = "Snow Lurker"
				PosQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
				PosM = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
			elseif a == 1425 or a <= 1449 then
				Mon = "Sea Soldier"
				Qdata = 1;
				Qname = "ForgottenQuest"
				NameMon = "Sea Soldier"
				PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
				PosM = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
			elseif a >= 1450 then
				Mon = "Water Fighter"
				Qdata = 2;
				Qname = "ForgottenQuest"
				NameMon = "Water Fighter"
				PosQ = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
				PosM = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
			end
		elseif World3 then
			if a == 1500 or a <= 1524 then
				Mon = "Pirate Millionaire"
				Qdata = 1;
				Qname = "PiratePortQuest"
				NameMon = "Pirate Millionaire"
				PosQ = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625)
				PosM = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625)
			elseif a == 1525 or a <= 1574 then
				Mon = "Pistol Billionaire"
				Qdata = 2;
				Qname = "PiratePortQuest"
				NameMon = "Pistol Billionaire"
				PosQ = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625)
				PosM = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625)
			elseif a == 1575 or a <= 1599 then
				Mon = "Dragon Crew Warrior"
				Qdata = 1;
				Qname = "AmazonQuest"
				NameMon = "Dragon Crew Warrior"
				PosQ = CFrame.new(6779.03271484375, 111.16865539550781, -801.2130737304688)
				PosM = CFrame.new(6779.03271484375, 111.16865539550781, -801.2130737304688)
			elseif a == 1600 or a <= 1624 then
				Mon = "Dragon Crew Archer"
				Qname = "AmazonQuest"
				Qdata = 2;
				NameMon = "Dragon Crew Archer"
				PosQ = CFrame.new(6955.8974609375, 546.6658935546875, 309.0401306152344)
				PosM = CFrame.new(6955.8974609375, 546.6658935546875, 309.0401306152344)
			elseif a == 1625 or a <= 1649 then
				Mon = "Hydra Enforcer"
				Qname = "VenomCrewQuest"
				Qdata = 1;
				NameMon = "Hydra Enforcer"
				PosQ = CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219)
				PosM = CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219)
			elseif a == 1650 or a <= 1699 then
				Mon = "Venomous Assailant"
				Qname = "VenomCrewQuest"
				Qdata = 2;
				NameMon = "Venomous Assailant"
				PosQ = CFrame.new(4697.5918, 1100.65137, 946.401978, 0.579397917, -4.19689783e-10, 0.81504482, -1.49287818e-10, 1, 6.21053986e-10, -0.81504482, -4.81513662e-10, 0.579397917)
				PosM = CFrame.new(4697.5918, 1100.65137, 946.401978, 0.579397917, -4.19689783e-10, 0.81504482, -1.49287818e-10, 1, 6.21053986e-10, -0.81504482, -4.81513662e-10, 0.579397917)
			elseif a == 1700 or a <= 1724 then
				Mon = "Marine Commodore"
				Qdata = 1;
				Qname = "MarineTreeIsland"
				NameMon = "Marine Commodore"
				PosQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
				PosM = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
			elseif a == 1725 or a <= 1774 then
				Mon = "Marine Rear Admiral"
				NameMon = "Marine Rear Admiral"
				Qname = "MarineTreeIsland"
				Qdata = 2;
				PosQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
				PosM = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
			elseif a == 1775 or a <= 1799 then
				Mon = "Fishman Raider"
				Qdata = 1;
				Qname = "DeepForestIsland3"
				NameMon = "Fishman Raider"
				PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
				PosM = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
			elseif a == 1800 or a <= 1824 then
				Mon = "Fishman Captain"
				Qdata = 2;
				Qname = "DeepForestIsland3"
				NameMon = "Fishman Captain"
				PosQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
				PosM = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625)
			elseif a == 1825 or a <= 1849 then
				Mon = "Forest Pirate"
				Qdata = 1;
				Qname = "DeepForestIsland"
				NameMon = "Forest Pirate"
				PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
				PosM = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
			elseif a == 1850 or a <= 1899 then
				Mon = "Mythological Pirate"
				Qdata = 2;
				Qname = "DeepForestIsland"
				NameMon = "Mythological Pirate"
				PosQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
				PosM = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
			elseif a == 1900 or a <= 1924 then
				Mon = "Jungle Pirate"
				Qdata = 1;
				Qname = "DeepForestIsland2"
				NameMon = "Jungle Pirate"
				PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
				PosM = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
			elseif a == 1925 or a <= 1974 then
				Mon = "Musketeer Pirate"
				Qdata = 2;
				Qname = "DeepForestIsland2"
				NameMon = "Musketeer Pirate"
				PosQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
				PosM = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
			elseif a == 1975 or a <= 1999 then
				Mon = "Reborn Skeleton"
				Qdata = 1;
				Qname = "HauntedQuest1"
				NameMon = "Reborn Skeleton"
				PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				PosM = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
			elseif a == 2000 or a <= 2024 then
				Mon = "Living Zombie"
				Qdata = 2;
				Qname = "HauntedQuest1"
				NameMon = "Living Zombie"
				PosQ = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				PosM = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
			elseif a == 2025 or a <= 2049 then
				Mon = "Demonic Soul"
				Qdata = 1;
				Qname = "HauntedQuest2"
				NameMon = "Demonic Soul"
				PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
			elseif a == 2050 or a <= 2074 then
				Mon = "Posessed Mummy"
				Qdata = 2;
				Qname = "HauntedQuest2"
				NameMon = "Posessed Mummy"
				PosQ = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
			elseif a == 2075 or a <= 2099 then
				Mon = "Peanut Scout"
				Qdata = 1;
				Qname = "NutsIslandQuest"
				NameMon = "Peanut Scout"
				PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
			elseif a == 2100 or a <= 2124 then
				Mon = "Peanut President"
				Qdata = 2;
				Qname = "NutsIslandQuest"
				NameMon = "Peanut President"
				PosQ = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
			elseif a == 2125 or a <= 2149 then
				Mon = "Ice Cream Chef"
				Qdata = 1;
				Qname = "IceCreamIslandQuest"
				NameMon = "Ice Cream Chef"
				PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
			elseif a == 2150 or a <= 2199 then
				Mon = "Ice Cream Commander"
				Qdata = 2;
				Qname = "IceCreamIslandQuest"
				NameMon = "Ice Cream Commander"
				PosQ = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				PosM = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
			elseif a == 2200 or a <= 2224 then
				Mon = "Cookie Crafter"
				Qdata = 1;
				Qname = "CakeQuest1"
				NameMon = "Cookie Crafter"
				PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
				PosM = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
			elseif a == 2225 or a <= 2249 then
				Mon = "Cake Guard"
				Qdata = 2;
				Qname = "CakeQuest1"
				NameMon = "Cake Guard"
				PosQ = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
				PosM = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
			elseif a == 2250 or a <= 2274 then
				Mon = "Baking Staff"
				Qdata = 1;
				Qname = "CakeQuest2"
				NameMon = "Baking Staff"
				PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
				PosM = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
			elseif a == 2275 or a <= 2299 then
				Mon = "Head Baker"
				Qdata = 2;
				Qname = "CakeQuest2"
				NameMon = "Head Baker"
				PosQ = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
				PosM = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
			elseif a == 2300 or a <= 2324 then
				Mon = "Cocoa Warrior"
				Qdata = 1;
				Qname = "ChocQuest1"
				NameMon = "Cocoa Warrior"
				PosQ = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
				PosM = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
			elseif a == 2325 or a <= 2349 then
				Mon = "Chocolate Bar Battler"
				Qdata = 2;
				Qname = "ChocQuest1"
				NameMon = "Chocolate Bar Battler"
				PosQ = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
				PosM = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
			elseif a == 2350 or a <= 2374 then
				Mon = "Sweet Thief"
				Qdata = 1;
				Qname = "ChocQuest2"
				NameMon = "Sweet Thief"
				PosQ = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
				PosM = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
			elseif a == 2375 or a <= 2399 then
				Mon = "Candy Rebel"
				Qdata = 2;
				Qname = "ChocQuest2"
				NameMon = "Candy Rebel"
				PosQ = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
				PosM = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
			elseif a == 2400 or a <= 2449 then
				Mon = "Candy Pirate"
				Qdata = 1;
				Qname = "CandyQuest1"
				NameMon = "Candy Pirate"
				PosQ = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
				PosM = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
			elseif a == 2450 or a <= 2474 then
				Mon = "Isle Outlaw"
				Qdata = 1;
				Qname = "TikiQuest1"
				NameMon = "Isle Outlaw"
				PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
				PosM = CFrame.new(-16479.900390625, 226.6117401123047, -300.3114318847656)
			elseif a == 2475 or a <= 2499 then
				Mon = "Island Boy"
				Qdata = 2;
				Qname = "TikiQuest1"
				NameMon = "Island Boy"
				PosQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
				PosM = CFrame.new(-16849.396484375, 192.86505126953125, -150.7853240966797)
			elseif a == 2500 or a <= 2524 then
				Mon = "Sun-kissed Warrior"
				Qdata = 1;
				Qname = "TikiQuest2"
				NameMon = "Sun-kissed Warrior"
				PosM = CFrame.new(-16347, 64, 984)
				PosQ = CFrame.new(-16538, 55, 1049)
			elseif a == 2525 or a <= 2550 then
				Mon = "Isle Champion"
				Qdata = 2;
				Qname = "TikiQuest2"
				NameMon = "Isle Champion"
				PosQ = CFrame.new(-16541.0215, 57.3082275, 1051.46118, 0.0410757065, -0, -0.999156058, 0, 1, -0, 0.999156058, 0, 0.0410757065)
				PosM = CFrame.new(-16602.1015625, 130.38734436035156, 1087.24560546875)-- Tiki Outpost
	-- TIKI OUTPOST
			elseif a >= 2551 and a <= 2574 then
				Mon = "Serpent Hunter"
				Qdata = 1;
				Qname = "TikiQuest3";
				NameMon = "Serpent Hunter"
				PosQ = CFrame.new(-16679.4785, 176.7473, 1474.3995)
				PosM = CFrame.new(-16679.4785, 176.7473, 1474.3995)
			elseif a >= 2575 and a <= 2599 then -- CH? T?I 2599, ?? 2600 chuy?n qua Submarine
				Mon = "Skull Slayer"
				Qdata = 2;
				Qname = "TikiQuest3";
				NameMon = "Skull Slayer"
				PosQ = CFrame.new(-16759.5898, 71.2837, 1595.3399)
				PosM = CFrame.new(-16759.5898, 71.2837, 1595.3399)

	-- SUBMARINE AREA (?闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰缂傚倷闄嶉崹铏光偓?m?c 2600 / 2625 / 2650 / 2675)
			elseif a >= 2600 and a <= 2624 then
				Mon = "Reef Bandit"
				Qdata = 1;
				Qname = "SubmergedQuest1";
				NameMon = "Reef Bandit"
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226) -- NPC Submerged
				PosM = CFrame.new(10736.6191, -2087.8439, 9338.4882)
			elseif a >= 2625 and a <= 2649 then
				Mon = "Coral Pirate"
				Qdata = 2;
				Qname = "SubmergedQuest1";
				NameMon = "Coral Pirate"
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226)
				PosM = CFrame.new(10965.1025, -2158.8842, 9177.2597)
			elseif a >= 2650 and a <= 2674 then
				Mon = "Sea Chanter"
				Qdata = 1;
				Qname = "SubmergedQuest2";
				NameMon = "Sea Chanter"
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226)
				PosM = CFrame.new(10621.0342, -2087.8440, 10102.0332)
			elseif a >= 2675 and a <= 2699 then
				Mon = "Ocean Prophet"
				Qdata = 2;
				Qname = "SubmergedQuest2";
				NameMon = "Ocean Prophet"
				PosQ = CFrame.new(10882.264, -2086.322, 10034.226)
				PosM = CFrame.new(11056.1445, -2001.6717, 10117.4493)
			elseif a >= 2700 and a <= 2724 then
				Mon = "High Disciple"
				Qdata = 1;
				Qname = "SubmergedQuest3";
				NameMon = "High Disciple"
				PosQ = CFrame.new(9636.52441, -1992.19507, 9609.52832)
				PosM = CFrame.new(9828.087890625, -1940.908935546875, 9693.0634765625)
			elseif a >= 2725 and a <= 2800 then
				Mon = "Grand Devotee"
				Qdata = 2;
				Qname = "SubmergedQuest3";
				NameMon = "Grand Devotee"
				PosQ = CFrame.new(9636.52441, -1992.19507, 9609.52832)
				PosM = CFrame.new(9557.5849609375, -1928.0404052734375, 9859.1826171875)
			end
		end
	end
MaterialMon=function()local a=game.Players.LocalPlayer;local b=a.Character and a.Character:FindFirstChild("HumanoidRootPart")if not b then return end;shouldRequestEntrance=function(c,d)local e=(b.Position-c).Magnitude;if e>=d then replicated.Remotes.CommF_:InvokeServer("requestEntrance",c)end end;if World1 then if SelectMaterial=="Angel Wings"then MMon={"Shanda","Royal Squad","Royal Soldier","Wysper","Thunder God"}MPos=CFrame.new(-4698,845,-1912)SP="Default"local c=Vector3.new(-4607.82275,872.54248,-1667.55688)shouldRequestEntrance(c,10000)elseif SelectMaterial=="Leather + Scrap Metal"then MMon={"Brute","Pirate"}MPos=CFrame.new(-1145,15,4350)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Military Soldier","Military Spy","Magma Admiral"}MPos=CFrame.new(-5815,84,8820)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Warrior","Fishman Commando","Fishman Lord"}MPos=CFrame.new(61123,19,1569)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,17000)end elseif World2 then if SelectMaterial=="Leather + Scrap Metal"then MMon={"Marine Captain"}MPos=CFrame.new(-2010.5059814453125,73.00115966796875,-3326.620849609375)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Magma Ninja","Lava Pirate"}MPos=CFrame.new(-5428,78,-5959)SP="Default"elseif SelectMaterial=="Ectoplasm"then MMon={"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer"}MPos=CFrame.new(911.35827636719,125.95812988281,33159.5390625)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,18000)elseif SelectMaterial=="Mystic Droplet"then MMon={"Water Fighter"}MPos=CFrame.new(-3385,239,-10542)SP="Default"elseif SelectMaterial=="Radioactive Material"then MMon={"Factory Staff"}MPos=CFrame.new(295,73,-56)SP="Default"elseif SelectMaterial=="Vampire Fang"then MMon={"Vampire"}MPos=CFrame.new(-6033,7,-1317)SP="Default"end elseif World3 then if SelectMaterial=="Scrap Metal"then MMon={"Jungle Pirate","Forest Pirate"}MPos=CFrame.new(-11975.78515625,331.7734069824219,-10620.0302734375)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Raider","Fishman Captain"}MPos=CFrame.new(-10993,332,-8940)SP="Default"elseif SelectMaterial=="Conjured Cocoa"then MMon={"Chocolate Bar Battler","Cocoa Warrior"}MPos=CFrame.new(620.6344604492188,78.93644714355469,-12581.369140625)SP="Default"elseif SelectMaterial=="Dragon Scale"then MMon={"Dragon Crew Archer","Dragon Crew Warrior"}MPos=CFrame.new(6594,383,139)SP="Default"elseif SelectMaterial=="Gunpowder"then MMon={"Pistol Billionaire"}MPos=CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)SP="Default"elseif SelectMaterial=="Mini Tusk"then MMon={"Mythological Pirate"}MPos=CFrame.new(-13545,470,-6917)SP="Default"elseif SelectMaterial=="Demonic Wisp"then MMon={"Demonic Soul"}MPos=CFrame.new(-9495.6806640625,453.58624267578125,5977.3486328125)SP="Default"end end end
QuestNeta = function()
  local Neta = QuestCheck()
  return {
    [1] = Mon,
    [2] = Qdata,
    [3] = Qname,
    [4] = PosM,
    [5] = NameMon,
    [6] = PosQ
  }
end


local ui = loadstring(game:HttpGet("https://tpbxkwwquvwtnmozgiik.supabase.co/functions/v1/raw/Luongdaynetroi/okokoko/refs/head/main.lua"))()

local Window = ui:MakeWindow({
    Title = "Dac Cau Hub V3",
    SubTitle = "made by DucLuong KeoCon",
    SaveFolder = "DC_UI_Config.json",
})
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://79166213730651", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) }
})
local Tabs = {
    Info = Window:MakeTab({ Title = "Status Game", Icon = "rbxassetid://6026568227" }),
    Main = Window:MakeTab({ Title = "Tab General", Icon = "home" }),
    Settings = Window:MakeTab({ Title = "Tab Setting", Icon = "rbxassetid://10734950309" }),
    Fish = Window:MakeTab({ Title = "Tab Fishing", Icon = "rbxassetid://127664059821666" }),
    Quests = Window:MakeTab({ Title = "Tab Stack Farm", Icon = "" }),
    SeaEvent = Window:MakeTab({ Title = "Tab Sea Events", Icon = "rbxassetid://6035078898" }),
    Mirage = Window:MakeTab({ Title = "Tab Mirage", Icon = "rbxassetid://11162889532" }),
    Race = Window:MakeTab({ Title = "Tab Upgrade Race", Icon = "rbxassetid://10709818847" }),
    Drago = Window:MakeTab({ Title = "Tab Dragon Dojo", Icon = "landmark" }),
    Prehistoric = Window:MakeTab({ Title = "Tab Prehistoric", Icon = "landmark" }),
    Raids = Window:MakeTab({ Title = "Tab Fruit And Raid", Icon = "rbxassetid://11155986081" }),
    Travel = Window:MakeTab({ Title = "Tab Teleport", Icon = "locatefixed" }),
    Shop = Window:MakeTab({ Title = "Tab Shopping", Icon = "rbxassetid://6031265983" }),
    Misc = Window:MakeTab({ Title = "Tab Miscellaneous", Icon = "list" }),
    PVP = Window:MakeTab({ Title = "Tab PVP", Icon = "swords" }),
    Dungeon = Window:MakeTab({ Title = "Tab Dungeon", Icon = "map" })
}

Tabs.Info:AddSection("Information")

ScriptStatus = Tabs.Info:AddParagraph({
    Title = "Release Date:04/30/2026",
    Content = "04/30/2026"
})
Tabs.Info:AddSection("Status Server")

Time = Tabs.Info:AddParagraph({
    Title = "Time Zone",
    Content = ""
})
function UpdateOS()
    local date = os.date("*t")
    local hour = (date.hour) % 24
    local ampm = hour < 12 and "AM" or "PM"
    local timezone = string.format("%02i:%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, date.sec, ampm)
    local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)    
    local LocalizationService = game:GetService("LocalizationService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local name = player.Name
    local result, code    
    if not getgenv().countryRegionCode then
        result, code = pcall(function()
            return LocalizationService:GetCountryRegionForPlayerAsync(player)
        end)
        if result then
            getgenv().countryRegionCode = code
        else
            getgenv().countryRegionCode = "Unknown"
        end
    else
        code = getgenv().countryRegionCode
    end
    Time:SetDesc(datetime.." - "..timezone.." [ " .. code .. " ]")
end
spawn(function()
    while true do
        UpdateOS()
        wait(1)
    end
end)
Timmessss = Tabs.Info:AddParagraph({
    Title = "Time",
    Content = ""
})
function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
    local Hour = math.floor(GameTime / (60^2)) % 24
    local Minute = math.floor(GameTime / (60^1)) % 60
    local Second = math.floor(GameTime / (60^0)) % 60
    Timmessss:SetDesc(Hour.." Hour (h) "..Minute.." Minute (m) "..Second.." Second (s) ")
end
spawn(function()
    while true do
        UpdateTime()
        wait(1)
    end
end)
Miragecheck = Tabs.Info:AddParagraph({
    Title = "Mirage Island",
    Content = "Status: "
})
local previousStatus = ""
spawn(function()
    pcall(function()
        while true do
            wait(1)            
            local mirageIslandExists = game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') ~= nil
            local currentStatus = mirageIslandExists and '??' or '??'
            if currentStatus ~= previousStatus then
                Miragecheck:SetDesc('Status: ' .. currentStatus)
                previousStatus = currentStatus
            end
        end
    end)
end)
Kitsunecheck = Tabs.Info:AddParagraph({
    Title = "Kitsune Island",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while task.wait(1) do
        local currentStatus = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and '??' or '??'
        if currentStatus ~= previousStatus then
            Kitsunecheck:SetDesc('Status: ' .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
CPrehistoriccheck = Tabs.Info:AddParagraph({
    Title = "Prehistoric Island",
    Desc = "Status: "
})
task.spawn(function()
    local previousStatus = ""
    while task.wait(1) do
        local currentStatus = game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and '??' or '??'
        if currentStatus ~= previousStatus then
            CPrehistoriccheck:SetDesc("Status: " .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
FrozenIsland = Tabs.Info:AddParagraph({
    Title = "Frozen Dimension",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') and '??' or '??'
        if currentStatus ~= previousStatus then
            FrozenIsland:SetDesc('Status: ' .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
MobCakePrince = Tabs.Info:AddParagraph({
    Title = "Dimension Killed",
    Content = ""
})
spawn(function()
    while wait(1) do
        local cakePrince = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
        local killStatus = "Cake Prince: ??"
        if string.len(cakePrince) >= 86 then
            local killCount = string.sub(cakePrince, 39, 41)
            killStatus = "Kill: " .. killCount
        end
        MobCakePrince:SetDesc(killStatus)
    end
end)
CheckRip = Tabs.Info:AddParagraph({
    Title = "Rip_Indra",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and '??' or '??'
        if currentStatus ~= previousStatus then
            CheckRip:SetDesc("Status: " .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
CheckDoughKing = Tabs.Info:AddParagraph({
    Title = "Dough King",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") and '??' or '??'
        if currentStatus ~= previousStatus then
            CheckDoughKing:SetDesc("Status: " .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
EliteHunter = Tabs.Info:AddParagraph({
    Title = "Elite Hunter",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) and '??' or '??'
        local progress = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")
        if currentStatus ~= previousStatus then
            if EliteHunter and EliteHunter.SetDesc then
                EliteHunter:SetDesc("Status: " .. tostring(currentStatus) .. " | Killed: " .. tostring(progress or 0))
            end
            previousStatus = currentStatus
        end
    end
end)
FM = Tabs.Info:AddParagraph({
    Title = "Full Moon",
    Content = ""
})
task.spawn(function()
    while task.wait(1) do
        local moonTextureId = game:GetService("Lighting").Sky.MoonTextureId
        local moonStatus = "Moon: 0/5"
        if moonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
            moonStatus = "Moon: 5/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
            moonStatus = "Moon: 4/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
            moonStatus = "Moon: 3/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
            moonStatus = "Moon: 2/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
            moonStatus = "Moon: 1/5"
        end
        FM:SetDesc(moonStatus)
    end
end)
LegendarySword = Tabs.Info:AddParagraph({
    Title = "Legendary Sword",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local swordStatus = "Not Found Legend Swords"
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
            swordStatus = "Shisui"
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2") then
            swordStatus = "Wando"
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3") then
            swordStatus = "Saddi"
        end
        LegendarySword:SetDesc(swordStatus)
    end
end)
StatusBone = Tabs.Info:AddParagraph({
    Title = "Bone",
    Content = ""
})
spawn(function()
    while wait(1) do
        if StatusBone and StatusBone.SetDesc then
            local bones = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
            StatusBone:SetDesc("You Have: " .. tostring(bones or 0) .. " Bones")
        end
    end
end)

WeaponDropdown = Tabs.Main:AddDropdown({
    Name = "Select Weapon",
    Options = {"Melee","Sword","Blox Fruit","Gun"},
    Default = "Melee",
    Callback = function(Value)
    _G.ChooseWP = Value
end})


spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if _G.ChooseWP == "Melee" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Sword" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Gun" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Blox Fruit" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        _G.SelectWeapon = v.Name
                    end
                end
            end
        end)
    end
end)




AttackDropdown = Tabs.Main:AddDropdown({
    Name = "Select Fast Delay",
    Options = {"Normal Attack","Fast Attack","Super Fast Attack","Dac Cau Attack"},
    Default = "Fast Attack",
    Callback = function(Value)
    _G.FastAttackGravity_Mode = Value
end})


local DelayConfig = {
    ["Normal Attack"] = 0.25,
    ["Fast Attack"] = 0.15,
    ["Super Fast Attack"] = 0.05,
    ["Dac Cau Attack"] = 0.1
}

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.FastAttackGravity_Mode and DelayConfig[_G.FastAttackGravity_Mode] then
                _G.Fast_Delay = DelayConfig[_G.FastAttackGravity_Mode]
            end
        end)
    end
end)

-- Super Fast / Dac Cau Attack (multi-target hit)
do
    local Net = replicated:WaitForChild("Modules"):WaitForChild("Net")
    local RH = Net:WaitForChild("RE/RegisterHit")
    local RA = Net:WaitForChild("RE/RegisterAttack")

    local SendHit
    pcall(function()
        local ls = plr.PlayerScripts:FindFirstChildOfClass("LocalScript") or plr.PlayerScripts:WaitForChildOfClass("LocalScript")
        local env = ls and getsenv(ls)
        SendHit = env and env._G and env._G.SendHitsToServer
    end)

    local FastHitParts = {"Head","HumanoidRootPart","LeftHand","RightHand","LeftLowerArm","RightLowerArm"}
    local function PickPart(m)
        if not m then return nil end
        local name = FastHitParts[math.random(1, #FastHitParts)]
        return m:FindFirstChild(name) or m:FindFirstChild("HumanoidRootPart")
    end

    local function Alive(m)
        local h = m and m:FindFirstChild("Humanoid")
        local r = m and m:FindFirstChild("HumanoidRootPart")
        return h and r and h.Health > 0
    end

    local function CollectTargets(radius, maxTargets)
        local c = plr.Character
        if not c or not c:FindFirstChild("HumanoidRootPart") then return {} end
        local hrp = c.HumanoidRootPart
        local list = {}
        for _, v in pairs(workspace.Enemies:GetChildren()) do
            if Alive(v) then
                local dist = (v.HumanoidRootPart.Position - hrp.Position).Magnitude
                if dist <= radius then
                    list[#list + 1] = {v, dist}
                end
            end
        end
        for _, v in pairs(workspace.Characters:GetChildren()) do
            if v ~= c and Alive(v) then
                local dist = (v.HumanoidRootPart.Position - hrp.Position).Magnitude
                if dist <= radius then
                    list[#list + 1] = {v, dist}
                end
            end
        end
        table.sort(list, function(a, b) return a[2] < b[2] end)
        local out = {}
        for i = 1, math.min(#list, maxTargets) do
            out[#out + 1] = list[i][1]
        end
        return out
    end

    local RadiusConfig = {
        ["Super Fast Attack"] = 160,
        ["Dac Cau Attack"] = 200
    }
    local DelayConfig2 = {
        ["Super Fast Attack"] = 0.03,
        ["Dac Cau Attack"] = 0.02
    }
    local MaxTargets = 4

    task.spawn(function()
        while task.wait(0.01) do
            if not _G.Seriality then continue end
            local mode = _G.FastAttackGravity_Mode
            if mode ~= "Super Fast Attack" and mode ~= "Dac Cau Attack" then
                task.wait(0.05)
                continue
            end
            local radius = RadiusConfig[mode] or 160
            local delay = DelayConfig2[mode] or 0.03
            local targets = CollectTargets(radius, MaxTargets)
            if #targets > 0 then
                local firstPart
                local pairs = {}
                for _, m in ipairs(targets) do
                    local part = PickPart(m) or m.HumanoidRootPart
                    firstPart = firstPart or part
                    pairs[#pairs + 1] = {m, part}
                end
                if firstPart then
                    RA:FireServer(0)
                    if SendHit then
                        SendHit(firstPart, pairs)
                    else
                        RH:FireServer(firstPart, pairs)
                    end
                end
            end
            task.wait(delay)
        end
    end)
end


local AutoFarmChest = false
local ChestFarmMode = "Tween" -- Teleport | Tween
local ChestTpCooldown = 0.16
local LastChestTp = 0
local ChestTweenBusy = false
Tabs.Main:AddToggle({
    Name = "Auto Farm Chest",
    Description = "",
    Default = false,
    Callback = function(Value)
        AutoFarmChest = Value
    end
})

Tabs.Main:AddDropdown({
    Name = "Chest Farm Mode",
    Options = {"Teleport", "Tween"},
    Default = "Tween",
    Callback = function(Value)
        ChestFarmMode = Value
    end
})


local function isValidChest(v)
    return v
        and v.Parent
        and v:IsA("BasePart")
        and v.Name:find("Chest")
        and v:FindFirstChild("TouchInterest")
end

local function getChestsSorted()
    local char = plr.Character
    local RootPart = char and char:FindFirstChild("HumanoidRootPart")
    if not RootPart then return {} end

    local Chests = {}
    local rootPos = RootPart.Position

    for _, v in pairs(workspace:GetDescendants()) do
        if isValidChest(v) then
            table.insert(Chests, v)
        end
    end

    table.sort(Chests, function(a, b)
        return (rootPos - a.Position).Magnitude < (rootPos - b.Position).Magnitude
    end)

    return Chests
end

local function ChestMoveTween(goal)
    if ChestTweenBusy then return false end
    ChestTweenBusy = true
    local ok = false

    local char = plr.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        ChestTweenBusy = false
        return false
    end

    local startPos = hrp.Position
    local targetPos = (goal + Vector3.new(0, 3, 0)).Position
    local flatTarget = Vector3.new(targetPos.X, startPos.Y, targetPos.Z)
    local dist = (flatTarget - startPos).Magnitude

    if dist < 6 then
        hrp.CFrame = CFrame.new(targetPos)
        ChestTweenBusy = false
        return true
    end

    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    local speed = 300
    local duration = math.max(dist / speed, 0.18)
    local temp = Instance.new("Part")
    temp.Name = "ChestTweenPart"
    temp.Anchored = true
    temp.CanCollide = false
    temp.Transparency = 1
    temp.Size = Vector3.new(1,1,1)
    temp.CFrame = CFrame.new(startPos)
    temp.Parent = workspace

    local tw = game:GetService("TweenService"):Create(temp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(flatTarget)})
    tw:Play()

    local t0 = tick()
    while tw.PlaybackState == Enum.PlaybackState.Playing and tick() - t0 <= duration + 0.35 do
        task.wait()
        if plr.Character ~= char or not hrp.Parent then break end
        local p = temp.Position
        hrp.CFrame = CFrame.new(p.X, startPos.Y, p.Z)
    end

    if temp then temp:Destroy() end
    if plr.Character == char and hrp.Parent then
        hrp.CFrame = CFrame.new(targetPos)
        task.wait(0.04)
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        ok = true
    end

    ChestTweenBusy = false
    return ok
end

local function TP(Goal)
    local char = plr.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end

    hrp.CFrame = Goal + Vector3.new(0, 3, 0)

    task.wait(0.08)
    if plr.Character == char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = true
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.12) do
        if AutoFarmChest then
            local now = tick()
            if now - LastChestTp >= ChestTpCooldown then
                pcall(function()
                    local Chests = getChestsSorted()
                    local firstChest = Chests[1]
                    if firstChest then
                        if ChestFarmMode == "Tween" then if ChestMoveTween(firstChest.CFrame) then task.wait(0.08) end else TP(firstChest.CFrame) end
                        LastChestTp = now
                    end
                end)
            end
        end
    end
end)

Tabs.Main:AddSection({"Farming"})

local function ResetFarmLevelState()
    alreadyTeleported = false
    teleporting = false
end

local function FarmMove(cf)
    if not cf then return end
    _tp(cf)
end

local function FarmKill(model)
    if not (model and model:FindFirstChild("HumanoidRootPart") and model:FindFirstChild("Humanoid")) then return end
    Attack.Kill(model, AutoFarmLevelEnabled)
end

local function FindEnemyInWorld(nameOrList)
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    for _, v in pairs(enemies:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local match = false
            if typeof(nameOrList) == "table" then
                match = table.find(nameOrList, v.Name) ~= nil
            else
                match = v.Name == nameOrList
            end
            if match and v:FindFirstChild("HumanoidRootPart") then
                return v
            end
        end
    end
    return nil
end

local function RequestEntrance(pos)
    if not pos then return end
    local remotes = replicated and replicated:FindFirstChild("Remotes")
    local comm = remotes and remotes:FindFirstChild("CommF_")
    if comm then
        pcall(function()
            comm:InvokeServer("requestEntrance", pos)
        end)
    end
end

local function MaybeRequestEntrance(q, rootPos)
    if not q or not q[3] or not q[6] or not rootPos then return end
    if (q[6].Position - rootPos).Magnitude <= 10000 then return end
    -- Fishman Island entrance
    if q[3] == "FishmanQuest" then
        RequestEntrance(Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        return
    end
    -- Sky Islands entrance
    if q[3] == "SkyExp1Quest" then
        if q[5] == "God's Guard" then
            RequestEntrance(Vector3.new(-4607.82275, 872.54248, -1667.55688))
        else
            RequestEntrance(Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
        end
        return
    end
    if q[3] == "SkyExp2Quest" then
        RequestEntrance(Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
    end
end

local AutoFarmLevelEnabled = false
FarmLevel = Tabs.Main:AddToggle({
    Name = "Auto Farm Level",
    Description = "",
    Default = false,
    Callback = function(Value)
        AutoFarmLevelEnabled = Value
        _G.Level = Value
        getgenv().AutoFarmLevelEnabled = Value
        _G.AutoFarmLevelEnabled = Value
        ResetFarmLevelState()
    end
})

local alreadyTeleported = false
local teleporting = false
local nextSubmergeAttempt = 0


local function IsInSubmergedIsland()
    local char = plr.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local islandXZ = Vector3.new(11520.8017578125, 0, 9829.513671875)
    local playerXZ = Vector3.new(hrp.Position.X, 0, hrp.Position.Z)
    return (playerXZ - islandXZ).Magnitude < 2000
end


plr.CharacterAdded:Connect(function()
    if _G.Level then
        ResetFarmLevelState()
    end
end)

task.spawn(function()
    while task.wait(Sec) do
        if AutoFarmLevelEnabled then
            if IsCollectingEggs then task.wait(1) end
            pcall(function()
                local char = plr.Character or plr.CharacterAdded:Wait()
                local Root = char:WaitForChild("HumanoidRootPart")

                local level = GetFarmLevelBySea()
                if not level then return end
                local inSub = IsInSubmergedIsland()
                if inSub then
                    alreadyTeleported = true
                elseif not teleporting then
                    alreadyTeleported = false
                end

                local mainGui = plr.PlayerGui:FindFirstChild("Main")
                local questUI = mainGui and mainGui:FindFirstChild("Quest")
                local QuestTitle = ""
                if questUI and questUI:FindFirstChild("Container") then
                    local titleObj = questUI.Container:FindFirstChild("QuestTitle")
                    QuestTitle = (titleObj and titleObj:FindFirstChild("Title") and titleObj.Title.Text) or ""
                end

                if World3 and level >= 2600 and not inSub and not teleporting and not alreadyTeleported then
                    teleporting = true
                    local npcPos = CFrame.new(-16269.1016, 29.5177539, 1372.3204)
                    repeat task.wait(Sec) _tp(npcPos) until not AutoFarmLevelEnabled or (Root.Position - npcPos.Position).Magnitude <= 5

                    task.wait(0.2)
                    if Remotes and Remotes.RFSubmarineWorkerSpeak then
                        pcall(function()
                            Remotes.RFSubmarineWorkerSpeak:InvokeServer("TravelToSubmergedIsland")
                        end)
                    end

                    local timeout = tick()
                    repeat task.wait(Sec) until IsInSubmergedIsland() or tick() - timeout > 8
                    alreadyTeleported = IsInSubmergedIsland()
                    teleporting = false
                end

                if inSub or level < 2600 then
                    alreadyTeleported = true
                    teleporting = false

                    local q = QuestNeta and QuestNeta() or nil
                    if not q or not q[1] or not q[3] or not q[4] or not q[6] then
                        QuestCheck()
                        if Mon and Qname and Qdata and PosQ and PosM then
                            q = {Mon, Qdata, Qname, PosM, NameMon, PosQ}
                        else
                            return
                        end
                    end

                    if q[5] and QuestTitle ~= "" and not string.find(QuestTitle, q[5]) then
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                    end

                    if not (questUI and questUI.Visible) then
                        local questPos = q[6]
                        if questPos then
                            _tp(questPos)
                        end
                        task.wait(0.1)
                        if questPos and (Root.Position - questPos.Position).Magnitude <= 5 then
                            pcall(function()
                                replicated.Remotes.CommF_:InvokeServer("StartQuest", q[3], q[2])
                            end)
                        end
                    else
                        local enemyName = q[1]
                        local foundEnemy = false
                        for _, v in pairs(workspace.Enemies:GetChildren()) do
                            if Attack.Alive(v) and v.Name == enemyName then
                                foundEnemy = true
                                repeat
                                    task.wait(Sec)
                                    _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                    Attack.Kill(v, AutoFarmLevelEnabled)
                                until not AutoFarmLevelEnabled or not v.Parent or v.Humanoid.Health <= 0 or not questUI.Visible
                            end
                        end
                        if not foundEnemy and q[4] then
                            _tp(q[4])
                        end
                    end
                end
            end)
        else
            ResetFarmLevelState()
        end
    end
end)

ClosetMons = Tabs.Main:AddToggle({
Name = "Auto Farm Gan Quai", 
Description = "", 
Default = false, 
Callback = function(Value)
  _G.AutoFarmNear = Value
end})
spawn(function()
  while wait() do
    pcall(function()
      if _G.AutoFarmNear then
        for i,v in pairs(workspace.Enemies:GetChildren()) do
          if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
            if v.Humanoid.Health > 0 then
              repeat wait() Attack.Kill(v,_G.AutoFarmNear) until not _G.AutoFarmNear or not v.Parent or v.Humanoid.Health <= 0
            end
          end
        end
      end
    end)
  end
end)
FactoryRaids = Tabs.Main:AddToggle({
Name = "Auto Danh Nha May", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoFactory = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoFactory then
        local v = GetConnectionEnemies("Core")
        if v then
          repeat wait()
            EquipWeapon(_G.SelectWeapon)
            _tp(CFrame.new(448.46756, 199.356781, -441.389252))
          until v.Humanoid.Health <= 0 or _G.AutoFactory == false
        else
          _tp(CFrame.new(448.46756, 199.356781, -441.389252))
        end
      end
    end)
  end
end)

CastleRaids = Tabs.Main:AddToggle({
Name = "Auto Pirate Raid", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoRaidCastle = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoRaidCastle then
      pcall(function()
      local CFrameCastleRaid = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
        if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - Root.Position).Magnitude <= 500 then
          for i,v in pairs(workspace.Enemies:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
              if v.Name then
                if (v.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000 then
                  repeat wait() Attack.Kill(v,_G.AutoRaidCastle) until not _G.AutoRaidCastle or not v.Parent or v.Humanoid.Health <= 0 or not workspace.Enemies:FindFirstChild(v.Name)
                end
              end
            end
          end
        else
          local Castle_Mob = {"Galley Pirate","Galley Captain","Raider","Mercenary","Vampire","Zombie","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
          for i = 1,#Castle_Mob do
            if replicated:FindFirstChild(Castle_Mob[i]) then
              for _,v in pairs(replicated:GetChildren()) do
                if table.find(Castle_Mob, v.Name) then _tp(CFrameCastleRaid) end
              end
            end
          end
        end
      end)
    end
  end
end)




Ecto = Tabs.Main:AddToggle({
Name = "Tu Dong Farm Ectoplasm", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoEctoplasm = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoEctoplasm then
        local EctoTable = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior"}    
        local v = GetConnectionEnemies(EctoTable)
		if Attack.Alive(v) then
		  repeat wait() Attack.Kill(v, _G.AutoEctoplasm)until not _G.AutoEctoplasm or not v.Parent or v.Humanoid.Health <= 0		        
	    else
	      replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
	    end
      end
    end)
  end
end)

Tabs.Main:AddSection({"Farm Elite Hunter"})

Process = Tabs.Main:AddParagraph({
Title = "Elites Process ",
Content = ""})
spawn(function()
  while wait(Sec) do
    pcall(function()    
      if Process and Process.SetDesc then
        local progress = replicated.Remotes.CommF_:InvokeServer("EliteHunter","Progress")
        Process:SetDesc("Elite Procress :  " .. tostring(progress or 0))
      end
    end)
  end
end)

EliteHunter = Tabs.Main:AddParagraph({
    Title = "Elite Spawn",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) and '??' or '??'
        local progress = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")
        if currentStatus ~= previousStatus then
            if EliteHunter and EliteHunter.SetDesc then
                EliteHunter:SetDesc("Status: " .. tostring(currentStatus) .. " | Killed: " .. tostring(progress or 0))
            end
            previousStatus = currentStatus
        end
    end
end)

EliteQ = Tabs.Main:AddToggle({
    Name = "Auto Farm Elite",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.FarmEliteHunt = Value
end})

spawn(function()
    while wait(1) do
        pcall(function()
            if _G.FarmEliteHunt then
                local questGui = plr.PlayerGui.Main.Quest
                local questTitle = questGui.Container.QuestTitle.Title.Text

                -- N?u ch?a c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?nhi?m v?
                if not questGui.Visible then
                    -- Nh?n nhi?m v? Elite
                    local result = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                    if result == nil or string.find(result, "Cooldown") then
                        -- N?u ?ang cooldown ho?c ch?a c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?boss
                        wait(10)
                        return
                    end
                    task.wait(1)
                else
                    -- ?? c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?nhi?m v? => x闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡???nh boss n闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?
                    local eliteName = nil
                    for _, name in pairs({"Diablo", "Urban", "Deandre"}) do
                        if string.find(questTitle, name) then
                            eliteName = name
                            break
                        end
                    end

                    if eliteName then
                        local boss = nil
                        -- T闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?boss trong Replicated ho?c Enemies
                        for _, v in pairs(replicated:GetChildren()) do
                            if v.Name == eliteName and v:FindFirstChild("HumanoidRootPart") then
                                boss = v
                                break
                            end
                        end
                        for _, v in pairs(Enemies:GetChildren()) do
                            if v.Name == eliteName and Attack.Alive(v) then
                                boss = v
                                break
                            end
                        end

                        if boss and boss:FindFirstChild("HumanoidRootPart") then
                            _tp(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            repeat
                                wait()
                                Attack.Kill(boss, _G.FarmEliteHunt)
                            until not _G.FarmEliteHunt or not boss.Parent or boss.Humanoid.Health <= 0 or not questGui.Visible
                        else
                            -- Kh?ng th?y boss 闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱???i boss spawn l?i
                            wait(5)
                        end
                    else
                        -- N?u quest title l?i ho?c bug 闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?b? quest
                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end
        end)
    end
end)

EliteH = Tabs.Main:AddToggle({
	Name = "Auto Farm Elite + Hop",
	Description = "",
	Default = false,
	Callback = function(Value)
	_G.FarmEliteH = Value
end})

-- === H闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?HOP SERVER ===
local function HopServer()
	local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"
	local PlaceID = game.PlaceId
	local Servers = {}
	local Cursor = ""
	local foundServer = false

	repeat
		local success, result = pcall(function()
			return game:HttpGet(Api .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. Cursor)
		end)
		if success and result then
			local data = Http:JSONDecode(result)
			if data.data then
				for _, v in pairs(data.data) do
					if v.playing < v.maxPlayers and v.id ~= game.JobId then
						foundServer = true
						TPS:TeleportToPlaceInstance(PlaceID, v.id)
						break
					end
				end
				Cursor = data.nextPageCursor or ""
			end
		end
	until not Cursor or foundServer
end

-- === FARM ELITE ===
spawn(function()
	while task.wait(1) do
		pcall(function()
			if _G.FarmEliteH then
				local questGui = plr.PlayerGui.Main.Quest
				local questTitle = questGui.Container.QuestTitle.Title.Text

				-- N?u ch?a c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?nhi?m v?
				if not questGui.Visible then
					local result = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
					if result == nil or string.find(result, "Cooldown") then
						-- N?u cooldown ho?c ch?a c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?boss 闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?hop
						HopServer()
						return
					end
					task.wait(1)

				else
					-- X闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡???nh boss Elite
					local eliteName = nil
					for _, name in pairs({"Diablo", "Urban", "Deandre"}) do
						if string.find(questTitle, name) then
							eliteName = name
							break
						end
					end

					if eliteName then
						local boss = nil
						for _, v in pairs(replicated:GetChildren()) do
							if v.Name == eliteName and v:FindFirstChild("HumanoidRootPart") then
								boss = v
								break
							end
						end
						for _, v in pairs(workspace.Enemies:GetChildren()) do
							if v.Name == eliteName and Attack.Alive(v) then
								boss = v
								break
							end
						end

						if boss and boss:FindFirstChild("HumanoidRootPart") then
							_tp(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
							repeat
								wait()
								Attack.Kill(boss, _G.FarmEliteH)
							until not _G.FarmEliteH or not boss.Parent or boss.Humanoid.Health <= 0 or not questGui.Visible
						else
							-- Kh?ng th?y boss sau v闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?giay 闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?hop server
							task.wait(5)
							HopServer()
						end
					else
						-- Quest l?i 闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?h?y v闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?hop lu?n
						replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
						task.wait(1)
						HopServer()
					end
				end
			end
		end)
	end
end)

Tabs.Main:AddSection({"Farming Cake"})
MobKilled = Tabs.Main:AddParagraph({
    Title = "Cake Princes :",
    Content = ""
})
spawn(function()
  while wait(.2) do
    pcall(function()
  	  local Killed = string.match(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"),"%d+")
      if Killed then
        MobKilled:SetDesc(" Killed : " ..(500 - Killed))
      end
    end)
  end
end)

-- Toggle 2: Auto Farm Cake Prince
Cake = Tabs.Main:AddToggle({
    Name = "Auto Farm Cake Prince",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.Auto_Cake_Prince = Value
end})

spawn(function()
    while task.wait() do
        -- Ch? farm Cake n?u Pirate kh?ng b?t
        if _G.Auto_Cake_Prince and not _G.AutoRaidCastle then
            pcall(function()
                local player = game.Players.LocalPlayer
                local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                local enemies = workspace.Enemies
                local bigMirror = workspace.Map:FindFirstChild("CakeLoaf") and workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
                if not root then return end

                -- N?u ch?a ??n ??o Cake, teleport xu?ng farm qu闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?
                if not workspace.Map:FindFirstChild("CakeLoaf") then
                    _tp(CFrame.new(-2077, 252, -12373))
                    task.wait(2)
                    return
                end

                if bigMirror and (bigMirror.Other.Transparency == 0 or enemies:FindFirstChild("Cake Prince")) then
                    -- Farm boss Cake Prince
                    local boss = GetConnectionEnemies("Cake Prince")
                    if boss then
                        repeat task.wait()
                            Attack.Kill2(boss, _G.Auto_Cake_Prince)
                        until not _G.Auto_Cake_Prince or not boss.Parent or boss.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-2151.82, 149.32, -12404.91))
                    end
                else
                    -- Farm qu闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?m? boss
                    local CakeMobs = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}
                    local mob = GetConnectionEnemies(CakeMobs)
                    if mob then
                        repeat task.wait()
                            Attack.Kill(mob, _G.Auto_Cake_Prince)
                        until not _G.Auto_Cake_Prince or not mob.Parent or mob.Humanoid.Health <= 0 or (bigMirror and bigMirror.Other.Transparency == 0)
                    else
                        _tp(CFrame.new(-2077, 252, -12373))
                    end
                end
            end)
        end
    end
end)


CakeSM = Tabs.Main:AddToggle({
    Name = "Auto Summon Cake Prince",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.AutoSpawnCP = Value
end})

spawn(function()
    while task.wait(2) do
        if _G.AutoSpawnCP then
            pcall(function()
                local CommF = game.ReplicatedStorage.Remotes.CommF_
                local enemies = workspace.Enemies
                local bigMirror = workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
                if not bigMirror then return end
                if enemies:FindFirstChild("Cake Prince") then return end
                if bigMirror.Other.Transparency == 0 then return end

                CommF:InvokeServer("CakePrinceSpawner", true)
            end)
        end
    end
end)

DoughKingFarm = Tabs.Main:AddToggle({
    Name = "Auto Farm Dough King",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.AutoDoughKing = Value
end})

spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if not _G.AutoDoughKing then return end

            local player = game.Players.LocalPlayer
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end

            local map = workspace.Map.CakeLoaf
            local enemies = workspace.Enemies

            -- 1?? Thi?u Cocoa => farm qu闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?Chocolate/Cocoa
            if GetM("Conjured Cocoa") < 10 then
                local v = GetConnectionEnemies({"Cocoa Warrior", "Chocolate Bar Battler"})
                if v then
                    repeat task.wait()
                        Attack.Kill(v, _G.AutoDoughKing)
                    until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(402.7, 81.06, -12259.54))
                end
                return
            end

            -- 2?? Thi?u God's Chalice => b?t farm elite
            if not GetBP("God's Chalice") then
                _G.FarmEliteHunt = true
                return
            end

            -- 3?? ?? nguy闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?li?u => craft Sweet Chalice
            if GetM("Conjured Cocoa") >= 10 and GetBP("God's Chalice") and not GetBP("Sweet Chalice") then
                replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                return
            end

            -- 4?? ?? c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?Sweet Chalice => v?n farm Cake qu闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?cho ??n khi Mirror m?
            local CakeMobs = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}
            if not map:FindFirstChild("RedDoor") then
                local v = GetConnectionEnemies(CakeMobs)
                if v then
                    repeat task.wait()
                        Attack.Kill(v, _G.AutoDoughKing)
                    until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-2077, 252, -12373))
                end
                return
            end

            -- 5?? N?u Mirror ?? m? (t?c summon ???c) => Equip ch闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?v闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?summon boss
            if GetBP("Sweet Chalice") or player.Character:FindFirstChild("Sweet Chalice") then
                EquipWeapon("Sweet Chalice")
                replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                task.wait(1)
                _tp(CFrame.new(-2682, 64, -12854)) -- v? tr闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?c?a v闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?Dough King
            end

            -- 6?? Khi boss Dough King spawn => farm boss
            local boss = GetConnectionEnemies("Dough King")
            if boss then
                repeat task.wait()
                    Attack.Kill(boss, _G.AutoDoughKing)
                until not _G.AutoDoughKing or not boss.Parent or boss.Humanoid.Health <= 0
            end
        end)
    end
end)

HopDough = Tabs.Main:AddToggle({
Name = "Auto Hop Dough King", 
Description = "", 
Default = false,
Callback = function(Value)
    _G.AutoHop_Dough = Value
end})

spawn(function()
    while task.wait(5) do
        if _G.AutoHop_Dough then
            pcall(function()
                local player = game.Players.LocalPlayer
                local enemies = workspace.Enemies
                local boss = enemies:FindFirstChild("Dough King")
                local mirror = workspace.Map.CakeLoaf:FindFirstChild("BigMirror")

                if boss then
                    _tp(CFrame.new(-1943.6765, 251.5095, -12337.8808))
                    task.wait(40)
                else
                    local HttpService = game:GetService("HttpService")
                    local req = syn and syn.request or http_request or request
                    if not req then return end
                    local response = req({Url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"})
                    local data = HttpService:JSONDecode(response.Body)
                    for _, v in pairs(data.data) do
                        if v.playing < v.maxPlayers then
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id, player)
                            break
                        end
                    end
                end
            end)
        end
    end
end)

Tabs.Main:AddSection({"Unlocked Dungeon"})

DouD = Tabs.Main:AddToggle({
Name = "Auto Unlock Dough dungeon", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Doughv2 = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Doughv2 then
      pcall(function()
	    if not workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
	      if GetBP("Red Key") then
	        replicated.Remotes.CommF_:InvokeServer("CakeScientist","Check")
	        replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Check")
		  end
	    elseif workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
          if GetBP("Red Key") then
		    repeat wait() _tp(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)) until not _G.Doughv2 or (plr.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)).Magnitude <= 5
		    EquipWeapon("Red Key")
		  end
		  elseif GetConnectionEnemies("Dough King") then
		    local v = GetConnectionEnemies("Dough King")
            if v then
              repeat wait() Attack.Kill(v,_G.Doughv2) until not _G.Doughv2 or not v.Parent or v.Humanoid.Health <= 0
            else
              _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
            end
	      end
		  if GetBP("Sweet Chalice") then
		    replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
		    _G.AutoMiror = true
	      else
	        _G.AutoMiror = false
          end
	      if GetBP("God's Chalice") and GetM("Conjured Cocoa") >= 10 then
		    replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
		  end
	      if not plr.Backpack:FindFirstChild("God's Chalice") or plr.Character:FindFirstChild("God's Chalice") then
	        _G.FarmEliteHunt = true
		  else
		    _G.FarmEliteHunt = false
		  end
	      if GetM("Conjured Cocoa") <= 10 then	        
		  local cocoa3 = {"Cocoa Warrior","Chocolate Bar Battler"}
		  local v = GetConnectionEnemies(cocoa3)
            if v then
            repeat wait() Attack.Kill(v,_G.Doughv2) until _G.Doughv2 == false or not v.Parent or v.Humanoid.Health <= 0
          else
            _tp(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
          end	      
        end
      end)
    end
  end
end)
PhoD = Tabs.Main:AddToggle({
Name = "Auto Unlock Phoenix dungeon", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoPhoenixF = Value
end})
spawn(function()
  while wait(.1) do
    if _G.AutoPhoenixF then
      pcall(function()
        if GetBP("Bird-Bird: Phoenix") then
          if plr.Backpack:FindFirstChild(plr.Data.DevilFruit.Value) then
            if plr.Backpack:FindFirstChild(plr.Data.DevilFruit.Value).Level.Value >= 400 then
               _tp(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
               if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                 replicated.Remotes.CommF_:InvokeServer("SickScientist","Check")
                 replicated.Remotes.CommF_:InvokeServer("SickScientist","Heal")
               end
             end
             elseif plr.Character:FindFirstChild(plr.Data.DevilFruit.Value) then
             if plr.Character:FindFirstChild(plr.Data.DevilFruit.Value).Level.Value >= 400 then
               _tp(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
              if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                replicated.Remotes.CommF_:InvokeServer("SickScientist","Check")
                replicated.Remotes.CommF_:InvokeServer("SickScientist","Heal")
              end
            end
          end
        end
      end)
    end 
  end
end)

Tabs.Main:AddSection({"Farming Bone"})

CheckingBone = Tabs.Main:AddParagraph({
    Title = " Bones :",
    Content = ""
})
spawn(function()
  while wait(.2) do
    pcall(function()
      CheckingBone:SetDesc(" Bones : " ..GetM("Bones"))          
    end)
  end
end)
Bone = Tabs.Main:AddToggle({
Name = "Auto Farm Bones", 
Description = "", 
Default = false,
Callback = function(Value)
    _G.AutoFarm_Bone = Value
end})

spawn(function()
    while task.wait(Sec) do
        if _G.AutoFarm_Bone then
            pcall(function()
                local player = game.Players.LocalPlayer
                local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if not root then return end

                local BonesTable = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
                local bone = GetConnectionEnemies(BonesTable)

                if bone then
                    repeat
                        task.wait()
                        Attack.Kill(bone, _G.AutoFarm_Bone)
                    until not _G.AutoFarm_Bone or bone.Humanoid.Health <= 0 or not bone.Parent
                else
                    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                end
            end)
        end
    end
end)



Tabs.Main:AddToggle({
Name = "Auto Soul Reaper", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoHytHallow = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoHytHallow then
      pcall(function()
        local v = GetConnectionEnemies("Soul Reaper")
	    if v then
          repeat task.wait() Attack.Kill(v,_G.AutoHytHallow) until v.Humanoid.Health <= 0 or _G.AutoHytHallow == false
        else
          if not GetBP("Hallow Essence") then
            repeat task.wait(.1)replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1)until _G.AutoHytHallow == false or GetBP("Hallow Essence")
          else
            repeat wait(.1) _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))until _G.AutoHytHallow == false or (plr.Character.HumanoidRootPart.CFrame == CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
		    EquipWeapon("Hallow Essence")
          end
        end
      end)
    end
  end
end)
RanBone = Tabs.Main:AddToggle({
Name = "Auto Random Bones", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Random_Bone = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Random_Bone then    
  	    repeat task.wait() replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) until not _G.Auto_Random_Bone
      end
    end)
  end
end)
Lucky = Tabs.Main:AddToggle({
Name = "Auto Try Luck Gravestone", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TryLucky = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.TryLucky then
    local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
      if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then
        _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
	 elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then
	   replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",1)
      end
    end
  end
end)
Pray = Tabs.Main:AddToggle({
Name = "Auto Pray Gravestone", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Praying = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Praying then
    local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
      if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then
	   _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
      elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then
	   replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",2)
      end
    end
  end
end)


Tabs.Main:AddSection({"Tyrant of the Skies"})

TyrantStatus = Tabs.Main:AddParagraph({
    Title = "Boss Spawn",
    Content = ""
})

spawn(function()
    pcall(function()
        while wait(1) do
            if workspace.Enemies:FindFirstChild("Tyrant of the Skies") then
                TyrantStatus:SetDesc("?")
            else
                TyrantStatus:SetDesc("?")
            end
        end
    end)
end)

FarmTyrant = Tabs.Main:AddToggle({
Name = "Auto Farm Boss", 
Description = "", 
Default = false,
Callback = function(Value) 
    getgenv().FarmTyrant = Value 
end})

spawn(function()
    while wait(Sec) do
        if getgenv().FarmTyrant then
            pcall(function()
                if not plr.Character then return end
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local bossPos = Vector3.new(-16268.287, 152.616, 1390.773)
                
                -- Teleport ??n boss n?u xa
                if (hrp.Position - bossPos).Magnitude > 5 then
                    _tp(CFrame.new(bossPos))
                    repeat wait() until not getgenv().FarmTyrant or (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and (plr.Character.HumanoidRootPart.Position - bossPos).Magnitude <= 5)
                end

                -- T闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?v闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?farm boss
                local boss = workspace.Enemies:FindFirstChild("Tyrant of the Skies")
                if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    repeat
                        if not getgenv().FarmTyrant then break end
                        if Attack and Attack.Kill then
                            Attack.Kill(boss, getgenv().FarmTyrant)
                        end
                        wait()
                    until not getgenv().FarmTyrant or not boss.Parent or boss.Humanoid.Health <= 0
                    return
                end

                -- Farm mob n?u boss ch?a spawn
                local mobList = {"Serpent Hunter","Skull Slayer","Isle Champion","Sun-kissed Warrior"}
                for _, mobName in ipairs(mobList) do
                    if not getgenv().FarmTyrant then break end
                    for _, mob in pairs(workspace.Enemies:GetChildren()) do
                        if not getgenv().FarmTyrant then break end
                        if mob and mob.Name == mobName and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                            if (hrp.Position - mob.HumanoidRootPart.Position).Magnitude > 5000 then
                                _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                local t0 = tick()
                                repeat wait() hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") until not getgenv().FarmTyrant or not hrp or (hrp.Position - mob.HumanoidRootPart.Position).Magnitude <= 6 or tick() - t0 > 8
                            end
                            repeat
                                if not getgenv().FarmTyrant then break end
                                if Attack and Attack.Kill then
                                    Attack.Kill(mob, getgenv().FarmTyrant)
                                end
                                wait()
                            until not getgenv().FarmTyrant or not mob.Parent or mob.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

FarmPhaBinh = Tabs.Main:AddToggle({
Name = "Auto Summon Boss", 
Description = "", 
Default = false,
Callback = function(Value)
    getgenv().FarmPhaBinh = Value
end})

local function sendSkillKey(skillKey)
    local virtualInputManager = game:GetService("VirtualInputManager")
    virtualInputManager:SendKeyEvent(true, skillKey, false, game)
    wait(0.05)
    virtualInputManager:SendKeyEvent(false, skillKey, false, game)
end

local function equipAndUseSkill(toolType)
    local character = plr.Character
    local backpack = plr.Backpack
    if not (character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0) then return end

    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.ToolTip == toolType then
            item.Parent = character
            wait(0.12)
            for _, skill in ipairs({"Z", "X", "C", "V", "F"}) do
                if not getgenv().FarmPhaBinh then break end
                pcall(function() sendSkillKey(skill) end)
                wait(0.12)
            end
            item.Parent = backpack
            break
        end
    end
end

local PhaBinhPoints = {
    CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875),
    CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875),
    CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875),
    CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625),
    CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875),
    CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875),
    CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375),
    CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125),
}

spawn(function()
    while wait(Sec) do
        if getgenv().FarmPhaBinh then
            pcall(function()
                if not (plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0) then return end

                for _, point in ipairs(PhaBinhPoints) do
                    if not getgenv().FarmPhaBinh then break end

                    _tp(point)

                    local arrived = false
                    local start = tick()
                    while tick() - start < 12 and not arrived and getgenv().FarmPhaBinh do
                        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                        if not hrp then break end
                        local dist = (hrp.Position - point.Position).Magnitude
                        if dist <= 3 then
                            arrived = true
                            break
                        end
                        wait(0.1)
                    end

                    if getgenv().FarmPhaBinh and arrived then
                        equipAndUseSkill("Melee")
                        equipAndUseSkill("Sword")
                        equipAndUseSkill("Gun")
                    end
                end
            end)
        end
    end
end)


Tabs.Main:AddSection({"Farm Material"})

Test = Tabs.Main:AddDropdown({
Name = "Choose Material",
		Description = "",
		Options = MaterialList,
		Default = false,
		Callback = function(Value)
			getgenv().SelectMaterial = Value
		end
		})
Toggle = Tabs.Main:AddToggle({
Name = "Auto Materials", 
Description = "", 
Default = false,
Callback = function(Value)
    getgenv().AutoMaterial = Value
end})
spawn(function()
  local function processEnemy(v, EnemyName)
    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      if v.Name == EnemyName then repeat wait() Attack.Kill(v,getgenv().AutoMaterial) until not getgenv().AutoMaterial or not v.Parent or v.Humanoid.Health <= 0 end
    end
  end
  local function handleEnemySpawns()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
      for _, EnemyName in ipairs(MMon) do
        if string.find(v.Name, EnemyName) then
          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
            _tp(v.CFrame * Pos)
          end
        end
      end
    end
  end
  while wait() do
    if getgenv().AutoMaterial then
      if IsCollectingEggs then task.wait(1) end
      pcall(function()
        if getgenv().SelectMaterial then MaterialMon(getgenv().SelectMaterial) _tp(MPos) end
        for _, EnemyName in ipairs(MMon) do
          for _, v in pairs(workspace.Enemies:GetChildren()) do processEnemy(v, EnemyName) end
        end
        handleEnemySpawns()
      end)
    end
  end
end)


Tabs.Main:AddSection({"Farm Boss"})

-- === Dropdown ch?n Boss ===
BossDropdown = Tabs.Main:AddDropdown({
    Name = "Select Boss",
		Description = "",
		Options = BossList,
		Default = false,
		Callback = function(value)
    getgenv().SelectBoss = Value
end})

-- === Toggle Farm Boss ===
FarmBossToggle = Tabs.Main:AddToggle({
    Name = "Auto Farm Boss",
    Description = "",
    Default = false,
Callback = function(Value)
    getgenv().AutoFarmBoss = Value
end})

-- === Loop Farm Boss (lu?n bay ??n boss ho?c ch? spawn) ===
spawn(function()
    while task.wait(0.2) do
        pcall(function()
            if getgenv().AutoFarmBoss and getgenv().SelectBoss then
                if IsCollectingEggs then task.wait(1) end
                local bossName = getgenv().SelectBoss
                local boss = workspace.Enemies:FindFirstChild(bossName)

                if boss and boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") then
                    -- Boss ?? spawn
                    local hrp = boss.HumanoidRootPart
                    local humanoid = boss.Humanoid
                    if humanoid.Health > 0 then
                        repeat task.wait()
                            -- Bay ??n tr闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡???u boss
                            _tp(hrp.CFrame * CFrame.new(0, 5, 0))
                            -- G?i fast attack
                            if Attack and typeof(Attack.Kill) == "function" then
                                Attack.Kill(boss, getgenv().AutoFarmBoss)
                            end
                        until not getgenv().AutoFarmBoss or not boss.Parent or humanoid.Health <= 0
                    end
                else
                    -- Boss ch?a spawn 闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?bay ??n v? tr闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?spawn trong ReplicatedStorage
                    local bossRep = game.ReplicatedStorage:FindFirstChild(bossName)
                    if bossRep and bossRep:FindFirstChild("HumanoidRootPart") then
                        _tp(bossRep.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
                    end
                end
            end
        end)
    end
end)

-- === Toggle Farm All Boss  ===
FarmAllBoss = Tabs.Main:AddToggle({
    Title = "Auto Farm All Boss",
    Default = false,
Callback = function(Value)
    getgenv().AutoFarmAllBoss = Value
end})

-- === Loop Farm Boss G?n Nh?t ===
task.spawn(function()
    while task.wait(0.3) do
        if getgenv().AutoFarmAllBoss then
            if IsCollectingEggs then task.wait(1) end
            pcall(function()
                local player = game.Players.LocalPlayer
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
                local hrp = player.Character.HumanoidRootPart

                local nearestBoss, nearestDist = nil, math.huge

                -- ?? T闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?boss g?n nh?t trong workspace.Enemies
                for _, boss in pairs(workspace.Enemies:GetChildren()) do
                    if boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                        if table.find(BossList, boss.Name) then
                            local dist = (hrp.Position - boss.HumanoidRootPart.Position).Magnitude
                            if dist < nearestDist then
                                nearestBoss = boss
                                nearestDist = dist
                            end
                        end
                    end
                end

                -- ?? N?u t闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?th?y boss g?n nh?t th闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?farm
                if nearestBoss and nearestBoss:FindFirstChild("HumanoidRootPart") then
                    local bossHRP = nearestBoss.HumanoidRootPart
                    local humanoid = nearestBoss.Humanoid

                    repeat
                        task.wait(0.1)
                        if not getgenv().AutoFarmAllBoss then break end

                        -- ?? Di chuy?n ??n boss (c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?bypass nh?)
                        local targetCFrame = bossHRP.CFrame * CFrame.new(0, 5, 0)
                        if (hrp.Position - targetCFrame.Position).Magnitude > 100 then
                            player.Character:PivotTo(targetCFrame)
                        else
                            _tp(targetCFrame)
                        end

                        -- ?? G?i fast attack
                        if Attack and typeof(Attack.Kill) == "function" then
                            Attack.Kill(nearestBoss, true)
                        end
                    until not nearestBoss.Parent or humanoid.Health <= 0 or not getgenv().AutoFarmAllBoss
                end
            end)
        end
    end
end)

Tabs.Main:AddSection({"Farming Mastery"})
local posMastery = {"Cake","Bone"}
local Mastery_Config = Tabs.Main:AddDropdown({
Name = "Choose Island",
		Description = "",
		Options = posMastery,
		Default = false,
		Callback = function(Value)
  SelectIsland = Value
end})
local MasteryFruits = Tabs.Main:AddToggle({
Name = "Auto Mastery Fruits", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmMastery_Dev = Value
end})
spawn(function()RunSer.RenderStepped:Connect(function() pcall(function()if _G.FarmMastery_Dev or _G.FarmMastery_G or _G.FarmMastery_S then for a,b in pairs(plr.PlayerGui.Notifications:GetChildren())do if b.Name=="NotificationTemplate"then if string.find(b.Text,"Skill locked!")then b:Destroy()end end end end end)end) end)
spawn(function()
  while wait(Sec) do
    if _G.FarmMastery_Dev then
      pcall(function()
        if SelectIsland == "Cake" then         
          local v = GetConnectionEnemies(mastery1)
		  if v then		   
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Mas(v,_G.FarmMastery_Dev)
		    until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent         		         		        
		  else
		    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
		  end
		elseif SelectIsland == "Bone" then
          local v = GetConnectionEnemies(mastery2)
		  if v then		
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Mas(v,_G.FarmMastery_Dev)
		    until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent		        
		  else
		    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 		    
		  end
        end
      end)
    end
  end
end)
local MasteryGun = Tabs.Main:AddToggle({
Name = "Auto Mastery Gun", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmMastery_G = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.FarmMastery_G then
      pcall(function()
        if SelectIsland == "Cake" then
          local v = GetConnectionEnemies(mastery1)
		  if v then		      
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Masgun(v,_G.FarmMastery_G)
		      local Modules = replicated:FindFirstChild("Modules")
              local Net = Modules:FindFirstChild("Net")
              local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")    
              if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then return end
              if plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name == 'Skull Guitar' then
                SoulGuitar = true
		        plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then
		        SoulGuitar = false
		        RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      end		            		
		    until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent    
		    SoulGuitar = false     		         		        
		  else
		    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 		    
	  	  end
		elseif SelectIsland == "Bone" then
          local v = GetConnectionEnemies(mastery2)
		  if v then		      
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Masgun(v,_G.FarmMastery_G)
		      local Modules = replicated:FindFirstChild("Modules")
              local Net = Modules:FindFirstChild("Net")
              local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")    
              if plr.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun" then return end
              if plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name == 'Skull Guitar' then
                SoulGuitar = true
		        plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then
		        SoulGuitar = false
		        RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      end		            		
		    until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent    
		    SoulGuitar = false     		         		        
		  else
		    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
	  	  end
        end
      end)
    end
  end
end)
local MasterySword = Tabs.Main:AddToggle({
Name = "Auto Mastery All Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmMastery_S = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.FarmMastery_S then
        if SelectIsland == "Cake" then
          for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do          
            if type(v) == "table" then
              if v.Type == "Sword" then
                SwordName = v.Name
                if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
                  local v = GetConnectionEnemies(mastery1)
                  if GetBP(SwordName) then                    
		            if v then
                      repeat wait() Attack.Sword(v,_G.FarmMastery_S) until _G.FarmMastery_S == false or not v.Parent or v.Humanoid.Health <= 0		                  
		            else
		              _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
		            end                    
                  else
                    replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName)   
                  end   
              elseif tonumber(v.Mastery) >= 600 then
                if GetBP(SwordName) then return nil else replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) end       
              end
                break
              end
            end         
          end
        elseif SelectIsland == "Bone" then
          for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do          
            if type(v) == "table" then
              if v.Type == "Sword" then
                SwordName = v.Name
                if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
                  local v = GetConnectionEnemies(mastery2)
                  if GetBP(SwordName) then                    
		            if v then
                      repeat wait() Attack.Sword(v,_G.FarmMastery_S) until _G.FarmMastery_S == false or not v.Parent or v.Humanoid.Health <= 0		                  
		            else
		              _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
		            end                    
                  else
                    replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName)   
                  end   
                elseif tonumber(v.Mastery) >= 600 then
                  if GetBP(SwordName) then return nil else replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) end       
                end
                break
              end
            end         
          end
        end
      end
    end)
  end
end)






-- ===================== BYPASS TELEPORT (FAST HOP) =====================
local DC_MAX_STEP_DIST = getgenv().DC_MAX_STEP_DIST or 9000
local DC_HOLD_TIME = getgenv().DC_HOLD_TIME or 2
local DC_HOLD_STEP = getgenv().DC_HOLD_STEP or 0.03
local DC_RESPAWN_TIMEOUT = getgenv().DC_RESPAWN_TIMEOUT or 7
local DC_SKIP_IF_NEAR = getgenv().DC_SKIP_IF_NEAR or 2000

local IslandCF = {
	["WindMill"] = CFrame.new(979.799, 16.516, 1429.047),
	["Marine"] = CFrame.new(-2566.43, 6.856, 2045.256),
	["Middle Town"] = CFrame.new(-690.331, 15.094, 1582.238),
	["Jungle"] = CFrame.new(-1612.796, 36.852, 149.128),
	["Pirate Village"] = CFrame.new(-1181.309, 4.751, 3803.546),
	["Desert"] = CFrame.new(944.158, 20.92, 4373.3),
	["Snow Island"] = CFrame.new(1347.807, 104.668, -1319.737),
	["MarineFord"] = CFrame.new(-4914.821, 50.964, 4281.028),
	["Colosseum"] = CFrame.new(-1427.62, 7.288, -2792.772),
	["Sky Island 1"] = CFrame.new(-4869.103, 733.461, -2667.018),
	["Sky Island 2"] = CFrame.new(-11.311, 29.277, 2771.522),
	["Sky Island 3"] = CFrame.new(-483.734, 332.038, 595.327),
	["Prison"] = CFrame.new(4875.33, 5.652, 734.85),
	["Magma Village"] = CFrame.new(-5247.716, 12.884, 8504.969),
	["Under Water Island"] = CFrame.new(61163.852, 11.68, 1819.784),
	["Fountain City"] = CFrame.new(5127.128, 59.501, 4105.446),

	["The Cafe"] = CFrame.new(-380.479, 77.22, 255.826),
	["Frist Spot"] = CFrame.new(-9515.372, 164.006, 5786.061),
	["Dark Area"] = CFrame.new(3780.03, 22.652, -3498.586),
	["Flamingo Mansion"] = CFrame.new(-3032.764, 317.897, -10075.373),
	["Flamingo Room"] = CFrame.new(2284.414, 15.152, 875.725),
	["Green Zone"] = CFrame.new(-2448.53, 73.016, -3210.631),
	["Factory"] = CFrame.new(424.127, 211.162, -427.54),
	["Colossuim"] = CFrame.new(-1503.622, 219.796, 1369.31),
	["Zombie Island"] = CFrame.new(-5622.033, 492.196, -781.786),
	["Two Snow Mountain"] = CFrame.new(753.143, 408.236, -5274.615),
	["Punk Hazard"] = CFrame.new(-6127.654, 15.952, -5040.286),
	["Cursed Ship"] = CFrame.new(923.402, 125.057, 32885.875),
	["Ice Castle"] = CFrame.new(6148.412, 294.387, -6741.117),
	["Forgotten Island"] = CFrame.new(2681.274, 1682.809, -7190.985),

	["Sea castle"] = CFrame.new(-5496.452, 313.809, -2857.703),
	["Mini Sky Island"] = CFrame.new(-288.741, 49326.316, -35248.594),
	["Great Tree"] = CFrame.new(2681.274, 1682.809, -7190.985),
	["Port Town"] = CFrame.new(-226.751, 20.603, 5538.34),
	["Hydra Island"] = CFrame.new(5291.249, 1005.443, 393.762),
	["Mansion"] = CFrame.new(-12633.672, 459.521, -7425.463),
	["Haunted Castle"] = CFrame.new(-9366.803, 141.366, 5443.941),
	["Ice Cream Island"] = CFrame.new(-902.568, 79.932, -10988.848),
	["Peanut Island"] = CFrame.new(-2062.748, 50.474, -10232.568),
	["Cake Island"] = CFrame.new(-1884.775, 19.328, -11666.897),
	["Cocoa Island"] = CFrame.new(87.943, 73.555, -12319.465),
	["Candy Island"] = CFrame.new(-1014.424, 149.111, -14555.963),
	["Tiki Outpost"] = CFrame.new(-16218.683, 9.086, 445.618),
	["Dragon Dojo"] = CFrame.new(5743.319, 1206.91, 936.011),
}

local Alias = {
	["MiniSky"] = "Mini Sky Island",
	["Colosseum"] = "Colosseum",
	["Colossuim"] = "Colossuim",
}

local WorldIslands = {
	World1 = {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City"},
	World2 = {"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island"},
	World3 = {"Sea castle","Mini Sky Island","Great Tree","Port Town","Hydra Island","Mansion","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Tiki Outpost","Dragon Dojo"},
}

local function getWorldKey()
	if World1 then return "World1" end
	if World2 then return "World2" end
	if World3 then return "World3" end
	return "World1"
end

local function normName(name)
	if type(name) ~= "string" then return nil end
	name = name:gsub("^%s+", ""):gsub("%s+$", "")
	if Alias[name] then name = Alias[name] end
	return name
end

local function dist(a, b) return (a - b).Magnitude end

local function GetChar()
	local c = plr.Character or plr.CharacterAdded:Wait()
	local hrp = c:WaitForChild("HumanoidRootPart", 10)
	local hum = c:FindFirstChildOfClass("Humanoid")
	if not (hrp and hum) then return end
	return c, hrp, hum
end

local function buildNodes()
	local wk = getWorldKey()
	local list = WorldIslands[wk] or {}
	local nodes = {}
	for _, n in ipairs(list) do
		if IslandCF[n] then nodes[#nodes+1] = n end
	end
	return nodes
end

local function nearestIsland(pos, nodes)
	local best, bestD
	for _, n in ipairs(nodes) do
		local d = dist(pos, IslandCF[n].Position)
		if not bestD or d < bestD then bestD, best = d, n end
	end
	return best, bestD or math.huge
end

local function dijkstra(nodes, startName, goalName, maxStep)
	local adj = {}
	for _, a in ipairs(nodes) do adj[a] = {} end

	for i=1,#nodes do
		local ai = nodes[i]
		local ap = IslandCF[ai].Position
		for j=i+1,#nodes do
			local bj = nodes[j]
			local bp = IslandCF[bj].Position
			local d = dist(ap, bp)
			if d <= maxStep then
				adj[ai][bj] = d
				adj[bj][ai] = d
			end
		end
	end

	local distMap, prev, used = {}, {}, {}
	for _, n in ipairs(nodes) do distMap[n] = math.huge end
	distMap[startName] = 0

	while true do
		local u, best = nil, math.huge
		for _, n in ipairs(nodes) do
			if not used[n] and distMap[n] < best then best, u = distMap[n], n end
		end
		if not u or u == goalName then break end
		used[u] = true
		for v, w in pairs(adj[u]) do
			if not used[v] then
				local nd = distMap[u] + w
				if nd < distMap[v] then distMap[v], prev[v] = nd, u end
			end
		end
	end

	if distMap[goalName] == math.huge then return nil end
	local path, cur = {}, goalName
	while cur do
		table.insert(path, 1, cur)
		cur = prev[cur]
	end
	return path
end

local _STOP, _RUN = false, false

local function HoldTPAndReset(pos)
	local c, hrp, hum = GetChar()
	if not c then return false end
	local cf = CFrame.new(pos)

	pcall(function()
		hrp.CFrame = cf
		hrp.AssemblyLinearVelocity = Vector3.zero
		hrp.AssemblyAngularVelocity = Vector3.zero
	end)

	local t0 = os.clock()
	while os.clock() - t0 < DC_HOLD_TIME do
		if _STOP then break end
		if not (hrp and hrp.Parent and hum and hum.Parent and hum.Health > 0) then break end
		pcall(function()
			hrp.CFrame = cf
			hrp.AssemblyLinearVelocity = Vector3.zero
			hrp.AssemblyAngularVelocity = Vector3.zero
		end)
		task.wait(DC_HOLD_STEP)
	end

	if _STOP then return false end
	pcall(function() hum.Health = 0 end)
	return true
end

local function WaitRespawn()
	local t0 = os.clock()
	while os.clock() - t0 < DC_RESPAWN_TIMEOUT do
		if _STOP then return false end
		local c = plr.Character
		local hrp = c and c:FindFirstChild("HumanoidRootPart")
		local hum = c and c:FindFirstChildOfClass("Humanoid")
		if hrp and hum and hum.Health > 0 then return true end
		task.wait(0.15)
	end
	return false
end

function DC_FastHopTo(targetName)
	targetName = normName(targetName)
	if not (targetName and IslandCF[targetName]) then return false end

	local nodes = buildNodes()
	if #nodes == 0 then return false end

	local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then
		if not WaitRespawn() then return false end
		hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
	end
	if not hrp then return false end

	local startIsland = nearestIsland(hrp.Position, nodes)
	local path = dijkstra(nodes, startIsland, targetName, DC_MAX_STEP_DIST)
	if not path then return false end

	_RUN, _STOP = true, false

	for _, name in ipairs(path) do
		if _STOP then break end
		local pos = IslandCF[name].Position
		local ch = plr.Character
		local hrp2 = ch and ch:FindFirstChild("HumanoidRootPart")
		if hrp2 and dist(hrp2.Position, pos) <= DC_SKIP_IF_NEAR then
			task.wait(0.1)
		else
			if not HoldTPAndReset(pos) or _STOP then break end
			if not WaitRespawn() or _STOP then break end
		end
		task.wait(0.2)
	end

	_RUN = false
	return not _STOP
end

function DC_StopFastHop()
	_STOP = true
end

function DC_IsFastHopRunning()
	return _RUN
end

local function BuildIslandOptions()
	local wk = getWorldKey()
	local list = WorldIslands[wk] or {}
	local out, seen = {}, {}
	for _, name in ipairs(list) do
		if Alias and Alias[name] then name = Alias[name] end
		if IslandCF[name] and not seen[name] then
			seen[name] = true
			out[#out+1] = name
		end
	end
	table.sort(out)
	return out
end

_G.Islandtp = _G.Islandtp or BuildIslandOptions()[1]

local BypassIslandDropdown = Tabs.Travel:AddDropdown({
	Name = "Bypass Island",
	Options = BuildIslandOptions(),
	Default = _G.Islandtp or false,
	Callback = function(Value)
		_G.Islandtp = Value
	end
})

task.spawn(function()
	while task.wait(0.25) do
		if _G.Bypass and _G.Islandtp and not _RUN then
			_STOP = false
			DC_FastHopTo(_G.Islandtp)
		end
	end
end)
-- =================== END BYPASS TELEPORT ===================

Tabs.Settings:AddSection({"Settings / Configure"})


Initialize = Tabs.Settings:AddToggle({
Name = "Fast Attack", 
Description = "", 
Default = true,
Callback = function(Value)
  _G.Seriality = Value
end})
local Bringmob = Tabs.Settings:AddToggle({
Name = "Bring Mobs", 
Description = "", 
Default = true,
Callback = function(Value)
  _B = Value
end})
-- ?? Toggle Auto Server Hop m?i 30 ph闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?
HopToggle = Tabs.Settings:AddToggle({
    Name = "Auto Hop (Every 30 Minutes)",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.AutoHopServer = Value
end})

-- ?? B? ??m v闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?x? ly hop
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if _G.AutoHopServer then
                if not _G.HopTimer then
                    _G.HopTimer = tick()
                end
                local elapsed = tick() - _G.HopTimer
                if elapsed >= 1800 then -- 1800s = 30 ph闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?
                    _G.HopTimer = tick()
                    if syn and syn.queue_on_teleport then
                        syn.queue_on_teleport("loadstring(game:HttpGet('https://pastefy.app/iiFOhcot/raw'))()")
                    end
                    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                end
            else
                _G.HopTimer = nil
            end
        end)
    end
end)
BusuAura = Tabs.Settings:AddToggle({
Name = "Auto Turn on Buso", 
Description = "", 
Default = true,
Callback = function(Value)
  Boud = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if Boud then
      local _HasBuso = {"HasBuso","Buso"}
  	  if not plr.Character:FindFirstChild(_HasBuso[1]) then replicated.Remotes.CommF_:InvokeServer(_HasBuso[2]) end
      end
    end)
  end
end)

RaceV3Aura = Tabs.Settings:AddToggle({
Name = "Auto Turn on Race V3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.RaceClickAutov3 = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.RaceClickAutov3 then
        repeat
          replicated.Remotes.CommE:FireServer("ActivateAbility") 
          wait(30)
        until not _G.RaceClickAutov3   
      end 
    end)
  end
end)
RaceV4Aura = Tabs.Settings:AddToggle({
Name = "Auto Turn on Race V4", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.RaceClickAutov4 = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.RaceClickAutov4 then
  	    if plr.Character:FindFirstChild("RaceEnergy") then
        if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then Useskills("nil","Y") end
        end        
      end 
    end)
  end
end)
RandomAround = Tabs.Settings:AddToggle({
Name = "Auto Turn on Spin Position", 
Description = "", 
Default = false,
Callback = function(Value)
  RandomCFrame = Value
end})
Byp = Tabs.Travel:AddToggle({
Name = "Turn on Bypass Teleport", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Bypass = Value
  if not Value and typeof(DC_StopFastHop) == "function" then
    DC_StopFastHop()
  end
end})
SafeModes = Tabs.Settings:AddToggle({
Name = "Safe Mode(T闁?闂備礁鍚嬮崕鐓幬涢崟顓熷厹闁绘ê妯婇悗鍫曟煛閳?n闂?s闂佽崵濮撮鎴犵不?th闂備礁顓介弶璺ㄤ患闂佸搫妫楃槐姝?khi m闂佽崵濮撮鎴犵不?d闂備礁顓介弶璺ㄤ患缂佺虎鍘炬慨鎾煝?m闁诲海鎳撶€氼剛鈧哎鍔戝畷?nh闁诲骸鍘滈崑鎾斥攽閸屾凹妲规い?闂備礁鍚嬮崕鐓幬涢崟顓熷厹闁绘ê鍟块崹鏃€淇?", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Safemode = Value
end})
spawn(function()
  while task.wait(Sec) do
    pcall(function()
	  if _G.Safemode then
  	  local Calc_Health = plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth * 100
  	  if Calc_Health < Num_self then shouldTween=true _tp(Root.CFrame * CFrame.new(0,500,0)) else shouldTween=false end
      end
    end)
  end
end)

DisableHitVFX = Tabs.Settings:AddToggle({
    Name = "Remove Hit VFX",
    Description = "Removes slash and sword visual effects for better visibility",
    Default = false,
    Callback = function(Value)
        _G.DestroyHit = Value
    end
})

-- ?? Danh s闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰闂佷紮绲介懟顖炵嵁?hi?u ?ng c?n x闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?
local HitEffects = {"SlashHit", "CurvedRing", "SwordSlash", "SlashTail"}

-- ?? V闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰缂傚倷闄嶉崹铏光偓?l?p Redz style
task.spawn(function()
    while task.wait(Sec) do
        if _G.DestroyHit then
            pcall(function()
                for _, v in pairs(workspace["_WorldOrigin"]:GetChildren()) do
                    if table.find(HitEffects, v.Name) then
                        v:Destroy()
                    end
                end
            end)
        end
    end
end)
RmvVFX = Tabs.Settings:AddToggle({
Name = "Remove Death & Respawned VFX", 
Description = "", 
Default = false,
Callback = function(Value)
  RDeath = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if RDeath then
	  if replicated.Effect.Container:FindFirstChild("Death") then replicated.Effect.Container.Death:Destroy() end
      if replicated.Effect.Container:FindFirstChild("Respawn") then replicated.Effect.Container.Respawn:Destroy() end
	  end
    end)
  end
end)	
DisblesNotify = Tabs.Settings:AddToggle({
Name = "Disable Notify", 
Description = "", 
Default = false,
Callback = function(Value)
  RemoveDamage = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if RemoveDamage then
        replicated.Assets.GUI.DamageCounter.Enabled = false
        plr.PlayerGui.Notifications.Enabled = false
	  else
        replicated.Assets.GUI.DamageCounter.Enabled = true
        plr.PlayerGui.Notifications.Enabled = true
      end
    end)
  end
end)      

Tabs.Settings:AddSection({"Stats Upgrade"})
StatusSelect = Tabs.Settings:AddSlider({
Name = "Stats Value",
Description = "",
Default = 10,
Min = 0,
Max = 1000,
Rounding = 1, 
Callback = function(Value)
  pSats = Value
end})

StatsUpg = Tabs.Settings:AddToggle({
Name = "Auto Melee", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Melee = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
    if _G.Auto_Melee then statsSetings("Melee",pSats) end
    end)
  end
end)

StatsUpg = Tabs.Settings:AddToggle({
Name = "Auto Swords", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Sword = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
    if _G.Auto_Sword then statsSetings("Sword",pSats) end
    end)
  end
end)
StatsUpg = Tabs.Settings:AddToggle({
Name = "Auto Gun", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Gun = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
    if _G.Auto_Gun then statsSetings("Gun",pSats) end
    end)
  end
end)
StatsUpg = Tabs.Settings:AddToggle({
Name = "Auto Blox Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_DevilFruit = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
    if _G.Auto_DevilFruit then statsSetings("Devil",pSats) end
    end)
  end
end)
StatsUpg = Tabs.Settings:AddToggle({
Name = "Auto Defense", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Defense = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
    if _G.Auto_Defense then statsSetings("Defense",pSats) end
    end)
  end
end)

Tabs.Fish:AddSection({"Fishing"})


BaitDropdown = Tabs.Fish:AddDropdown({
    Name = "Select Bait",
    Description = "",
    Options = {"Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait", "Epic Bait", "Carnivore Bait"},
    Multi = false,
    Default = _G.SelectedBait,
    Callback = function(Value)
        _G.SelectedBait = Value
        if _G.AutoBuyBait then
            pcall(function()
                Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
            end)
        end
    end
})

BuyBaitToggle = Tabs.Fish:AddToggle({
    Name = "Auto Buy Bait",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoBuyBait = Value
        if Value then
            pcall(function()
                Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
            end)
        end
    end
})


task.spawn(function()
    while task.wait(2) do
        if _G.AutoBuyBait and _G.SelectedBait then
            pcall(function()
                Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
            end)
        end
    end
end)




Fishing = Tabs.Fish:AddToggle({
Name = "Auto Fishing", 
Description = "",
Default = false,
Callback = function(Value)
    _G.AutoFishing = Value
end})


local Players2 = game:GetService("Players")
local LocalPlayer2 = Players2.LocalPlayer
local Workspace2 = game:GetService("Workspace")
local FishReplicated2 = game:GetService("ReplicatedStorage"):WaitForChild("FishReplicated")
local FishingRequest2 = FishReplicated2:WaitForChild("FishingRequest")
local Config2 = require(FishReplicated2.FishingClient.Config)
local GetWaterHeight2 = require(game:GetService("ReplicatedStorage").Util.GetWaterHeightAtLocation)
local maxdistance2 = Config2.Rod.MaxLaunchDistance


task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoFishing then
            pcall(function()
                local Char = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
                local hrm = Char:FindFirstChild("HumanoidRootPart")
                local Tool = Char:FindFirstChildOfClass("Tool")
                if not (hrm and Tool) then return end

                local waterHeight = GetWaterHeight2(hrm.Position)
                local _, hitPos = Workspace2:FindPartOnRayWithIgnoreList(
                    Ray.new(Char.Head.Position, hrm.CFrame.LookVector * maxdistance2),
                    {Char, Workspace2.Characters, Workspace2.Enemies}
                )
                local pos = Vector3.new(hitPos.X, math.max(hitPos.Y, waterHeight), hitPos.Z)
                local State = Tool:GetAttribute("State")
                local ServerState = Tool:GetAttribute("ServerState")

                if State == "ReeledIn" or ServerState == "ReeledIn" then
                    FishingRequest2:InvokeServer("StartCasting")
                    task.wait()
                    FishingRequest2:InvokeServer("CastLineAtLocation", pos, 100, true)
                elseif ServerState == "Biting" then
                    FishingRequest2:InvokeServer("Catching", true)
                    task.wait(0.1)
                    FishingRequest2:InvokeServer("Catch", 1)
                end
            end)
        end
    end
end)


FishingQ = Tabs.Fish:AddToggle({
Name = "Auto Quest Fishing", 
Description = "",
Default = false,
Callback = function(Value)
    _G.AutoFishingQuest = Value
end})


local Players3 = game:GetService("Players")
local LocalPlayer3 = Players3.LocalPlayer
local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
local RFJobsRemoteFunction3 = ReplicatedStorage3.Modules.Net:WaitForChild("RF/JobsRemoteFunction")

local function GetQuestGui3()
    local pg = LocalPlayer3.PlayerGui
    if not pg then return nil end
    local main = pg:FindFirstChild("Main")
    if main and main:FindFirstChild("Quest") then
        return main.Quest
    end
    return pg:FindFirstChild("Quest") or pg:FindFirstChild("QuestGui")
end

local function GetQuestTitle3()
    local questGui = GetQuestGui3()
    if not questGui or questGui.Visible == false then return "" end
    local container = questGui:FindFirstChild("Container") or questGui
    local qt = container:FindFirstChild("QuestTitle")
    local titleObj = qt and (qt:FindFirstChild("Title") or qt)
    if titleObj and titleObj:IsA("TextLabel") then
        return titleObj.Text or ""
    end
    return ""
end

local function HasQuest3()
    local title = GetQuestTitle3()
    return title ~= nil and title ~= ""
end

local function GetFishingNPCName()
    local npcs = workspace:FindFirstChild("NPCs")
    if npcs then
        for _, npc in ipairs(npcs:GetChildren()) do
            local n = npc.Name:lower()
            if n:find("angler") or n:find("fisher") or n:find("fishing") then
                return npc.Name
            end
        end
    end
    return "Angler"
end

local function TryAskFishingQuest()
    if not Remotes.RFJobsRemoteFunction then return end
    local npc = GetFishingNPCName()
    local calls = {
        {"FishingNPC", npc, "AskQuest"},
        {"FishingNPC", npc, "RequestQuest"},
        {"FishingNPC", npc, "StartQuest"},
        {"FishingNPC", "Angler", "AskQuest"},
        {"FishingNPC", "Angler", "RequestQuest"},
        {"FishingNPC", "Angler", "StartQuest"},
        {"FishingNPC", "AskQuest"},
        {"FishingNPC", "RequestQuest"},
        {"FishingNPC", "StartQuest"},
    }
    for _, args in ipairs(calls) do
        local ok = InvokeFishingJob(unpack(args))
        if ok then return end
    end
end

local function TryFinishFishingQuest()
    if not Remotes.RFJobsRemoteFunction then return end
    local npc = GetFishingNPCName()
    local calls = {
        {"FishingNPC", npc, "FinishQuest"},
        {"FishingNPC", npc, "CompleteQuest"},
        {"FishingNPC", npc, "ClaimQuest"},
        {"FishingNPC", "Angler", "FinishQuest"},
        {"FishingNPC", "Angler", "CompleteQuest"},
        {"FishingNPC", "Angler", "ClaimQuest"},
        {"FishingNPC", "FinishQuest"},
        {"FishingNPC", "CompleteQuest"},
        {"FishingNPC", "ClaimQuest"},
    }
    for _, args in ipairs(calls) do
        local ok = InvokeFishingJob(unpack(args))
        if ok then return end
    end
end

local function TrySellFish()
    if not Remotes.RFJobsRemoteFunction then return end
    local npc = GetFishingNPCName()
    local calls = {
        {"FishingNPC", npc, "SellFish"},
        {"FishingNPC", "Angler", "SellFish"},
        {"FishingNPC", "SellFish"},
    }
    for _, args in ipairs(calls) do
        local ok = InvokeFishingJob(unpack(args))
        if ok then return end
    end
end

task.spawn(function()
    while task.wait(1) do
        if _G.AutoFishingQuest then
            pcall(function()
                if not HasQuest3() then
                    TryAskFishingQuest()
                end
            end)
        end
    end
end)


QuestToggle = Tabs.Fish:AddToggle({
    Name = "Auto Complete Quest",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoQuestComplete = Value

        if Value then
            pcall(function()
                TryFinishFishingQuest()
            end)
        end
    end
})


task.spawn(function()
    while task.wait(5) do 
        if _G.AutoQuestComplete then
            pcall(function()
                if HasQuest3() then
                    TryFinishFishingQuest()
                end
            end)
        end
    end
end)


SellFishToggle = Tabs.Fish:AddToggle({
    Name = "Auto Sell Fish",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoSellFish = Value

        if Value then
            pcall(function()
                TrySellFish()
            end)
        end
    end
})


task.spawn(function()
    while task.wait(5) do 
        if _G.AutoSellFish then
            pcall(function()
                Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
            end)
        end
    end
end)


SpamSkillZ = Tabs.Fish:AddToggle({
Name = "Auto Spam Skill Z", 
Description = "",
Default = false,
Callback = function(Value)
    _G.AutoSkillZ = Value
end})


local ReplicatedStorage4 = game:GetService("ReplicatedStorage")
local RFJobToolAbilities4 = ReplicatedStorage4.Modules.Net:WaitForChild("RF/JobToolAbilities")

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoSkillZ then
            pcall(function()
                RFJobToolAbilities4:InvokeServer("Z", true)
            end)
        end
    end
end)

-- Fishing CFrame Save/Teleport
Tabs.Fish:AddSection({"CFrame"})

local SavedFishingCFrame = nil
local SavedFishingName = "Fishing Spot"

SaveFishingCFrameBtn = Tabs.Fish:AddButton({
    Name = "Save CFrame Here",
    Description = "Save current position for fishing",
    Callback = function()
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            SavedFishingCFrame = hrp.CFrame
            game.StarterGui:SetCore("SendNotification", {
                Title = "Fishing CFrame",
                Text = "Position saved: " .. SavedFishingName,
                Duration = 2
            })
        end
    end
})

TeleToSavedFishing = Tabs.Fish:AddToggle({
    Name = "Tele to Saved CFrame",
    Description = "Auto tween to saved fishing position",
    Default = false,
    Callback = function(Value)
        _G.TeleToSavedFishing = Value
        if Value and SavedFishingCFrame and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            shouldTween = true
            _tp(SavedFishingCFrame)
        end
    end
})

-- Auto tween loop - teleport ngay khi b?t toggle
task.spawn(function()
    while task.wait(1) do
        if _G.TeleToSavedFishing and SavedFishingCFrame and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            if (hrp.Position - SavedFishingCFrame.Position).Magnitude > 15 then
                _tpSmooth(SavedFishingCFrame) -- D闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰缂傚倷闄嶉崹铏光偓?h闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?tween ri闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰缂傚倷闄嶉崹铏光偓?
            end
        end
    end
end)

TravelDress = Tabs.Quests:AddToggle({
Name = "Auto Quest Sea 2", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TravelDres = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TravelDres then
        if plr.Data.Level.Value >= 700 then
          if workspace.Map.Ice.Door.CanCollide == true and workspace.Map.Ice.Door.Transparency == 0 then
            replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
		    EquipWeapon("Key")
		    repeat wait() _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488)) until not _G.TravelDres or (Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position)
	      elseif workspace.Map.Ice.Door.CanCollide == false and workspace.Map.Ice.Door.Transparency == 1 then
            if Enemies:FindFirstChild("Ice Admiral") then
              for _,xz in pairs(Enemies:GetChildren()) do
                if xz.Name == "Ice Admiral" and Attack.Alive(xz) then
              	  repeat task.wait() Attack.Kill(xz,_G.TravelDres) until _G.TravelDres == false or xz.Humanoid.Health <= 0
                  replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
              end
            else
              _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))
            end
	      else
		    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
	      end
        end
      end
    end)
  end
end)
Zou = Tabs.Quests:AddToggle({
Name = "Auto Quest Sea 3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoZou = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoZou then
   	    if plr.Data.Level.Value >= 1500 then
          if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
            if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
              replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
              if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                local v = GetConnectionEnemies("rip_indra")
                if v then
                  repeat wait() Attack.Kill(v,_G.AutoZou) until not _G.AutoZou or not v.Parent or v.Humanoid.Health <= 0
                  Check = 2
                  repeat wait()replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")until Check == 1                   
                else
                  replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Check") wait(.1)
                  replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Begin")
                end
              elseif replicated.Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
                replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
              else
                local v = GetConnectionEnemies("Don Swan")
                if v then
                  repeat wait() Attack.Kill(v,_G.AutoZou)until not _G.AutoZou or not v.Parent or v.Humanoid.Health<=0                  
                else
                  repeat wait() _tp(CFrame.new(2288.802, 15.1870775, 863.034607)) until not _G.AutoZou or (Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position)
                  if (Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607)) then notween(CFrame.new(2288.802, 15.1870775, 863.034607)) end
                end
              end
            else
            if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
              TabelDevilFruitStore = {}
              TabelDevilFruitOpen = {}
              for i,v in pairs(replicated.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                for i1,v1 in pairs(v) do
                  if i1 == "Name" then table.insert(TabelDevilFruitStore,v1)end
                end
              end
              for i,v in next, game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
                if v.Price >= 1000000 then table.insert(TabelDevilFruitOpen,v.Name) end
              end
              for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
                  if DevilFruitOpenDoor == DevilFruitStore and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                    if not plr.Backpack:FindFirstChild(DevilFruitStore) then
                      replicated.Remotes.CommF_:InvokeServer("F_","LoadFruit",DevilFruitStore)
                    else
                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
                    end
                  end
                end
              end
                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
              end
            end
          else
            if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
              if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then                
                local v = GetConnectionEnemies("Swan Pirate")
                if v then
                  pcall(function() repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false or plr.PlayerGui.Main.Quest.Visible == false end)                    
                else
                  _tp(CFrame.new(1057.92761, 137.614319, 1242.08069))
                end
              else
                _tp(CFrame.new(-456.28952, 73.0200958, 299.895966))
              end
            elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
              local v = GetConnectionEnemies("Jeremy")
              if v then
                repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false
              else
                _tp(CFrame.new(2099.88159, 448.931, 648.997375))
              end
            elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
              repeat wait() _tp(CFrame.new(-1836, 11, 1714)) until not _G.AutoZou or (Root.Position == CFrame.new(-1836, 11, 1714).Position)
              if (Root.CFrame == CFrame.new(-1836, 11, 1714)) then notween(CFrame.new(-1836, 11, 1714))end
              notween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
              wait(.1)
              notween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
              wait(.1)
              notween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
              wait(.1)
              notween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
              wait(.1)
              notween(CFrame.new(-1869.54224, 15.987854, 1681.00659))
              wait(.1)
              notween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
              wait(.1)
              notween(CFrame.new(-1819.26343, 14.795166, 1717.90625))
              wait(.1)
              notween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
            end
          end
        end
      end
    end)
  end
end)




Tabs.Quests:AddSection({"Tushita + Yama"})

Q = Tabs.Quests:AddToggle({
Name = "Auto Tushita Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Tushita = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Tushita then
        if workspace.Map.Turtle:FindFirstChild("TushitaGate") then
          if not GetBP("Holy Torch") then
            _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
            wait(0.7)
          else
            EquipWeapon("Holy Torch")
            task.wait(1)
            repeat task.wait() _tp(CFrame.new(-10752, 417, -9366)) until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-11672, 334, -9474)) until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-12132, 521, -10655)) until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-13336, 486, -6985)) until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-13489, 332, -7925)) until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
          end
        else
          local v = GetConnectionEnemies("Longma")
          if v then repeat task.wait() Attack.Kill(v,_G.Auto_Tushita) until v.Humanoid.Health <= 0 or not _G.Auto_Tushita or not v.Parent
          else 
          if replicated:FindFirstChild("Longma") then _tp(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0,40,0)) end
          end                     
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Yama Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Yama = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Yama then
	    if replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
	      _G.FarmEliteHunt = true
	    elseif replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30 then
	      _G.FarmEliteHunt = false
	      if (workspace.Map.Waterfall.SealedKatana.Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
            _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
            local zx = GetConnectionEnemies("Ghost")
            if zx then
              repeat wait() Attack.Kill(zx,_G.Auto_Yama) until zx.Humanoid.Health <= 0 or not zx.Parent or not _G.Auto_Yama               
			  fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
            end
          end
	    end
      end
    end)
  end
end)

Tabs.Quests:AddSection({"Cursed Dual Katana"})
CheckCDK = Tabs.Quests:AddParagraph({
Title = " Number Cursed dual katana quests ",
Content = "Quest Numbers :"})
spawn(function()  
  while wait(.2) do 
    if QuestYama_1 == true then 
	 CheckCDK:SetDesc(" Quest Numbers : yama quest 1") 
    elseif QuestYama_2 == true then
	  CheckCDK:SetDesc(" Quest Numbers : yama quest 2") 
    elseif QuestYama_3 == true then
	  CheckCDK:SetDesc(" Quest Numbers : yama quest 3") 
    elseif QuestTushita_1 == true then
	  CheckCDK:SetDesc(" Quest Numbers : tushita quest 1") 
    elseif QuestTushita_2 == true then
	  CheckCDK:SetDesc(" Quest Numbers : tushita quest 2") 
    elseif QuestTushita_1 == true then
	  CheckCDK:SetDesc(" Quest Numbers: tushita quest 2") 
	elseif GetWP("Cursed Dual Katana") then
	  CheckCDK:SetDesc(" Quest Numbers: CDK done!!")
    end 
  end
end) 
Q = Tabs.Quests:AddToggle({
Name = "Auto Get CDK [ Last Quest ]", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CDK = Value
end})
spawn(function()    
  while wait(Sec) do
    pcall(function()
      if _G.CDK then
        replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
        replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
        replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Boss")
        local v = GetConnectionEnemies("Cursed Skeleton Boss")
        if v then
          repeat wait()
            if plr.Character:FindFirstChild("Yama") or plr.Backpack:FindFirstChild("Yama") then EquipWeapon("Yama")
            elseif plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then EquipWeapon("Tushita")                                    
            end _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
          until not _G.CDK or not v.Parent or v.Humanoid.Health <= 0                                
        else
          _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375)) wait(.5)
          _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Yama CDK", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CDK_YM = Value
end})
spawn(function()
  while wait() do
    pcall(function()
      if _G.CDK_YM then
        if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then                  
          replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
          replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        else
          if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
          elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then                        
            if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -3 then
              QuestYama_1 = true QuestYama_2 = false QuestYama_3 = false
              repeat task.wait()
                if not workspace.Enemies:FindFirstChild("Forest Pirate") then
                  _tp(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
                else
                  local v = GetConnectionEnemies("Forest Pirate")
                  if v then _tp(workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)end
                end
              until tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 1 or not _G.CDK_YM
            elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -4 then
              QuestYama_1 = false QuestYama_2 = true QuestYama_3 = false
              for ix,HitMon in pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren()) do
                for NameMonHaze, CFramePos in pairs(PosMsList) do
                  if string.find(NameMonHaze,HitMon.Name) and HitMon.Value > 0 then
                    if (CFramePos.Position - Root.Position).Magnitude <= 1000 and workspace.Enemies:FindFirstChild(NameMonHaze) then
                      for i,v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HazeESP") then
                          repeat wait() Attack.Kill(v, _G.CDK_YM) until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 2 or not v:FindFirstChild("HazeESP") or v.Humanoid.Health <= 0
                        end
                      end
                    else   
                      _tp(CFramePos)                               
                    end
                  end
                end
              end
            elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
              QuestYama_1 = false QuestYama_2 = false QuestYama_3 = true
              if workspace.Map:FindFirstChild("HellDimension") then
                if (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
                  for gg,ez in pairs(workspace.Map.HellDimension.Exit:GetChildren()) do
                    if tonumber(gg) == 2 then
                      repeat task.wait() Root.CFrame = workspace.Map.HellDimension.Exit.CFrame until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                    end
                  end
                  EquipWeapon(_G.SelectWeapon)
                  if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) ~= 3 then
                  repeat task.wait()
                    repeat task.wait() 
                      _tp(workspace.Map.HellDimension.Torch1.Particles.CFrame) 
                      for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                      end
                    until (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5
                    wait(2) _G.T1Yama = true
                  until not _G.CDK_YM or _G.T1Yama or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                  repeat task.wait()
                    repeat task.wait()
                      _tp(workspace.Map.HellDimension.Torch2.Particles.CFrame) 
                      for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then fireproximityprompt(v)end
                      end
                    until (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5
                    wait(2) _G.T2Yama = true
                  until _G.T2Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                    repeat wait()
                      repeat task.wait() 
                        _tp(workspace.Map.HellDimension.Torch3.Particles.CFrame) 
                        for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
                          if v:IsA("ProximityPrompt") then fireproximityprompt(v)end
                        end
                      until (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5 
                      wait(2) _G.T3Yama = true
                    until _G.T3Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                  end
                  for i,v in pairs(workspace.Enemies:GetChildren()) do
                    if (v:FindFirstChild("HumanoidRootPart").Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 then
                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        repeat task.wait() Attack.Kill(v,_G.CDK_YM) until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end)
  end
end)
spawn(function()
  while wait() do
    pcall(function()
      if _G.CDK_YM then
        if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
          if not workspace.Map:FindFirstChild("HellDimension") or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000 then
            local v = GetConnectionEnemies("Soul Reaper")
            if v then repeat task.wait()_tp(v.HumanoidRootPart.CFrame) until v.Humanoid.Health <= 0 or not _G.CDK_YM or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3 or (workspace.Map:FindFirstChild("HellDimension") and (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000)
            elseif plr.Backpack:FindFirstChild("Hallow Essence") or plr.Character:FindFirstChild("Hallow Essence") then
            repeat _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) task.wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8
            EquipWeapon("Hallow Essence")
            elseif replicated:FindFirstChild("Soul Reaper") and replicated:FindFirstChild("Soul Reaper").Humanoid.Health > 0 then
              _tp(replicated:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
            else
              if replicated.Remotes.CommF_:InvokeServer("Bones","Check") < 50 and not workspace.Enemies:FindFirstChild("Soul Reaper") and not replicated:FindFirstChild("Soul Reaper") and not workspace.Map:FindFirstChild("HellDimension") then
                if workspace.Enemies:FindFirstChild("Reborn Skeleton") or workspace.Enemies:FindFirstChild("Living Zombie") or workspace.Enemies:FindFirstChild("Domenic Soul") or workspace.Enemies:FindFirstChild("Posessed Mummy") then
                  for i,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        repeat task.wait() Attack.Kill(v,_G.CDK_YM)until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent
                      end
                    end
                  end
                else
                  _tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
                end
              else
                replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
              end
            end
          end
        end
      end
    end)
  end
end)

Q = Tabs.Quests:AddToggle({
Name = "Auto Tushita CDK", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CDK_TS = Value
end})
spawn(function()
  while wait() do
    pcall(function()
      if _G.CDK_TS then
        if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
          wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
          wait(.3) replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        else
          if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
          elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then
            if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -3 then
              QuestTushita_1 = true
              QuestTushita_2 = false
              QuestTushita_3 = false
              repeat wait() _tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)) until (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
              if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
              end
                wait(1) repeat wait() _tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)) until (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
                if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                end
                  wait(1) repeat wait() _tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)) until (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
                  if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                    wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                    wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                  end
                  wait(1)
                  elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -4 then
                    QuestTushita_1 = false
                    QuestTushita_2 = true
                    QuestTushita_3 = false
                    repeat wait()
                      _G.AutoRaidCastle = true
                    until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 2 
                      _G.AutoRaidCastle = false         
                  elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -5 then
                    QuestTushita_1 = false
                    QuestTushita_2 = false
                    QuestTushita_3 = true
                    if workspace.Enemies:FindFirstChild("Cake Queen") then
                      for i,v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name == "Cake Queen" then
                          if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat wait()
                              Attack.Kill(v, _G.CDK_TS)
                            until not _G.CDK_TS or not v.Parent or v.Humanoid.Health <= 0 or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
                          end
                        end
                      end
                     elseif replicated:FindFirstChild("Cake Queen") and replicated:FindFirstChild("Cake Queen").Humanoid.Health > 0 then
                       _tp(replicated:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                     else
                   if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
                     for i,v in pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren()) do
                       Ex = i
                     end
                     if Ex == 2 then
                       repeat wait()
                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame
                       until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
                    end
                   repeat wait()
                     repeat wait() 
                       _tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625)) 
                       for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
                         if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                       end
                     until (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                     wait(2)
                    _G.DoneT1 = true
                  until not _G.CDK_TS or _G.DoneT1
                  repeat wait()
                    repeat wait()
                      _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875)) 
                       for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
                         if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                       end
                    until (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2) _G.DoneT2 = true
                  until _G.DoneT2 or _G.CDK_TS == false
                  repeat wait()
                    repeat task.wait() 
                      _tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375)) 
                      for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                      end
                    until (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2) _G.DoneT3 = true
                  until _G.DoneT3 or _G.CDK_TS == false
                  for i,v in pairs(workspace.Enemies:GetChildren()) do
                    if (v:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 then
                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        repeat wait()
                          Attack.Kill(v, _G.CDK_TS)
                        until not _G.CDK_TS or v.Humanoid.Health <= 0 or not v.Parent                      
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end)
  end
end)
Tabs.Quests:AddSection({"True Triple Katana Sword"})
Tabs.Quests:AddButton({
Name = "Buy Legendary Sword",
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
end})
Tabs.Quests:AddButton({
Name = "Buy True Triple Katana Sword", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("MysteriousMan","2")
end})
Q = Tabs.Quests:AddToggle({
Name = "Tween to Legendary Sword Dealer", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Tp_LgS = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Tp_LgS then
	  pcall(function()
	    for _,v in pairs(replicated.NPCs:GetChildren()) do
	      if v.Name == "Legendary Sword Dealer " then _tp(v.HumanoidRootPart.CFrame) end
        end   	   
	  end)
    end
  end
end)

Tabs.Quests:AddSection({"Pole / God Enal's"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Pole V1", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoPole = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoPole then
      pcall(function()
        local v = GetConnectionEnemies("Thunder God")
	    if v then
          repeat task.wait() Attack.Kill(v, _G.AutoPole) until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0
        else
          _tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Pole V2 [Beta]", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoPoleV2 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoPoleV2 then        
	   if not GetBP("Pole (1st Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (1st Form)") end
	   if not GetBP("Pole (2nd Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (2nd Form)") end      
	   if GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value <= 179 then _G.Level = true elseif GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value >= 180 then _G.Level = false end	   
	   if not GetBP("Rumble Fruit") then return end
	   if GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("F") then
	     _G.SelectChip = nil
		 _G.Raiding = false
		 _G.Auto_Awakener = false
		if plr.Data.Fragments.Value >= 5000 then
          replicated.Remotes.CommF_:InvokeServer("Thunder God", "Talk") wait(Sec)
          replicated.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
        end
        elseif replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == nil or replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == 0 then
          _G.SelectChip = "Rumble"
          local Buying = replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
          if Buying then Buying:Stop() end
          _G.Raiding = true
          _G.Auto_Awakener = true
	    end	   
      end
    end)
  end
end)

Tabs.Quests:AddSection({"Items Law/Order Sword"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Law Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoLawKak = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoLawKak then
      pcall(function()
        local v = GetConnectionEnemies("Order")
        if v then repeat task.wait() Attack.Kill(v, _G.AutoLawKak) until _G.AutoLawKak == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
        end
      end)
    end
  end
end)
Tabs.Quests:AddButton({
Name = "Buy Microchip Law", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
end})
Tabs.Quests:AddButton({
Name = "Start Law Raids", 
Description = "",
Callback = function()
  fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end})

Tabs.Quests:AddSection({"East Blue Misc"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Saw Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSaw = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.AutoSaw then
        local v = GetConnectionEnemies("The Saw")
        if v then repeat task.wait() Attack.Kill(v, _G.AutoSaw)until _G.AutoSaw == false or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Saber Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSaber = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.AutoSaber and plr.Data.Level.Value >= 200 and not plr.Backpack:FindFirstChild("Saber") and not plr.Character:FindFirstChild("Saber") then
        if workspace.Map.Jungle.Final.Part.Transparency == 0 then
	      if workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
		    if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
		      _tp(plr.Character.HumanoidRootPart.CFrame)
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
	    	  wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
		      wait(0.5) 
		    else
		      _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
		    end
	      else
		    if workspace.Map.Desert.Burn.Part.Transparency == 0 then
		      if plr.Backpack:FindFirstChild("Torch") or plr.Character:FindFirstChild("Torch") then
		        EquipWeapon("Torch")
		        firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,0)
			    firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,1)
		   	    _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
		      else
		        _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))                    end
		      else
		        if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
		          replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
			      wait(0.5)
			      EquipWeapon("Cup")
			      wait(0.5)
			      replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",plr.Character.Cup)
			      wait(Sec)
			      replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
		        else
		 	      if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
			        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
		          elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
			        if workspace.Enemies:FindFirstChild("Mob Leader") or replicated:FindFirstChild("Mob Leader") then
			          _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
			         for i,v in pairs(workspace.Enemies:GetChildren()) do
				       if v.Name == "Mob Leader" and Attack.Alive(v) then
				       repeat task.wait() Attack.Kill(v, _G.AutoSaber)until v.Humanoid.Health <= 0 or _G.AutoSaber == false
				       end
				     end
			       end
			     elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
			       replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
				   EquipWeapon("Relic")
				  _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
				 end
			   end
			 end
		   end
		 else
	     if workspace.Enemies:FindFirstChild("Saber Expert") or replicated:FindFirstChild("Saber Expert") then
	       for _,v in pairs(workspace.Enemies:GetChildren()) do
		     if v.Name == "Saber Expert" and Attack.Alive(v) then
			   repeat task.wait() Attack.Kill(v, _G.AutoSaber) until v.Humanoid.Health <= 0 or _G.AutoSaber == false
		       if v.Humanoid.Health <= 0 then replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic") end		      
		      end
		    end
		  else
		    _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
	      end
	    end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Cybrog", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoColShad = Value
end})
spawn(function()
  while wait(.2) do
    if _G.AutoColShad then
      pcall(function()
        local v = GetConnectionEnemies("Cyborg")
	    if v then repeat task.wait()Attack.Kill(v, _G.AutoColShad)until _G.AutoColShad == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Usoap's Hat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoGetUsoap = Value
end})
spawn(function()
  while task.wait(Sec) do
    pcall(function()
      if _G.AutoGetUsoap then
	   for _, v in pairs(workspace.Characters:GetChildren()) do
          if v.Name ~= plr.Name then
            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 230 then
              repeat task.wait() EquipWeapon(_G.SelectWeapon) _tp(v.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2)) until _G.AutoGetUsoap == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
            end
          end
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Bisento V2", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Greybeard = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Greybeard then
      pcall(function()
        if not GetWP("Bisento") then
          replicated.Remotes.CommF_:InvokeServer("BuyItem","Bisento")
        elseif GetWP("Bisento") then
          replicated.Remotes.CommF_:InvokeServer("LoadItem","Bisento")
          local v = GetConnectionEnemies("Greybeard")
          if v then repeat wait() Attack.Kill(v,_G.Greybeard)until _G.Greybeard == false or not v.Parent or v.Humanoid.Health <= 0
          else _tp(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
          end
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Warden Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.WardenBoss = Value
end})
spawn(function()
  while wait(.1) do
    if _G.WardenBoss then
      pcall(function()
        local v = GetConnectionEnemies("Chief Warden")
        if v then repeat wait() Attack.Kill(v,_G.WardenBoss) until _G.WardenBoss == false or not v.Parent or v.Humanoid.Health <= 0 
        else _tp(CFrame.new(5206.92578,0.997753382,814.976746,0.342041343,-0.00062915677,0.939684749,0.00191645394,0.999998152,-2.80422337e-05,-0.939682961,0.00181045406,0.342041939))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Marine Coat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.MarinesCoat = Value
end})
spawn(function()
  while wait(.1) do
    if _G.MarinesCoat then
      pcall(function()
        local v = GetConnectionEnemies("Vice Admiral")
        if v then repeat wait() Attack.Kill(v, _G.MarinesCoat) until _G.MarinesCoat == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Swan Coat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SwanCoat = Value
end})
spawn(function()
  while wait(.1) do
    if _G.SwanCoat then
      pcall(function()
        local v = GetConnectionEnemies("Swan")
        if v then repeat wait()Attack.Kill(v, _G.SwanCoat)until _G.SwanCoat == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
        end
      end)
    end
  end
end)

Tabs.Quests:AddSection({"Rengoku Sword"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Rengoku Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.IceBossRen = Value
end})
spawn(function()
  pcall(function()
    while wait(.1) do
      if _G.IceBossRen then
        local v = GetConnectionEnemies("Awakened Ice Admiral")
        if v then repeat task.wait()Attack.Kill(v,_G.IceBossRen)until _G.IceBossRen == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
        end
      end
    end
  end)
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Key Rengoku", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.KeysRen = Value
end})
spawn(function()
  while wait(.1) do
    pcall(function()
      if _G.KeysRen then
        if plr.Backpack:FindFirstChild(RenMon[3]) or plr.Character:FindFirstChild(RenMon[3]) then
          EquipWeapon(RenMon[3]) wait(.1)
          _tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
        else
          local v = GetConnectionEnemies(RenMon)
          if v then repeat task.wait() Attack.Kill(v,_G.KeysRen)until plr.Backpack:FindFirstChild(RenMon[3]) or _G.KeysRen == false or not v.Parent or v.Humanoid.Health <= 0
          else _tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
          end
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Dragon Trident", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoTridentW2 = Value
end})
spawn(function()
  while wait(.1) do
    pcall(function()
      if _G.AutoTridentW2 then
        local v = GetConnectionEnemies("Tide Keeper")
        if v then repeat task.wait() Attack.Kill(v,_G.AutoTridentW2)until _G.AutoTridentW2 == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Long Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.LongsWord = Value
end})
spawn(function()
  while wait(.1) do
    pcall(function()
      if _G.LongsWord then
        local v = GetConnectionEnemies("Diamond")
        if v then repeat task.wait() Attack.Kill(v,_G.LongsWord)until _G.LongsWord == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Black Spikey", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.BlackSpikey = Value
end})
spawn(function()
  while wait(.1) do
    if _G.BlackSpikey then
      pcall(function()
        local v = GetConnectionEnemies("Jeremy")
        if v then repeat wait() Attack.Kill(v, _G.BlackSpikey)until _G.BlackSpikey == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Dark Blade V3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DarkBladev3 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.DarkBladev3 and World2 then
      if not GetBP("Dark Blade") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Dark Blade") end
        if GetBP("Fist of Darkness") > 1 then
          if not workspace.Enemies:FindFirstChild("Darkbeard") then
            _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
          elseif GetConnectionEnemies("Darkbeard") and GetBP("Fist of Darkness") >= 1 then
            repeat wait() _tp(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375)) until not _G.DarkBladev3 or (Root.Position == CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375).Position)
            fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
          end         
        else
          _G.AutoFarmChest = true;
        end        
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Midnight Blade", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoEcBoss = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoEcBoss then
	    if GetM("Ectoplasm") >= 99 then
	      replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 3)	   
	    elseif GetM("Ectoplasm") <= 99 then
	      local v = GetConnectionEnemies("Cursed Captain")
	      if v then repeat wait()Attack.Kill(v, _G.AutoEcBoss) until not _G.AutoEcBoss or not v.Parent or v.Humanoid.Health <= 0
	      else
	        replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) wait(.5)
	        _tp(CFrame.new(916.928589, 181.092773, 33422))
	      end
	    end	
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Darkbeard", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Def_DarkCoat = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Auto_Def_DarkCoat then
      pcall(function()
        if GetBP("Fist of Darkness") and not workspace.Enemies:FindFirstChild("Darkbeard") then          
          _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
        elseif GetConnectionEnemies("Darkbeard") then
          local v = GetConnectionEnemies("Darkbeard")          
		  if v then repeat wait()Attack.Kill(v,_G.Auto_Def_DarkCoat)until _G.Auto_Def_DarkCoat == false or not v.Parent or v.Humanoid.Helath <= 0 end
        elseif not GetBP("Fist of Darkness") and not GetConnectionEnemies("Darkbeard") then
          repeat wait(.1) _G.AutoFarmChest = true until not _G.Auto_Def_DarkCoat or GetBP("Fist of Darkness") or GetConnectionEnemies("Darkbeard") _G.AutoFarmChest = false
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Unlocked DonSwan", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_DonAcces = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Auto_DonAcces then
      pcall(function()
        if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil and plr.Data.Level.Value >= 1500 then
          FruitPrice = {}
	      FruitStore = {}
		  for i,v in next,replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
		    if v.Price >= 1000000 then  
		     table.insert(FruitPrice,v.Name)
		    end
		  end
		  for i,v in pairs(replicated.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
		    for _,x in pairs(v) do
		      if _ == "Name" then 
		        table.insert(FruitStore,x)
		      end
	        end
	          replicated.Remotes.CommF_:InvokeServer("Cousin","Buy")
	          for _,y in pairs(FruitPrice) do
		        for _,z in pairs(FruitStore) do
		          if y == z and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
		            _G.StoreF = false
			      if not plr.Backpack:FindFirstChild(FruitStore) then
			        replicated.Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))
			      else
			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","1")
			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","2")
			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","3")
			      end
			    end
		      end 
		    end
		    if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
		      _G.StoreF = true
		      _G.Auto_DonAcces = false
		    end
	      end
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Swan Glasses", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_SwanGG = Value
end})
spawn(function()
  while wait(.2) do
    if _G.Auto_SwanGG then
      pcall(function()
        local v = GetConnectionEnemies("Don Swan")
        if v then repeat wait() Attack.Kill(v,_G.Auto_SwanGG)until _G.Auto_SwanGG == false or not v.Parent or v.Humanoid.Health <= 0
	    else _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
        end
      end)
    end
  end
end)

Tabs.Quests:AddSection({"Cavender + Twin Hooks + Bigmom"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Bigmom", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoBigmom = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoBigmom then
      pcall(function()
        local bx = GetConnectionEnemies("Cake Queen")
        if bx then repeat task.wait() Attack.Kill(bx, _G.AutoBigmom) until not _G.AutoBigmom or not bx.Parent or bx.Humanoid.Health <= 0
        else _tp(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Canvendish Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Cavender = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Cavender then
        local v = GetConnectionEnemies("Beautiful Pirate")
	    if v then repeat wait() Attack.Kill(v,_G.Auto_Cavender)until not _G.Auto_Cavender or v.Humanoid.Health <= 0
	    else _tp(CFrame.new(5283.609375,22.56223487854,-110.78285217285))
	    end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Twin Hooks", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TwinHook = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TwinHook then
        local v = GetConnectionEnemies("Captain Elephant")
	    if v then repeat wait()Attack.Kill(v,_G.TwinHook)until not _G.TwinHook or v.Humanoid.Health <= 0
	    else
          replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)) wait(.2)
          _tp(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))
	    end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Serpent Bow", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSerpentBow = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoSerpentBow then
      local v = GetConnectionEnemies("Hydra Leader")
      if v then	repeat wait() Attack.Kill(v,_G.AutoSerpentBow)until not _G.AutoSerpentBow or not v.Parent or v.Humanoid.Health <= 0
	  else _tp(CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547))
      end
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Lei Accessory", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoKilo = Value
end})
spawn(function()
  while wait(.2) do
    if _G.AutoKilo then
      pcall(function()
        local v = GetConnectionEnemies("Kilo Admiral")
        if v then repeat task.wait()Attack.Kill(v,_G.AutoKilo)until not _G.AutoKilo or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))
        end
      end)
    end
  end
end)

Tabs.Quests:AddSection({"Buso/Aura Colours"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Teleport Barista Cousin", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Tp_MasterA = Value
end})
spawn(function()
  while wait() do
    if _G.Tp_MasterA then
	  pcall(function()
	    for _,v in pairs(replicated.NPCs:GetChildren()) do
	    if v.Name == "Barista Cousin" then _tp(v.HumanoidRootPart.CFrame) end
        end   	   
	 end)
    end
  end
end)
Tabs.Quests:AddButton({
Name = "Buy Buso Colors", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("ColorsDealer","2")
end})
Q = Tabs.Quests:AddToggle({
Name = "Auto Rainbow Colors", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Rainbow_Haki = Value
end})
spawn(function()
  pcall(function()
    while wait(Sec) do
      if _G.Auto_Rainbow_Haki then
        if plr.PlayerGui.Main.Quest.Visible == false then
          if _G.GetQFast then
            if plr.PlayerGui.Main.Quest.Visible == false then replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet") end     
          else
            Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
            if (plr.Character.HumanoidRootPart.CFrame ~= Rainbow1) then
              _tp(Rainbow1)
            elseif (plr.Character.HumanoidRootPart.CFrame == Rainbow1) then
              wait(1)
              replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet")
            end
          end
          elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
            local v = GetConnectionEnemies("Stone")
            if v then
              repeat wait() Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
            end
          elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
            local v = GetConnectionEnemies("Hydra Leader")
            if v then
              repeat task.wait()Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
              local framelong1 = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
              local framelong2 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
              if (plr.Character.HumanoidRootPart.CFrame.Position == framelong1) then _tp(framelong2)end
            end
          elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
            local v = GetConnectionEnemies("Kilo Admiral")
            if v then
              repeat task.wait()Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
            end
            elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
              local v = GetConnectionEnemies("Captain Elephant")
              if v then
                repeat task.wait() Attack.Kill(v,_G.Auto_Rainbow_Haki)until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
              else
              local gamergayror1 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
              local gamergayror2 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
              if (plr.Character.HumanoidRootPart.CFrame.Position ~= gamergayror1) then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
              elseif (plr.Character.HumanoidRootPart.CFrame.Position == gamergayror1) then
                _tp(gamergayror2)
              end
            end
        elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
          local v = GetConnectionEnemies("Captain Elephant")
          if v then
            repeat task.wait() Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
          else
            replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
          end
        end                  
      end
    end    
  end)
end)
Q = Tabs.Quests:AddToggle({
Name = "Accept Rainbow Quest Faster", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.GetQFast = Value
end})

Tabs.Quests:AddSection({"Instinct / Observation"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Farm Observation", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.obsFarm = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.obsFarm then        
        replicated.Remotes.CommE:FireServer("Ken",true)
        if plr:GetAttribute("KenDodgesLeft") == 0 then
          KenTest = false
        elseif plr:GetAttribute("KenDodgesLeft") > 0 then
          replicated.Remotes.CommE:FireServer("Ken",true)
          KenTest = true
        end        
      end
    end)
  end
end)    
spawn(function()      
  while wait(.2) do
    pcall(function()
      if _G.obsFarm then
        if World1 then
          if workspace.Enemies:FindFirstChild("Galley Captain") then
            if KenTest then
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
          end
        elseif World2 then
          if workspace.Enemies:FindFirstChild("Lava Pirate") then
            if KenTest then
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
          end
        elseif World3 then
          if workspace.Enemies:FindFirstChild("Venomous Assailant") then
            if KenTest then
              repeat wait()
                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0,50,0))
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
          end
        end        
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Observation V2", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoKenVTWO = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoKenVTWO then
      pcall(function()
      local Kv2Pos1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
      local Kv2Pos2 = "Kuy"
      local Kv2Pos3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
      local Kv2Pos4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
      local Kv2Pos5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
	  if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
	    local v = GetConnectionEnemies("Forest Pirate")
        if v then
	      repeat wait() Attack.Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
	    else
	      _tp(Kv2Pos4)
	    end
	  elseif plr.PlayerGui.Main.Quest.Visible == true then 
	    local v = GetConnectionEnemies("Captain Elephant")
	    if v then
          repeat wait() Attack.Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
	    else
	      _tp(Kv2Pos5)
	    end
	  elseif plr.PlayerGui.Main.Quest.Visible == false then
	    replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") wait(.1)
	    replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
	  end
	  if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
	    _tp(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
	  end
	  if not plr.Backpack:FindFirstChild("Fruit Bowl") or not plr.Character:FindFirstChild("Fruit Bowl") then
	  if not GetBP("Fruit Bowl") then   	    
	    if not GetBP("Apple") then
	      replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Apple" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end
	    elseif not GetBP("Banana") then
	      _tp(CFrame.new(2286.0078125,73.13391876220703,-7159.80908203125))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Banana" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end	    
	    elseif not GetBP("Pineapple") then
	      _tp(CFrame.new(-712.8272705078125,98.5770492553711,5711.9541015625))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Pineapple" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end	    
	    end	  
	  end  	    	    
	    if plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple") or plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple") then
	      repeat wait() _tp(Kv2Pos1) until _G.AutoKenVTWO or plr.Character.HumanoidRootPart.CFrame == Kv2Pos1
		  replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")	    			 
	    end
	      if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
	        if plr.Character.HumanoidRootPart.CFrame ~= Kv2Pos3 then _tp(Kv2Pos3)
		    elseif plr.Character.HumanoidRootPart.CFrame == Kv2Pos3 then
		      replicated.Remotes.CommF_:InvokeServer("KenTalk2","Start") wait(.1)
		      replicated.Remotes.CommF_:InvokeServer("KenTalk2","Buy")
	        end			 		    
	      end
	    end
      end)
    end
  end
end)



Bartilo = Tabs.Quests:AddToggle({
Name = "Auto Done Bartilo Quest", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Bartilo_Quest = Value
end})
spawn(function()
  while wait(.1) do    
    pcall(function()
      if _G.Bartilo_Quest and Lv >= 850 then
      local Qbart = plr.PlayerGui.Main.Quest
        if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
          _G.Level = false
          if Qbart.Visible == true then
            local v = GetConnectionEnemies("Swan Pirate")
            if v then
              local x = GetConnectionEnemies(BartMon)
              if x then
                repeat task.wait()
                  if not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate")then replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                  else Attack.Kill(x,_G.Bartilo_Quest)end
                until _G.Bartilo_Quest == false or not x.Parent or x.Humanoid.Health <= 0 or Qbart.Visible == false or not x:FindFirstChild("HumanoidRootPart")                  
              end
            else
              _tp(CFrame.nee(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468))
            end
          else
            repeat wait() 
              _tp(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312))
            until (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 20 or _G.Bartilo_Quest == false
            if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 then
              replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest",1)
            end
          end
          elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
            _G.Level = false
            local je = GetConnectionEnemies("Jeremy")
            if je then
              repeat task.wait() Attack.Kill(je,_G.Bartilo_Quest) until _G.Bartilo_Quest == false or not je.Parent or je.Humanoid.Health <= 0 or Qbart.Visible == false or not je:FindFirstChild("HumanoidRootPart")                  
            else
              _tp(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-09, -0.656645238, -4.47752875e-08, 1, 4.50709301e-08, 0.656645238, 6.3393955e-08, -0.754199564))
            end
          elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
          repeat wait() _tp(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456))until (CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 or _G.Bartilo_Quest == false
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
          wait(2.5)
        end
      end
    end)
  end
end)
CitizenQ = Tabs.Quests:AddToggle({
Name = "Auto Done Citizen Quest", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CitizenQuest = Value
end})
spawn(function()	
  while wait(Sec) do
    pcall(function()
      if _G.CitizenQuest then
        if Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
          if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
            local v = GetConnectionEnemies("Forest Pirate")
            if v then
              repeat task.wait() Attack.Kill(v,_G.CitizenQuest)until _G.CitizenQuest == false or not v.Parent or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
            end
          else
            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - plr.Character.HumanoidRootPart.Position).Magnitude <= 30 then
              wait(1.5) replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
            end
          end
        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
          local v = GetConnectionEnemies("Captain Elephant")
          if plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and plr.PlayerGui.Main.Quest.Visible == true then
            if v then
              repeat task.wait() Attack.Kill(v,_G.CitizenQuest) until _G.CitizenQuest == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
            end
          else
            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4 then
              wait(1.5)
              replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
            end
          end
        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
          _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Training Dummy", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DummyMan = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.DummyMan then
      pcall(function()
        if plr.PlayerGui.Main.Quest.Visible == false then	
          local xxx = {[1] = "ArenaTrainer"}
	      replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(xxx))
        else
          local v = GetConnectionEnemies("Training Dummy")
          if v then
		    repeat wait() Attack.Kill(v,_G.DummyMan) until not _G.DummyMan or not v.Parent or v.Humanoid.Health <= 0
	      else
	        _tp(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
	      end
	    end
      end)
    end
  end
end)




Tabs.Quests:AddSection({"Dark Dragger + Valkyrie"})
Q = Tabs.Quests:AddToggle({
Name = "Auto Valkyrie", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoRipIngay = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoRipIngay then
        local v = GetConnectionEnemies("rip_indra")
	    if not GetWP("Dark Dagger") or not GetIn("Valkyrie") and v then
	      repeat wait() Attack.Kill(v,_G.AutoRipIngay)until not _G.AutoRipIngay or not v.Parent or v.Humanoid.Health <= 0
        else
          replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
		  wait(.1)_tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
	    end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Unlocked Puzzle", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoUnHaki = Value
end})
AuraSkin = function(HakiID)
  local args = {[1] = {["StorageName"] = HakiID,["Type"] = "AuraSkin",["Context"] = "Equip"}};
  replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack(args));
end;
VaildColor = function(Part)
  if Part and Part.BrickColor then return (tostring(Part.BrickColor) == "Lime green") end;
end;
HakiCalculate = function(Part)
  local ID = {["Really red"] = "Pure Red";["Oyster"] = "Snow White";["Hot pink"] = "Winter Sky";};
  if Part and Part.BrickColor then return (ID[tostring(Part.BrickColor)])end;
end;
spawn(function()
  while wait(Sec) do
    if _G.AutoUnHaki then
      pcall(function()
        local Summoner = workspace.Map["Boat Castle"]:FindFirstChild("Summoner");
        if Summoner and Summoner:FindFirstChild("Circle") then 
          for i,v in pairs(Summoner:FindFirstChild("Circle"):GetChildren()) do 
            if v.Name == "Part" then 
            local TogglesPart = v:FindFirstChild("Part");
              if VaildColor(TogglesPart) == false then 
                AuraSkin(HakiCalculate(v));
                repeat wait() _tp(v.CFrame) until VaildColor(TogglesPart) == true or not _G.AutoUnHaki;
              end
            end            
          end
        end        
      end)
    end
  end
end)

Tabs.Quests:AddSection({"Fighting Melee Styles"})
SuperHuman = Tabs.Quests:AddToggle({
Name = "Auto Superhuman", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_SuperHuman = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_SuperHuman then
      local M_Beli = plr.Data.Beli.Value
	  local M_Frag = plr.Data.Fragments.Value
        if plr:FindFirstChild("WeaponAssetCache") then
          if not GetBP("Superhuman") then                    
            if not GetBP("Black Leg") then
            if (M_Beli >= 150000) then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
            elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then _G.Level = true elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then _G.Level = false end                        
            if not GetBP("Electro") then
            if (M_Beli >= 500000) then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end
            elseif GetBP("Electro") and GetBP("Electro").Level.Value < 299 then _G.Level = true elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then _G.Level = false end                        
            if not GetBP("Fishman Karate") then
            if (M_Beli >= 750000) then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
            elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then _G.Level = true elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then _G.Level = false end                        
            if not GetBP("Dragon Claw") then
            if (M_Frag >= 1500) then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end
            elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then _G.Level = true elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then _G.Level = false end
            replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")          
          end
        end        
      end
    end)
  end
end)
DeathStep = Tabs.Quests:AddToggle({
Name = "Auto DeathStep", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoDeathStep = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoDeathStep then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then  
          if not GetBP("Death Step") then          
            if not GetBP("Black Leg") then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
            if GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") _G.Level = false elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 399 then _G.Level = true end
            if GetBP("Black Leg") or GetBP("Black Leg").Level.Value >= 400 then
            if workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then            
              if GetBP("Library Key") then repeat wait() _tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) until not _G.AutoDeathStep or (Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position)
		        if (Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") end     
		        elseif not GetBP("Library Key") then
		          local v = GetConnectionEnemies("Awakened Ice Admiral")
		          if v then	repeat wait() Attack.Kill(v,_G.AutoDeathStep) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoDeathStep == false or GetBP("Library Key") or GetBP("Death Step")
	              else _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
	              end
		        end		    
              end
            end          
          end
        end
      end)
    end
  end
end)
SharkManV2 = Tabs.Quests:AddToggle({
Name = "Auto Sharkman Karate", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_SharkMan_Karate = Value
end})
spawn(function() 
  while wait(Sec) do
    if _G.Auto_SharkMan_Karate then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then  
          if not GetBP("Sharkman Karate") then          
            if not GetBP("Fishman Karate") then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
            if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate") _G.Level = false elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 399 then _G.Level = true end
            if GetBP("Fishman Karate") or GetBP("Fishman Karate").Level.Value >= 400 then           
              if GetBP("Water Key") then
		        if string.find(replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
			      if GetBP("Water Key") then
			        repeat wait() _tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)) until not _G.Auto_SharkMan_Karate or (Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position)
	                replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
		          end
		        end
		      elseif not GetBP("Water Key") then
		        local v = GetConnectionEnemies("Tide Keeper")
		        if v then repeat wait() Attack.Kill(v,_G.Auto_SharkMan_Karate)until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_SharkMan_Karate == false or GetBP("Water Key") or GetBP("Sharkman Karate")		
	            else _tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
	            end
		      end		                  
            end          
          end
        end
      end)
    end
  end
end)
ElectricClaw = Tabs.Quests:AddToggle({
Name = "Auto ElectricClaw", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Electric_Claw = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Auto_Electric_Claw then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then 
        if not GetBP("Electro") then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end        
          if GetBP("Electro") and GetBP("Electro").Level.Value >= 400 then
            if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then notween(CFrame.new(-12548, 337, -7481)) end
            replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
          elseif GetBP("Electro") and GetBP("Electro").Level.Value < 400 then
            repeat _G.AutoFarm_Bone = true wait() until not _G.Auto_Electric_Claw or GetBP("Electric Claw") _G.AutoFarm_Bone = false
          end
        end       
      end)
    end
  end
end)
DragonTalon = Tabs.Quests:AddToggle({
Name = "Auto DragonTalon", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoDragonTalon = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoDragonTalon then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then 
        if not GetBP("Dragon Claw") then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end        
          if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
          elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 400 then repeat _G.AutoFarm_Bone = true wait() until not _G.AutoDragonTalon or GetBP("Dragon Talon") _G.AutoFarm_Bone = false
          end         
        end
      end)
    end
  end
end)
Godhuman = Tabs.Quests:AddToggle({
Name = "Auto Godhuman", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_God_Human = Value
end})
spawn(function()
  while wait() do
    pcall(function()
      if _G.Auto_God_Human then
        if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets." then
          if GetM("Dragon Scale") == false or GetM("Dragon Scale") < 10 then
            if World3 then
              Lv = 1575
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelZou")
            end
          elseif GetM("Fish Tail") == false or GetM("Fish Tail") < 20 then
            if World3 then
              Lv = 1775
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelZou")
            end
          elseif GetM("Mystic Droplet") == false or GetM("Mystic Droplet") < 10 then
            if World2 then
              Lv = 1425
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
          elseif GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
            if World2 then
              Lv = 1175
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end  
          end
        elseif replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == 3 then
          return nil
        else
          replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
        end
      end
    end)
  end
end)
SanguineArt = Tabs.Quests:AddToggle({
Name = "Auto SanguineArt", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Snaguine = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Snaguine then
      pcall(function()
        if not GetBP("Sanguine Art") then replicated.Remotes.CommF_:InvokeServer("Sanguine Art") end
        if not GetBP("Sanguine Art") then
          if GetM("Leviathan Heart") >= 1 then print("Completed!!")
          else
          if World3 then _G.DangerSc = "Lv Infinite" _G.SailBoats = true; else _G.SailBoats = false; end end
          if GetM("Vampire Fang") <= 19 then
            if World2 then
              local n = GetConnectionEnemies("Vampire")
              if n then repeat task.wait() Attack.Kill(n,_G.Snaguine) until not _G.Snaguine or n.Humanoid.Health <= 0 or not n.Parent
              else _tp(CFrame.new(-6041.29248046875, 6.402710914611816, -1304.63330078125))
              end
            else
              replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
          end                                      
          if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") <= 19 then
            if World3 then
              local n = GetConnectionEnemies("Demonic Soul")
		      if n then repeat task.wait() Attack.Kill(n,_G.Snaguine) until not _G.Snaguine or n.Humanoid.Health <= 0 or not n.Parent
              else _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
              end
             else
               replicated.Remotes.CommF_:InvokeServer("TravelZou")
             end
           end
           if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") >= 20 and GetM("Dark Fragment") <= 1 then
             if World2 then
               local n = GetConnectionEnemies("Darkbeard")
		       if n then repeat task.wait() Attack.Kill(black,_G.Snaguine) until _G.Snaguine or black.Humanoid.Health <= 0 or not black.Parent
		      else _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
		      end
		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
	        end
          end
        else replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
        end
      end)
    end
  end
end)

Tabs.Mirage:AddSection({"Mystic Island / Full Moon"})
FullMOOn = Tabs.Mirage:AddParagraph({
Title = " FullMoon Status ",
Content = ""})
Ismirage = Tabs.Mirage:AddParagraph({
Title = " Mirage Island Status ",
Content = ""})
spawn(function()
  while wait(.2) do
    if workspace.Map:FindFirstChild("MysticIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
      Ismirage:SetDesc(" Mirage Island : True")
    else
      Ismirage:SetDesc(" Mirage Island : False")
    end
  end
end)
spawn(function()
  while wait(.2) do
    pcall(function()
      moon8 = "http://www.roblox.com/asset/?id=9709150401"
      moon7 = "http://www.roblox.com/asset/?id=9709150086"
      moon6 = "http://www.roblox.com/asset/?id=9709149680"
      moon5 = "http://www.roblox.com/asset/?id=9709149431"
      moon4 = "http://www.roblox.com/asset/?id=9709149052"
      moon3 = "http://www.roblox.com/asset/?id=9709143733"
      moon2 = "http://www.roblox.com/asset/?id=9709139597"
      moon1 = "http://www.roblox.com/asset/?id=9709135895"
      moon = Getmoon()
      if moon == moon1 then
        FullMOOn:SetDesc("Moon : 0 / 8")
      elseif moon == moon2 then
        FullMOOn:SetDesc("Moon : 1 / 8")
      elseif moon == moon3 then
        FullMOOn:SetDesc("Moon : 2 / 8")
      elseif moon == moon4 then
        FullMOOn:SetDesc("Moon : 3 / 8 [ Next Night ]")
      elseif moon == moon5 then
        FullMOOn:SetDesc("Moon : 4 / 8 [ Full Moon ]")
      elseif moon == moon6 then
        FullMOOn:SetDesc("Moon : 5 / 8 [ Last Night ]")
      elseif moon == moon7 then
        FullMOOn:SetDesc("Moon : 6 / 8")
      elseif moon == moon8 then
        FullMOOn:SetDesc("Moon : 7 / 8")
      end
    end)
  end
end)
Q = Tabs.Mirage:AddToggle({
Name = "Auto Find Mirage Island", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FindMirage = Value
end})
spawn(function()
  while wait() do
    if _G.FindMirage then 
      pcall(function()
        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then                
          local myBoat = CheckBoat()
          if not myBoat then
            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(buyBoatCFrame)
            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
          else
            if plr.Character.Humanoid.Sit == false then
              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
              _tp(boatSeatCFrame)
            else            
              repeat wait()
                local targetDestination = CFrame.new(-10000000, 31, 37016.25)
                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                  _tp(CFrame.new(-10000000, 150, 37016.25))
                else
                  _tp(CFrame.new(-10000000, 31, 37016.25))
                end
              until not _G.FindMirage or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false
            end
          end
        else
          _tp(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,300,0))
        end
      end)
    end
  end
end)
Q = Tabs.Mirage:AddToggle({
Name = "Auto Tween To Highest Point", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.HighestMirage = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.HighestMirage then 
      pcall(function()
      if workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island",true) then _tp(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,400,0))end
      end)
    end
  end
end)
Q = Tabs.Mirage:AddToggle({
Name = "Auto Collect Gear", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TPGEAR = Value
end})
spawn(function()
  pcall(function()
    while wait(0.1) do
      if _G.TPGEAR then
        for i,v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
          if v.Name == "Part" then
            if v.ClassName == "MeshPart" then _tp(v.CFrame) end
          end
        end
      end
    end
  end)
end)
Q = Tabs.Mirage:AddToggle({
Name = "Change Transparency can see", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.can = Value
end})
spawn(function()
  pcall(function()
    while wait(Sec) do
      if _G.can then
        for i,v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
          if v.Name == "Part" then
            if v.ClassName == "MeshPart" then
              v.Transparency = 0
            else 
              v.Transparency = 1
            end
          end
        end
      end
    end
  end)
end)
Q = Tabs.Mirage:AddToggle({
Name = "Auto Tween Advanced Fruit Dealer", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Addealer = Value
end})
spawn(function()
  while wait() do
    if _G.Addealer then
	  pcall(function()
	    for _,v in pairs(replicated.NPCs:GetChildren()) do
	    if v.Name == "Advanced Fruit Dealer" then _tp(v.HumanoidRootPart.CFrame) end
        end   	   
	 end)
    end
  end
end)
Q = Tabs.Mirage:AddToggle({
Name = "Auto Collect Mirage Chest", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmChestM = Value
end})
spawn(function()
  while wait(.2) do
    if _G.FarmChestM then
      pcall(function()
        if workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest") or workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest") then
          local CollectionService = game:GetService("CollectionService")
          local Players = game:GetService("Players")
          local Player = Players.LocalPlayer
          local Character = Player.Character or Player.CharacterAdded:Wait()                
          if not Character then return end                
          local Position = Character:GetPivot().Position
          local Chests = CollectionService:GetTagged("_ChestTagged")      
          local Distance, Nearest = math.huge, nil  
          for i = 1, #Chests do
            local Chest = Chests[i]
            local Magnitude = (Chest:GetPivot().Position - Position).Magnitude        
            if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then
              if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then
                Distance = Magnitude
                Nearest = Chest
              end
            end
          end
        if Nearest then _tp(Nearest:GetPivot()) end
        end
      end)
    end
  end
end)

Tabs.Mirage:AddSection({"Skull Guitars / Misc"})
CheckSoul = Tabs.Mirage:AddParagraph({
Title = " Skull Guitar Quests ",
Content = ""})
spawn(function()
  while wait(.2) do
    pcall(function()
      if Quest1 == true then CheckSoul:SetDesc(" Quest Number : Quest1")
	  elseif Quest2 == true then CheckSoul:SetDesc(" Quest Number : Quest2")
	  elseif Quest3 == true then CheckSoul:SetDesc(" Quest Number : Quest3")
	  elseif Quest4 == true then CheckSoul:SetDesc(" Quest Number : Quest4")
	  elseif GetWP("Skull Guitar") then CheckSoul:SetDesc(" Quest Number : Collect!!")
	  else CheckSoul:SetDesc(" Quest Number : No Quest!!")
      end
    end)
  end
end)
Q = Tabs.Mirage:AddToggle({
Name = "Auto Skull Guitar", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Soul_Guitar = Value
end})
task.spawn(function()
  while wait() do
    if _G.Auto_Soul_Guitar then 
      pcall(function() 
        local v = GetConnectionEnemies("Living Zombie")
        if v then 
          v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
          v.Head.CanCollide = false
          v.Humanoid.Sit = false
          v.HumanoidRootPart.CanCollide = false
          v.Humanoid.JumpPower = 0
          v.Humanoid.WalkSpeed = 0
          if v.Humanoid:FindFirstChild('Animator') then v.Humanoid:FindFirstChild('Animator'):Destroy() end
        end    
      end)
    end
  end
end)
function getT(num)
    local rotation
    if num == 1 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
    elseif num == 3 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
    elseif num == 4 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
    elseif num == 7 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
    elseif num == 10 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
    end
    if rotation then
        return rotation.Z
    end
end
function getRT(num)
    local Trophy_Q = workspace.Map["Haunted Castle"].Trophies.Quest
    local Trophy_Pos
    for _, v in pairs(Trophy_Q:GetChildren()) do
        if num == 1 and v.Name == "Trophy1" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation
        elseif num == 2 and v.Name == "Trophy2" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation         
        elseif num == 3 and v.Name == "Trophy3" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation       
        elseif num == 4 and v.Name == "Trophy4" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation  
        elseif num == 5 and v.Name == "Trophy5" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation     
        end          
        if Trophy_Pos then
            return Trophy_Pos.Z   
        end
    end
end
GetFirePlacard = function(Number,Side)
  if tostring(workspace.Map["Haunted Castle"]["Placard"..Number][Side].Indicator.BrickColor) ~= "Pearl" then
    fireclickdetector(workspace.Map["Haunted Castle"]["Placard"..Number][Side].ClickDetector)
  end
end
spawn(function()
  repeat task.wait() until _G.Auto_Soul_Guitar
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Soul_Guitar then
        if World3 then
          replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
          replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
          if replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check") == nil then
            _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
            replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
            replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Swamp == false then
             Quest1 = true;
             Quest2 = false;
             Quest3 = false;
             Quest4 = false;
             local v = GetConnectionEnemies("Living Zombie")
             if v then repeat task.wait() Attack.Kill(v,_G.Auto_Soul_Guitar) until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
             else _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
             end
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Gravestones == false then
             Quest1 = false;
             Quest2 = true;
             Quest3 = false;
             Quest4 = false;
             GetFirePlacard("7","Left")
             GetFirePlacard("6","Left")
             GetFirePlacard("5","Left")
             GetFirePlacard("4","Right")
             GetFirePlacard("3","Left")
             GetFirePlacard("2","Right")
             GetFirePlacard("1","Right")
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Ghost == false then
             replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
             replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == false then
             Quest1 = false;
             Quest2 = false;
             Quest3 = true;
             Quest4 = false;             
             _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
             repeat wait()
               local z1 = getRT(1)
               local _z1 = getT(1)
               if z1 and _z1 then
                 fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
               end
             until z1 == _z1
            repeat wait()
              local z2 = getRT(2)
              local _z2 = getT(3)
              if z2 and _z2 then
                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
              end
            until z2 == _z2
          repeat wait()
            local z3 = getRT(3)
            local _z3 = getT(4)
            if z3 and _z3 then
              fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
            end
          until z3 == _z3
          repeat wait()
            local z4 = getRT(4)
            local _z4 = getT(7)
            if z4 and _z4 then
              fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
            end
          until z4 == _z4
        repeat wait()
          local z5 = getRT(5)
          local _z5 = getT(10)
          if z5 and _z5 then
            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))    
          end
        until z5 == _z5
        repeat wait()    
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))       
        until workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
          elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Pipes == false then
            Quest1 = false;
            Quest2 = false;
            Quest3 = false;
            Quest4 = true;
           _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
	   	   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
	       fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
	       fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
          end
        end
      end
    end)
  end
end)
Q = Tabs.Mirage:AddToggle({
Name = "Auto Farm Material Skull Guitar", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoMatSoul = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoMatSoul and GetWP("Skull Guitar") == false then
	    if GetM("Bones") >= 500 and GetM("Ectoplasm") >= 250 and GetM("Dark Fragment") >= 1 then
	      replicated.Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
		else
		  if GetM("Ectoplasm") <= 250 then
		    if _G.AutoMatSoul and World2 then
		      local EctoTable = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior"}    
		      local xz = GetConnectionEnemies(EctoTable)
              if xz then repeat task.wait() Attack.Kill(xz, _G.AutoMatSoul)until not _G.AutoMatSoul or not xz.Parent or xz.Humanoid.Health <= 0
			  else replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			  end
		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
		    end
		  elseif GetM("Dark Fragment") < 1 then
		    if _G.AutoMatSoul and World2 then
		      local black = GetConnectionEnemies("Darkbeard")
		      if black then repeat task.wait()Attack.Kill(black, _G.AutoMatSoul)until _G.AutoMatSoul or black.Humanoid.Health <= 0
		      else _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
		      end
		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
			end
		     if not GetConnectionEnemies("Darkbeard") then Hop() end
	         elseif GetM("Bones") <= 500 then
		       if _G.AutoMatSoul and World3 then
			     local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
			     local zx = GetConnectionEnemies(BonesTable)			   
	             if zx then repeat task.wait()Attack.Kill(zx, _G.AutoMatSoul)until not _G.AutoMatSoul or zx.Humanoid.Health <= 0 or not zx.Parent or zx.Humanoid.Health <= 0
				 else _tp(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
			   end
		     else
		       replicated.Remotes.CommF_:InvokeServer("TravelZou")
		     end
		   end
	     end
	   end
    end)
  end
end)
Tabs.Mirage:AddButton({
Name = "Talk With Stone", 
Description = "",
Callback = function()
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Begin")
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Check")
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Teleport")
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Continue")
end})
Q = Tabs.Mirage:AddToggle({
Name = "Auto Look At Moon", 
Description = "", 
Default = false,
Callback = function(Value)
  LookM = Value
end})
function MoveCamtoMoon()
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position,Lighting:GetMoonDirection() + plr.Character.HumanoidRootPart.CFrame.Position)
end
task.spawn(function()
  while task.wait() do
    if LookM then
      MoveCamtoMoon()
      wait(.1)
      replicated.Remotes.CommE:FireServer("ActivateAbility")
    end
  end
end)


Tabs.Race:AddSection({"Upgrade Races V3"})
RaceMink = Tabs.Race:AddToggle({
Name = "Auto Upgrade Mink V3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Mink = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Mink then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= 2 then
          if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
            replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
          elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
            if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
              _tp(workspace.Flower1.CFrame)
            elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
              _tp(workspace.Flower2.CFrame)
            elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
              local v = GetConnectionEnemies("Swan Pirate")
              if v then repeat wait() Attack.Kill(v,_G.Auto_Mink) until GetBP("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Mink == false
              else _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))end            
            end        
          elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
	        replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
	      end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
          replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
		  _G.AutoFarmChest = true
	    else
	      _G.AutoFarmChest = false
        end
      end
    end)
  end
end)
RaceHuman = Tabs.Race:AddToggle({
Name = "Auto Upgrade Human V3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Human = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Human then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
	     if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
		  replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
		elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
		  if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
		    _tp(workspace.Flower1.CFrame)
		  elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
		    _tp(workspace.Flower2.CFrame)
		  elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
		    local v = GetConnectionEnemies("Swan Pirate")
            if v then repeat wait() Attack.Kill(v,_G.Auto_Human) until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Human == false
		    else _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))end
		  end
		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
		    replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
		  end
		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
		    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
		  local v = GetConnectionEnemies(Human_v3_Mob[1])
          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           
	      else _tp(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))
		  end		      
		  local v = GetConnectionEnemies(Human_v3_Mob[2])
          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           
	      else _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
		  end		      
		  local v = GetConnectionEnemies(Human_v3_Mob[3])
          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           
          else _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
	      end		      		
        end
      end
    end)
  end
end)
RaceSky = Tabs.Race:AddToggle({
Name = "Auto Upgrade Skypiea V3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Skypiea = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Skypiea then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
	      if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
		    replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
		    if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
		      _tp(workspace.Flower1.CFrame)
		    elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
		      _tp(workspace.Flower2.CFrame)
		    elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
		      local v = GetConnectionEnemies("Swan Pirate")
		      if v then
			    repeat wait()Attack.Kill(v,_G.Auto_Skypiea)until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
		      else
		        _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
		      end
		    end
	      elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
            replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
          end
		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
	        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
	    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
	      for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= plr.Name and tostring(v.Data.Race.Value) == "Skypiea" then
		      repeat task.wait() _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,8,0) * CFrame.Angles(math.rad(-45),0,0))until v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
	        end
	      end
        end          
      end
    end)
  end
end)
RaceFish = Tabs.Race:AddToggle({
Name = "Auto Upgrade FishMan V3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Fish = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Fish then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
	      if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
		    replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
	        if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
		      _tp(workspace.Flower1.CFrame)
	        elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
	          _tp(workspace.Flower2.CFrame)
	        elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
	          local v = GetConnectionEnemies("Swan Pirate")
		      if v then
			    repeat wait()Attack.Kill(v,_G.Auto_Fish)until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Fish == false
	          else
		       _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
	          end
            end
	      elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
            replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
          end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
	      replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
	    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
          warn("Sea Beast Soon")
        end
      end
    end)
  end
end)


Tabs.Race:AddSection({"Trials Quest V4"})
CheckTier = Tabs.Race:AddParagraph({
Title = " Tiers V4 Status ",
Content = ""})
spawn(function()
  pcall(function()
    while wait(.2) do
      CheckTier:SetDesc(" Tiers - V4  :" .." "..plr.Data.Race.C.Value)
    end
  end)
end)
PullLv = Tabs.Race:AddToggle({
Name = "Auto Pull Lever", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Lver = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Lver then
      pcall(function()
        for x,c in pairs(workspace.Map["Temple of Time"]:GetDescendants()) do
        if c.Name == "ProximityPrompt" then fireproximityprompt(c,math.huge)end
        end
      end)
    end
  end
end)
Train = Tabs.Race:AddToggle({
Name = "Auto Train V4", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AcientOne = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AcientOne then
        local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
	    for i=1,#BonesTable do
          if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
            vim1:SendKeyEvent(true, "Y", false, game)
            replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
            _tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
	      elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
	        local v = GetConnectionEnemies(BonesTable)
	        if v then repeat wait() Attack.Kill(v, _G.AcientOne) until _G.AcientOne == false or v.Humanoid.Health <= 0 or not v.Parent
		    else _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
		    end
	      end
        end
      end
    end)
  end
end)
Tabs.Race:AddButton({
Name = "Teleport to Temple of Time", 
Description = "",
Callback = function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875,14896.544921875,102.625))
end})
Tabs.Race:AddButton({
Name = "Teleport to Ancient One", 
Description = "",
Callback = function()
  notween(CFrame.new(28981.552734375, 14888.4267578125, - 120.245849609375))
end})
Tabs.Race:AddButton({
Name = "Teleport to Ancient Clock", 
Description = "",
Callback = function()
  notween(CFrame.new(29549, 15069, -88))
end})
Doors = Tabs.Race:AddToggle({
Name = "Auto Teleport to Race Doors", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TPDoor = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TPDoor then
	    if tostring(plr.Data.Race.Value) == "Mink" then
          _tp(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
	    elseif tostring(plr.Data.Race.Value) == "Fishman" then
          _tp(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
	    elseif tostring(plr.Data.Race.Value) == "Cyborg" then
          _tp(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
	    elseif tostring(plr.Data.Race.Value) == "Skypiea" then
          _tp(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
	    elseif tostring(plr.Data.Race.Value) == "Ghoul" then
          _tp(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
	    elseif tostring(plr.Data.Race.Value) == "Human" then
          _tp(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
	    end
      end
    end)
  end
end)                   
Trials = Tabs.Race:AddToggle({
Name = "Auto Complete Trial Race", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Complete_Trials = Value
end})
GetSeaBeastTrial = function()
  if not workspace.Map:FindFirstChild("FishmanTrial") then return nil end
  if workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then FishmanTrial = workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") end
  if FishmanTrial then
    for _,v in next, workspace.SeaBeasts:GetChildren() do
      if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
      if v.Health.Value > 0 then return v end
      end
    end
  end
end
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Complete_Trials then
        if tostring(plr.Data.Race.Value) == "Mink" then
          notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-20,0))
	   end
      end
    end)
  end
end)
spawn(function()
  while wait(Sec) do
    pcall(function() 
      if _G.Complete_Trials then
	    if tostring(plr.Data.Race.Value) == "Fishman" then
	      if GetSeaBeastTrial() then            
            repeat task.wait()
              spawn(function()_tp(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300,GetSeaBeastTrial().HumanoidRootPart.Position.Z))end)
		      MousePos = GetSeaBeastTrial().HumanoidRootPart.Position
              Useskills("Melee","Z")
	          Useskills("Melee","X")
	          Useskills("Melee","C")
              wait(.1)
              Useskills("Sword","Z")
              Useskills("Sword","X")
              wait(.1)
              Useskills("Blox Fruit","Z")
              Useskills("Blox Fruit","X")
              Useskills("Blox Fruit","C")
              wait(.1)
              Useskills("Gun","Z")
              Useskills("Gun","X")
            until _G.Complete_Trials == false or not GetSeaBeastTrial()
          end          
	    end
      end
    end)
  end
end)
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Complete_Trials then
        if tostring(plr.Data.Race.Value) == "Cyborg" then
         _tp(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0,500,0))
   	   end
      end
    end)
  end
end)
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Complete_Trials then
        if tostring(plr.Data.Race.Value) == "Skypiea" then
          notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
  	   end
      end
    end)
  end
end)
spawn(function()
  while wait(.1) do   
    pcall(function()
      if _G.Complete_Trials then
	    if tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul" then	      
	      local TrialsTables = {"Ancient Vampire","Ancient Zombie"}
	      local v = GetConnectionEnemies(TrialsTables)
          if v then repeat wait() Attack.Kill(v, _G.Complete_Trials)until _G.Complete_Trials == false or not v.Parent or v.Humanoid.Health <= 0 end		
        end
      end
    end)
  end
end)
AutoKill = Tabs.Race:AddToggle({
Name = "Auto Kill Player After Trial", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Defeating = Value
end})
spawn(function()
  while task.wait(Sec) do
    pcall(function()
      if _G.Defeating then
	    for _, v in pairs(workspace.Characters:GetChildren()) do
          if v.Name ~= plr.Name then
            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 250 then
              repeat task.wait() EquipWeapon(_G.SelectWeapon) _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,0,15)) sethiddenproperty(plr, "SimulationRadius", math.huge)until _G.Defeating == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
            end
          end
        end
      end
    end)
  end
end)

Tabs.Drago:AddSection({"Dojo Quest & Drago Race"})
DojoQ = Tabs.Drago:AddToggle({
Name = "Auto Dojo Trainer", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Dojoo = Value
end})
function printBeltName(data) if type(data) == "table" and data.Quest["BeltName"] then return data.Quest["BeltName"] end end
spawn(function()
  while wait(Sec) do
    if _G.Dojoo then
      pcall(function()
        local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "RequestQuest"}}        
        local progress = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
        local NameBelt = printBeltName(progress)
        if debug == false and not progress and not NameBelt then
          _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
          debug = true
        elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
          if NameBelt == "White" then
            local v = GetConnectionEnemies("Skull Slayer")
            if v then repeat task.wait() Attack.Kill(v, _G.Dojoo) until not progress or not _G.Dojoo or not Attack.Alive(v)
            else _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
            end
          elseif NameBelt == "Yellow" then
            repeat task.wait()
              _G.SeaBeast1 = true
              _G.TerrorShark = true
              _G.Shark = true
              _G.Piranha = true
              _G.MobCrew = true
              _G.FishBoat = true
              _G.SailBoats = true
            until not _G.Dojoo or not progress
            _G.SeaBeast1 = false
            _G.TerrorShark = false
            _G.Shark = false
            _G.Piranha = false
            _G.MobCrew = false
            _G.FishBoat = false
            _G.SailBoats = false               
          elseif NameBelt == "Green" then
            repeat task.wait()
              _G.SailBoats = true
            until not _G.Dojoo or not progress
            _G.SailBoats = false
          elseif NameBelt == "Purple" then
            repeat task.wait()
              _G.FarmEliteHunt = true
            until not _G.Dojoo or not progress
            _G.FarmEliteHunt = false
          elseif NameBelt == "Red" then
            repeat task.wait()
              _G.SailBoats = true
              _G.FishBoat = true
            until not _G.Dojoo or not progress
            _G.SailBoats = false
            _G.FishBoat = false                      
          elseif NameBelt == "Black" then
            repeat task.wait()              
              if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then    
                _G.Prehis_Find = true                   
                if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt",true) then
                  _G.Prehis_Skills = false
                  _G.Prehis_Find = true
                else
                  _G.Prehis_Skills = true
                  _G.Prehis_Find = false
                end
              else
                _G.Prehis_Find = true
                _G.Prehis_Skills = false
              end
            until not _G.Dojoo or not progress
            _G.Prehis_Find = false
            _G.Prehis_Skills = false                        
          elseif NameBelt == "Orange" or NameBelt == "Blue" then
            return nil
          end
        end
        if not progress then
          debug = false
          local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "ClaimQuest"}}
          replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
        end
      end)
    end
  end
end)
BlazeEM = Tabs.Drago:AddToggle({
Name = "Auto Dragon Hunter", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmBlazeEM = Value
end})
checkQuesta=function()local a={[1]={["Context"]="Check"}}local b=nil;pcall(function()local c={[1]={["Context"]="RequestQuest"}}game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(c))end)local d,e=pcall(function()b=game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(a))end)local f=false;local g;local h;local i;if b then if b.Text then f=true;local j=b.Text;if string.find(tostring(j),"Defeat")then i=1;g=string.sub(tostring(j),8,9)g=tonumber(g)local k={"Hydra Enforcer","Venomous Assailant"}for l,m in pairs(k)do if string.find(j,m)then h=m;break end end elseif string.find(tostring(j),"Destroy")then g=10;i=2;h=nil end end end;return f,h,g,i end
BackTODoJo=function()for a,b in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren())do if b.Name=="NotificationTemplate"then if string.find(b.Text,"Head back to the Dojo to complete more tasks")then return true end end end;return false end
DragonMobClear=function(a,b,c)if workspace.Enemies:FindFirstChild(b)then for d,e in pairs(workspace.Enemies:GetChildren())do if e.Name==b and Attack.Alive(e)then if a then Attack.Kill(e,a)end end end else _tp(c)end end
spawn(function()
  while wait() do 
    if _G.FarmBlazeEM then
      pcall(function()              
        local a,v,h,x = checkQuesta()                  
        if a == true and not BackTODoJo() then
          if x == 1 then
            if v == "Hydra Enforcer" or v == "Venomous Assailant" then            
              repeat wait()
                DragonMobClear(true, v, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
              until not _G.FarmBlazeEM or not a or BackTODoJo()                            
            end      
          elseif x == 2 then
            if workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
              repeat wait()                
                spawn(function() _tp(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4,0,0)) end)
                if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
                MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
                Useskills("Melee","Z")
	            Useskills("Melee","X")
	            Useskills("Melee","C")
                wait(.5)
                Useskills("Sword","Z")
                Useskills("Sword","X")
                wait(.5)
                Useskills("Blox Fruit","Z")
                Useskills("Blox Fruit","X")
                Useskills("Blox Fruit","C")
                wait(.5)
                Useskills("Gun","Z")
                Useskills("Gun","X")
                end
              until not _G.FarmBlazeEM or not a or BackTODoJo()
            end
          end
        else
          _tp(CFrame.new(5813, 1208, 884))
          DragonMobClear(false, nil, nil) 
        end
      end)
    end
  end
end)
spawn(function()
  while wait(.1) do 
    if _G.FarmBlazeEM then
      pcall(function()              
        if workspace.EmberTemplate:FindFirstChild("Part") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame        
        end
      end)
    end
  end
end)

Tabs.Drago:AddSection({"Drago Trial"})
GetQuestDracoLevel = function()
  local v371 = {[1] = {NPC = "Dragon Wizard",Command = "Upgrade"}};
  return replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371))
end
Toggle = Tabs.Drago:AddToggle({
Name = "Tween To Upgrade Droco Trial", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.UPGDrago = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.UPGDrago then     
        if GetQuestDracoLevel() == false then
          return nil
        elseif GetQuestDracoLevel() == true then
          if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
          else
            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
            local v371 = {[1] = {NPC = "Dragon Wizard",Command = "Upgrade"}};
            replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
          end
        end
      end
    end)
  end
end)
Toggle = Tabs.Drago:AddToggle({
Name = "Auto Drago (V1)", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DragoV1 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.DragoV1 then     
        if GetM("Dragon Egg") <= 0 then
        repeat wait()
          _G.Prehis_Find = true
          _G.Prehis_Skills = true
          _G.Prehis_DE = true
        until not _G.DragoV1 or GetM("Dragon Egg") >= 1
          _G.Prehis_Find = false
          _G.Prehis_Skills = false
          _G.Prehis_DE = false
        end
      end
    end)
  end
end)
fireflower = Tabs.Drago:AddToggle({
Name = "Auto Drago (V2)", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoFireFlowers = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoFireFlowers then
      local FireFlower = workspace:FindFirstChild("FireFlowers")
      local v = GetConnectionEnemies("Forest Pirate")
      if v then repeat wait() Attack.Kill(v,_G.AutoFireFlowers) until not _G.AutoFireFlowers or not v.Parent or v.Humanoid.Health <= 0 or FireFlower
      else _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
      end      
      if FireFlower then
        for i, v in pairs(FireFlower:GetChildren()) do
          if (v:IsA("Model") and v.PrimaryPart) then
            local FlowerPos = v.PrimaryPart.Position;
            local playerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
            local Magnited = (FlowerPos - playerRoot).Magnitude;
            if (Magnited <= 100) then
              vim1:SendKeyEvent(true, "E", false, game) wait(1.5) vim1:SendKeyEvent(false, "E", false, game)
            else
              _tp(CFrame.new(FlowerPos));
            end
          end
        end
      end
    end
  end
end)
Toggle = Tabs.Drago:AddToggle({
Name = "Auto Drago (V3)", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DragoV3 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.DragoV3 then     
        repeat wait()
          _G.DangerSc = "Lv Infinite"
          _G.SailBoats = true
          _G.TerrorShark = true
        until not _G.DragoV3
        _G.DangerSc = "Lv 1"
        _G.SailBoats = false
        _G.TerrorShark = false
      end
    end)
  end
end)
Toggle = Tabs.Drago:AddToggle({
Name = "Auto Relic Drago Trial [Beta]", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Relic123 = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Relic123 then
      pcall(function()
        if workspace.Map:FindFirstChild("DracoTrial") then
          replicated.Remotes.DracoTrial:InvokeServer()                  
          wait(.5)
          repeat wait() _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375)) until not _G.Relic123 or (Root.Position == CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position)
          repeat wait() _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625)) until not _G.Relic123 or (Root.Position == CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position)
          wait(2.5)
          repeat wait() _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375)) until not _G.Relic123 or (Root.Position == CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position)
          repeat wait() _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375)) until not _G.Relic123 or (Root.Position == CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position)
          wait(2.5)
          repeat wait() _tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875)) until not _G.Relic123 or (Root.Position == CFrame.new(-39908.5, 10685.4052734375, 22990.04296875).Position)
          repeat wait() _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975)) until not _G.Relic123 or (Root.Position == CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position) 
        else
          local drago = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
          if drago and drago:IsA("Part") then _tp(CFrame.new(drago.Position)) end        
        end
      end)
    end
  end
end)
Toggle = Tabs.Drago:AddToggle({
Name = "Auto Train Drago v4", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TrainDrago = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TrainDrago then
        local DragoM = {"Venomous Assailant","Hydra Enforcer"}
	    for i=1,#DragoM do
          if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
            vim1:SendKeyEvent(true, "Y", false, game)
            replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy",2)
            _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
	      elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
	        local v = GetConnectionEnemies(DragoM)
	        if v then repeat wait() Attack.Kill(v, _G.TrainDrago) until _G.TrainDrago == false or v.Humanoid.Health <= 0 or not v.Parent                    		
		    else _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
		    end
	      end
        end
      end
    end)
  end
end)
dragoTpVolcano = Tabs.Drago:AddToggle({
Name = "Tween to Drago Trials", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TpDrago_Prehis = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.TpDrago_Prehis then
      local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
      if (v748 and v748:IsA("Part")) then _tp(CFrame.new(v748.Position)) end
    end
  end
end)
bdrago = Tabs.Drago:AddToggle({
Name = "Swap Drago Race", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.BuyDrago = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.BuyDrago then
      pcall(function()
        if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
          _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
        else
          _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
          local v371 = {[1] = {NPC = "Dragon Wizard",Command = "DragonRace"}};
          replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
        end
      end)
    end
  end
end)
UpTalon = Tabs.Drago:AddToggle({
Name = "Upgrade Dragon Talon With Uzoth", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DT_Uzoth = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.DT_Uzoth then
      local Uz_POS = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)
      _tp(Uz_POS)
      if (Uz_POS.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then
        local ohTable1 = {["NPC"] = "Uzoth",["Command"] = "Upgrade"}
        replicated.Modules.Net["RF/InteractDragonQuest"]:InvokeServer(ohTable1)
      end
    end
  end
end)

Tabs.Prehistoric:AddSection({"Volcanic Magnet"})

Toggle = Tabs.Prehistoric:AddToggle({
    Name = "Auto Craft Volcanic Magnet",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.CraftVM = Value
end})

Tabs.Prehistoric:AddButton({
    Name = "Craft Volcanic Magnet",
    Description = "",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Volcanic Magnet")
    end
})


local function AutoCraftVolcanicMagnet()
    replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Volcanic Magnet")
    task.wait(1.5) 
end


spawn(function()
    while task.wait(2) do
        pcall(function()
            if _G.CraftVM then
                AutoCraftVolcanicMagnet()
            end
        end)
    end
end)
Tabs.Prehistoric:AddSection({"Prehistoric Island"})
Check_Volcano = Tabs.Prehistoric:AddParagraph({
Title = " Prehistoric Island Status ",
Content = ""})
spawn(function()
  while wait(.2) do
    if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
      Check_Volcano:SetDesc(" Prehistoric Island : True")
    else
      Check_Volcano:SetDesc(" Prehistoric Island : False")
    end
  end
end)
Vocan = Tabs.Prehistoric:AddToggle({
Name = "Auto Find Prehistoric Island", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Prehis_Find = Value
end
})
local targetDestination = nil
spawn(function()
  while wait() do
    if _G.Prehis_Find then 
      pcall(function()
        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then                
          local myBoat = CheckBoat()
          if not myBoat then
            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(buyBoatCFrame)
            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
          else
            if plr.Character.Humanoid.Sit == false then
              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
              _tp(boatSeatCFrame)
            else                            
              repeat wait() 
                local targetDestination = CFrame.new(-10000000, 31, 37016.25)
                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                  _tp(CFrame.new(-10000000, 150, 37016.25))
                else
                  _tp(CFrame.new(-10000000, 31, 37016.25))
                end
              until not _G.Prehis_Find or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false
            end
          end
        else
          if (workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame)end
          if workspace.Map:FindFirstChild("PrehistoricIsland", true) or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then            
            if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
              if plr:DistanceFromCharacter(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame.Position) <= 150 then
                fireproximityprompt(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt, math.huge)
                vim1:SendKeyEvent(true, "E", false, game) wait(1.5) vim1:SendKeyEvent(false, "E", false, game)
              end
              _tp(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)              
            end
          end
        end
      end)
    end
  end
end)
Patch = Tabs.Prehistoric:AddToggle({
Name = "Auto Patch Prehistoric Event", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Prehis_Skills = Value
end
})
spawn(function()
  while wait() do
    if _G.Prehis_Skills then
      local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
      if prehistoricIsland then
        for _, obj in pairs(prehistoricIsland:GetDescendants()) do
        if obj:IsA("Part") and obj.Name:lower():find("lava") then obj:Destroy() end
        if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then obj:Destroy() end
        end
        local lavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
        if lavaModel and lavaModel:IsA("Model") then lavaModel:Destroy() end
        local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
        if Island then   
          local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")   
          for _, v in pairs(Island:GetDescendants()) do
            if v.Name == "TouchInterest" then
              if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                v.Parent:Destroy()
              end
            end
          end
        end  
      end
    end
  end
end)
spawn(function()
  while wait() do
    pcall(function()
      if _G.Prehis_Skills then
        if workspace.Enemies:FindFirstChild("Lava Golem") then
          local v = GetConnectionEnemies("Lava Golem")
          if v then repeat wait()Attack.Kill(v,_G.Prehis_Skills) v.Humanoid:ChangeState(15)until not _G.Prehis_Skills or not v.Parent or v.Humanoid.Health <= 0 end
        end
        for i,v in pairs(game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
          if v:FindFirstChild("VFXLayer") then
            if v:FindFirstChild("VFXLayer").At0.Glow.Enabled == true or v.VFXLayer.At0.Glow.Enabled == true then
              repeat wait()
                _tp(v.VFXLayer.CFrame)
                if v.VFXLayer.At0.Glow.Enabled == true and plr:DistanceFromCharacter(v.VFXLayer.CFrame.Position) <= 150 then
                  MousePos = v.VFXLayer.CFrame.Position
                  Useskills("Melee","Z") wait(.5)
          	      Useskills("Melee","X") wait(.5)
	              Useskills("Melee","C") wait(.5)
                  Useskills("Blox Fruit","Z") wait(.5)
                  Useskills("Blox Fruit","X") wait(.5)
                  Useskills("Blox Fruit","C")
                end   
              until not _G.Prehis_Skills or v:FindFirstChild("VFXLayer").At0.Glow.Enabled == false or v.VFXLayer.At0.Glow.Enabled == false            
            end
          end
        end
      end
    end)
  end
end)
Kaura = Tabs.Prehistoric:AddToggle({
    Name = "Kill Aura",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.KillAuraFull = Value
end})

local Range = 500
local Delay = 2   

spawn(function()
    while task.wait(Delay) do
        if _G.KillAuraFull then
            pcall(function()
                local plr = game.Players.LocalPlayer
                local char = plr.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                sethiddenproperty(plr, "SimulationRadius", math.huge)

                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                        local dist = (enemy.HumanoidRootPart.Position - hrp.Position).Magnitude
                        if dist <= Range and enemy.Humanoid.Health > 0 then
                            enemy.Humanoid.Health = 0
                            enemy.HumanoidRootPart.CanCollide = false
                            enemy:BreakJoints()
                        end
                    end
                end
            end)
        end
    end
end)
Vocan = Tabs.Prehistoric:AddToggle({
Name = "Auto Collect Dino Bones", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Prehis_DB = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Prehis_DB then
        if workspace:FindFirstChild("DinoBone") then
          for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "DinoBone" then _tp(v.CFrame) end
          end
        end
      end
    end)
  end
end)
Vocan = Tabs.Prehistoric:AddToggle({
Name = "Auto Collect Dragon Eggs", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Prehis_DE = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Prehis_DE then
      if workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then _tp(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame) fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30) end        
      end
    end)
  end
end)
Toggle = Tabs.Prehistoric:AddToggle({
Name = "Auto Reset When Complete Volcano", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.ResetPH = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.ResetPH then
        local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
        if (v748 and v748:FindFirstChild("TouchInterest")) then
          plr.Character.Humanoid.Health = 0 
        else
          if workspace:FindFirstChild("DinoBone") then
            for i,v in pairs(workspace:GetChildren()) do
              if v.Name == "DinoBone" then _tp(v.CFrame) end
            end
          end
        end
      end
    end)
  end
end)

Tabs.SeaEvent:AddSection({"Sea Event / Setting Sail"})
local ListSeaBoat={"Guardian","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop","Beast Hunter"}
local ListSeaZone={"Lv 1","Lv 2","Lv 3","Lv 4","Lv 5","Lv 6","Lv Infinite"}
SPYING = Tabs.SeaEvent:AddParagraph({
Title = " Spy Status ",
Content = ""})
spawn(function()
  while wait(.2) do
    pcall(function()
      local spycheck = string.match(replicated.Remotes.CommF_:InvokeServer("InfoLeviathan","1"),"%d+")
      if spycheck then SPYING:SetDesc(" Spy Leviathan  : "..tostring(spycheck))
        if tostring(spycheck) == 5 then
          SPYING:SetDesc(" Spy Leviathan : Already Done!!")
        end
      end
    end)
  end
end)
Tabs.SeaEvent:AddButton({
Name = "Buy Fracments with Spy", 
Description = "",
Callback = function()
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","2")
end})
FloD = Tabs.SeaEvent:AddParagraph({
Title = " FlozenDimension Status ",
Content = ""})
spawn(function()
  pcall(function()
    while wait(.2) do
      if workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
        FloD:SetDesc(' Flozen Dimension : True')
      else
        FloD:SetDesc(' Flozen Dimension : False')
      end
    end
  end)
end)
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Teleport Frozen Dimension", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FrozenTP = Value
end})
spawn(function()
  while wait(.1) do
    if _G.FrozenTP then
      pcall(function()
      if workspace.Map:FindFirstChild("LeviathanGate") then _tp(workspace.Map.LeviathanGate.CFrame) replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLeviathanGate") end
      end)
    end
  end
end)
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Drive To Hydra Island", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SailBoat_Hydra = Value
end})
spawn(function()
  while wait() do
    if _G.SailBoat_Hydra then 
      pcall(function()        
        local myBoat = CheckBoat()
        if not myBoat then
          local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
          TeleportToTarget(buyBoatCFrame)
          if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
        elseif myBoat then
          if plr.Character.Humanoid.Sit == false then
            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
            _tp(boatSeatCFrame)
          else                         
            repeat wait() 
              if CheckEnemiesBoat() or CheckPirateGrandBrigade() or CheckTerrorShark() then
                _tp(CFrame.new(5433, 150, 290))
              else
                _tp(CFrame.new(5433, 35, 290))
              end           
            until _G.SailBoat_Hydra==false or plr.Character:WaitForChild("Humanoid").Sit==false plr.Character.Humanoid.Sit = false
          end
        end
      end)
    end
  end
end)
Q = Tabs.SeaEvent:AddDropdown({
    Name = "Choose Boats",
	Options = ListSeaBoat,
	Default = false,
	Callback = function(Value)
        _G.SelectedBoat = Value
    end
})
Tabs.SeaEvent:AddButton({
Name = "Buy Boats", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyBoat",_G.SelectedBoat)
end})
Q = Tabs.SeaEvent:AddDropdown({
Name = "Choose Sea Level",
Options = ListSeaZone,
Default = false,
Callback = function(Value)
  _G.DangerSc = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Sail Boat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SailBoats = Value
end})
spawn(function()
  while wait() do
    if _G.SailBoats then 
      pcall(function()        
        local myBoat = CheckBoat()
        if not myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
          local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
          TeleportToTarget(buyBoatCFrame)
          if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
        elseif myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
          if plr.Character.Humanoid.Sit == false then
            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
            _tp(boatSeatCFrame)
          else                         
            if _G.DangerSc == "Lv 1" then CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
            elseif _G.DangerSc == "Lv 2" then CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
            elseif _G.DangerSc == "Lv 3" then CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
            elseif _G.DangerSc == "Lv 4" then CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
            elseif _G.DangerSc == "Lv 5" then CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
            elseif _G.DangerSc == "Lv 6" then CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
            elseif _G.DangerSc == "Lv Infinite" then CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
            end           
            repeat wait() 
              if (not _G.FishBoat and CheckEnemiesBoat()) or (not _G.PGB and CheckPirateGrandBrigade()) or (not _G.TerrorShark and CheckTerrorShark()) then
                _tp(CFrameSelectedZone * CFrame.new(0,150,0))
              else
                _tp(CFrameSelectedZone)
              end           
            until _G.SailBoats==false or(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)or CheckSeaBeast()and _G.SeaBeast1 or CheckEnemiesBoat()and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit==false plr.Character.Humanoid.Sit = false
          end
        end
      end)
    end
  end
end)
spawn(function()while wait(Sec)do pcall(function()for a,b in pairs(workspace.Boats:GetChildren())do for c,d in pairs(workspace.Boats[b.Name]:GetDescendants())do if d:IsA("BasePart")then if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then d.CanCollide=false else d.CanCollide=true end end end end end)end end)

Tabs.SeaEvent:AddSection({"Entity Sea Event"})

Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Shark", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Shark = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Piranha", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Piranha = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Terror Shark", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TerrorShark = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Fish Crew Member", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.MobCrew = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Haunted Crew Member", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.HCM = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Attack PirateGrandBrigade", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.PGB = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Attack Fish Boat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FishBoat = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Attack Sea Beast", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SeaBeast1 = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Attack Leviathan", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Leviathan1 = Value
end})
spawn(function()
  while wait() do
    pcall(function()	
      if _G.Shark then local a={"Shark"}if CheckShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.Shark)until _G.Shark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.TerrorShark then local a={"Terrorshark"}if CheckTerrorShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.KillSea(c,_G.TerrorShark)until _G.TerrorShark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.Piranha then local a={"Piranha"}if CheckPiranha()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.Piranha)until _G.Piranha==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.MobCrew then local a={"Fish Crew Member"}if CheckFishCrew()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.MobCrew)until _G.MobCrew==false or not c.Parent or c.Humanoid.Health<=0 end end end end end                 
      if _G.HCM then local a={"Haunted Crew Member"}if CheckHauntedCrew()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.HCM)until _G.HCM==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.SeaBeast1 then if workspace.SeaBeasts:FindFirstChild("SeaBeast1")then for a,b in pairs(workspace.SeaBeasts:GetChildren())do if b:FindFirstChild("HumanoidRootPart")and b:FindFirstChild("Health")and b.Health.Value>0 then repeat task.wait()spawn(function()_tp(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))end)if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position)<=500 then AitSeaSkill_Custom=b.HumanoidRootPart.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.SeaBeast1==false or not b:FindFirstChild("HumanoidRootPart")or not b.Parent or b.Health.Value<=0 end end end end
      if _G.Leviathan1 then if workspace.SeaBeasts:FindFirstChild("Leviathan")then for a,b in pairs(workspace.SeaBeasts:GetChildren())do if b:FindFirstChild("HumanoidRootPart")and b:FindFirstChild("Leviathan Segment")and b:FindFirstChild("Health")and b.Health.Value>0 then repeat task.wait()spawn(function()_tp(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))end)if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position)<=500 then MousePos=b:FindFirstChild("Leviathan Segment").Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.Leviathan1==false or not b:FindFirstChild("HumanoidRootPart")or not b.Parent or b.Health.Value<=0 end end end end
      if _G.FishBoat then if CheckEnemiesBoat()then for a,b in pairs(workspace.Enemies:GetChildren())do if b:FindFirstChild("Health")and b.Health.Value>0 and b:FindFirstChild("VehicleSeat")then repeat task.wait()spawn(function()if b.Name=="FishBoat"then _tp(b.Engine.CFrame*CFrame.new(0,-50,-25))end end)if plr:DistanceFromCharacter(b.Engine.CFrame.Position)<=150 then AitSeaSkill_Custom=b.Engine.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.FishBoat==false or not b:FindFirstChild("VehicleSeat")or b.Health.Value<=0 end end end end
      if _G.PGB then if CheckPirateGrandBrigade()then for a,b in pairs(workspace.Enemies:GetChildren())do if b:FindFirstChild("Health")and b.Health.Value>0 and b:FindFirstChild("VehicleSeat")then repeat task.wait()spawn(function()if b.Name=="PirateBrigade"then _tp(b.Engine.CFrame*CFrame.new(0,-30,-10))elseif b.Name=="PirateGrandBrigade"then _tp(b.Engine.CFrame*CFrame.new(0,-50,-50))end end)if plr:DistanceFromCharacter(b.Engine.CFrame.Position)<=150 then AitSeaSkill_Custom=b.Engine.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.PGB==false or not b:FindFirstChild("VehicleSeat")or b.Health.Value<=0 end end end end
    end)
  end
end)

Tabs.SeaEvent:AddSection({"Kitsune Island / Event"})
Check_Kitsu = Tabs.SeaEvent:AddParagraph({
Title = " Kitsune Island Status ",
Content = ""})
spawn(function()
  while wait(.2) do
    if workspace.Map:FindFirstChild("KitsuneIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
      Check_Kitsu:SetDesc(" Kitsune Island : True")
    else
      Check_Kitsu:SetDesc(" Kitsune Island : False")
    end
  end
end)
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Find Kitsune Island", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutofindKitIs = Value
end})
spawn(function()
  while wait() do
    if _G.AutofindKitIs then 
      pcall(function()
        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island", true) then                
          local myBoat = CheckBoat()
          if not myBoat then
            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(buyBoatCFrame)
            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
          else
            if plr.Character.Humanoid.Sit == false then
              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
              _tp(boatSeatCFrame)
            else
              local targetDestination = CFrame.new(-10000000, 31, 37016.25)              
              repeat wait() 
                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                  _tp(CFrame.new(-10000000, 150, 37016.25))
                else
                  _tp(CFrame.new(-10000000, 31, 37016.25))
                end
              until not _G.AutofindKitIs or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false
            end
          end
        else
          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame*CFrame.new(0,500,0))
        end
      end)
    end
  end
end)
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Teleport to Shrine Actived", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.tweenShrine = Value
end})
spawn(function()
  while wait(.1) do
    if _G.tweenShrine then
      pcall(function()
      local kit_is = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
      local shrineActive = kit_is:FindFirstChild("ShrineActive")
        if shrineActive then
          for _, v in next, shrineActive:GetDescendants() do
            if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
              replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
              repeat wait() _tp(v.CFrame * CFrame.new(0,2,0)) until _G.tweenShrine == false or not kit_is
            end
          end
        else
          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))        
        end
      end)
    end
  end
end)
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Collect Azure Ember", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Collect_Ember = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Collect_Ember then
      pcall(function()
        if workspace:WaitForChild("AttachedAzureEmber") or workspace:WaitForChild("EmberTemplate") then
        notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
        else
          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))        
          replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
        end
      end)
    end
  end
end)
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Trade Azure Ember", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Trade_Ember = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Trade_Ember then
      pcall(function()
        if workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island",true) then
          replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
        end
      end)
    end
  end
end)
Tabs.SeaEvent:AddButton({
Name = "Trade Items Azure", 
Description = "",
Callback = function()
  replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
end})
Tabs.SeaEvent:AddButton({
Name = "Talk with kitsune statue", 
Description = "",
Callback = function()
  replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
end})

Tabs.Raids:AddSection({"Fruits Options"})

RandomFF = Tabs.Raids:AddToggle({
Name = "Auto Random Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Random_Auto = Value
end})
spawn(function()
  while wait(Sec) do
   	pcall(function()
      if _G.Random_Auto then replicated.Remotes.CommF_:InvokeServer("Cousin","Buy") end 
    end)
  end
end)
DropF = Tabs.Raids:AddToggle({
Name = "Auto Drop Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DropFruit = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.DropFruit then
      pcall(function() DropFruits() end)
    end
  end
end)
StoredF = Tabs.Raids:AddToggle({
Name = "Auto Store Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.StoreF = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.StoreF then
      pcall(function() UpdStFruit() end)
    end
  end
end)
TwF = Tabs.Raids:AddToggle({
Name = "Auto Tween to Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TwFruits = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.TwFruits then
      pcall(function()
        for _,x1 in pairs(workspace:GetChildren()) do
	    if string.find(x1.Name, "Fruit") then _tp(x1.Handle.CFrame) end
	    end
      end)
    end
  end
end)
BringF = Tabs.Raids:AddToggle({
Name = "Auto Collect Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.InstanceF = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.InstanceF then
      pcall(function() collectFruits(_G.InstanceF) end)
    end
  end
end)

Tabs.Raids:AddSection({"Dungeon Event / Raiding"})
RaidS = Tabs.Raids:AddParagraph({
Title = " Raiding Status ",
Content = ""})
spawn(function()
  while wait(.2) do
    pcall(function()      
      if plr.PlayerGui.Main.Timer.Visible == true then
        RaidS:SetDesc(" Raiding Statud : True")
      else
        RaidS:SetDesc(" Raiding Statud : False")
      end      
    end)
  end
end)
DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}
Q = Tabs.Raids:AddDropdown({
Name = "Select Chip",
Description = "",
Options = DungeonTables,
Default = false,
Callback = function(Value)
  _G.SelectChip = Value
end})
Q = Tabs.Raids:AddToggle({
Name = "Auto Select Dungeon Chip", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSelectDungeon = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoSelectDungeon then
      pcall(function()
        if GetBP("Flame-Flame") then
          _G.SelectChip = "Flame"
        elseif GetBP("Ice-Ice") then
          _G.SelectChip = "Ice"
        elseif GetBP("Quake-Quake") then
          _G.SelectChip = "Quake"
        elseif GetBP("Light-Light") then
          _G.SelectChip = "Light"
        elseif GetBP("Dark-Dark") then
          _G.SelectChip = "Dark"
        elseif GetBP("String-String") then
          _G.SelectChip = "String"
        elseif GetBP("Rumble-Rumble") then
          _G.SelectChip = "Rumble"
         elseif GetBP("Magma-Magma") then
          _G.SelectChip = "Magma"
         elseif GetBP("Human-Human: Buddha Fruit") then
          _G.SelectChip = "Human: Buddha"
        elseif GetBP("Dough-Dough") then
          _G.SelectChip = "Dough"
        elseif GetBP("Sand-Sand") then
          _G.SelectChip = "Sand"
        elseif GetBP("Bird-Bird: Phoenix") then
          _G.SelectChip = "Bird: Phoenix"
        else
          _G.SelectChip = "Ice"
        end
      end)
    end
  end
end)
Tabs.Raids:AddButton({
Name = "Buy Dungeon Chips [Beli]", 
Description = "",
Callback = function()
  if not GetBP("Special Microchip") then replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip) end
end})
Tabs.Raids:AddButton({
Name = "Buy Dungeon Chips [Devil Fruit]", 
Description = "",
Callback = function()
  if GetBP("Special Microchip") then return end
  local FruitPrice = {}
  local FruitStore = {}
  for i,v in next,replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
    if v.Price <= 490000 then table.insert(FruitPrice,v.Name) end 
  end    
  for _,y in pairs(FruitPrice) do    
    for i,v in pairs(DungeonTables) do 
      if not GetBP("Special Microchip") then     
        replicated.Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))	      
	    replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)	
	  end            
    end    
  end
end})

Tabs.Raids:AddSection({"Raiding Menu"})
Q = Tabs.Raids:AddToggle({
Name = "Auto Start Raid", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_StartRaid = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_StartRaid then
        if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
          if GetBP("Special Microchip") then
            if World2 then
              _tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))
              fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
            elseif World3 then                   
              replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
              fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
            end
          end
        end
      end
    end)
  end
end)    

Raiding = Tabs.Raids:AddToggle({
    Name = "Auto Farm Raid + Next Island",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.Raiding = Value
end})

spawn(function()
    pcall(function()
        local locations = game:GetService("Workspace")["_WorldOrigin"].Locations
        local currentIsland = nil
        local islands = {"Island 1", "Island 2", "Island 3", "Island 4", "Island 5"}

        while task.wait(0.8) do
            if _G.Raiding and plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                local foundEnemies = false
                local nextIsland = nil

                -- ?? X闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡???nh ??o hi?n t?i (theo kho?ng c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰闂佷紮绲介懟顖炵嵁?g?n nh?t)
                local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    local closestDist = math.huge
                    for _, name in ipairs(islands) do
                        local loc = locations:FindFirstChild(name)
                        if loc then
                            local dist = (root.Position - loc.Position).Magnitude
                            if dist < closestDist then
                                closestDist = dist
                                currentIsland = name
                            end
                        end
                    end
                end

                -- ?? Farm to闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?b? qu闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?trong ??o hi?n t?i
                if currentIsland then
                    local islandPos = locations:FindFirstChild(currentIsland)
                    if islandPos then
                        for _, v in pairs(workspace.Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                local dist = (v.HumanoidRootPart.Position - islandPos.Position).Magnitude
                                if dist < 500 then
                                    foundEnemies = true
                                    repeat
                                        task.wait()
                                        Attack.Kill(v, _G.Raiding)
                                    until not _G.Raiding or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end

                -- ?? Khi kh?ng c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?qu闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?? ??o hi?n t?i 闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?ch?n ??o k? ti?p
                if not foundEnemies and currentIsland then
                    local currentIndex = table.find(islands, currentIsland)
                    if currentIndex and islands[currentIndex + 1] then
                        nextIsland = islands[currentIndex + 1]
                    end
                end

                -- ?? Teleport sang ??o k? ti?p n?u c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱?
                if nextIsland then
                    local nextLoc = locations:FindFirstChild(nextIsland)
                    if nextLoc then
                        _tp(nextLoc.CFrame * CFrame.new(0, 40, 100))
                        currentIsland = nextIsland
                        task.wait(1)
                    end
                end
            else
                currentIsland = nil
                task.wait(2)
            end
        end
    end)
end)

Q = Tabs.Raids:AddToggle({
Name = "Auto Awakening", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Awakener = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Awakener then
        replicated.Remotes.CommF_:InvokeServer("Awakener","Check")
        replicated.Remotes.CommF_:InvokeServer("Awakener","Awaken")
      end
    end)
  end
end)	




Tabs.Travel:AddSection({"Travel - Worlds"})

Tabs.Travel:AddButton({
Name = "Travel East Blue (World 1)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("TravelMain")
end})
Tabs.Travel:AddButton({
Name = "Travel Dressrosa (World 2)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end})
Tabs.Travel:AddButton({
Name = "Travel Zou (World 3)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("TravelZou")
end})
Tabs.Travel:AddSection({"Travel - Island"})
Location = {}
for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do  
  table.insert(Location ,v.Name)
end
Travelllll = Tabs.Travel:AddDropdown({
Name = "Select Travelling",
Description = "",
Options = Location,
Default = false,
Callback = function(Value)
  _G.Island = Value
end})
GoIsland = Tabs.Travel:AddToggle({
Name = "Auto Travel", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Teleport = Value
  if Value then
    for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do
      if v.Name == _G.Island then
        repeat wait()
	     _tp(v.CFrame * CFrame.new(0, 30, 0)) 
        until not _G.Teleport or Root.CFrame == v.CFrame
      end
    end
  end
end
})





Tabs.Shop:AddSection({"Shop Options"})
Tabs.Shop:AddButton({
Name = "Buy Buso", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Buso")
end})
Tabs.Shop:AddButton({
Name = "Buy Geppo", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
end})
Tabs.Shop:AddButton({
Name = "Buy Soru", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Soru")
end})
Tabs.Shop:AddButton({
Name = "Buy Ken", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("KenTalk","Buy")
end})

Tabs.Shop:AddSection({"Fighting - Style"})
Tabs.Shop:AddButton({
Name = "Buy Black Leg", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
end})
Tabs.Shop:AddButton({
Name = "Buy Electro", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyElectro")
end})
Tabs.Shop:AddButton({
Name = "Buy Fishman Karate", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
end})
Tabs.Shop:AddButton({
Name = "Buy DragonClaw", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
end})
Tabs.Shop:AddButton({
Name = "Buy Superhuman", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
end})
Tabs.Shop:AddButton({
Name = "Buy Death Step", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
end})
Tabs.Shop:AddButton({
Name = "Buy Sharkman Karate", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
end})
Tabs.Shop:AddButton({
Name = "Buy ElectricClaw", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
end})
Tabs.Shop:AddButton({
Name = "Buy DragonTalon", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
end})
Tabs.Shop:AddButton({
Name = "Buy Godhuman", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
end})
Tabs.Shop:AddButton({
Name = "Buy SanguineArt", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
end})

Tabs.Shop:AddSection({"Accessory"})
Tabs.Shop:AddButton({
Name = "Buy Tomoe Ring", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Tomoe Ring")
end})
Tabs.Shop:AddButton({
Name = "Buy Black Cape", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Black Cape")
end})
Tabs.Shop:AddButton({
Name = "Buy Swordsman Hat", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Swordsman Hat")
end})
Tabs.Shop:AddButton({
Name = "Buy Bizarre Rifle", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 1)
end})
Tabs.Shop:AddButton({
Name = "Buy Ghoul Mask", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 2)
end})

Tabs.Shop:AddSection({"Accessory SeaEvent"})
Tabs.Shop:AddButton({
Name = "Craft Dragonheart", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Dragonheart");
end})
Tabs.Shop:AddButton({
Name = "Craft Dragonstorm", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","Dragonstorm");
end})
Tabs.Shop:AddButton({
Name = "Craft DinoHood", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","DinoHood");
end})   
Tabs.Shop:AddButton({
Name = "Craft SharkTooth", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","SharkTooth");
end})   
Tabs.Shop:AddButton({
Name = "Craft TerrorJaw", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","TerrorJaw");
end})   
Tabs.Shop:AddButton({
Name = "Craft SharkAnchor", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","SharkAnchor");
end})   
Tabs.Shop:AddButton({
Name = "Craft LeviathanCrown", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanCrown");
end})   
Tabs.Shop:AddButton({
Name = "Craft LeviathanShield", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanShield");
end})   
Tabs.Shop:AddButton({
Name = "Craft LeviathanBoat", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LeviathanBoat");
end})   
Tabs.Shop:AddButton({
Name = "Craft LegendaryScroll", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","LegendaryScroll");
end})   
Tabs.Shop:AddButton({
Name = "Craft MythicalScroll", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CraftItem","Craft","MythicalScroll");
end})   

Tabs.Shop:AddSection({"Weapon World1"})
Tabs.Shop:AddButton({
Name = "Buy Cutlass", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
end})
Tabs.Shop:AddButton({
Name = "Buy Katana", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Katana")
end})
Tabs.Shop:AddButton({
Name = "Buy Iron Mace", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
end})   
Tabs.Shop:AddButton({
Name = "Buy Duel Katana", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
end})   
Tabs.Shop:AddButton({
Name = "Buy Triple Katana", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
end})  
Tabs.Shop:AddButton({
Name = "Buy Pipe", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Pipe")
end})  
Tabs.Shop:AddButton({
Name = "Buy Dual-Headed Blade", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
end})   
Tabs.Shop:AddButton({
Name = "Buy Bisento", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Bisento")
end})  
Tabs.Shop:AddButton({
Name = "Buy Soul Cane", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
end})
Tabs.Shop:AddButton({
Name = "Buy Slingshot", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
end})
Tabs.Shop:AddButton({
Name = "Buy Musket", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Musket")
end})    
Tabs.Shop:AddButton({
Name = "Buy Dual Flintlock", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual Flintlock")
end})   
Tabs.Shop:AddButton({
Name = "Buy Flintlock", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
end})   
Tabs.Shop:AddButton({
Name = "Buy Refined Flintlock", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
end})   
Tabs.Shop:AddButton({
Name = "Buy Cannon", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Cannon")
end}) 
Tabs.Shop:AddButton({
Name = "Buy Kabucha", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
end})

Tabs.Shop:AddSection({"Fragments shop"})
Tabs.Shop:AddButton({
Name = "Buy Refund Stats", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end})
Tabs.Shop:AddButton({
Name = "Buy Reroll Race", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end})   
Tabs.Shop:AddButton({
Name = "Buy Ghoul Race (2.5k)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("Ectoplasm"," Change", 4)
end})	
Tabs.Shop:AddButton({
Name = "Buy Cyborg Race (2.5k)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CyborgTrainer"," Buy")
end})

Tabs.Misc:AddSection({"Server - Function"})
Tabs.Misc:AddButton({
Name = "Rejoin Server", 
Description = "",
Callback = function()
  game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end})
Tabs.Misc:AddButton({
Name = "Hop Server", 
Description = "",
Callback = function()
  Hop()
end})
Tabs.Misc:AddButton({
Name = "Hop to Lowest Players", 
Description = "",
Callback = function()
  local Http = game:GetService("HttpService")
  local TPS = game:GetService("TeleportService")
  local Api = "https://games.roblox.com/v1/games/"
  local _place = game.PlaceId
  local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
   function ListServers(cursor)
     local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
     return Http:JSONDecode(Raw)
   end
   local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
  until Server
  TPS:TeleportToPlaceInstance(_place,Server.id,plr)
end})

Tabs.Misc:AddButton({
Name = "Hop to Lowest Pings Server", 
Description = "",
Callback = function()
local HTTPService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local StatsService = game:GetService("Stats")
local function fetchServersData(placeId, limit)
    local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", placeId, limit)
    local success, response = pcall(function()
        return HTTPService:JSONDecode(game:HttpGet(url))
    end)
  if success and response and response.data then
	return response.data
  end
    return nil
  end
  local placeId = game.PlaceId
  local serverLimit = 100
  local servers = fetchServersData(placeId, serverLimit)
  if not servers then return end
  local lowestPingServer = servers[1]
  for _, server in pairs(servers) do
    if server["ping"] < lowestPingServer["ping"] and server.maxPlayers > server.playing then
      lowestPingServer = server
    end
  end
  local commonLoadTime = 0.5
  task.wait(commonLoadTime)
  local pingThreshold = 100
  local serverStats = StatsService.Network.ServerStatsItem
  local dataPing = serverStats["Data Ping"]:GetValueString()
  local pingValue = tonumber(dataPing:match("(%d+)"))
  if pingValue >= pingThreshold then
    TeleportService:TeleportToPlaceInstance(placeId, lowestPingServer.id)
  else
    --pings
  end
end})


Tabs.Misc:AddButton({
Name = "Teleport [Job ID]", 
Description = "",
Callback = function()
  replicated['__ServerBrowser']:InvokeServer("teleport",_G.JobId)
end})
Tabs.Misc:AddButton({
Name = "Copy JobID", 
Description = "",
Callback = function()
  setclipboard(tostring(game.JobId))
end})

Tabs.Misc:AddSection({"Player Gui / Others"})

Tabs.Misc:AddButton({
Name = "Open Awakenings Expert", 
Description = "",
Callback = function()
  plr.PlayerGui.Main.AwakeningToggler.Visible = true
end})
Tabs.Misc:AddButton({
Name = "Open Title Selection", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("getTitles",true)
  plr.PlayerGui.Main.Titles.Visible = true
end})
DisbleChat = Tabs.Misc:AddToggle({
Name = "Disable Chat GUI", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Rechat = Value
  if  _G.Rechat == true then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)    
  elseif _G.chat == false then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)    
  end
end
})
DisbleLeaderB = Tabs.Misc:AddToggle({
Name = "Disable Leader Board GUI", 
Description = "", 
Default = false,
Callback = function(Value)
  ReLeader = Value
  if ReLeader == true then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)   
  elseif ReLeader == false then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)   
  end
end
})
Tabs.Misc:AddButton({
Name = "Set Pirate Team", 
Description = "",
Callback = function()
  Pirates()
end})  
Tabs.Misc:AddButton({
Name = "Set Marine Team", 
Description = "",
Callback = function()
  Marines()
end})
UnPortal = Tabs.Misc:AddToggle({
Name = "Unlock All Portals", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.PortalUnLock = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.PortalUnLock then        
         if Attack.Pos(CstlePos_Miti,8) then
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
         elseif Attack.Pos(Man3Pos_Miti,8) then
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
         elseif Attack.Pos(HydraPos_Miti,8) then                    
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
         elseif Attack.Pos(HydratoCastle,8) then                   
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
        end
      end
    end)
  end
end)

Tabs.Misc:AddSection({"Graphics / Haki Stats"})

HakiSt = {"State 0","State 1","State 2","State 3","State 4","State 5"}
HakiStat = Tabs.Misc:AddDropdown({
Name = "Select Haki States",
Options = HakiSt,
Default = false,
Callback = function(Value)
  _G.SelectStateHaki = Value
end})
Tabs.Misc:AddButton({
Name = "ChangeBusoStage", 
Description = "",
Callback = function()
  if _G.SelectStateHaki == "State 0" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
  elseif _G.SelectStateHaki == "State 1" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
  elseif _G.SelectStateHaki == "State 2" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
  elseif _G.SelectStateHaki == "State 3" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
  elseif _G.SelectStateHaki == "State 4" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
  elseif _G.SelectStateHaki == "State 5" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
  end
end})
rtxM = Tabs.Misc:AddToggle({
Name = "Turn on RTX Mode", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.RTXMode = Value
  local a = game.Lighting
  local c = Instance.new("ColorCorrectionEffect", a)
  local e = Instance.new("ColorCorrectionEffect", a)
  OldAmbient = a.Ambient
  OldBrightness = a.Brightness
  OldColorShift_Top = a.ColorShift_Top
  OldBrightnessc = c.Brightness
  OldContrastc = c.Contrast
  OldTintColorc = c.TintColor
  OldTintColore = e.TintColor    
  if not _G.RTXMode then return end
  while _G.RTXMode do wait()
    a.Ambient = Color3.fromRGB(33, 33, 33)
    a.Brightness = 0.3
    c.Brightness = 0.176
    c.Contrast = 0.39
    c.TintColor = Color3.fromRGB(217, 145, 57)
    game.Lighting.FogEnd = 999
    if not plr.Character.HumanoidRootPart:FindFirstChild("PointLight") then
      local a2 = Instance.new("PointLight")
      a2.Parent = plr.Character.HumanoidRootPart
      a2.Range = 15
      a2.Color = Color3.fromRGB(217, 145, 57)
    end
    if not _G.RTXMode then
      a.Ambient = OldAmbient
      a.Brightness = OldBrightness
      a.ColorShift_Top = OldColorShift_Top
      c.Contrast = OldContrastc
      c.Brightness = OldBrightnessc
      c.TintColor = OldTintColorc
      e.TintColor = OldTintColore
      game.Lighting.FogEnd = 2500
      plr.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
    end
  end
end
})
Tabs.Misc:AddButton({
Name = "Turn on Fast Mode", 
Description = "",
Callback = function()
  for _,zx in next, workspace:GetDescendants() do
  if table.find(Past, zx.ClassName) then  zx.Material = "Plastic" end
  end
end})
Tabs.Misc:AddButton({
Name = "Turn on Low CPU", 
Description = "",
Callback = function()
  LowCpu()
end})
Tabs.Misc:AddButton({
Name = "Thuy?n ?i Nhanh", 
Description = "",
Callback = function()
  for _, v in pairs(workspace.Boats:GetDescendants()) do
    if table.find(ListSeaBoat, v.Name) and tostring(v.Owner.Value) == tostring(plr.Name) then              
      v.VehicleSeat.MaxSpeed = 350
      v.VehicleSeat.Torque = 0.2
      v.VehicleSeat.TurnSpeed = 5
      v.VehicleSeat.HeadsUpDisplay = true
    end
  end
end})
Tabs.Misc:AddButton({
Name = "Remove Sky Fog", 
Description = "",
Callback = function()
  if Lighting:FindFirstChild("LightingLayers") then Lighting.LightingLayers:Destroy() end
  if Lighting:FindFirstChild("SeaTerrorCC") then Lighting.SeaTerrorCC:Destroy() end
  if Lighting:FindFirstChild("FantasySky") then Lighting.FantasySky:Destroy() end
end})

Tabs.Misc:AddSection({"Configure - God"})
Tabs.Misc:AddButton({
Name = "Rain Fruits (Client)", 
Description = "",
Callback = function()
  for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
    v.Parent = game.Workspace.Map
    v:MoveTo(plr.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
    if v.Fruit:FindFirstChild("AnimationController") then
      v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
    end
    v.Handle.Touched:Connect(function(otherPart)
      if otherPart.Parent == plr.Character then
        v.Parent = plr.Backpack
        plr.Character.Humanoid:EquipTool(v)
      end
    end)
  end
end})
briggt1 = Tabs.Misc:AddToggle({
Name = "Turn on Full Bright", 
Description = "", 
Default = false,
Callback = function(Value)
  bright = Value
  if Value == true then
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
    Lighting.ColorShift_Top = Color3.new(1, 1, 1)
  else
    Lighting.Ambient = Color3.new(0, 0, 0)
    Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
    Lighting.ColorShift_Top = Color3.new(0, 0, 0)
  end  
end
})


DayN = Tabs.Misc:AddDropdown({
Name = "Select Time",
Description = "",
Options = {"Day", "Night"},
Default = false,
Callback = function(Value)
  _G.SelectDN = Value
end})
dayornight = Tabs.Misc:AddToggle({
Name = "Turn on Time", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.daylightN = Value
end})
task.spawn(function()
  while task.wait() do
    if _G.daylightN then
      if _G.SelectDN == "Day" then
        Lighting.ClockTime = 12
      elseif _G.SelectDN == "Night" then
        Lighting.ClockTime = 0
      end
    end
  end
end)
walkWater = Tabs.Misc:AddToggle({
Name = "Turn on Walk on Water", 
Description = "", 
Default = true,
Callback = function(Value)
  _G.WalkWater_Part = Value
  if _G.WalkWater_Part then
    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
  else
    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
  end
end
})
iceWalk = Tabs.Misc:AddToggle({
Name = "Turn on Ice Walk", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.WalkWater = Value
end})
spawn(function()
  while task.wait() do
    if _G.WalkWater then
      pcall(function()
	   if plr.Character and plr.Character:FindFirstChild("LeftFoot") then
	   local upval0 = replicated.Assets.Models.IceSpikes4:Clone()
        upval0.Parent = workspace
        upval0.Size = Vector3.new(3+math.random(10,12),1.7,3+math.random(10,12))
        upval0.Color = Color3.fromRGB(128,187,219)
        upval0.CFrame = CFrame.new(plr.Character.Head.Position.X,-3.8,plr.Character.Head.Position.Z)*CFrame.Angles((math.random()-0.5)*0.06, math.random()*7,(math.random()-0.5)*0.07)
        local var85={};
        var85.Size=Vector3.new(0,0.3,0)
        local var3=TW:Create(upval0,TweenInfo.new(2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),var85)
        var3.Completed:Connect(function()
          upval0:Destroy()
        end)
          var3:Play()
	    end	
      end)
    end
  end
end)
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer

local v1 = next
local v2 = {
    RS:WaitForChild("Util"),
    RS:WaitForChild("Common"),
    RS:WaitForChild("Remotes"),
    RS:WaitForChild("Assets"),
    RS:WaitForChild("FX"),
}

local v3 = nil
local u4 = nil -- RemoteEvent found
local u5 = nil -- Id attribute

do
    while true do
        local folder
        v3, folder = v1(v2, v3)
        if v3 == nil then break end

        for _, obj in ipairs(folder:GetChildren()) do
            if obj:IsA("RemoteEvent") and obj:GetAttribute("Id") then
                u5 = obj:GetAttribute("Id")
                u4 = obj
            end
        end

        -- listen new children
        folder.ChildAdded:Connect(function(obj)
            if obj:IsA("RemoteEvent") and obj:GetAttribute("Id") then
                u5 = obj:GetAttribute("Id")
                u4 = obj
            end
        end)
    end
end

local function BuildHits(character, range)
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return {} end

    local hits = {}
    for _, container in ipairs({workspace:FindFirstChild("Enemies"), workspace:FindFirstChild("Characters")}) do
        if container then
            for _, mob in ipairs(container:GetChildren()) do
                if mob ~= character then
                    local mhrp = mob:FindFirstChild("HumanoidRootPart")
                    local hum = mob:FindFirstChildOfClass("Humanoid") or mob:FindFirstChild("Humanoid")
                    if mhrp and hum and hum.Health > 0 then
                        if (mhrp.Position - hrp.Position).Magnitude <= range then
                            for _, part in ipairs(mob:GetChildren()) do
                                if part:IsA("BasePart") then
                                    if (mhrp.Position - hrp.Position).Magnitude <= range then
                                        hits[#hits+1] = {mob, part}
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return hits
end

function AttackNoCoolDown()
    local character = plr.Character
    if not character then return end

    local tool = character:FindFirstChildOfClass("Tool")
    if not tool then return end

    local wtype = tool:GetAttribute("WeaponType")
    if wtype ~= "Melee" and wtype ~= "Sword" then
        return
    end

    local hits = BuildHits(character, 60)
    if #hits <= 0 then return end

    local head = hits[1][1] and hits[1][1]:FindFirstChild("Head")
    if not head then return end

    if not u4 or not u5 then return end

    pcall(function()
        local Net = require(RS:WaitForChild("Modules"):WaitForChild("Net"))

        Net:RemoteEvent("RegisterHit", true)
        RS.Modules.Net["RE/RegisterAttack"]:FireServer()

        RS.Modules.Net["RE/RegisterHit"]:FireServer(
            head,
            hits,
            {},
            tostring(plr.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(11, 15)
        )

        local seed = RS.Modules.Net.seed:InvokeServer()
        local key = bit32.bxor(u5 + 909090, seed * 2)

        local encodedName = string.gsub("RE/RegisterHit", ".", function(ch)
            return string.char(
                bit32.bxor(
                    string.byte(ch),
                    math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1
                )
            )
        end)

        cloneref(u4):FireServer(encodedName, key, head, hits)
    end)
end

CameraShakerR = require(RS.Util.CameraShaker)
CameraShakerR:Stop()

get_Monster = function()
    for _, b in pairs(workspace.Enemies:GetChildren()) do
        local c = b:FindFirstChild("UpperTorso") or b:FindFirstChild("Head")
        if b:FindFirstChild("HumanoidRootPart", true) and c then
            if (b.Head.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                return true, c.Position
            end
        end
    end
    for _, d in pairs(workspace.SeaBeasts:GetChildren()) do
        if d:FindFirstChild("HumanoidRootPart") and d:FindFirstChild("Health") and d.Health.Value > 0 then
            return true, d.HumanoidRootPart.Position
        end
    end
    for _, d in pairs(workspace.Enemies:GetChildren()) do
        if d:FindFirstChild("Health") and d.Health.Value > 0 and d:FindFirstChild("VehicleSeat") then
            return true, d.Engine.Position
        end
    end
end

Actived = function()
    local a = plr.Character:FindFirstChildOfClass("Tool")
    if not a then return end
    for _, c in next, getconnections(a.Activated) do
        if typeof(c.Function) == "function" then
            getupvalues(c.Function)
        end
    end
end

task.spawn(function()
    local lastFruitM1 = 0
    RunService.Heartbeat:Connect(function()
        if not _G.Seriality then return end

        pcall(function()
            if _G.FastAttackGravity_Mode ~= "Super Fast Attack" and _G.FastAttackGravity_Mode ~= "Dac Cau Attack" then
                AttackNoCoolDown()
            end

            local ch = plr.Character
            if not ch then return end

            local Pretool = ch:FindFirstChildOfClass("Tool")
            if not Pretool then return end

            local ToolTip = Pretool.ToolTip
            local MobAura = get_Monster()

            if ToolTip == "Blox Fruit" and MobAura then
                local now = os.clock()
                local mode = _G.FastAttackGravity_Mode
                local fruitDelay = _G.Fast_Delay or 0.1
                if mode == "Super Fast Attack" then
                    fruitDelay = 0.03
                elseif mode == "Dac Cau Attack" then
                    fruitDelay = 0.02
                end

                if (now - lastFruitM1) >= fruitDelay then
                    lastFruitM1 = now
                    local LeftClickRemote = Pretool:FindFirstChild("LeftClickRemote")
                    if LeftClickRemote then
                        Actived()
                        LeftClickRemote:FireServer(Vector3.new(0.01, -500, 0.01), 1, true)
                        LeftClickRemote:FireServer(false)
                    end
                end
            end
        end)
    end)
end)
-- ============================================
-- TAB DUNGEON - CH?C N?NG DUNGEON WORLD 4
-- ============================================
Tabs.Dungeon:AddSection("Dungeon Settings")

DungeonPlaceId = 73902483975735

local function IsDungeonGame()
    return game.PlaceId == DungeonPlaceId
end

local function ClickButtonOnce(Button, AttributeName)
    if not Button or not Button.Parent then return false end
    AttributeName = AttributeName or "ClickedOnce"
    if Button:GetAttribute(AttributeName) then return false end
    Button:SetAttribute(AttributeName, true)
    pcall(function() Button:Activate() end)
    pcall(function() if firesignal and Button.Activated then firesignal(Button.Activated) end end)
    return true
end

local function ClickButton(Button)
    if not Button or not Button.Parent then return false end
    pcall(function() Button:Activate() end)
    pcall(function() if firesignal and Button.Activated then firesignal(Button.Activated) end end)
    return true
end

-- Auto Join Dungeon Server
AutoJoinDungeonServer = false
DungeonJoinToggle = Tabs.Dungeon:AddToggle({
    Name = "Auto Join Dungeon Server",
    Description = "Join Dungeon server automatically",
    Default = false,
    Callback = function(Value)
        AutoJoinDungeonServer = Value
    end
})

task.spawn(function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    while task.wait(0.5) do
        if IsDungeonGame() then
            if AutoJoinDungeonServer then AutoJoinDungeonServer = false end
            task.wait(1)
        end
        
        if not AutoJoinDungeonServer then
            local ServerBrowserButton = PlayerGui:FindFirstChild("Topbar") and PlayerGui.Topbar:FindFirstChild("Frame") and PlayerGui.Topbar.Frame:FindFirstChild("ServerBrowserButton")
            if ServerBrowserButton then pcall(function() ServerBrowserButton:SetAttribute("Clicked_ServerBrowserButton", nil) end) end
            task.wait(1)
        else
            local ServerBrowserButton = PlayerGui:WaitForChild("Topbar"):WaitForChild("Frame"):WaitForChild("ServerBrowserButton")
            ClickButtonOnce(ServerBrowserButton, "Clicked_ServerBrowserButton")
            
            local ServerBrowserGui = PlayerGui:WaitForChild("ServerBrowser")
            task.wait(0.5)
            
            local DungeonButton = ServerBrowserGui:WaitForChild("Frame"):WaitForChild("TeleportButtons"):WaitForChild("Dungeon")
            task.wait(0.5)
            
            for i = 1, 3 do
                if not AutoJoinDungeonServer then break end
                ClickButton(DungeonButton)
                task.wait(0.25)
            end
            
            AutoJoinDungeonServer = false
        end
    end
end)

-- Bring Mobs Dungeon
Tabs.Dungeon:AddSection("Bring Mobs")

local BringRadius = 350
local ScanRadius = 1000
local ClusterLinkDistance = 200
local MaxBring = 5
local HoldHeight = 1

local function GetLocalCharacterRoot()
    return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
end

local function GetEnemiesFolder()
    if not World4 then return nil end
    return workspace:FindFirstChild("Enemies")
end

local function GetMobsInRadius(Position, Radius)
    if not World4 then return {} end
    local EnemiesFolder = GetEnemiesFolder()
    if not EnemiesFolder then return {} end
    local Mobs = {}
    for _, Mob in ipairs(EnemiesFolder:GetChildren()) do
        local Humanoid = Mob:FindFirstChild("Humanoid")
        local HumanoidRootPart = Mob:FindFirstChild("HumanoidRootPart")
        if Humanoid and HumanoidRootPart and Humanoid.Health > 0 then
            local Distance = (Mob.HumanoidRootPart.Position - Position).Magnitude
            if Distance <= Radius then
                table.insert(Mobs, Mob)
            end
        end
    end
    return Mobs
end

local function CalculateRingPosition(AngleMultiplier, Radius)
    local Angle = AngleMultiplier * 2.3999632297287
    return Vector3.new(math.cos(Angle) * Radius, 0, math.sin(Angle) * Radius)
end

local MonPosition = nil
local TargetPosition = nil

BringMobsDungeonToggle = Tabs.Dungeon:AddToggle({
    Name = "Bring Mobs Dungeon",
    Description = "Bring dungeon mobs to you (World 4 only)",
    Default = false,
    Callback = function(Value)
        _G.BringMobsDungeon = Value
    end
})

local BringMobsThread = nil

BringMobsDungeonToggle = Tabs.Dungeon:AddToggle({
    Name = "Bring Mobs Dungeon",
    Description = "Bring dungeon mobs to you (World 4 only)",
    Default = false,
    Callback = function(Value)
        _G.BringMobsDungeon = Value
        
        if Value and World4 then
            -- B?t ??u thread m?i
            BringMobsThread = task.spawn(function()
                local ScanRadius = 1000
                local MaxBring = 5
                local HoldHeight = 1
                
                while _G.BringMobsDungeon and World4 do
                    task.wait(0.2)
                    
                    local CharacterRoot = GetLocalCharacterRoot()
                    if CharacterRoot then
                        local Mobs = GetMobsInRadius(CharacterRoot.Position, ScanRadius)
                        if #Mobs >= 3 then
                            table.sort(Mobs, function(a, b)
                                local distA = (a.HumanoidRootPart.Position - CharacterRoot.Position).Magnitude
                                local distB = (b.HumanoidRootPart.Position - CharacterRoot.Position).Magnitude
                                return distA < distB
                            end)
                            
                            local BroughtCount = 0
                            local BasePosition = Vector3.new(CharacterRoot.Position.X, CharacterRoot.Position.Y + HoldHeight, CharacterRoot.Position.Z)
                            
                            for i = 1, math.min(#Mobs, MaxBring) do
                                BroughtCount = BroughtCount + 1
                                local MobRoot = Mobs[i].HumanoidRootPart
                                if MobRoot and MobRoot.Parent then
                                    local TargetPos = BasePosition + CalculateRingPosition(BroughtCount, 6)
                                    MobRoot.CFrame = CFrame.new(TargetPos)
                                end
                            end
                        end
                    end
                end
                
                -- Cleanup khi thread k?t th闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?
                _G.BringMobsDungeon = false
                BringMobsThread = nil
            end)
        else
            -- D?ng thread
            _G.BringMobsDungeon = false
            if BringMobsThread then
                task.cancel(BringMobsThread)
                BringMobsThread = nil
            end
        end
    end
})

-- Auto Farm Dungeon
Tabs.Dungeon:AddSection("Auto Farm")

local function GetLocalRootPart()
    return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
end

local function GetBestTarget()
    if not World4 then return nil end
    
    local CharacterRoot = GetLocalRootPart()
    if not CharacterRoot then return nil end
    
    local BestTarget = nil
    local BestDistance = math.huge
    
    for _, Enemy in ipairs(workspace.Enemies:GetChildren()) do
        local Humanoid = Enemy:FindFirstChild("Humanoid")
        local HumanoidRootPart = Enemy:FindFirstChild("HumanoidRootPart")
        if Humanoid and HumanoidRootPart and Humanoid.Health > 0 then
            local Distance = (CharacterRoot.Position - HumanoidRootPart.Position).Magnitude
            if Distance < BestDistance and Distance < 5000 then
                BestDistance = Distance
                BestTarget = Enemy
            end
        end
    end
    
    return BestTarget
end

local function HasValidTargets()
    if not World4 then return false end
    
    for _, Enemy in ipairs(workspace.Enemies:GetChildren()) do
        local Humanoid = Enemy:FindFirstChild("Humanoid")
        local HumanoidRootPart = Enemy:FindFirstChild("HumanoidRootPart")
        if Humanoid and HumanoidRootPart and Humanoid.Health > 0 then
            return true
        end
    end
    return false
end

local function GetRoomExitTeleporter()
    local Dungeon = workspace.Map and workspace.Map:FindFirstChild("Dungeon")
    if not Dungeon then return nil end
    
    local CharacterRoot = GetLocalRootPart()
    if not CharacterRoot then return nil end
    
    local NearestExit = nil
    local NearestDistance = math.huge
    
    for _, Room in ipairs(Dungeon:GetChildren()) do
        local ExitTeleporter = Room:FindFirstChild("ExitTeleporter")
        if ExitTeleporter then
            local ExitPart = ExitTeleporter:FindFirstChild("Part") or ExitTeleporter
            if ExitPart then
                local Distance = (CharacterRoot.Position - ExitPart.Position).Magnitude
                if Distance < NearestDistance then
                    NearestDistance = Distance
                    NearestExit = ExitPart
                end
            end
        end
    end
    
    return NearestExit
end

local FarmDungeonThread = nil

AutoFarmDungeonToggle = Tabs.Dungeon:AddToggle({
    Name = "Auto Farm Raid Dungeon",
    Description = "Auto farm dungeon + next floor (World 4 only)",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmDungeon = Value
        
        if Value and World4 then
            FarmDungeonThread = task.spawn(function()
                local FastDelay = 0.5
                _G.GoingToExit = false
                _G.DeathPause = false
                
                while _G.AutoFarmDungeon and World4 do
                    task.wait(0.1)
                    
                    if not _G.GoingToExit and not _G.DeathPause then
                        local CharacterRoot = GetLocalRootPart()
                        if CharacterRoot then
                            local Target = GetBestTarget()
                            
                            if Target then
                                local TargetRoot = Target:FindFirstChild("HumanoidRootPart")
                                if TargetRoot then
                                    -- Teleport ngay ??n target (kh?ng c?n ki?m tra kho?ng c闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡叉劙骞掗弬鐐媰闂佷紮绲介懟顖炵嵁?
                                    _tp(TargetRoot.CFrame * CFrame.new(0, 30, 0))
                                end
                            else
                                if not HasValidTargets() then
                                    _G.GoingToExit = true
                                    task.wait(0.2)
                                    local ExitPart = GetRoomExitTeleporter()
                                    if ExitPart then
                                        _tp(ExitPart.CFrame * CFrame.new(0, 3, 0))
                                        task.wait(1)
                                    end
                                    _G.GoingToExit = false
                                end
                            end
                        end
                    end
                    
                    task.wait(FastDelay)
                end
                
                -- Cleanup khi thread k?t th闂傚倸鍊搁崐鎼佸磹瀹勬噴褰掑炊瑜夐弸鏍煛閸ャ儱鐏╃紒鎰殜閺岀喖鎮ч崼鐔哄嚒闂佸憡鍨规慨鎾煘閹达附鍋愰悗鍦Т椤ユ繄绱撴担鍝勵€岄柛銊ョ－濡?
                _G.AutoFarmDungeon = false
                _G.GoingToExit = false
                _G.DeathPause = false
                FarmDungeonThread = nil
            end)
        else
            _G.AutoFarmDungeon = false
            _G.GoingToExit = false
            _G.DeathPause = false
            if FarmDungeonThread then
                task.cancel(FarmDungeonThread)
                FarmDungeonThread = nil
            end
        end
    end
})
-- =====================
-- TAB PVP + ESP FEATURES
-- =====================

-- ESP Variables
getgenv().BerryESP = false
getgenv().PlayerESP = false
getgenv().IslandESP = false
getgenv().DevilFruitESP = false

local ESP_NAMES = {
    Berry = "DCESP_Berry",
    Island = "DCESP_Island",
    Player = "DCESP_Player",
    Fruit = "DCESP_Fruit"
}

local ESP_STYLE = {
    Size = UDim2.new(0, 170, 0, 26),
    TextSize = 12,
    Stroke = 0.65,
    BerryColor = Color3.fromRGB(124, 255, 188),
    IslandColor = Color3.fromRGB(145, 210, 255),
    EnemyColor = Color3.fromRGB(255, 120, 120),
    TeamColor = Color3.fromRGB(120, 255, 178),
    FruitColor = Color3.fromRGB(255, 188, 110),
}

local function round(num)
    return math.floor(num + 0.5)
end

local function getLocalHead()
    local c = game.Players.LocalPlayer.Character
    return c and c:FindFirstChild("Head")
end

local function createOrGetBill(parent, billName, adornee, color)
    local bill = parent:FindFirstChild(billName)
    if not bill then
        bill = Instance.new("BillboardGui")
        bill.Name = billName
        bill.ExtentsOffset = Vector3.new(0, 1.5, 0)
        bill.Size = ESP_STYLE.Size
        bill.Adornee = adornee
        bill.AlwaysOnTop = true
        bill.Parent = parent

        local txt = Instance.new("TextLabel")
        txt.Name = "TextLabel"
        txt.Font = Enum.Font.GothamSemibold
        txt.TextSize = ESP_STYLE.TextSize
        txt.TextWrapped = true
        txt.Size = UDim2.new(1, 0, 1, 0)
        txt.BackgroundTransparency = 1
        txt.TextStrokeTransparency = ESP_STYLE.Stroke
        txt.TextColor3 = color
        txt.Parent = bill
    else
        local txt = bill:FindFirstChild("TextLabel")
        if txt then
            txt.TextSize = ESP_STYLE.TextSize
            txt.TextColor3 = color
            txt.TextStrokeTransparency = ESP_STYLE.Stroke
        end
    end
    return bill
end

local function clearEspByName(name)
    for _, d in pairs(workspace:GetDescendants()) do
        if d:IsA("BillboardGui") and d.Name == name then
            d:Destroy()
        end
    end
end

local function clearLegacyEsp()
    for _, d in pairs(workspace:GetDescendants()) do
        if d:IsA("BillboardGui") then
            if d.Name == "BerryESP" or d.Name == "IslandESP" then
                d:Destroy()
            elseif string.sub(d.Name, 1, 9) == "PlayerESP" then
                d:Destroy()
            elseif string.sub(d.Name, 1, 8) == "FruitESP" then
                d:Destroy()
            end
        end
    end
end

local function clearAllPvpEsp()
    clearEspByName(ESP_NAMES.Berry)
    clearEspByName(ESP_NAMES.Island)
    clearEspByName(ESP_NAMES.Player)
    clearEspByName(ESP_NAMES.Fruit)
    clearLegacyEsp()
end

-- Cleanup stale ESP from previous runs
clearAllPvpEsp()

function UpdateBerriesESP()
    local CollectionService = game:GetService("CollectionService")
    local head = getLocalHead()
    local bushes = CollectionService:GetTagged("BerryBush")
    for _, bush in pairs(bushes) do
        pcall(function()
            local berryName
            for _, attrVal in pairs(bush:GetAttributes()) do
                if attrVal then
                    berryName = tostring(attrVal)
                    break
                end
            end
            if berryName and bush.Parent then
                local bill = createOrGetBill(bush.Parent, ESP_NAMES.Berry, bush.Parent, ESP_STYLE.BerryColor)
                if head and bill:FindFirstChild("TextLabel") then
                    local dist = (bush.Parent:GetPivot().Position - head.Position).Magnitude
                    bill.TextLabel.Text = berryName .. "\n" .. math.floor(dist) .. "m"
                end
            elseif bush.Parent then
                local old = bush.Parent:FindFirstChild(ESP_NAMES.Berry)
                if old then old:Destroy() end
            end
        end)
    end
end

function UpdateIslandESP()
    local head = getLocalHead()
    local locations = game:GetService("Workspace"):FindFirstChild("_WorldOrigin")
    locations = locations and locations:FindFirstChild("Locations")
    if not locations then return end

    for _, v in pairs(locations:GetChildren()) do
        pcall(function()
            if v.Name ~= "Sea" then
                local bill = createOrGetBill(v, ESP_NAMES.Island, v, ESP_STYLE.IslandColor)
                if head and bill:FindFirstChild("TextLabel") then
                    bill.TextLabel.Text = v.Name .. "\n" .. round((head.Position - v.Position).Magnitude / 3) .. " Distance"
                end
            end
        end)
    end
end

function UpdatePlayerESP()
    local head = getLocalHead()
    if not head then return end
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        pcall(function()
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                local enemy = (v.Team ~= game.Players.LocalPlayer.Team)
                local color = enemy and ESP_STYLE.EnemyColor or ESP_STYLE.TeamColor
                local bill = createOrGetBill(v.Character.Head, ESP_NAMES.Player, v.Character.Head, color)
                if bill:FindFirstChild("TextLabel") then
                    local dist = round((head.Position - v.Character.Head.Position).Magnitude / 3)
                    bill.TextLabel.Text = v.Name .. " | " .. dist .. " Distance"
                end
            end
        end)
    end
end

function UpdateDevilFruitESP()
    local head = getLocalHead()
    if not head then return end
    for _, v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                local bill = createOrGetBill(v.Handle, ESP_NAMES.Fruit, v.Handle, ESP_STYLE.FruitColor)
                if bill:FindFirstChild("TextLabel") then
                    local dist = round((head.Position - v.Handle.Position).Magnitude / 3)
                    bill.TextLabel.Text = v.Name .. "\n" .. dist .. " Distance"
                end
            end
        end)
    end
end

-- ESP Toggle Section
Tabs.PVP:AddSection("ESP Features")

-- Berry ESP Toggle
BerryESP = Tabs.PVP:AddToggle({
    Name = "Berry ESP",
    Description = "Show berry locations",
    Default = false,
    Callback = function(Value)
        getgenv().BerryESP = Value
        if not Value then
            clearEspByName(ESP_NAMES.Berry)
        end
    end
})

-- Player ESP Toggle
PlayerESP = Tabs.PVP:AddToggle({
    Name = "Player ESP",
    Description = "Show other players (Red = Enemy, Green = Team)",
    Default = false,
    Callback = function(Value)
        getgenv().PlayerESP = Value
        if not Value then
            clearEspByName(ESP_NAMES.Player)
        end
    end
})

-- Island ESP Toggle
IslandESP = Tabs.PVP:AddToggle({
    Name = "Island ESP",
    Description = "Show island locations",
    Default = false,
    Callback = function(Value)
        getgenv().IslandESP = Value
        if not Value then
            clearEspByName(ESP_NAMES.Island)
        end
    end
})

-- Devil Fruit ESP Toggle
DevilFruitESP = Tabs.PVP:AddToggle({
    Name = "Devil Fruit ESP",
    Description = "Show devil fruit locations",
    Default = false,
    Callback = function(Value)
        getgenv().DevilFruitESP = Value
        if not Value then
            clearEspByName(ESP_NAMES.Fruit)
        end
    end
})

-- ESP Update Loop
task.spawn(function()
    while task.wait(1) do
        if getgenv().BerryESP then
            pcall(UpdateBerriesESP)
        end
        if getgenv().PlayerESP then
            pcall(UpdatePlayerESP)
        end
        if getgenv().IslandESP then
            pcall(UpdateIslandESP)
        end
        if getgenv().DevilFruitESP then
            pcall(UpdateDevilFruitESP)
        end
    end
  end)
-- =====================
-- PVP FEATURES
-- =====================

local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- PVP Section
Tabs.PVP:AddSection("ESP And PVP")

-- Player List
local PlrList = {}
for _, v in pairs(Players:GetPlayers()) do
    table.insert(PlrList, v.Name)
end

-- Update player list when players join/leave
local function UpdatePlayerDropdown()
    if PlayerDropdown and PlayerDropdown.Set then
        PlayerDropdown:Set(PlrList)
    end
end

Players.PlayerAdded:Connect(function()
    table.clear(PlrList)
    for _, v in pairs(Players:GetPlayers()) do
        table.insert(PlrList, v.Name)
    end
    UpdatePlayerDropdown()
end)

Players.PlayerRemoving:Connect(function()
    task.wait(0.5)
    table.clear(PlrList)
    for _, v in pairs(Players:GetPlayers()) do
        table.insert(PlrList, v.Name)
    end
    UpdatePlayerDropdown()
end)

-- Function to refresh player list
local function RefreshPlayerList()
    table.clear(PlrList)
    for _, v in pairs(Players:GetPlayers()) do
        table.insert(PlrList, v.Name)
    end
    UpdatePlayerDropdown()
end

PlayerDropdown = Tabs.PVP:AddDropdown({
    Name = "Select Player PVP",
    Options = PlrList,
    Default = "",
    Callback = function(Value)
        getgenv().PlayersList = Value
    end
})

-- Refresh Player List Button
Tabs.PVP:AddButton({
    Name = "Refresh Player List",
    Description = "Update player list when new players join",
    Callback = function()
        RefreshPlayerList()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Player List",
            Text = "Player list refreshed!",
            Duration = 2
        })
    end
})

-- Method Aimbot
ABmethod = "Select Player"
Tabs.PVP:AddDropdown({
    Name = "Select Method Aimbot",
    Options = {"Select Player", "Target nearest Player"},
    Default = "Select Player",
    Callback = function(Value)
        ABmethod = Value
    end
})

-- Teleport Player
Tabs.PVP:AddToggle({
    Name = "Teleport Player",
    Default = false,
    Callback = function(Value)
        getgenv().TpPly = Value
    end
})

task.spawn(function()
    while task.wait(0.15) do
        pcall(function()
            if not getgenv().TpPly then return end
            local target = Players:FindFirstChild(getgenv().PlayersList or "")
            local myHRP = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            local tarHRP = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if not (myHRP and tarHRP) then return end
            if target.Team == plr.Team then return end

            local goal = tarHRP.CFrame * CFrame.new(0, 3, 2)
            local dist = (myHRP.Position - goal.Position).Magnitude
            if dist > 200 then
                myHRP.CFrame = goal
            elseif dist > 10 then
                myHRP.CFrame = myHRP.CFrame:Lerp(goal, 0.45)
            end
        end)
    end
end)

-- Auto Aimbot
Tabs.PVP:AddToggle({
    Name = "Auto Aimbot",
    Default = false,
    Callback = function(Value)
        getgenv().AimMethod = Value
    end
})

local function GetNearestEnemyPlayer()
    local myHRP = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    local best, bestDist = nil, math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= plr and v.Team ~= plr.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local hum = v.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local d = (v.Character.HumanoidRootPart.Position - myHRP.Position).Magnitude
                if d < bestDist then
                    bestDist = d
                    best = v
                end
            end
        end
    end
    return best
end

local function GetSelectedEnemyPlayer()
    local v = Players:FindFirstChild(getgenv().PlayersList or "")
    if not (v and v ~= plr and v.Team ~= plr.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart")) then
        return nil
    end
    local hum = v.Character:FindFirstChildOfClass("Humanoid")
    if not (hum and hum.Health > 0) then return nil end
    return v
end

local function ResolveAimTarget()
    if ABmethod == "Select Player" then
        return GetSelectedEnemyPlayer()
    end
    return GetNearestEnemyPlayer()
end

spawn(function()
    while task.wait(0.03) do
        pcall(function()
            if not getgenv().AimMethod then return end
            local target = ResolveAimTarget()
            local tarHRP = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if not tarHRP then return end

            local predict = tarHRP.AssemblyLinearVelocity * 0.12
            getgenv().MousePos = tarHRP.Position + predict
        end)
    end
end)

-- Auto Aimbot Camera
Tabs.PVP:AddToggle({
    Name = "Auto Aimbot Camera",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAimbotCamera = Value
    end
})

-- Sword Kill
Tabs.PVP:AddSection("Sword Kill")

getgenv().SwordKillEnabled = false
getgenv().SwordKillMode = "Trident Z"

local SwordKillState = {
    CharAdded = nil,
    ChildAdded = nil,
    AnimPlayed = nil
}

local function ClearSwordKillConnections()
    if SwordKillState.ChildAdded then
        SwordKillState.ChildAdded:Disconnect()
        SwordKillState.ChildAdded = nil
    end
    if SwordKillState.AnimPlayed then
        SwordKillState.AnimPlayed:Disconnect()
        SwordKillState.AnimPlayed = nil
    end
end

local function SwordKillTPSpam(char, loops)
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _ = 1, loops do
        if not getgenv().SwordKillEnabled then break end
        if not hrp.Parent then break end
        hrp.CFrame = CFrame.new(hrp.Position.X, -99999, hrp.Position.Z)
        task.wait()
    end
end

local function HookSwordKill(char)
    ClearSwordKillConnections()
    if not getgenv().SwordKillEnabled then return end
    if not char then return end

    local mode = getgenv().SwordKillMode
    local useTrident = (mode == "Trident Z" or mode == "All Skill")
    local useSaddi = (mode == "Saddi Z" or mode == "All Skill")
    local useUniversal = (mode == "All Skill")

    if useTrident then
        SwordKillState.ChildAdded = char.ChildAdded:Connect(function(v)
            if v and v.Name == "TridentGrabZ" then
                task.delay(0.8, function()
                    if getgenv().SwordKillEnabled and v and v.Parent then
                        task.spawn(SwordKillTPSpam, char, 15)
                    end
                end)
            end
        end)
    end

    if useSaddi or useUniversal then
        local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 5)
        if not hum then return end
        SwordKillState.AnimPlayed = hum.AnimationPlayed:Connect(function(track)
            if not (track and track.Name) then return end
            local tname = track.Name
            local lowerName = string.lower(tname)

            if useSaddi and tname == "Saddi_Z_Charge" then
                local stoppedConn
                stoppedConn = track.Stopped:Connect(function()
                    if stoppedConn then
                        stoppedConn:Disconnect()
                    end
                    if getgenv().SwordKillEnabled then
                        task.spawn(SwordKillTPSpam, char, 10)
                    end
                end)
                return
            end

            if useUniversal then
                if lowerName:find("idle") or lowerName:find("walk") or lowerName:find("run") or lowerName:find("jump") or lowerName:find("fall") then
                    return
                end

                local tool = char:FindFirstChildOfClass("Tool")
                local isSword = tool and (tool.ToolTip == "Sword" or tool:GetAttribute("WeaponType") == "Sword")
                local looksLikeSwordSkill = lowerName:find("sword") or lowerName:find("_z_") or lowerName:find("_x_") or lowerName:find("_c_") or lowerName:find("z_charge")
                if isSword and looksLikeSwordSkill then
                    task.delay(0.08, function()
                        if getgenv().SwordKillEnabled then
                            task.spawn(SwordKillTPSpam, char, 12)
                        end
                    end)
                end
            end
        end)
    end
end

if not SwordKillState.CharAdded then
    SwordKillState.CharAdded = plr.CharacterAdded:Connect(function(char)
        HookSwordKill(char)
    end)
end

Tabs.PVP:AddDropdown({
    Name = "Sword Kill Method",
    Options = {"Trident Z", "Saddi Z", "All Skill"},
    Default = "Trident Z",
    Callback = function(Value)
        getgenv().SwordKillMode = Value
        if getgenv().SwordKillEnabled then
            HookSwordKill(plr.Character)
        end
    end
})

Tabs.PVP:AddToggle({
    Name = "Sword One Hit",
    Default = false,
    Callback = function(Value)
        getgenv().SwordKillEnabled = Value
        if Value then
            HookSwordKill(plr.Character)
        else
            ClearSwordKillConnections()
        end
    end
})

-- =====================
-- FAST GUN (PVP)
-- =====================
Tabs.PVP:AddSection("Fast Gun")

getgenv().FastGunPVP = false
getgenv().FastGunRange = 300
getgenv().FastGunMobs = false
getgenv().FastGunDelay = 0.08

Tabs.PVP:AddToggle({
    Name = "Fast Gun (PVP)",
    Default = false,
    Callback = function(Value)
        getgenv().FastGunPVP = Value
    end
})

Tabs.PVP:AddToggle({
    Name = "Fast Gun (Mobs)",
    Default = true,
    Callback = function(Value)
        getgenv().FastGunMobs = Value
    end
})

Tabs.PVP:AddSlider({
    Name = "Gun Range (max 500)",
    Min = 50, Max = 500, Default = 150,
    Callback = function(Value)
        getgenv().FastGunRange = math.clamp(math.floor(Value), 1, 500)
    end
})

Tabs.PVP:AddSlider({
    Name = "Gun Delay (0.03 - 0.30)",
    Min = 3, Max = 30, Default = 5,
    Callback = function(Value)
        getgenv().FastGunDelay = math.clamp(Value / 100, 0.03, 0.30)
    end
})

local function IsGunTool(tool)
    if not tool then return false end
    if tool:GetAttribute("WeaponType") == "Gun" then return true end
    local name = tool.Name:lower()
    local tip = tool.ToolTip and tool.ToolTip:lower() or ""
    return name:find("gun") or name:find("pistol") or name:find("rifle") or name:find("sniper")
        or tip:find("gun") or tip:find("pistol") or tip:find("rifle") or tip:find("sniper")
end

local function GetNearestPvpTarget(range)
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local best, bestDist
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= plr and v.Team ~= plr.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local hum = v.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local dist = (v.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                if dist <= range and (not bestDist or dist < bestDist) then
                    bestDist = dist
                    best = v.Character.HumanoidRootPart
                end
            end
        end
    end
    return best
end

local function GetNearestMobTarget(range)
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local best, bestDist
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    for _, v in pairs(enemies:GetChildren()) do
        if v and v:FindFirstChild("HumanoidRootPart") then
            local hum = v:FindFirstChildOfClass("Humanoid") or v:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then
                local dist = (v.HumanoidRootPart.Position - hrp.Position).Magnitude
                if dist <= range and (not bestDist or dist < bestDist) then
                    bestDist = dist
                    best = v.HumanoidRootPart
                end
            end
        end
    end
    return best
end

local function GetNearestSeaTarget(range)
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local best, bestDist
    local seaBeasts = workspace:FindFirstChild("SeaBeasts")
    if seaBeasts then
        for _, v in pairs(seaBeasts:GetChildren()) do
            local part = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
            local hp = v:FindFirstChild("Health")
            if part and hp and hp.Value > 0 then
                local dist = (part.Position - hrp.Position).Magnitude
                if dist <= range and (not bestDist or dist < bestDist) then
                    bestDist = dist
                    best = part
                end
            end
        end
    end
    -- Boats / sea mobs with VehicleSeat
    local boats = workspace:FindFirstChild("Boats")
    if boats then
        for _, v in pairs(boats:GetDescendants()) do
            if v:IsA("VehicleSeat") then
                local dist = (v.Position - hrp.Position).Magnitude
                if dist <= range and (not bestDist or dist < bestDist) then
                    bestDist = dist
                    best = v
                end
            end
        end
    end
    return best
end

task.spawn(function()
    while true do
        local delay = math.clamp(getgenv().FastGunDelay or 0.08, 0.03, 0.30)
        delay = delay + (math.random() * 0.02)
        task.wait(delay)
        if getgenv().FastGunPVP or getgenv().FastGunMobs then
            pcall(function()
                local tool = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
                if not IsGunTool(tool) then return end
                local range = math.clamp(getgenv().FastGunRange or 300, 1, 500)
                local target = nil
                if getgenv().FastGunPVP then
                    target = GetNearestPvpTarget(range)
                end
                if not target and getgenv().FastGunMobs then
                    target = GetNearestMobTarget(range)
                    if not target then
                        target = GetNearestSeaTarget(range)
                    end
                end
                if not target then return end
                pcall(function() sethiddenproperty(plr, "SimulationRadius", 5000) end)
                local mods = replicated and replicated:FindFirstChild("Modules")
                local net = mods and mods:FindFirstChild("Net")
                local shoot = net and net:FindFirstChild("RE/ShootGunEvent")
                if shoot then
                    shoot:FireServer(target.Position, {target})
                elseif tool and tool:FindFirstChild("LeftClickRemote") then
                    local dir = (target.Position - plr.Character.HumanoidRootPart.Position).Unit
                    tool.LeftClickRemote:FireServer(dir, 1)
                elseif tool then
                    tool:Activate()
                end
            end)
        end
    end
end)

spawn(function()
    local camera = workspace.CurrentCamera

    while task.wait(0.03) do
        pcall(function()
            if getgenv().AutoAimbotCamera then
                local target = ResolveAimTarget and ResolveAimTarget() or nil
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    local tar = target.Character.HumanoidRootPart
                    local lookAt = tar.Position + (tar.AssemblyLinearVelocity * 0.08)
                    local desired = CFrame.new(camera.CFrame.Position, lookAt)
                    camera.CFrame = camera.CFrame:Lerp(desired, 0.28)
                end
            end
        end)
    end
end)

-- Speed Run Player
Tabs.PVP:AddToggle({
    Name = "Speed Run Player",
    Default = false,
    Callback = function(Value)
        getgenv().InfAbility = Value
        if Value == false then
            local hrp = plr.Character and plr.Character.HumanoidRootPart
            if hrp and hrp:FindFirstChild("Agility") then
                hrp.Agility:Destroy()
            end
        end
    end
})

-- No Clip
Tabs.PVP:AddToggle({
    Name = "No Clip",
    Default = false,
    Callback = function(Value)
        getgenv().NoClip = Value
    end
})

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().NoClip and plr.Character then
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)