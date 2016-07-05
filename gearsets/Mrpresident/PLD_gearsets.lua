---------------------------------------------------------------------------------------------
-- Idle Sets
---------------------------------------------------------------------------------------------
	sets.Idle = {}

--Idle Regen
	sets.Idle.Regen = {
			ammo="Homiliary",
			neck="Coatl Gorget +1",
			ear1="Infused Earring",
			ear2="Ethereal Earring",
			hands="Ogier's Gauntlets",
			ring1="Paguroidea Ring",
			ring2="Sheltered Ring",
			back="Scuta Cape",
			waist="Fucho-no-Obi",
			feet="Ogier's Leggings"}
	sets.Idle.Regen.Ochain = set_combine(sets.Idle.Regen,{sub="Ochain"})
	sets.Idle.Regen.Aegis = set_combine(sets.Idle.Regen,{sub="Aegis"})
	sets.Idle.Regen.Priwen = set_combine(sets.Idle.Regen,{sub="Priwen"})

--Idle Refresh
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			head=empty,
			body="Respite Cloak",})
	sets.Idle.Refresh.Ochain = set_combine(sets.Idle.Refresh,{sub="Ochain"})
	sets.Idle.Refresh.Aegis = set_combine(sets.Idle.Refresh,{sub="Aegis"})
	sets.Idle.Refresh.Priwen = set_combine(sets.Idle.Refresh,{sub="Priwen"})

--Idle Movement
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			legs=carmine.legs,})
	sets.Idle.Movement.Ochain = set_combine(sets.Idle.Movement,{sub="Ochain"})
	sets.Idle.Movement.Aegis = set_combine(sets.Idle.Movement,{sub="Aegis"})
	sets.Idle.Movement.Priwen = set_combine(sets.Idle.Movement,{sub="Priwen"})
	
--Idle Resting
	sets.Resting = set_combine(sets.Idle.Regen)

--Idle Twilight
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
--Idle Hybrid
	sets.Idle.Hybrid = set_combine(sets.Idle.Regen,{
			head="Sulevia's Mask +1",
			body="Cab. Surcoat +1",
			hands="Sulevia's Gauntlets +1",
			legs=carmine.legs,
			feet="Sulevia's Leggings +1",
			ring2="Defending Ring",
			ear1="Merman's Earring",
			ear2="Merman's Earring",
			waist="Nierenschutz",
			back=pld_cape.phalanx})
	sets.Idle.Hybrid.Ochain = set_combine(sets.Idle.Hybrid,{sub="Ochain"})
	sets.Idle.Hybrid.Aegis = set_combine(sets.Idle.Hybrid,{sub="Aegis"})
	sets.Idle.Hybrid.Priwen = set_combine(sets.Idle.Hybrid,{sub="Priwen"})

--Idle Town
	sets.Town = set_combine(sets.Idle.Hybrid,{
    		ammo="Hasty Pinion +1",
    		head="Sulevia's Mask +1",
    		body="Sulevia's Platemail +1",
    		hands="Sulevia's Gauntlets +1",
    		legs=carmine.legs,
    		feet="Sulevia's Leggings +1",
    		neck="Warder's Charm +1",
    		waist="Tempus Fugit",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		back=pld_cape.savage,
			ring1="Defending Ring",
			ring2="Shadow Ring"})
	sets.Town.Ochain = set_combine(sets.Town,{sub="Ochain"})
	sets.Town.Aegis = set_combine(sets.Town,{sub="Aegis"})
	sets.Town.Priwen = set_combine(sets.Town,{sub="Priwen"})

---------------------------------------------------------------------------------------------
-- Engaged Only TP Sets
---------------------------------------------------------------------------------------------
	sets.TP = {}

