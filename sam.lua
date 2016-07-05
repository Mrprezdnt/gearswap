-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC","MaxACC"} -- 4 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. Can Delete Lentus If You Don't Need It. --
	WeaponIndex = 3
	WeaponArray = {"Kogarasumaru","Tsurumaru","Amanomurakumo","Masamune"} -- Default TP Set Is Amanomurakumo. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	TypeIndex = 1
	Armor = 'None'
	Twilight = 'None'
	warning = false
	Attack = 'OFF' -- Set Default WS Attack Set ON or OFF Here --
	Seigan = 'ON' -- Set Default Seigan Set ON or OFF Here --
	Third_Eye = 'ON' -- Set Default Third Eye Set ON or OFF Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	ammo_warning_limit = 10 -- Set Ammo Limit Check Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	-- Gavialis Helm --
	elements = {}
	elements.equip = {head="Gavialis Helm"}
	elements["Tachi: Shoha"] = S{"Lightning","Dark","Wind"}
	elements["Tachi: Fudo"] = S{"Light","Ice","Water","Wind","Fire","Lightning"}
	elements["Tachi: Rana"] = S{"Dark","Earth","Ice"}
	elements["Tachi: Ageha"] = S{"Dark","Earth"}
	elements["Tachi: Kasha"] = S{"Fire","Light","Dark"}
	elements["Tachi: Gekko"] = S{"Water","Ice"}

	sc_map = {SC1="TachiFudo", SC2="TachiRana", SC3="NamasArrow"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			head="Twilight Helm",
			neck="Wiglen Gorget",
			ear1="Sanare Earring",
			ear2="Dawn Earring",
			body="Kumarbi's Akar",
			hands="Otronif Gloves +1",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Repulse Mantle",
			waist="Lycopodium Sash",
			legs="Otronif Brais +1",
			feet="Danzo Sune-Ate"}
	sets.Idle.Regen.Kogarasumaru = set_combine(sets.Idle.Regen,{
			main="Kogarasumaru",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow"})
	sets.Idle.Regen.Tsurumaru = set_combine(sets.Idle.Regen,{
			main="Tsurumaru",
			sub="Bloodrain Strap",
			range="Yoichinoyumi",
			ammo="Eminent Arrow"})
	sets.Idle.Regen.Amanomurakumo = set_combine(sets.Idle.Regen,{
			main="Amanomurakumo",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow"})
	sets.Idle.Regen.Masamune = set_combine(sets.Idle.Regen,{
			main="Masamune",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow"})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Tartarus Platemail",
			ring1="Defending Ring",
			ring2="Patricius Ring"})
	sets.Idle.Movement.Kogarasumaru = set_combine(sets.Idle.Movement,{
			main="Kogarasumaru",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow"})
	sets.Idle.Movement.Tsurumaru = set_combine(sets.Idle.Movement,{
			main="Tsurumaru",
			sub="Bloodrain Strap",
			range="Yoichinoyumi",
			ammo="Eminent Arrow"})
	sets.Idle.Movement.Amanomurakumo = set_combine(sets.Idle.Movement,{
			main="Amanomurakumo",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow"})
	sets.Idle.Movement.Masamune = set_combine(sets.Idle.Movement,{
			main="Masamune",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow"})

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- Preshot Set --
	sets.Preshot = {}

	-- Midshot Sets --
	sets.Midshot = {}
	sets.Midshot.MidACC = set_combine(sets.Midshot,{})
	sets.Midshot.HighACC = set_combine(sets.Midshot.MidACC,{})
	sets.Midshot.MaxACC = set_combine(sets.Midshot.HighACC,{})

	-- TP Base Set --
	sets.TP = {}

	-- Kogarasumaru(AM3 Down) TP Sets --
	sets.TP.Kogarasumaru = {
			main="Kogarasumaru",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow",
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Haste+3','STR+7 DEX+7',}},
			neck="Ganesha's Mala",
			ear1="Tripudio Earring",
			ear2="Enervating Earring",
			body="Kasuga Domaru +1",
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}},
			waist="Windbuffet Belt +1",
			legs="Kasuga Haidate +1",
			feet="Sak. Sune-Ate +1"}
	sets.TP.Kogarasumaru.MidACC = set_combine(sets.TP.Kogarasumaru,{
			ear2="Zennaroi Earring",
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+6 DEX+6',}}})
	sets.TP.Kogarasumaru.HighACC = set_combine(sets.TP.Kogarasumaru.MidACC,{
			neck="Da. Nodowa +1",
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			waist="Olseni Belt"})
	sets.TP.Kogarasumaru.MaxACC = set_combine(sets.TP.Kogarasumaru.HighACC,{
			head="Yaoyotl Helm",
			neck="Iqabi Necklace",
			ear1="Steelflash Earring",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1",
			back="Ground. Mantle +1",
			waist="Dynamic Belt +1"})
			
	-- Kogarasumaru(AM3 Up) TP Sets --
	sets.TP.Kogarasumaru.AM3 = set_combine(sets.TP.Kogarasumaru,{})
	sets.TP.Kogarasumaru.MidACC.AM3 = set_combine(sets.TP.Kogarasumaru.MidACC,{})
	sets.TP.Kogarasumaru.HighACC.AM3 = set_combine(sets.TP.Kogarasumaru.HighACC,{})
	sets.TP.Kogarasumaru.MaxACC.AM3 = set_combine(sets.TP.Kogarasumaru.MaxACC,{})
			
	-- Kogarasumaru(AM3 Down: Ionis) TP Sets --
	sets.TP.Kogarasumaru.Ionis = set_combine(sets.TP.Kogarasumaru,{})
	sets.TP.Kogarasumaru.MidACC.Ionis = set_combine(sets.TP.Kogarasumaru.MidACC,{})
	sets.TP.Kogarasumaru.HighACC.Ionis = set_combine(sets.TP.Kogarasumaru.HighACC,{})
	sets.TP.Kogarasumaru.MaxACC.Ionis = set_combine(sets.TP.Kogarasumaru.MaxACC,{})

	-- Kogarasumaru(AM3 Up: Ionis) TP Sets --
	sets.TP.Kogarasumaru.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.AM3,{})
	sets.TP.Kogarasumaru.MidACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.MidACC.AM3,{})
	sets.TP.Kogarasumaru.HighACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.HighACC.AM3,{})
	sets.TP.Kogarasumaru.MaxACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.MaxACC.AM3,{})

	-- Kogarasumaru(AM3 Down: SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.STP = set_combine(sets.TP.Kogarasumaru,{})
	sets.TP.Kogarasumaru.MidACC.STP = set_combine(sets.TP.Kogarasumaru.MidACC,{})
	sets.TP.Kogarasumaru.HighACC.STP = set_combine(sets.TP.Kogarasumaru.HighACC,{})
	sets.TP.Kogarasumaru.MaxACC.STP = set_combine(sets.TP.Kogarasumaru.MaxACC,{})

	-- Kogarasumaru(AM3 Up: SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.AM3.STP = set_combine(sets.TP.Kogarasumaru.AM3,{})
	sets.TP.Kogarasumaru.MidACC.AM3.STP = set_combine(sets.TP.Kogarasumaru.MidACC.AM3,{})
	sets.TP.Kogarasumaru.HighACC.AM3.STP = set_combine(sets.TP.Kogarasumaru.HighACC.AM3,{})
	sets.TP.Kogarasumaru.MaxACC.AM3.STP = set_combine(sets.TP.Kogarasumaru.MaxACC.AM3,{})

	-- Kogarasumaru(AM3 Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.Ionis.STP = set_combine(sets.TP.Kogarasumaru,{})
	sets.TP.Kogarasumaru.MidACC.Ionis.STP = set_combine(sets.TP.Kogarasumaru.MidACC,{})
	sets.TP.Kogarasumaru.HighACC.Ionis.STP = set_combine(sets.TP.Kogarasumaru.HighACC,{})
	sets.TP.Kogarasumaru.MaxACC.Ionis.STP = set_combine(sets.TP.Kogarasumaru.MaxACC,{})

	-- Kogarasumaru(AM3 Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.AM3,{})
	sets.TP.Kogarasumaru.MidACC.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.MidACC.AM3,{})
	sets.TP.Kogarasumaru.HighACC.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.HighACC.AM3,{})
	sets.TP.Kogarasumaru.MaxACC.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.MaxACC.AM3,{})

	-- Tsurumaru TP Sets --
	sets.TP.Tsurumaru = {
			main="Tsurumaru",
			sub="Bloodrain Strap",
			range="Yoichinoyumi",
			ammo="Eminent Arrow",
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Kasuga Domaru +1",
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}},
			waist="Windbuffet Belt +1",
			legs="Kasuga Haidate +1",
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+6 DEX+6',}}}
	sets.TP.Tsurumaru.MidACC = set_combine(sets.TP.Tsurumaru,{
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Haste+3','STR+7 DEX+7',}},
			ear1="Zennaroi Earring",
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}}})
	sets.TP.Tsurumaru.HighACC = set_combine(sets.TP.Tsurumaru.MidACC,{
			neck="Da. Nodowa +1",
			waist="Olseni Belt"})
	sets.TP.Tsurumaru.MaxACC = set_combine(sets.TP.Tsurumaru.HighACC,{
			head="Yaoyotl Helm",
			neck="Iqabi Necklace",
			ear2="Steelflash Earring",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1",
			back="Ground. Mantle +1",
			waist="Dynamic Belt +1"})

	-- Tsurumaru(Ionis) TP Sets --
	sets.TP.Tsurumaru.Ionis = set_combine(sets.TP.Tsurumaru,{})
	sets.TP.Tsurumaru.MidACC.Ionis = set_combine(sets.TP.Tsurumaru.MidACC,{})
	sets.TP.Tsurumaru.HighACC.Ionis = set_combine(sets.TP.Tsurumaru.HighACC,{})
	sets.TP.Tsurumaru.MaxACC.Ionis = set_combine(sets.TP.Tsurumaru.MaxACC,{})

	-- Tsurumaru(SAM Roll) TP Sets --
	sets.TP.Tsurumaru.STP = set_combine(sets.TP.Tsurumaru,{})
	sets.TP.Tsurumaru.MidACC.STP = set_combine(sets.TP.Tsurumaru.MidACC,{})
	sets.TP.Tsurumaru.HighACC.STP = set_combine(sets.TP.Tsurumaru.HighACC,{})
	sets.TP.Tsurumaru.MaxACC.STP = set_combine(sets.TP.Tsurumaru.MaxACC,{})

	-- Tsurumaru(Ionis + SAM Roll) TP Sets --
	sets.TP.Tsurumaru.Ionis.STP = set_combine(sets.TP.Tsurumaru,{})
	sets.TP.Tsurumaru.MidACC.Ionis.STP = set_combine(sets.TP.Tsurumaru.MidACC,{})
	sets.TP.Tsurumaru.HighACC.Ionis.STP = set_combine(sets.TP.Tsurumaru.HighACC,{})
	sets.TP.Tsurumaru.MaxACC.Ionis.STP = set_combine(sets.TP.Tsurumaru.MaxACC,{})

	-- Amanomurakumo(AM Down) TP Sets --
	sets.TP.Amanomurakumo = {
			main="Amanomurakumo",
			sub="Bloodrain Strap",
			range="Yoichinoyumi",
			ammo="Eminent Arrow",
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Kasuga Domaru +1",
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}},
			waist="Windbuffet Belt +1",
			legs="Kasuga Haidate +1",
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+6 DEX+6',}}}
	sets.TP.Amanomurakumo.MidACC = set_combine(sets.TP.Amanomurakumo,{
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Haste+3','STR+7 DEX+7',}},
			ear1="Zennaroi Earring",
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}}})
	sets.TP.Amanomurakumo.HighACC = set_combine(sets.TP.Amanomurakumo.MidACC,{
			neck="Da. Nodowa +1",
			waist="Olseni Belt"})
	sets.TP.Amanomurakumo.MaxACC = set_combine(sets.TP.Amanomurakumo.HighACC,{
			head="Yaoyotl Helm",
			neck="Iqabi Necklace",
			ear2="Steelflash Earring",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1",
			back="Ground. Mantle +1",
			waist="Dynamic Belt +1"})

	-- Amanomurakumo(AM Up) TP Sets --
	sets.TP.Amanomurakumo.AM = set_combine(sets.TP.Amanomurakumo,{})
	sets.TP.Amanomurakumo.MidACC.AM = set_combine(sets.TP.Amanomurakumo.MidACC,{})
	sets.TP.Amanomurakumo.HighACC.AM = set_combine(sets.TP.Amanomurakumo.HighACC,{})
	sets.TP.Amanomurakumo.MaxACC.AM = set_combine(sets.TP.Amanomurakumo.MaxACC,{})

	-- Amanomurakumo(AM Down: Ionis) TP Sets --
	sets.TP.Amanomurakumo.Ionis =  set_combine(sets.TP.Amanomurakumo,{})
	sets.TP.Amanomurakumo.MidACC.Ionis = set_combine(sets.TP.Amanomurakumo.MidACC,{})
	sets.TP.Amanomurakumo.HighACC.Ionis = set_combine(sets.TP.Amanomurakumo.HighACC,{})
	sets.TP.Amanomurakumo.MaxACC.Ionis = set_combine(sets.TP.Amanomurakumo.MaxACC,{})

	-- Amanomurakumo(AM Up: Ionis) TP Sets --
	sets.TP.Amanomurakumo.AM.Ionis =  set_combine(sets.TP.Amanomurakumo,{})
	sets.TP.Amanomurakumo.MidACC.AM.Ionis = set_combine(sets.TP.Amanomurakumo.MidACC,{})
	sets.TP.Amanomurakumo.HighACC.AM.Ionis = set_combine(sets.TP.Amanomurakumo.HighACC,{})
	sets.TP.Amanomurakumo.MaxACC.AM.Ionis = set_combine(sets.TP.Amanomurakumo.MaxACC,{})

	-- Amanomurakumo(AM Down: SAM Roll) TP Sets --
	sets.TP.Amanomurakumo.STP = set_combine(sets.TP.Amanomurakumo,{})
	sets.TP.Amanomurakumo.MidACC.STP = set_combine(sets.TP.Amanomurakumo.MidACC,{})
	sets.TP.Amanomurakumo.HighACC.STP = set_combine(sets.TP.Amanomurakumo.HighACC,{})
	sets.TP.Amanomurakumo.MaxACC.STP = set_combine(sets.TP.Amanomurakumo.MaxACC,{})

	-- Amanomurakumo(AM Up: SAM Roll) TP Sets --
	sets.TP.Amanomurakumo.AM.STP = set_combine(sets.TP.Amanomurakumo,{})
	sets.TP.Amanomurakumo.MidACC.AM.STP = set_combine(sets.TP.Amanomurakumo.MidACC,{})
	sets.TP.Amanomurakumo.HighACC.AM.STP = set_combine(sets.TP.Amanomurakumo.HighACC,{})
	sets.TP.Amanomurakumo.MaxACC.AM.STP = set_combine(sets.TP.Amanomurakumo.MaxACC,{})

	-- Amanomurakumo(AM Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Amanomurakumo.Ionis.STP = set_combine(sets.TP.Amanomurakumo,{})
	sets.TP.Amanomurakumo.MidACC.Ionis.STP = set_combine(sets.TP.Amanomurakumo.MidACC,{})
	sets.TP.Amanomurakumo.HighACC.Ionis.STP = set_combine(sets.TP.Amanomurakumo.HighACC,{})
	sets.TP.Amanomurakumo.MaxACC.Ionis.STP = set_combine(sets.TP.Amanomurakumo.MaxACC,{})

	-- Amanomurakumo(AM Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Amanomurakumo.AM.Ionis.STP = set_combine(sets.TP.Amanomurakumo,{})
	sets.TP.Amanomurakumo.MidACC.AM.Ionis.STP = set_combine(sets.TP.Amanomurakumo.MidACC,{})
	sets.TP.Amanomurakumo.HighACC.AM.Ionis.STP = set_combine(sets.TP.Amanomurakumo.HighACC,{})
	sets.TP.Amanomurakumo.MaxACC.AM.Ionis.STP = set_combine(sets.TP.Amanomurakumo.MaxACC,{})

	-- Masamune TP Sets --
	sets.TP.Masamune = {
			main="Masamune",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Eminent Arrow",
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Ganesha's Mala",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Kasuga Domaru +1",
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}},
			waist="Windbuffet Belt +1",
			legs="Kasuga Haidate +1",
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+6 DEX+6',}}}
	sets.TP.Masamune.MidACC = set_combine(sets.TP.Masamune,{
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Haste+3','STR+7 DEX+7',}},
			ear1="Zennaroi Earring",
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}}})
	sets.TP.Masamune.HighACC = set_combine(sets.TP.Masamune.MidACC,{
			neck="Da. Nodowa +1",
			waist="Olseni Belt"})
	sets.TP.Masamune.MaxACC = set_combine(sets.TP.Masamune.HighACC,{
			head="Yaoyotl Helm",
			neck="Iqabi Necklace",
			ear2="Steelflash Earring",
			ring1="Ramuh Ring +1",
			ring2="Ramuh Ring +1",
			back="Ground. Mantle +1",
			waist="Dynamic Belt +1"})

	-- Masamune(Ionis) TP Sets --
	sets.TP.Masamune.Ionis = set_combine(sets.TP.Masamune,{})
	sets.TP.Masamune.MidACC.Ionis = set_combine(sets.TP.Masamune.MidACC,{})
	sets.TP.Masamune.HighACC.Ionis = set_combine(sets.TP.Masamune.HighACC,{})
	sets.TP.Masamune.MaxACC.Ionis = set_combine(sets.TP.Masamune.MaxACC,{})

	-- Masamune(SAM Roll) TP Sets --
	sets.TP.Masamune.STP = set_combine(sets.TP.Masamune,{})
	sets.TP.Masamune.MidACC.STP = set_combine(sets.TP.Masamune.MidACC,{})
	sets.TP.Masamune.HighACC.STP = set_combine(sets.TP.Masamune.HighACC,{})
	sets.TP.Masamune.MaxACC.STP = set_combine(sets.TP.Masamune.MaxACC,{})

	-- Masamune(Ionis + SAM Roll) TP Sets --
	sets.TP.Masamune.Ionis.STP = set_combine(sets.TP.Masamune.Ionis,{})
	sets.TP.Masamune.MidACC.Ionis.STP = set_combine(sets.TP.Masamune.MidACC,{})
	sets.TP.Masamune.HighACC.Ionis.STP = set_combine(sets.TP.Masamune.HighACC,{})
	sets.TP.Masamune.MaxACC.Ionis.STP = set_combine(sets.TP.Masamune.MaxACC,{})

	-- Seigan TP Set --
	sets.TP.Seigan = {head="Kasuga Kabuto +1"}

	-- Third Eye TP Set --
	sets.TP['Third Eye'] = {legs="Sakonji Haidate +1"}

	-- PDT/MDT Sets --
	sets.PDT = {
			head="Otronif Mask +1",
			neck="Twilight Torque",
			ear1="Black Earring",
			ear2="Darkness Earring",
			body="Tartarus Platemail",
			hands="Otronif Gloves +1",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Shadow Mantle",
			waist="Flume Belt",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"}

	sets.MDT = set_combine(sets.PDT,{
			head="Ogier's Helm",
			ear1="Merman's Earring",
			ear2="Sanare Earring",
			body="Tartarus Platemail",
			ring1="Shadow Ring",
			back="Engulfer Cape",
			waist="Resolute Belt"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})
	sets.TP.Hybrid.MaxACC = set_combine(sets.TP.Hybrid.HighACC,{})

	-- WS Base Set --
	sets.WS = {
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Ganesha's Mala",
			ear1="Vulcan's Pearl",
			ear2="Brutal Earring",
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			hands="Miki. Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Buquwik Cape",
			waist="Metalsinger Belt",
			legs={ name="Acro Breeches", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}},
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}}}

	-- Tachi: Fudo Sets --
	sets.WS["Tachi: Fudo"] = {
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Karieyh Ring",
			back="Buquwik Cape",
			waist="Metalsinger Belt",
			legs={ name="Acro Breeches", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}},
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}}}
	sets.WS["Tachi: Fudo"].MidACC = set_combine(sets.WS["Tachi: Fudo"],{
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','Weapon skill damage +3%',}},
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','STR+10',}},
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}}})
	sets.WS["Tachi: Fudo"].HighACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			waist="Olseni Belt",})
	sets.WS["Tachi: Fudo"].MaxACC = set_combine(sets.WS["Tachi: Fudo"].HighACC,{
			ear1="Zennaroi Earring",
			ear2="Steelflash Earring",
			ring1="Ramuh Ring +1",})

	-- Tachi: Fudo(SAM Roll) Sets --
	sets.WS["Tachi: Fudo"].STP = set_combine(sets.WS["Tachi: Fudo"],{})
	sets.WS["Tachi: Fudo"].MidACC.STP = set_combine(sets.WS["Tachi: Fudo"].MidACC,{})
	sets.WS["Tachi: Fudo"].HighACC.STP = set_combine(sets.WS["Tachi: Fudo"].HighACC,{})
	sets.WS["Tachi: Fudo"].MaxACC.STP = set_combine(sets.WS["Tachi: Fudo"].MaxACC,{})

	-- Tachi: Fudo(Attack) Set --
	sets.WS["Tachi: Fudo"].ATT = set_combine(sets.WS["Tachi: Fudo"],{})

	-- Tachi: Shoha Sets --
	sets.WS["Tachi: Shoha"] = {
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Ganesha's Mala",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			hands="Miki. Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Buquwik Cape",
			waist="Metalsinger Belt",
			legs={ name="Acro Breeches", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}},
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}}}
	sets.WS["Tachi: Shoha"].MidACC = set_combine(sets.WS["Tachi: Shoha"],{
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','Weapon skill damage +3%',}},
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','STR+10',}},
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}}})
	sets.WS["Tachi: Shoha"].HighACC = set_combine(sets.WS["Tachi: Shoha"].MidACC,{
			neck="Breeze Gorget",
			waist="Olseni Belt"})
	sets.WS["Tachi: Shoha"].MaxACC = set_combine(sets.WS["Tachi: Shoha"].HighACC,{
			ear1="Zennaroi Earring",
			ear2="Steelflash Earring",
			ring1="Ramuh Ring +1",})

	-- Tachi: Shoha(SAM Roll) Sets --
	sets.WS["Tachi: Shoha"].STP = set_combine(sets.WS["Tachi: Shoha"],{})
	sets.WS["Tachi: Shoha"].MidACC.STP = set_combine(sets.WS["Tachi: Shoha"].MidACC,{})
	sets.WS["Tachi: Shoha"].HighACC.STP = set_combine(sets.WS["Tachi: Shoha"].HighACC,{})
	sets.WS["Tachi: Shoha"].MaxACC.STP = set_combine(sets.WS["Tachi: Shoha"].MaxACC,{})

	-- Tachi: Kaiten Sets --
	sets.WS["Tachi: Kaiten"] = {
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Karieyh Ring",
			back="Buquwik Cape",
			waist="Metalsinger Belt",
			legs={ name="Acro Breeches", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}},
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}}}
	sets.WS["Tachi: Kaiten"].MidACC = set_combine(sets.WS["Tachi: Kaiten"],{
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','Weapon skill damage +3%',}},
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','STR+10',}}})
	sets.WS["Tachi: Kaiten"].HighACC = set_combine(sets.WS["Tachi: Kaiten"].MidACC,{
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}},
			waist="Olseni Belt"})
	sets.WS["Tachi: Kaiten"].MaxACC = set_combine(sets.WS["Tachi: Kaiten"].HighACC,{
			ear1="Zennaroi Earring",
			ear2="Steelflash Earring",
			ring1="Ramuh Ring +1",})

	-- Tachi: Kaiten(SAM Roll) Sets --
	sets.WS["Tachi: Kaiten"].STP = set_combine(sets.WS["Tachi: Kaiten"],{})
	sets.WS["Tachi: Kaiten"].MidACC.STP = set_combine(sets.WS["Tachi: Kaiten"].MidACC,{})
	sets.WS["Tachi: Kaiten"].HighACC.STP = set_combine(sets.WS["Tachi: Kaiten"].HighACC,{})
	sets.WS["Tachi: Kaiten"].MaxACC.STP = set_combine(sets.WS["Tachi: Kaiten"].MaxACC,{})

	-- Tachi: Kaiten(Attack) Set --
	sets.WS["Tachi: Kaiten"].ATT = set_combine(sets.WS["Tachi: Kaiten"],{})

	-- Tachi: Rana Sets --
	sets.WS["Tachi: Rana"] = {
			head={ name="Otomi Helm", augments={'Haste+2','"Snapshot"+2','STR+8',}},
			neck="Fotia Gorget",
			ear1="Vulcan's Pearl",
			ear2="Brutal Earring",
			body={ name="Acro Surcoat", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
			hands="Miki. Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Buquwik Cape",
			waist="Metalsinger Belt",
			legs={ name="Acro Breeches", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}},
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}}}
	sets.WS["Tachi: Rana"].MidACC = set_combine(sets.WS["Tachi: Rana"],{
			head={ name="Acro Helm", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','Weapon skill damage +3%',}},
			hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','Weapon Skill Acc.+20','STR+10',}}})
	sets.WS["Tachi: Rana"].HighACC = set_combine(sets.WS["Tachi: Rana"].MidACC,{
			back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+1','"Store TP"+3',}},
			waist="Olseni Belt"})
	sets.WS["Tachi: Rana"].MaxACC = set_combine(sets.WS["Tachi: Rana"].HighACC,{
			ear1="Zennaroi Earring",
			ear2="Steelflash Earring",
			ring1="Ramuh Ring +1",})

	-- Tachi: Rana(SAM Roll) Sets --
	sets.WS["Tachi: Rana"].STP = set_combine(sets.WS["Tachi: Rana"],{})
	sets.WS["Tachi: Rana"].MidACC.STP = set_combine(sets.WS["Tachi: Rana"].MidACC,{})
	sets.WS["Tachi: Rana"].HighACC.STP = set_combine(sets.WS["Tachi: Rana"].HighACC,{})
	sets.WS["Tachi: Rana"].MaxACC.STP = set_combine(sets.WS["Tachi: Rana"].MaxACC,{})

	-- Namas Arrow Sets --
	sets.WS["Namas Arrow"] = {
			ammo="Eminent Arrow",
			head="Sakonji Kabuto +1",
			neck="Ocachi Gorget",
			ear1="Vulcan's Pearl",
			ear2="Vulcan's Pearl",
			body="Phorcys Korazin",
			hands="Kasuga Kote +1",
			ring1="Ifrit Ring +1",
			ring2="Karieyh Ring",
			back="Buquwik Cape",
			waist="Fotia Belt",
			legs={ name="Acro Breeches", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}},
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}}}
	sets.WS["Namas Arrow"].MidACC = set_combine(sets.WS["Namas Arrow"],{
			neck="Fotia Gorget",
			feet="Waki. Sune-Ate +1"})
	sets.WS["Namas Arrow"].HighACC = set_combine(sets.WS["Namas Arrow"].MidACC,{
			ear1="Clearview Earring",
			ear2="Enervating Earring",
			body="Kyujutsugi",
			back="Thall Mantle"})
	sets.WS["Namas Arrow"].MaxACC = set_combine(sets.WS["Namas Arrow"].HighACC,{
			ring1="Hajduk Ring +1",
			ring2="Hajduk Ring +1"})

	-- Apex Arrow Sets --
	sets.WS["Apex Arrow"] = {
			ammo="Eminent Arrow",
			head="Sakonji Kabuto +1",
			neck="Fotia Gorget",
			ear1="Altdorf's Earring",
			ear2="Wilhelm's Earring",
			body="Phorcys Korazin",
			hands="Kasuga Kote +1",
			ring1="Stormsoul Ring",
			ring2="Stormsoul Ring",
			back="Buquwik Cape",
			waist="Fotia Belt",
			legs={ name="Acro Breeches", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}},
			feet={ name="Acro Leggings", augments={'Accuracy+20 Attack+20','"Store TP"+6','Weapon skill damage +3%',}}}
	sets.WS["Apex Arrow"].MidACC = set_combine(sets.WS["Apex Arrow"],{
			feet="Waki. Sune-Ate +1"})
	sets.WS["Apex Arrow"].HighACC = set_combine(sets.WS["Apex Arrow"].MidACC,{
			ear1="Clearview Earring",
			ear2="Enervating Earring",
			body="Kyujutsugi",
			back="Thall Mantle"})
	sets.WS["Apex Arrow"].MaxACC = set_combine(sets.WS["Apex Arrow"].HighACC,{
			ring1="Hajduk Ring +1",
			ring2="Hajduk Ring +1"})

	-- JA Sets --
	sets.JA = {}
	sets.JA.Meditate = {head="Wakido Kabuto +1",hands="Sakonji Kote +1"}
	sets.JA["Warding Circle"] = {head="Wakido Kabuto +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ring1="Prolix Ring",
			ring2="Veneficium Ring"}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2800 then -- Cancel Meditate If TP Is Above 2800 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif spell.action_type == 'Ranged Attack' and spell.target.distance > 24.9 then
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then
		if spell.skill == 'Archery' then
			if spell.target.distance > 16+target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		else
			if spell.target.distance > target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		end
	end
