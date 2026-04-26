local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CollectionService = game:GetService("CollectionService")
local lp = Players.LocalPlayer
local replicated = game:GetService("ReplicatedStorage")

-- [[ 1. SET TEAM ]]
pcall(function()
    local teamRemote = replicated:WaitForChild("Remotes"):WaitForChild("CommF_")
    teamRemote:InvokeServer("SetTeam", getgenv().team or "Pirates")
end)

-- [[ ESP PRO LOGIC ]]
local espObjects = {}
local function getTeamColor(player)
    return (player.Team ~= lp.Team) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 0, 255)
end

local function removeESP(player)
    if espObjects[player] then
        for _, v in pairs(espObjects[player]) do pcall(function() v:Destroy() end) end
        espObjects[player] = nil
    end
end

local function createESP(player)
    if player == lp then return end
    removeESP(player)
    local char = player.Character
    if not char then return end
    local head = char:FindFirstChild("Head") or char:FindFirstChildWhichIsA("BasePart")
    if not head then return end

    local hl = Instance.new("Highlight", char)
    hl.FillTransparency = 0.7
    hl.OutlineColor = getTeamColor(player)
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

    local bb = Instance.new("BillboardGui", head)
    bb.Size = UDim2.new(0, 200, 0, 50)
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 3, 0)

    local img = Instance.new("ImageLabel", bb)
    img.Size = UDim2.new(0, 45, 0, 45)
    img.BackgroundTransparency = 1
    img.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=150&height=150&format=png"

    local txt = Instance.new("TextLabel", bb)
    txt.Size = UDim2.new(1, -50, 1, 0)
    txt.Position = UDim2.new(0, 50, 0, 0)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = getTeamColor(player)
    txt.TextStrokeTransparency = 0.5
    txt.TextScaled = true
    txt.Font = Enum.Font.Code
    txt.TextXAlignment = Enum.TextXAlignment.Left

    local arw = Instance.new("ImageLabel", bb)
    arw.Size = UDim2.new(0, 15, 0, 15)
    arw.Position = UDim2.new(0.5, -7.5, 1, 0)
    arw.BackgroundTransparency = 1
    arw.Image = "rbxassetid://7072716990"
    arw.ImageColor3 = getTeamColor(player)

    espObjects[player] = {hl = hl, bb = bb, txt = txt, arw = arw}
    
    task.spawn(function()
        while player.Parent and char.Parent and espObjects[player] do
            local root = char:FindFirstChild("HumanoidRootPart")
            if root and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                local dist = math.floor((root.Position - lp.Character.HumanoidRootPart.Position).Magnitude)
                local hum = char:FindFirstChildOfClass("Humanoid")
                local hp = hum and math.floor((hum.Health/hum.MaxHealth)*100) or 0
                local lv = (player:FindFirstChild("Data") and player.Data:FindFirstChild("Level")) and player.Data.Level.Value or "?"
                txt.Text = string.format("Lv: %s | %s\n%d M | HP: %d%%", tostring(lv), player.Name, dist, hp)
            end
            task.wait(0.3)
        end
        removeESP(player)
    end)
end

for _, p in pairs(Players:GetPlayers()) do
    p.CharacterAdded:Connect(function() task.wait(0.5); createESP(p) end)
    if p.Character then createESP(p) end
end
Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function() task.wait(0.5); createESP(p) end) end)
Players.PlayerRemoving:Connect(removeESP)

-- [[ BLUE AURA ]]
task.spawn(function()
    while task.wait(1) do
        if lp.Character and not lp.Character:FindFirstChild("Blue_Aura") then
            local hl = Instance.new("Highlight", lp.Character); hl.Name = "Blue_Aura"
            hl.FillColor, hl.FillTransparency = Color3.fromRGB(0, 150, 255), 0.5
            hl.OutlineColor = Color3.new(1,1,1)
        end
    end
end)

local Platform = Instance.new("Part", workspace); Platform.Size, Platform.Anchored, Platform.Transparency = Vector3.new(30, 1, 30), true, 1
RunService.Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and _G.TargetPlayer then
        Platform.CFrame = lp.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.5, 0)
        for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
    end
end)
-- [[ 2. LOGIC ANTI-STUN (CHI TIẾT) ]]
local function AntiStunLogic()
    local char = lp.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hum and hrp then
            hum.PlatformStand = false
            hum.Sit = false
            if hum.WalkSpeed < 100 then hum.WalkSpeed = 200 end
            hum.JumpPower = 150

            local animator = hum:FindFirstChildOfClass("Animator")
            if animator then
                for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                    if track.Name:lower():find("stun") or track.Name:lower():find("hit") then
                        track:Stop()
                    end
                end
            end

            for _, v in ipairs(hrp:GetChildren()) do
                if (v:IsA("BodyVelocity") or v:IsA("BodyPosition") or v:IsA("BodyAngularVelocity") or v:IsA("LinearVelocity")) and v.Name ~= "BananaFix" then
                    v:Destroy()
                end
            end
        end
    end
