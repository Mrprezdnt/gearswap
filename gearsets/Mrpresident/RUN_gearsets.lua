
	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			head="None",
			body="Respite Cloak",
    		left_ring="Sheltered Ring",
    		right_ring="Paguroidea Ring"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})

	-- TP Sets --
	sets.TP = {
    		ammo="Hasty Pinion +1",
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
    		back=run_cape.dt}
	sets.TP.MidACC = set_combine(sets.TP,{
			main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','System: 2 ID: 114 Val: 9',}},
			hands="Rawhide Gloves",
			ring1="Defending Ring",
			ring2="Yacuruna Ring",
			legs=carmine.legs,
			feet=carmine.feet,
			waist="Windbuffet Belt +1",})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','System: 2 ID: 114 Val: 9',}},
    		sub="Tzacab Grip",
    		ammo="Inlamvuyeso",
    		head={ name="Despair Helm", augments={'STR+15','Enmity+7','"Store TP"+3',}},
    		body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1','STR+2 VIT+2',}},
    		hands={ name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20',}},
    		legs={ name="Carmine Cuisses", augments={'Accuracy+10','DEX+10','MND+15',}},
    		feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    		neck="Peacock Amulet",
    		waist="Kentarch Belt",
    		left_ear="Steelflash Earring",
    		right_ear="Heartseeker Earring",
    		left_ring="Etana Ring",
    		right_ring="Yacuruna Ring",
    		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+17 Attack+17','Weapon skill damage +10%',}},})

	-- TP Swordplay Set
	sets.TP.Swordplay = {hands="Futhark Mitons +1"}

	-- PDT/MDT Sets --
	sets.PDT = {
			left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Breath dmg. taken -4%','Phys. dmg. taken -4%',}},
    		right_ring="Defending Ring"}

	sets.MDT = set_combine(sets.PDT,{
    		ammo="Demonry Stone",
			head="None",
    		body="Respite Cloak",
    		hands={ name="Taeon Gloves", augments={'Accuracy+7 Attack+7','"Triple Atk."+1','HP+10',}},
    		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2','STR+4',}},
    		feet={ name="Taeon Boots", augments={'Attack+18','"Triple Atk."+2','STR+5',}},
    		neck="Warder's Charm +1",
    		waist="Flax Sash",
    		left_ear="Steelflash Earring",
    		right_ear="Spellbr. Earring",
    		left_ring="Yacuruna Ring",
    		right_ring="Defending Ring",
    		back="Engulfer Cape +1",})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
    		ammo="Demonry Stone",
    		head="Despair Helm",
    		body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1','STR+2 VIT+2',}},
			hands="Rawhide Gloves",
    		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2','STR+4',}},
    		feet={ name="Taeon Boots", augments={'Attack+18','"Triple Atk."+2','STR+5',}},
    		neck="Cloud Hairpin",
    		waist="Acipayam Belt",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Yacuruna Ring",
    		right_ring="Yacuruna Ring",
    		back="Evasionist's Cape"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			waist="Chiner's Belt +1",})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			head="Alhazen Hat +1"})

	-- WS Base Set --
	sets.WS = {
			ammo="Cheruski Needle",
    		head="Smilodon Mask +1",
    		body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1','STR+2 VIT+2',}},
			hands="Rawhide Gloves",
    		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2','STR+4',}},
    		feet={ name="Taeon Boots", augments={'Attack+18','"Triple Atk."+2','STR+5',}},
    		neck="Asperity Necklace",
    		waist="Warwolf Belt",
    		left_ring="Ifrit Ring",
    		right_ring="Ifrit Ring",
    		back="Buquwik Cape"}

	-- WS Sets --
	sets.WS.Resolution = {
			ammo="Cheruski Needle",
    		neck="Asperity Necklace",
    		waist="Warwolf Belt",
    		left_ring="Ifrit Ring",
    		right_ring="Ifrit Ring",
    		back="Buquwik Cape"}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})
	
	sets.WS.Dimidiation = {
			ammo="Jukukik Feather",
		    head=herc_ws.head,
			waist="Chiner's Belt +1",
			left_ring="Ramuh Ring",
			right_ring="Ramuh Ring",
			back=run_cape.dimidation}

	sets.WS.Upheaval = {}
	sets.WS.Upheaval.MidACC = set_combine(sets.WS.Upheaval,{})
	sets.WS.Upheaval.HighACC = set_combine(sets.WS.Upheaval.MidACC,{})

	-- Enmity Set --
	sets.Enmity = {
		neck="Unmoving Collar"}

	sets.JA = {}
	-- JA Sets --
	sets.JA.Lunge = {}
	sets.JA.Swipe = set_combine(sets.Lunge,{})
	sets.JA.Vallation = set_combine(sets.Enmity,{body="Runeist Coat +1", back=run_cape.dimidation})
	sets.JA.Swordplay = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
	sets.JA.Pflug = set_combine(sets.Enmity,{feet="Runeist Bottes +1"})
	sets.JA.Valiance = set_combine(sets.Enmity,{body="Runeist Coat +1"})
	sets.JA.Embolden = set_combine(sets.Enmity,{
			legs="Futhark Trousers +1",
			back=run_cape.embolden})
	sets.JA.Gambit = set_combine(sets.Enmity,{hands="Runeist Mitons +1"})
	sets.JA.Liement = set_combine(sets.Enmity,{body="Futhark Coat +1"})
	sets.JA["One For All"] = set_combine(sets.Enmity)
	sets.JA.Battuta = set_combine(sets.Enmity,{head="Fu. Bandeau +1"})
	sets.JA.Rayke = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
	sets.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
	sets.JA['Vivacious Pulse'] = set_combine(sets.Enmity,{head="Erilaz Galea +1"})
	sets.JA.Provoke = set_combine(sets.Enmity)
	sets.JA.Warcry = set_combine(sets.Enmity)

	-- Waltz Set --
	sets.Waltz = {}

	-- Flourish --
	sets.Flourish = {}

	sets.Precast = {}
	
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Rune. Bandeau +1",
			feet=carmine.feet}

	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{
			waist="Siegel Sash",
			legs="Futhark Trousers +1"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	-- Flash Set --
	sets.Midcast.Flash = {}

	--== Enhancing Magic ==--
	sets.Midcast['Enhancing Magic'] = {
			head="Erilaz Galea +1",
			hands="Runeist Mitons +1",
			legs="Futhark Trousers +1"}

		-- Stoneskin --
		sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

		-- Phalanx --
		sets.Midcast.Phalanx = set_combine(sets.Midcast['Enhancing Magic'],{head="Futhark Mitons +1"})

	-- Regen --
	sets.Midcast.Regen = {head="Rune. Bandeau +1"}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = {}
	
	-- Organizer Items --
	organizer_items = {
			duplus="Duplus Grip",
			tzacab="Tzacab Grip",
			macbain="Macbain",
			sushsole="Sole Sushi",
			sushsubl="Sublime Sushi",
			echodr="Echo Drops",
			hwater="Holy Water",
			remedy="Remedy",
			prismp="Prism Powder",
			snoil="Silent Oil",
			shihei="Shihei",
			tbshihei="Toolbag (Shihe)",
			shinobi="Shinobi-Tabi",
			tbshinobi="Toolbag (Shino)",}