-- Ochain TP Sets
	sets.TP.Ochain = {
    		sub="Ochain",
    		ammo="Jukukik Feather",
    		head="Otomi Helm",
    		body=acro_da.body,
    		hands=acro_da.hands,
    		legs=acro_da.legs,
    		feet=acro_da.feet,
    		neck="Asperity Necklace",
    		waist="Windbuffet Belt +1",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Etana Ring",
    		right_ring="Mouflon Ring",
    		back="Bleating Mantle"} 
	sets.TP.Ochain.MidACC = set_combine(sets.TP.Ochain,{
    		head=despair.head,
			hands=souveran.hands,
    		legs=carmine.legs,
			waist="Kentarch Belt",
			back=pld_cape.enmity})
	sets.TP.Ochain.HighACC = set_combine(sets.TP.Ochain.MidACC,{
			ammo="Hasty Pinion +1",
    		head="Sulevia's Mask +1",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1",
			neck="Peacock Amulet",
			waist="Kentarch Belt",
			right_ear="Zwazo Earring",
			left_ear="Steelflash Earring",
			ring1="Etana Ring",
			ring2="Yacuruna Ring",
			back="Grounded Mantle +1",})

	-- Ochain PDT Hybrid Set --
	sets.TP.Ochain.PDT = {
			sub="Ochain",
    		ammo="Hasty Pinion +1",
    		head="Sulevia's Mask +1",
    		body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
    		legs="Sulevia's Cuisses +1",
    		feet="Sulevia's Legings +1",
    		neck="Diemer Gorget",
    		waist="Tempus Fugit",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Etana Ring",
    		right_ring="Defending Ring",
    		back=pld_cape.enmity}
	sets.TP.Ochain.PDT.MidACC = set_combine(sets.TP.Ochain.PDT,{})
	sets.TP.Ochain.PDT.HighACC = set_combine(sets.TP.Ochain.PDT.MidACC,{})

	-- Ochain MDT Hybrid Set --
	sets.TP.Ochain.MDT = {
			sub="Ochain",
			ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1",
			neck="Cloud Hairpin +1",
			ear1="Bladeborn Earring",
			ear2="Steelflash Earring",
			body="Caballarius Surcoat +1",
			hands=souveran.hands,
			ring1="Defending Ring",
			ring2="Yacuruna Ring",
			back=pld_cape.enmity,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
	sets.TP.Ochain.MDT.MidACC = set_combine(sets.TP.Ochain.MDT,{})
	sets.TP.Ochain.MDT.HighACC = set_combine(sets.TP.Ochain.MDT.MidACC,{})
	
	-- Ochain DT Hybrid Set --
	sets.TP.Ochain.DT = {
			sub="Ochain",
			ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1",
			neck="Asperity Necklace",
			ear1="Bladeborn Earring",
			ear2="Steelflash Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			ring1="Defending Ring",
			ring2="Yacuruna Ring",
			back=pld_cape.enmity,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
	sets.TP.Ochain.DT.MidACC = set_combine(sets.TP.Ochain.DT,{})
	sets.TP.Ochain.DT.HighACC = set_combine(sets.TP.Ochain.DT.MidACC,{})

-- Aegis TP Sets
	sets.TP.Aegis = {
    		ammo="Jukukik Feather",
    		head="Otomi Helm",
    		body=acro_da.body,
    		hands=acro_da.hands,
    		legs=acro_da.legs,
    		feet=acro_da.feet,
    		neck="Asperity Necklace",
    		waist="Windbuffet Belt +1",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Etana Ring",
    		right_ring="Mouflon Ring",
    		back="Bleating Mantle"}	
	sets.TP.Aegis.MidACC = set_combine(sets.TP.Aegis,{
    		head=despair.head,
			hands=souveran.hands,
    		legs=carmine.legs,
			waist="Kentarch Belt",
			back=pld_cape.enmity})	
	sets.TP.Aegis.HighACC = set_combine(sets.TP.Aegis.MidACC,{
			neck="Subtlety Spec.",
			ear1="Zwazo Earring +1",
			body="Mes. Haubergeon",
			ring2="Beeline Ring",
			waist="Dynamic Belt +1"})
	
	-- Aegis PDT Hybrid Set --
	sets.TP.Aegis.PDT = set_combine(sets.TP.Ochain.PDT, {sub="Aegis"})
	sets.TP.Aegis.PDT.MidACC = set_combine(sets.TP.Aegis.PDT,{})
	sets.TP.Aegis.PDT.HighACC = set_combine(sets.TP.Aegis.PDT.MidACC,{})
	
	-- Aegis MDT Hybrid Set --
	sets.TP.Aegis.MDT = set_combine(sets.TP.Ochain.MDT, {sub="Aegis"})
	sets.TP.Aegis.MDT.MidACC = set_combine(sets.TP.Aegis.MDT,{})
	sets.TP.Aegis.MDT.HighACC = set_combine(sets.TP.Aegis.MDT.MidACC,{})
	
	-- Aegis DT Hybrid Set --
	sets.TP.Aegis.DT = {
			sub="Aegis",
			ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1",
			neck="Asperity Necklace",
			ear1="Bladeborn Earring",
			ear2="Steelflash Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			ring1="Defending Ring",
			ring2="Yacuruna Ring",
			back=pld_cape.enmity,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
	sets.TP.Aegis.DT.MidACC = set_combine(sets.TP.Aegis.DT,{})
	sets.TP.Aegis.DT.HighACC = set_combine(sets.TP.Aegis.DT.MidACC,{})
			
-- Priwen TP Sets
	sets.TP.Priwen = {
			sub="Priwen",
			ammo="Ginsen",
			head="Otomi Helm",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Acro Breeches",
			feet="Acro Leggings"}			
	sets.TP.Priwen.MidACC = set_combine(sets.TP.Priwen,{
			head={ name="Yorium Barbuta", augments={'Accuracy+14 Attack+14','Enmity+10','STR+7 INT+7',}},
			ear2="Zennaroi Earring",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			back="Grounded Mantle",
			legs="Eschite Cuisses"})	
	sets.TP.Priwen.HighACC = set_combine(sets.TP.Priwen.MidACC,{
			neck="Subtlety Spec.",
			ear1="Zwazo Earring +1",
			body="Mes. Haubergeon",
			ring2="Beeline Ring",
			waist="Dynamic Belt +1"})
	
	-- Priwen PDT Hybrid Set
	sets.TP.Priwen.PDT = set_combine(sets.TP.Ochain.PDT, {sub="Priwen"})
	sets.TP.Priwen.PDT.MidACC = set_combine(sets.TP.Priwen.PDT,{})
	sets.TP.Priwen.PDT.HighACC = set_combine(sets.TP.Priwen.PDT.MidACC,{})
	
	-- Priwen MDT Hybrid Set
	sets.TP.Priwen.MDT = set_combine(sets.TP.Ochain.MDT, {sub="Priwen"})
	sets.TP.Priwen.MDT.MidACC = set_combine(sets.TP.Priwen.MDT,{})
	sets.TP.Priwen.MDT.HighACC = set_combine(sets.TP.Priwen.MDT.MidACC,{})
	
	-- Priwen DT Hybrid Set --
	sets.TP.Priwen.DT = {
			sub="Priwen",
			ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1",
			neck="Warder's Charm +1",
			ear1="Bladeborn Earring",
			ear2="Steelflash Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			ring1="Defending Ring",
			ring2="Yacuruna Ring",
			back=pld_cape.enmity,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
	sets.TP.Priwen.DT.MidACC = set_combine(sets.TP.Priwen.DT,{})
	sets.TP.Priwen.DT.HighACC = set_combine(sets.TP.Priwen.DT.MidACC,{})

-- Ragnarok TP Sets
	sets.TP.Ragnarok = {}
	sets.TP.Ragnarok.MidACC = set_combine(sets.TP.Ragnarok,{})	
	sets.TP.Ragnarok.HighACC = set_combine(sets.TP.Ragnarok.MidACC,{})

	-- Ragnarok (ionis) TP Sets
	sets.TP.Ragnarok.Ionis = set_combine(sets.TP.Ragnarok,{})
	sets.TP.Ragnarok.MidACC.Ionis = set_combine(sets.TP.Ragnarok.Ionis,{})	
	sets.TP.Ragnarok.HighACC.Ionis = set_combine(sets.TP.Ragnarok.MidACC.Ionis,{})

---------------------------------------------------------------------------------------------
-- Locked "Armor" Sets
---------------------------------------------------------------------------------------------

-- PDT Sets
	sets.PDT = {}
	sets.PDT.Ochain = {
    		sub="Ochain",
    		ammo="Brigantia Pebble",
    		head="Sulevia's Mask +1",
    		body="Cab. Surcoat +1",
    		hands="Sulevia's Gauntlets +1",
    		legs="Sulevia's Cuisses +1",
    		feet="Sulevia's Leggings +1",
    		neck="Diemer Gorget",
    		waist="Flume Belt +1",
    		left_ear="Upsurge Earring",
    		right_ear="Knight's Earring",
			left_ring="Defending Ring",
    		right_ring=dark_ring.dt,
    		back=pld_cape.enmity}
	sets.PDT.Aegis = {
			sub="Aegis",
			ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1",
    		neck="Diemer Gorget",
			ear1="Bladeborn Earring",
			ear2="Steelflash Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			ring1="Defending Ring",
			ring2=dark_ring.dt,
			back=pld_cape.enmity,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
	sets.PDT.Priwen = {
			sub="Priwen",
			ammo="Hasty Pinion +1",
			head={ name="Yorium Barbuta", augments={'Accuracy+14 Attack+14','Enmity+10','STR+7 INT+7',}},
			neck="Subtlety Spec.",
			ear1="Zennaroi Earring",
			ear2="Ethereal Earring",
			body="Cab. Surcoat +1",
			hands="Souv. Handsch. +1",
			ring1="Defending Ring",
			ring2="Vocane Ring",
			back="Weard Mantle",
			waist="Flume Belt +1",
			legs="Chev. Cuisses +1",
			feet="Souveran Schuhs +1"}
	
-- MDT Sets
	sets.MDT = {}
	sets.MDT.Ochain = {
			sub="Ochain",
			ammo="Vanir Battery",
			head="Sulevia's Mask +1",
			neck="Warder's Charm +1",
			ear1="Bladeborn Earring",
			ear2="Steelflash Earring",
			body="Caballarius Surcoat +1",
			hands=souveran.hands,
			ring1="Defending Ring",
			ring2="Yacuruna Ring",
			back=pld_cape.fastcast,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
	sets.MDT.Aegis = {
			sub="Aegis",
			ammo="Vanir Battery",
			head="Sulevia's Mask +1",
			neck="Warder's Charm +1",
			ear1="Spellbreaker Earring",
			ear2="Steelflash Earring",
			body="Caballarius Surcoat +1",
			hands=souveran.hands,
			ring1="Defending Ring",
			ring2="Shadow Ring",
			back=pld_cape.fastcast,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Caballarius Leggings +1"}			
	sets.MDT.Priwen = {
			sub="Priwen",
			ammo="Vanir Battery",
			head="Sulevia's Mask +1",
			neck="Cloud Hairpin +1",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			ring1="Defending Ring",
			ring2="Yacuruna Ring",
			back=pld_cape.fastcast,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
		
-- DT Sets
	sets.DT = {}
	sets.DT.Ochain = {
			sub="Ochain",
			ammo="Vanir Battery",
			head="Sulevia's Mask +1",
			neck="Diemer Gorget",
			ear1="Merman's Earring",
			ear2="Zwazo Earring",
			body="Caballarius Surcoat +1",
			hands="Sulevia's Gauntlets +1",
			ring1="Defending Ring",
			ring2=dark_ring.dt,
			back=pld_cape.enmity,
			waist="Nierenschutz",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"}
	sets.DT.Aegis = {
			sub="Aegis",
			ammo="Vanir Battery",
			head="Sulevia's Mask +1",
			neck="Diemer Gorget",
			ear1="Spellbreaker Earring",
			ear2="Upsurge Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			ring1="Defending Ring",
			ring2=dark_ring.dt,
			back=pld_cape.enmity,
			waist="Tempus Fugit",
			legs="Sulevia's Cuisses +1",
			feet="Souveran Schuhs"}	
	sets.DT.Priwen = set_combine(sets.DT.Ochain, {sub="Priwen"})

-- (BDT) Sets
	sets.BDT = {}
	sets.BDT.Ochain = set_combine(sets.MDT.Ochain, {
			sub="Ochain",
			ammo="Hasty Pinion +1",
			head=souveran.head,
			body="Cab. Surcoat +1",
			hands="Sulevia's Gauntlets +1",
			legs="Scuffler's Cosciales",
			feet="Sulevia's Leggings +1",
			left_ring=dark_ring.dt,
			right_ring="Defending Ring",
			ear1="Steelflash Earring",
			ear2="Zwazo Earring",
			waist="Kentarch Belt",
			back=pld_cape.enmity})
	sets.BDT.Aegis = {
			sub="Aegis",
			ammo="Iron Gobbet",
			head="Souv. Schaller +1",
			neck="Warder's Charm +1",
			ear1="Zwazo Earring +1",
			ear2="Ethereal Earring",
			body="Souv. Cuirass +1",
			hands="Souv. Handsch. +1",
			ring1="Defending Ring",
			ring2="Vocane Ring",
			back="Engulfer Cape +1",
			waist="Flume Belt +1",
			legs="Souv. Diechlings +1",
			feet="Souveran Schuhs +1"}
	sets.BDT.Priwen = {
			sub="Priwen",
			ammo="Iron Gobbet",
			head="Souv. Schaller +1",
			neck="Warder's Charm +1",
			ear1="Zwazo Earring +1",
			ear2="Ethereal Earring",
			body="Souv. Cuirass +1",
			hands="Souv. Handsch. +1",
			ring1="Defending Ring",
			ring2="Vocane Ring",
			back="Engulfer Cape +1",
			waist="Flume Belt +1",
			legs="Souv. Diechlings +1",
			feet="Souveran Schuhs +1"}

---------------------------------------------------------------------------------------------
-- Specialized Sets
---------------------------------------------------------------------------------------------

-- Weakness Set	
	sets.Weakness = {}
	sets.Weakness.Ochain = set_combine(sets.PDT.Ochain,{})
	sets.Weakness.Aegis = set_combine(sets.PDT.Aegis,{})
	sets.Weakness.Priwen = set_combine(sets.PDT.Priwen,{})

-- Kiting Set
	sets.Kiting = {}
	sets.Kiting.Ochain = set_combine(sets.DT.Ochain,{legs=carmine.legs})
	sets.Kiting.Aegis = set_combine(sets.DT.Aegis,{legs=carmine.legs})
	sets.Kiting.Priwen = set_combine(sets.DT.Priwen,{legs=carmine.legs})

-- Repulse Mantle set
	sets.Repulse = {}
	sets.Repulse.Ochain = {sub="Ochain",back="Repulse Mantle"}
	sets.Repulse.Aegis = {sub="Aegis",back="Repulse Mantle"}
	sets.Repulse.Priwen = {sub="Priwen",back="Repulse Mantle"}

-- Magic Evasion Set
	sets.Meva = {}
	sets.Meva.Ochain = set_combine(sets.MDT.Ochain,{})
	sets.Meva.Aegis = set_combine(sets.MDT.Aegis,{})
	sets.Meva.Priwen = set_combine(sets.MDT.Priwen,{})

-- Enmity Set
	sets.Enmity = {
			head=yorium_hate.head,
    		body={ name="Cab. Surcoat +1", augments={'Enhances "Fealty" effect',}},
    		hands=yorium_hate.hands,
			legs=odyssean_hate.legs,
			feet=yorium_hate.feet,
    		neck="Unmoving Collar",
    		waist="Creed Baudrier",
    		left_ring="Apeile Ring",
			right_ring="Apeile Ring +1",
			back=pld_cape.enmity}
	
---------------------------------------------------------------------------------------------
-- WeaponSkill Sets
---------------------------------------------------------------------------------------------
	
-- WS Base Set
	sets.WS = {
			ammo="Cheruski Needle",
    		head="Sulevia's Mask +1",
    		body="Sulevia's Platemail +1",
    		hands="Sulevia's Gauntlets +1",
    		legs="Sulevia's Cuisses +1",
    		feet="Sulevia's Leggings +1",
    		neck="Asperity Necklace",
    		waist="Warwolf Belt",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Ifrit Ring",
    		right_ring="Ifrit Ring",
    		back=pld_cape.savage}

-- Chant du Cygne Sets
	sets.WS["Chant du Cygne"] = set_combine(sets.WS, {
			ammo="Jukukik Feather",
			ring1="Ramuh Ring",
			ring2="Ramuh Ring",
			waist="Windbuffet +1",})
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{})
		
-- Savage Blade Sets
	sets.WS["Savage Blade"] = {
			ammo= "Cheruski Needle",
    		head="Sulevia's Mask +1",
    		body="Sulevia's Platemail +1",
    		hands="Sulevia's Gauntlets +1",
    		legs="Sulevia's Cuisses +1",
    		feet="Sulevia's Leggings +1",
    		neck="Asperity Necklace",
    		waist="Warwolf Belt",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Ifrit Ring",
    		right_ring="Ifrit Ring",
    		back=pld_cape.savage}
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Savage Blade"],{})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Savage Blade"].MidACC,{})

-- Requiescat Sets
	sets.WS.Requiescat = {
			ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1",
    		body="Sulevia's Platemail +1",
    		hands="Sulevia's Gauntlets +1",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1",
			neck="Asperity Necklace",
			waste="Windbuffet Belt +1",
			back="Bleating Mantle",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			ring1="Levia. Ring",
			ring2=pld_cape.savage}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{})

-- Atonement Sets
	sets.WS.Atonement = set_combine(sets.WS,{})

-- Knights of the Round Sets
	sets.WS["Knights of Round"] = set_combine(sets.WS,{})

-- Sanguine Blade Sets
	sets.WS["Sanguine Blade"] = set_combine(sets.WS,{ear1="Hecate's Earring"})

-- Aeolian Edge Sets
	sets.WS["Aeolian Edge"] = set_combine(sets.WS,{ear1="Hecate's Earring"})

-- Circle Blade Set
	sets.WS["Circle Blade"] = set_combine(sets.WS["Savage Blade"],{waise="Aqua Belt"})

-- Realmrazer
	sets.WS["Realmrazer"] = set_combine(sets.WS.Requiescat, {})
-- Judgment

-- Resolution Sets
	sets.WS.Resolution = {
			ammo="Cheruski Needle",
			head="Otomi Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Metalsinger Belt",
			legs="Acro Breeches",
			feet="Acro Leggings"}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})


---------------------------------------------------------------------------------------------
-- Job Ability Sets
---------------------------------------------------------------------------------------------
	sets.JA = {}

	sets.JA["Shield Bash"] = set_combine(sets.Enmity,{hands="Cab. Gauntlets +1"})
	sets.JA.Sentinel = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
	sets.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.JA["Divine Emblem"] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
	sets.JA.Fealty = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
	sets.JA.Invincible = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
	sets.JA.Cover = {head="Rev. Coronet +1",body="Cab. Surcoat +1"}
	sets.JA.Palisade = set_combine(sets.Enmity)
	sets.JA.Provoke = set_combine(sets.Enmity)
	sets.JA.Warcry = set_combine(sets.Enmity)
	sets.JA.Souleater = set_combine(sets.Enmity)
	sets.JA["Last Resort"] = set_combine(sets.Enmity)
	sets.JA.Chivalry = {
			ammo="Quartz Tathlum +1",
			head="Rev. Coronet +1",
			body="Cab. Surcoat +1",
			hands="Umuthi Gloves",
			ring1="Levia. Ring +1",
			legs="Cab. Breeches +1",
			feet="Whirlpool Greaves"}
	sets.JA.Rampart = set_combine(sets.Enmity,{head="Cab. Coronet +1"})

-- Sublimation --
	sets.Sublimation = {}

-- Flourish --
	sets.Flourish = set_combine(sets.Enmity)

-- Step --
	sets.Step = set_combine(sets.Enmity)

-- Waltz --
	sets.Waltz = {}

---------------------------------------------------------------------------------------------
-- Pre-Casting Sets
---------------------------------------------------------------------------------------------
	sets.Precast = {}

-- **Fastcast** --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head=souveran.head,
			neck="Orunmila's Torque",
			ear1="Enchntr. Earring +1",
			ear2="Loquac. Earring",
			body="Nuevo Coselete",
			hands="Buremte Gloves",
			ring1="Lebeche Ring",
			ring2="Meridian Ring",
			back=pld_cape.fastcast,
			waist="Goading Belt",
			legs="Enif Cosciales",
			feet=carmine.feet}

-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

-- Cure Precast Set --
	sets.Precast.Cure = set_combine(sets.Precast.FastCast,{
			neck="Diemer Gorget",
			ear1="Nourish. Earring +1",
			right_ear="Mendi. Earring",})

---------------------------------------------------------------------------------------------
--Midcast Sets
---------------------------------------------------------------------------------------------
	sets.Midcast = {}

-- Spells Recast --
	sets.Midcast.Recast = {
			ammo="Impatiens",
			head="Chev. Armet +1",
			neck="Orunmila's Torque",
			ear1="Enchntr. Earring +1",
			ear2="Loquac. Earring",
			body="Nuevo Coselete",
			hands="Buremte Gloves",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Repulse Mantle",
			waist="Goading Belt",
			legs="Enif Cosciales",
			feet="Ejekamal Boots"}

-- Divine Magic --
	sets.Midcast['Divine Magic'] = set_combine(sets.Midcast.Recast,{
			neck="Nesanica Torque",
			ear1="Knight's Earring",
			ear2="Beatific Earring",
			body="Rev. Surcoat +1",
			hands="Eschite Gauntlets",
			waist="Bishop's Sash",
			feet="Templar Sabatons"})

-- Cure Set --
	sets.Midcast.Cure = {
			ammo="Impatiens",
    		hands="Macabre Gaunt. +1",
    		legs=carmine.legs,
    		feet=yorium_cure.feet,
    		neck="Unmoving Collar",
    		waist="Nierenschutz",
    		left_ear="Nourish. Earring +1",
    		right_ear="Mendi. Earring",
    		left_ring="Defending Ring",
    		right_ring="Apeile Ring +1",
    		back="Repulse Mantle",}

-- Self Cure Set --
	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{
			legs="Souveran Diechlings"})

-- Flash Set --
	sets.Midcast.Flash = set_combine(sets.enmity, {
			ammo="Impatiens",
			ear1="Knight's Earring",})

-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = set_combine(sets.Midcast.Recast,{
			ammo="Impatiens",
			neck="Melic Torque",
			ear1="Andoaa Earring",
			ear2="Augment. Earring",
			body="Shab. Cuirass +1",
			hands=souveran.hands,
			legs=carmine.legs,
			back=pld_cape.phalanx,
			waist="Olympus Sash",
			legs="Rev. Breeches +1"})

-- Phalanx Set --
	sets.Midcast.phalanx = set_combine(sets.Midcast['Enhancing Magic'],{
			head=yorium_phalanx.head,
			body=yorium_phalanx.body,
			hands=souveran.hands,
			legs=yorium_phalanx.legs,
			back=pld_cape.phalanx,})

-- Stoneskin --
	sets.Midcast.Stoneskin =  set_combine(sets.Midcast['Enhancing Magic'],{})

-- Reprisal --
	sets.Midcast.Reprisal = {
			ammo="Impatiens",
			head="Chev. Armet +1",
			neck="Dualism Collar +1",
			ear1="Etiolation Earring",
			ear2="Cryptic Earring",
			body="Shab. Cuirass +1",
			hands="Souv. Handsch.",
			ring1="Etana Ring",
			ring2="Meridian Ring",
			back="Aenoth. Mantle +1",
			waist="Oneiros Belt",
			legs="Chev. Cuisses +1",
			feet="Souveran Schuhs +1"}

---------------------------------------------------------------------------------------------
-- Organizer Items
---------------------------------------------------------------------------------------------
	organizer_items = {
			claid="Claidheamh Soluis",
			degen="Demersal Degen +1",
			herk="Herkuleskeule",
			sushsole="Sole Sushi",
			sushsubl="Sublime Sushi",
			hghgpie="Hedgehog Pie",
			echodr="Echo Drops",
			hwater="Holy Water",
			remedy="Remedy",
			prismp="Prism Powder",
			snoil="Sneak Oil",}