end

-- [[ 3. LOGIC AUTO KEN ]]
local function AutoKenLogic()
    if lp.Character and CollectionService:HasTag(lp.Character, "Ken") then
        local pGui = lp:FindFirstChild("PlayerGui")
        local kenBtn = pGui and pGui:FindFirstChild("MobileContextButtons") 
            and pGui.MobileContextButtons:FindFirstChild("ContextButtonFrame") 
            and pGui.MobileContextButtons.ContextButtonFrame:FindFirstChild("BoundActionKen")
        
        if kenBtn and kenBtn:GetAttribute("Selected") ~= true then
            pcall(function()
                replicated:WaitForChild("Remotes"):WaitForChild("CommE"):FireServer("Ken", true)
                kenBtn:SetAttribute("Selected", true)
            end)
        end
        
        local success, om = pcall(function() return getrenv()._G.OM end)
        if success and om and not om.active then
            om.radius = 0
            if type(om.setActive) == "function" then om:setActive(true) end
        end
    end
end

-- [[ 4. HITBOX EXPANSION ]]
local function ApplyHitbox()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            hrp.Size = Vector3.new(75, 75, 75)
            hrp.Transparency = 0.85
            hrp.BrickColor = BrickColor.new("Really red")
            hrp.Material = Enum.Material.Neon
            hrp.CanCollide = false
        end
    end
end

-- [[ 5. AUTO RACE V4 ]]
local function AutoRaceV4()
    if lp.Character and lp.Character:FindFirstChild("RaceEnergy") then
        if lp.Character.RaceEnergy.Value >= 1 then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Y, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Y, false, game)
        end
    end
end

-- [[ 6. GIAO DIỆN ]]
if CoreGui:FindFirstChild("BananaHUD_AntiFall") then CoreGui.BananaHUD_AntiFall:Destroy() end
local sg = Instance.new("ScreenGui", CoreGui); sg.Name = "BananaHUD_AntiFall"; sg.IgnoreGuiInset = true
local Main = Instance.new("Frame", sg); Main.Size, Main.Position, Main.BackgroundTransparency = UDim2.new(0, 800, 0, 450), UDim2.new(0.5, -400, 0.05, 0), 1
local list = Instance.new("UIListLayout", Main); list.HorizontalAlignment, list.Padding = Enum.HorizontalAlignment.Center, UDim.new(0, 10)

local function AddLabel(text, color, size)
    local l = Instance.new("TextLabel", Main); l.Text, l.TextColor3, l.TextSize, l.Font = text, color, size, Enum.Font.FredokaOne
    l.BackgroundTransparency, l.Size = 1, UDim2.new(1, 0, 0, size + 15)
    Instance.new("UIStroke", l).Thickness = 3
    return l
end

local Title = AddLabel("? HUB BOUNTY", Color3.fromRGB(255, 200, 80), 50)
local TimeL = AddLabel("Time: 0h0m0s", Color3.fromRGB(255, 255, 255), 26)
local BountyL = AddLabel("Bounty: 0", Color3.fromRGB(255, 255, 255), 26)
local StatusL = AddLabel("Status: Initializing...", Color3.fromRGB(255, 255, 255), 16)

local BtnContainer = Instance.new("Frame", Main); BtnContainer.Size, BtnContainer.BackgroundTransparency = UDim2.new(0, 400, 0, 50), 1
local function CreateBtn(text, pos, color)
    local b = Instance.new("TextButton", BtnContainer); b.Size, b.Position, b.Text, b.BackgroundColor3 = UDim2.new(0, 180, 0, 40), pos, text, color
    b.Font, b.TextSize, b.TextColor3 = Enum.Font.FredokaOne, 18, Color3.new(1,1,1)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    return b
end
local NextBtn = CreateBtn("Next Player", UDim2.new(0, 10, 0, 0), Color3.fromRGB(40, 120, 200))
local HopBtn = CreateBtn("Hop Server", UDim2.new(0, 210, 0, 0), Color3.fromRGB(200, 40, 40))

-- [[ THÔNG BÁO BOUNTY ]]
local oldBounty = lp.leaderstats["Bounty/Honor"].Value
lp.leaderstats["Bounty/Honor"].Changed:Connect(function(newVal)
    if newVal > oldBounty then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "TARGET KILLED!",
            Text = "Gained: +" .. tostring(newVal - oldBounty) .. " Bounty",
            Duration = 5
        })
    end
    oldBounty = newVal
