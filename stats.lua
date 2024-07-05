local datastore = game:GetService("DataStoreService")
local datakey = 1

--stat
local atkdata = datastore:GetDataStore("Attack")
local defdata = datastore:GetDataStore("Defense")
local spddata = datastore:GetDataStore("Speed")
local intdata = datastore:GetDataStore("Intelligence")

--xp
local atkxpdata = datastore:GetDataStore("atkxp"..datakey)
local defxpdata = datastore:GetDataStore("defxp"..datakey)
local spdxpdata = datastore:GetDataStore("spdxp"..datakey)
local intxpdata = datastore:GetDataStore("intxp"..datakey)

--rank
local atkrankdata = datastore:GetDataStore("atkrank"..datakey)
local defrankdata = datastore:GetDataStore("defrank"..datakey)
local spdrankdata = datastore:GetDataStore("spdrank"..datakey)
local intrankdata = datastore:GetDataStore("intrank"..datakey)

local allstats = {
	"F", "F+", "E", "E+", "D", "D+", "C", "C+", "B", "B+",
	"A", "A+", "S", "S+", "SS", "SS+", "SSS", "SSS+","SR", "SR+",
	"SSR", "SSR+", "UR", "UR+", "LR", "LR+", "MR", "MR+",
	"X","XX","XXX"
}

local statslv = {
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
	12, 13, 15, 16, 18, 19, 21, 22, 25,
	27, 31, 34, 39, 43, 49, 54, 61,
	70, 90, 120    
}

local statsdmg = {
	20, 100, 200, 300, 400, 500, 600, 700, 800, 900,
	1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000,
	12000, 14000, 16000, 18000, 20000, 25000, 30000, 40000,
	100000,500000,10000000    
}

local statsspd = {
	23, 25, 28, 31, 34, 37, 40, 43, 46, 49,
	52, 55, 58, 61, 64, 67, 70, 73, 76, 79,
	82, 85, 88, 91, 94, 97, 100, 110, 
	120, 135, 150
}

local statsdef = {
	200, 400, 700, 900, 1200, 1400, 1700, 1900, 2200, 2400,
	2700, 2900, 3200, 3400, 3700, 3900, 4200, 4400, 4800, 5000,
	5400, 5600, 6000, 6300, 6800, 7100, 7700, 8100, 
	12000, 22000, 33000
}
game.Players.PlayerAdded:Connect(function(Player)
	local UserId = Player.UserId

	--folder
	local Stats_Folder = Instance.new("Folder",Player)
	Stats_Folder.Name = "Statfol"

	--stat
	--atk
	local atk_Stats = Instance.new("IntValue",Stats_Folder)
	atk_Stats.Name = "Attack"
	atk_Stats.Value = atkdata:GetAsync(UserId) or 20
	--def
	local def_Stats = Instance.new("IntValue",Stats_Folder)
	def_Stats.Name = "Defense"
	def_Stats.Value = defdata:GetAsync(UserId) or 20
	--spd
	local spd_Stats = Instance.new("IntValue",Stats_Folder)
	spd_Stats.Name = "Speed"
	spd_Stats.Value = spddata:GetAsync(UserId) or 17
	--int
	local int_Stats = Instance.new("IntValue",Stats_Folder)
	int_Stats.Name = "Technique"
	int_Stats.Value = intdata:GetAsync(UserId) or 20

	--stat exp
	--atk
	local atkxp = Instance.new("IntValue",Stats_Folder)
	atkxp.Name = "atkxp"
	atkxp.Value = atkxpdata:GetAsync(UserId) or 1
	--def
	local defxp = Instance.new("IntValue",Stats_Folder)
	defxp.Name = "defxp"
	defxp.Value = defxpdata:GetAsync(UserId) or 1
	--spd
	local spdxp = Instance.new("IntValue",Stats_Folder)
	spdxp.Name = "spdxp"
	spdxp.Value = spdxpdata:GetAsync(UserId) or 1
	--int
	local intxp = Instance.new("IntValue",Stats_Folder)
	intxp.Name = "intxp"
	intxp.Value = intxpdata:GetAsync(UserId) or 1

	--rank
	--atk
	local atkrank = Instance.new("StringValue",Stats_Folder)
	atkrank.Name = "atkrank"
	atkrank.Value = atkrankdata:GetAsync(UserId) or "F"
	--def
	local defrank = Instance.new("StringValue",Stats_Folder)
	defrank.Name = "defrank"
	defrank.Value = defrankdata:GetAsync(UserId) or "F"
	--spd
	local spdrank = Instance.new("StringValue",Stats_Folder)
	spdrank.Name = "spdrank"
	spdrank.Value = spdrankdata:GetAsync(UserId) or "F"
	--int
	local intrank = Instance.new("StringValue",Stats_Folder)
	intrank.Name = "intrank"
	intrank.Value = intrankdata:GetAsync(UserId) or "F"

	local atks = atkxp.Value
	local defs = defxp.Value
	local spds = spdxp.Value
	local ints = intxp.Value
	
	while wait() do
		if atks ~= atkxp.Value or defs ~= defxp.Value or spds ~= spdxp.Value or ints ~= intxp.Value then
			local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
			for i = 1, #statslv do
				if atkxp.Value >= statslv[i] then
					atks = atkxp.Value
					atkrank.Value = allstats[i]
					atk_Stats.Value = statsdmg[i]
				elseif atkxp.Value <= 0 then
					atks = atkxp.Value
					atkrank.Value = "F"
					atk_Stats.Value = 5
					atkxp.Value = 1
				end
				if defxp.Value >= statslv[i] then
					defs = defxp.Value
					defrank.Value = allstats[i]
					def_Stats.Value = statsdef[i]
					humanoid.MaxHealth = def_Stats.Value
					humanoid.Health = humanoid.MaxHealth
				elseif defxp.Value <= 0 then
					defs = defxp.Value
					defrank.Value = "F"
					def_Stats.Value = 5
					defxp.Value = 1
				end
				if spdxp.Value >= statslv[i] then
					spds = spdxp.Value
					spdrank.Value = allstats[i]
					spd_Stats.Value = statsspd[i]
				elseif spdxp.Value <= 0 then
					spds = spdxp.Value
					spdrank.Value = "F"
					spd_Stats.Value = 5
					spdxp.Value = 1
				end
				if intxp.Value  >= statslv[i] then
					ints = intxp.Value
					intrank.Value = allstats[i]
					int_Stats.Value = statsdmg[i]
				elseif intxp.Value <= 0 then
					ints = intxp.Value
					intrank.Value = "F"
					int_Stats.Value = 5
					intxp.Value = 1
				end
			end
		end
	end    
end)