end

function precast(spell,action)
	local check_ammo
	local check_ammo_count = 1
	if spell.action_type == 'Ranged Attack' then
		check_ammo = player.equipment.ammo
		if player.equipment.ammo == 'empty' or player.inventory[check_ammo].count <= check_ammo_count then
			add_to_chat(123, spell.name..' Canceled: [Out of Ammo]')
			cancel_spell()
			return
		else
			equip(sets.Preshot)
			if player.inventory[check_ammo].count <= ammo_warning_limit and player.inventory[check_ammo].count > 1 and not warning then
				add_to_chat(8, '***** [Low Ammo Warning!] *****')
				warning = true
			elseif player.inventory[check_ammo].count > ammo_warning_limit and warning then
				warning = false
			end
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if Attack == 'ON' then
				equipSet = equipSet["ATT"]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
				equipSet = equipSet["STP"]
			end
			if elements[spell.name] and elements[spell.name]:contains(world.day_element) then
				equipSet = set_combine(equipSet,elements.equip)
			end
			if buffactive.Sekkanoki then -- Equip Kasuga Kote +1 When Sekkanoki Is On --
				equipSet = set_combine(equipSet,{hands="Kasuga Kote +1"})
			end
			if buffactive.Sengikori then -- Equip Kas. Sune-Ate +1 When Sengikori Is On --
				equipSet = set_combine(equipSet,{feet="Kas. Sune-Ate +1"})
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if TypeIndex == 1 and spell.english == "Tachi: Fudo" then 
				if player.tp > 2990 or buffactive.Sekkanoki or (player.tp > 1990 and buffactive.Hagakure) then		
					if world.time <= (7*60) or world.time >= (17*60) then
						if buffactive["Aftermath: Lv.3"] then
							equipSet = set_combine(equipSet,{ear1="Lugra Earring +1",ear2="Lugra Earring"}) -- 3000 TP or Sekkanoki or Hagakure(2000+ TP) - Equip Lugra Earring +1 & Lugra Earring During AM3 From Dusk To Dawn --
						else
							equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"}) -- 3000 TP or Sekkanoki or Hagakure(2000+ TP) - Equip Lugra Earring +1 From Dusk To Dawn --
						end
					else
						equipSet = set_combine(equipSet,{ear1="Vulcan's Pearl"}) -- 3000 TP or Sekkanoki or Hagakure(2000+ TP) - Equip Vulcan's Pearl --
					end
				elseif buffactive["Aftermath: Lv.3"] then
					if world.time <= (7*60) or world.time >= (17*60) then
						equipSet = set_combine(equipSet,{ear2="Lugra Earring +1"}) -- Equip Lugra Earring +1 Instead of Brutal Earring During AM3 From Dusk To Dawn --
					else
						equipSet = set_combine(equipSet,{ear2="Vulcan's Pearl"}) -- Equip Vulcan's Pearl Instead of Brutal Earring During AM3 --
					end
				end
			end
			if TypeIndex == 1 and (spell.english == "Tachi: Shoha" or spell.english == "Tachi: Kasha") and (player.tp > 2990 or buffactive.Sekkanoki or (player.tp > 1990 and buffactive.Hagakure)) then
				if world.time <= (7*60) or world.time >= (17*60) then
					equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"}) -- 3000 TP or Sekkanoki or Hagakure(2000+ TP) - Equip Lugra Earring +1 From Dusk To Dawn --
				else
					equipSet = set_combine(equipSet,{ear1="Vulcan's Pearl"}) -- 3000 TP or Sekkanoki or Hagakure(2000+ TP) - Equip Vulcan's Pearl --
				end
			end
			if TypeIndex == 1 and spell.english == "Tachi: Rana" and (world.time <= (7*60) or world.time >= (17*60)) then -- Equip Lugra Earring +1 From Dusk To Dawn --
				equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
		if spell.english == 'Utsusemi: Ni' then
			if buffactive['Copy Image (3)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
				return
			else
				equip(sets.Precast.FastCast)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	if spell.action_type == 'Ranged Attack' then
		equipSet = sets.Midshot
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then -- Cancel Copy Image 1, 2 & 3 For Utsusemi: Ichi --
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Warding Circle" then -- Warding Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			equipSet = equipSet["AM3"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
		end
		if buffactive.Seigan and Seigan == 'ON' then -- Use Seigan Toggle For Seigan TP Set --
			equipSet = set_combine(equipSet,sets.TP.Seigan)
		end
		if buffactive["Third Eye"] and Third_Eye == 'ON' then -- Use Third Eye Toggle For Third Eye TP Set --
			equipSet = set_combine(equipSet,sets.TP["Third Eye"])
		end
		equip(equipSet)
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == "perfect defense" then -- PD Timer --
		if gain then
			send_command('timers create "Perfect Defense" 57 down')
		else
			send_command('timers delete "Perfect Defense"')
			add_to_chat(123,'PD: [OFF]')
		end
	elseif buff == "yaegasumi" then -- Yaegasumi Timer --
		if gain then
			send_command('timers create "Yaegasumi" 45 down')
		else
			send_command('timers delete "Yaegasumi"')
			add_to_chat(123,'Yaegasumi: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- Key-bindings
send_command('bind f12 gs c C1') -- F12 Cycles through Accuracy Modes
send_command('bind f10 gs c C7') -- F10 Toggles PDT Mode
send_command('bind f11 gs c C15') -- F10 Toggles MDT Mode
send_command('bind ^f12 gs c C17') -- CTRL+F12 Toggles Main Weapon Mode


-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C17' then -- Main Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Seigan Toggle --
		if Seigan == 'ON' then
			Seigan = 'OFF'
			add_to_chat(123,'Seigan Set: [Unlocked]')
		else
			Seigan = 'ON'
			add_to_chat(158,'Seigan Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- Third Eye Toggle --
		if Third_Eye == 'ON' then
			Third_Eye = 'OFF'
			add_to_chat(123,'Third Eye Set: [Unlocked]')
		else
			Third_Eye = 'ON'
			add_to_chat(158,'Third Eye Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- SAM Roll Toggle --
		if Samurai_Roll == 'ON' then
			Samurai_Roll = 'OFF'
			add_to_chat(123,'SAM Roll: [OFF]')
		else
			Samurai_Roll = 'ON'
			add_to_chat(158,'SAM Roll: [ON]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C10' then -- Cancel Meikyo Shisui --
		send_command('Cancel Meikyo Shisui')
		add_to_chat(123,'Meikyo Shisui: [OFF]')
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//'..sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	else
		enable('ring1','ring2','back')
	end
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(8, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(8,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'DNC' then
		set_macro_page(3, 1)
	elseif player.sub_job == 'DRK' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 1)
	else
		set_macro_page(1, 1)
	end
end