end)

-- [[ 7. LOOP CHẠY NGẦM ]]
RunService.Heartbeat:Connect(function()
    AntiStunLogic()
    ApplyHitbox()
end)

task.spawn(function()
    while task.wait(0.5) do
        AutoKenLogic()
        AutoRaceV4()
    end
end)

-- [[ 8. HOP SERVER ]]
local function HopServer()
    local Api = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100"
    local function GetServers(cursor)
        local success, result = pcall(function() return game:HttpGet(Api .. (cursor and "&cursor=" .. cursor or "")) end)
        if success then return HttpService:JSONDecode(result) end
    end
    
    local sList = GetServers()
    local ValidServers = {}
    
    while sList do
        for _, s in pairs(sList.data) do
            -- Chỉ chọn server dưới 11 người để chắc chắn không bị Full
            if s.playing <= 10 and s.id ~= game.JobId then
                table.insert(ValidServers, s.id)
            end
        end
        -- Nếu tìm được kha khá server rồi thì thôi không quét trang tiếp theo nữa cho nhanh
        if #ValidServers >= 5 or not sList.nextPageCursor then break end
        sList = GetServers(sList.nextPageCursor)
        task.wait(0.1)
    end

    if #ValidServers > 0 then
        -- Random server trong list để tránh trùng
        local randomServer = ValidServers[math.random(1, #ValidServers)]
        TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServer, lp)
    else
        print("Không tìm thấy server nào trống slot!")
    end
end

-- [[ 9. SĂN BOUNTY CHÍNH ]]
_G.TargetPlayer = nil
local StartAttackTime, IsReached = 0, false
local startSession, lastHopTime = os.time(), os.time()
local CurrentTween = nil

NextBtn.MouseButton1Click:Connect(function() _G.TargetPlayer = nil end)
HopBtn.MouseButton1Click:Connect(function() HopServer() end)

task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local now = os.time()
            TimeL.Text = "Time: " .. string.format("%dh%dm%ds", math.floor((now-startSession)/3600), math.floor(((now-startSession)%3600)/60), (now-startSession)%60)
            BountyL.Text = "Bounty: " .. tostring(lp.leaderstats["Bounty/Honor"].Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
            
            local hopCountdown = math.max(0, 300 - (now - lastHopTime))
            if hopCountdown <= 0 then lastHopTime = now; HopServer() end
            
            local target = _G.TargetPlayer
            if target and target.Parent and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and target.Character.Humanoid.Health > 0 then
                local hrp, thit = lp.Character.HumanoidRootPart, target.Character.HumanoidRootPart
                local dist = (hrp.Position - thit.Position).Magnitude

                -- ANTI-FALL CHỐNG RỚT
                if not hrp:FindFirstChild("BananaFix") then
                    local bv = Instance.new("BodyVelocity", hrp)
                    bv.Name = "BananaFix"
                    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
                
                if dist < 50 and not IsReached then IsReached = true; StartAttackTime = now end
                local skip = IsReached and math.max(0, 25 - (now - StartAttackTime)) or 0
                if IsReached and skip <= 0 then _G.TargetPlayer = nil end

                StatusL.Text = string.format("Hunting: %s | HP: %d | Dist: %d | Skip: %ds | Hop: %ds", target.Name, math.floor(target.Character.Humanoid.Health), math.floor(dist), skip, hopCountdown)
                
                if not lp.Character:FindFirstChild("HasBuso") then replicated.Remotes.CommF_:InvokeServer("Buso") end
                for _, v in pairs(lp.Backpack:GetChildren()) do
                    if v:IsA("Tool") and (v.Name:find("Fruit") or v.ToolTip == "Blox Fruit") then
                        lp.Character.Humanoid:EquipTool(v) break
                    end
                end

                if CurrentTween then CurrentTween:Cancel() end
                CurrentTween = TweenService:Create(hrp, TweenInfo.new(dist/350, Enum.EasingStyle.Linear), {CFrame = thit.CFrame * CFrame.new(0, 7, 0)})
                CurrentTween:Play()
            else
                if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character.HumanoidRootPart:FindFirstChild("BananaFix") then
                    lp.Character.HumanoidRootPart.BananaFix:Destroy()
                end

                if CurrentTween then CurrentTween:Cancel() end
                StatusL.Text = string.format("Status: Searching... | Hop: %ds", hopCountdown)
                local players = Players:GetPlayers()
                _G.TargetPlayer = players[math.random(1, #players)]
                if _G.TargetPlayer == lp then _G.TargetPlayer = nil end
                IsReached, StartAttackTime = false, 0
            end
        end)
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/duy260414-lang/Fastattack/refs/heads/main/Ultra"))()