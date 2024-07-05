local LocalPlayer = game.Players.LocalPlayer
local userid = LocalPlayer.UserId

---------- Stats ----------
local Stats_Folder = LocalPlayer:WaitForChild("Statfol")
local atk_Stats = Stats_Folder:WaitForChild("Attack") 
local spd_Stats = Stats_Folder:WaitForChild("Speed") 
local def_Stats = Stats_Folder:WaitForChild("Defense") 
local int_Stats = Stats_Folder:WaitForChild("Intelligence") 
local rank = Stats_Folder:WaitForChild("Rank")
---------- exp----------
local atkrank = Stats_Folder:WaitForChild("atkrank") 
local spdrank = Stats_Folder:WaitForChild("spdrank") 
local defrank = Stats_Folder:WaitForChild("defrank") 
local intrank = Stats_Folder:WaitForChild("intrank") 
---------- Gui ----------
local Gui = script.Parent
local Stats_Frame = Gui:WaitForChild("Stats")
local atk_Frame = Stats_Frame:WaitForChild("attack")
local def_Frame = Stats_Frame:WaitForChild("defense")
local spd_Frame = Stats_Frame:WaitForChild("speed")
local int_Frame = Stats_Frame:WaitForChild("int")
---------- Gui Text ----------
local atk_Text = atk_Frame:WaitForChild("Number")
local spd_Text = spd_Frame:WaitForChild("Number")
local def_Text = def_Frame:WaitForChild("Number")
local int_Text = int_Frame:WaitForChild("Number")
local rank_Text = Stats_Frame:WaitForChild("rank")

---------- Function ----------

local allstats = {
	"F", "F+", "E", "E+", "D", "D+", "C", "C+", "B", "B+",
	"A", "A+", "S", "S+", "SS", "SS+", "SSS", "SSS+","SR", "SR+",
	"SSR", "SSR+", "UR", "UR+", "LR", "LR+", "MR", "MR+",
	"X","XX","XXX"
}

local colors = {
	Color3.new(0.666667, 0.670588, 0.658824), -- F ถึง F+
	Color3.new(0.839216, 0.839216, 0.839216), -- E ถึง E+
	Color3.new(0.862745, 0.862745, 0.862745), -- D ถึง D+
	Color3.new(0.666667, 1, 0.498039),        -- C ถึง C+
	Color3.new(0.333333, 1, 1),               -- B ถึง B+
	Color3.new(1, 0.666667, 0.498039),        -- A ถึง A+
	Color3.new(1, 0, 0),                      -- S ถึง SSS+
	Color3.new(1, 0.803922, 0.0196078),       -- SR ถึง SR+
	Color3.new(1, 0, 1),                      -- SSR ถึง SSR+
	Color3.new(0.188235, 0.541176, 1),        -- UR ถึง UR+
	Color3.new(1, 0.333333, 0),               -- LR ถึง LR+
	Color3.new(0.666667, 0, 1),               -- MR ถึง MR+
	Color3.new(0.666667, 0, 0),               -- X ถึง XXX
}

local function getColorForStat(stat)
	local index = table.find(allstats, stat)
	if not index then return nil end

	if index <= 2 then return colors[1]       -- F ถึง F+
	elseif index <= 4 then return colors[2]   -- E ถึง E+
	elseif index <= 6 then return colors[3]   -- D ถึง D+
	elseif index <= 8 then return colors[4]   -- C ถึง C+
	elseif index <= 10 then return colors[5]  -- B ถึง B+
	elseif index <= 12 then return colors[6]  -- A ถึง A+
	elseif index <= 18 then return colors[7]  -- S ถึง SSS+
	elseif index <= 20 then return colors[8]  -- SR ถึง SR+
	elseif index <= 22 then return colors[9]  -- SSR ถึง SSR+
	elseif index <= 24 then return colors[10] -- UR ถึง UR+
	elseif index <= 26 then return colors[11] -- LR ถึง LR+
	elseif index <= 28 then return colors[12] -- MR ถึง MR+
	else return colors[13]                    -- X ถึง XXX
	end
end


-----------update stas---------
function Update_Value()
	atk_Text.Text = atkrank.Value
	spd_Text.Text = spdrank.Value
	def_Text.Text = defrank.Value
	int_Text.Text = intrank.Value
	rank_Text.Text = "Rank : "..rank.Value

	-- Set colors based on rank
	atk_Text.TextColor3 = getColorForStat(atkrank.Value)
	spd_Text.TextColor3 = getColorForStat(spdrank.Value)
	def_Text.TextColor3 = getColorForStat(defrank.Value)
	int_Text.TextColor3 = getColorForStat(intrank.Value)
end


while wait() do
	Update_Value()
end
