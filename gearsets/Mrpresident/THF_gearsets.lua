sets.Idle = {}
	-- Regen Set --
	sets.Idle.Regen = {
			head="Smilodon Mask +1",
			left_ear="Infused Earring",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring"}
	-- Movement Set --
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			feet="Jute Boots +1",
			ring2="Defending Ring"})

	-- Damage Type Daggers --
	sets.Idle.Regen.Melee = set_combine(sets.Idle.Regen,{
			main={ name="Ipetam", augments={'Accuracy+5','"Dbl.Atk."+1','DMG:+13'}},
			sub="Jugo Kukri +1"})
	-- Damage & TH Types Daggers --
	sets.Idle.Regen.TH = set_combine(sets.Idle.Regen,{
			main="Sandung",
			sub="Atoyac"})
-- todo:fixed equipment change for reives down below, move equipment sets up here as a variable set type? also fix in else if down below for oneiros ring if MP is above 100--

	-- Damage Type Daggers --
	sets.Idle.Movement.Melee = set_combine(sets.Idle.Movement,{
			main={ name="Ipetam", augments={'Accuracy+5','"Dbl.Atk."+1','DMG:+13'}},
			sub="Jugo Kukri +1"})
	-- Damage & TH Types Daggers --
	sets.Idle.Movement.TH = set_combine(sets.Idle.Movement,{
			main="Sandung",
			sub="Atoyac"})

	-- Normal TP Sets --
	sets.TP = {
    		head=taeon_tp.head,
    		body=taeon_tp.body,
    		hands=taeon_tp.hands,
    		legs=taeon_tp.legs,
    		feet=taeon_tp.feet,
    		neck="Asperity Necklace",
    		waist="Windbuffet Belt +1",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Etana Ring",
    		right_ring="Mouflon Ring",
    		back="Bleating Mantle"}
    -- Mid-Accuracy --
	sets.TP.MidACC = set_combine(sets.TP,{
			head="Herculean Helm",
			hands="Rawhide Gloves",
    		waist="Chiner's Belt +1",
    		right_ring="Toreador's Ring",
    		back=thf_cap})
	-- High-Accuracy --
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
    		neck="Peacock Amulet",
    		waist="Life Belt",
    		right_ear="Heartseeker Earring"})

	-- March x2 + (Haste or Samba) --
	-- March + Haste + Samba --
	-- (Embrava or Geo Haste) + (March or Haste or Samba) --
	sets.TP.MidHaste = set_combine(sets.TP,{})
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidHaste,{})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{})

	-- March x2 + Haste + Samba --
	-- Embrava + (March or Haste) + Samba --
	-- Geo Haste + (March or Haste or Embrava) + Samba --
	sets.TP.HighHaste = set_combine(sets.TP.MidHaste,{})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{})

	-- Full TH TP Set --
	sets.TP.TH = set_combine(sets.TP,{
			hands="Plun. Armlets +1",
    		feet="Skulker's Poulaines",
			left_ear="Dudgeon Earring",
    		right_ear="Heartseeker Earring",})

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- TP Feint Set --
	sets.TP.Feint = {legs="Plun. Culottes +1"}

	-- PDT/MDT Sets --
	sets.PDT = {
			head="Smilodon Mask +1",
			body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1',}},
			hands="Hegira Wristbands",
			legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
			feet={ name="Taeon Boots", augments={'Attack+18','"Triple Atk."+2','STR+5',}},
			neck="Veisa Collar",
			waist="Nierenschutz",
			left_ear="Grit Earring",
			right_ear="Upsurge Earring",
			left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Breath dmg. taken -4%','Phys. dmg. taken -4%',}},
			right_ring="Defending Ring",
			back="Repulse Mantle"}

	sets.MDT = set_combine(sets.PDT,{
			neck="Cloud Hairpin +1",
    		waist="Flax Sash",
    		left_ear="Spellbr. Earring",
    		right_ear="Coral Earring",
    		left_ring="Yacuruna Ring",
    		right_ring="Yacuruna Ring",
    		back="Engulfer Cape +1"})

	-- Hybrid/Evasion Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.Evasion = set_combine(sets.PDT,{
			head="Imp. Wing Hair. +1",
    		left_ear="Allegro Earring",
    		right_ear="Phawaylla Earring",
    		left_ring="Garuda Ring",
    		right_ring="Garuda Ring",
    		back={ name="Canny Cape", augments={'DEX+4','AGI+5','"Dual Wield"+1','Crit. hit damage +2%',}}})

	-- WS Base Set --
	sets.WS = {
    		head="Imp. Wing Hair. +1",
    		body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1',}},
    		hands={ name="Taeon Gloves", augments={'Accuracy+7 Attack+7','"Triple Atk."+1',}},
    		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
    		feet={ name="Taeon Boots", augments={'Attack+18','"Triple Atk."+2','STR+5',}},
    		neck="Moepapa Medal",
    		waist="Artful Belt",
    		left_ear="Thunder Pearl",
    		right_ear="Pixie Earring",
    		left_ring="Ramuh Ring",
    		right_ring="Ramuh Ring",
    		back="Aife's Mantle"}

	-- WS Sets --
	sets.WS["Mercy Stroke"] = {}
	sets.WS["Mercy Stroke"].SA = {hands="Skulk. Armlets +1"}
	sets.WS["Mercy Stroke"].TA = {hands="Pill. Armlets +1"}

	sets.WS.Exenterator = {
			waist="Chiner's Belt +1",
    		left_ring="Garuda Ring",
    		right_ring="Garuda Ring",
    		back={ name="Canny Cape", augments={'DEX+4','AGI+5','"Dual Wield"+1','Crit. hit damage +2%',}},}
	sets.WS.Exenterator.SA = set_combine(sets.WS.Exenterator,{hands="Skulk. Armlets +1"})
	sets.WS.Exenterator.TA = set_combine(sets.WS.Exenterator,{hands="Pill. Armlets +1"})

	sets.WS.Evisceration = {}
	sets.WS.Evisceration.SA = set_combine(sets.WS.Evisceration,{hands="Skulk. Armlets +1"})
	sets.WS.Evisceration.TA = set_combine(sets.WS.Evisceration,{hands="Pill. Armlets +1"})

	sets.WS["Rudra's Storm"] = {}
	sets.WS["Rudra's Storm"].SA = set_combine(sets.WS["Rudra's Storm"],{hands="Skulk. Armlets +1"})
	sets.WS["Rudra's Storm"].TA = set_combine(sets.WS["Rudra's Storm"],{hands="Pill. Armlets +1"})

	sets.WS["Aeolian Edge"] = {
			left_ear="Hecate's Earring",
			waist="Aquiline Belt"}

	sets.WS["Mandalic Stab"] = {}

	-- JA Sets --
	sets.JA = {}
	TH_Gear = {hands="Plun. Armlets +1",waist="Chaac Belt",feet="Skulk. Poulaines +1"}
	sets.JA.Conspirator = {body="Skulker's Vest +1"}
	sets.JA.Accomplice = {head="Skulker's Bonnet +1"}
	sets.JA.Collaborator = {head="Skulker's Bonnet +1"}
	sets.JA["Perfect Dodge"] = {hands="Plun. Armlets +1"}
	sets.JA.Steal = {hands="Pill. Armlets +1",legs="Pill. Culottes +1",feet="Pill. Poulaines +1"}
	sets.JA.Flee = {feet="Pill. Poulaines +1"}
	sets.JA.Despoil = {legs="Skulk. Culottes +1",feet="Skulk. Poulaines +1"}
	sets.JA.Mug = {head="Plun. Bonnet +1"}
	sets.JA.Hide = {body="Pillager's Vest +1"}
	sets.JA.Provoke = TH_Gear
	sets.JA["Sneak Attack"] = {
			hands="Skulk. Armlets +1"}
	sets.JA["Trick Attack"] = set_combine(sets.JA["Sneak Attack"],{hands="Pill. Armlets +1"})

	-- Step Set --
	sets.Step = set_combine({},TH_Gear)

	-- Flourish Set --
	sets.Flourish = set_combine({},TH_Gear)

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})
	
	-- Ranged Attack Set --
	sets.RA = {
			head="Alhazen Hat +1",
    		body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1','STR+2 VIT+2',}},
    		hands="Pursuer's Cuffs",
    		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2','STR+4',}},
    		feet="Jute Boots +1",
    		neck="Peacock Amulet",
    		waist="Flax Sash",
    		left_ear="Clearview Earring",
    		right_ear="Allegro Earring",
    		left_ring="Paqichikaji Ring",
    		right_ring="Nekhen Ring",
    		back={ name="Canny Cape", augments={'DEX+4','AGI+5','"Dual Wield"+1','Crit. hit damage +2%'}}}
	
	-- Organizer Items --
	organizer_items = {
			wingcut="Wingcutter +1",
			sushsubl="Sublime Sushi",
			sushsquid="Squid Sushi",
			echodr="Echo Drops",
			hwater="Holy Water",
			remedy="Remedy",}