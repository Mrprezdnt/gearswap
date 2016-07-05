sets.Idle = {
			range="Dunna",
			head=empty,
			body="Respite Cloak",
			hands="Geo. Mitaines",
			neck="Veisa Collar",
			ring1="Lebeche Ring",
			ring2="Shadow Ring",
			ear1="Handler's Earring",
			ear2="Handler's Earring +1",
			back=geo_cape.luopon,
			feet="Geomancy Sandals",}
-- Idle Sets --
	sets.Idle.Refresh = set_combine(sets.Idle,{
			main="Terra's Staff",
			head=empty,
			body="Respite Cloak",
			hands="Bagua Mitaines",
			legs="Assiduity Pants +1",})
-- Movement Sets
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{feet="Geomancy Sandals",})
-- Luopan Idle Set --
	sets.Idle.Luopan = set_combine(sets.Idle.Refresh,{
			main="Idris",
			sub="Genbu's Shield",
			neck="Twilight Torque",
			body="Respite Cloak",
			hands="Geo. Mitaines",
			ring1="Defending Ring",
			ring2="Dark Ring",
			ear1="Handler's Earring",
			ear2="Handler's Earring +1",
			back=geo_cape.luopon,
			feet="Bagua Sandals +1"})
			
	sets.Resting = set_combine(sets.Idle.Movement,{})

	-- PDT Set --
	sets.PDT = set_combine(sets.Idle.Luopan,{
		main="Terra's Staff",
		hands="Geo. Mitaines",
		neck="Veisa Collar",
		feet="Geomancy Sandals",
		back="Umbra Cape"})

	-- Sublimation Set --
	sets.Sublimation = {}

	sets.Precast = {}
	-- FastCast Set --
	sets.Precast.FastCast = {
			sub=empty,
			feet="Regal Pumps +1",
			back=geo_cape.fastcastint}

	-- Geomancy Precast (empty = To Fix Club/Staff Issue) --
	sets.Precast.GeoCast = {
			sub=empty,
			range=empty,
			hands="Geo. Mitaines",
			legs="Geo. Pants",
			feet="Regal Pumps +1",
			back=geo_cape.luopon}

	-- Elemental Staves --
	sets.Precast.Lightning = {main='Apamajas I'}
	sets.Precast.Water = {main='Haoma I'}
	sets.Precast.Fire = {main='Atar I'}
	sets.Precast.Ice = {main='Vourukasha I'}
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Earth = {main='Vishrava I'}
	sets.Precast.Light = {main='Arka I'}
	sets.Precast.Dark = {main='Xsaeta I'}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Elemental Magic --
	sets.Precast['Elemental Magic'] = set_combine(sets.Precast.FastCast,{hands="Bagua Mitaines"})

-- Precast Cure Set --
	sets.Precast.Cure = {
			sub=empty,
			ring1="Lebeche Ring",
			ring2="Haoma's Ring",
			left_ear="Mendi. Earring",
			back="Pahtli Cape",
			feet="Regal Pumps +1",}

-- Midcast Base Set --
	sets.Midcast = {}

-- Midcast Geocolure Set --
	sets.Midcast.Geocolure = {
    		range="Dunna",
			head="Azimuth Hood",
    		body="Bagua Tunic",
    		hands="Geo. Mitaines",
    		legs="Bagua Pants",
    		waist="Pythia Sash",
    		left_ear="Gifted Earring",
			back=geo_cape.geomancy,}

	-- Midcast Indicolure Set --
	sets.Midcast.Indicolure = set_combine(sets.Midcast.Geocolure,{
			legs="Bagua Pants",
			feet="Azimuth Gaiters",
			back=geo_cape.luopon,})

	-- Cure Set --
	sets.Midcast.Cure = {
			main="Tamaxchi",
    		sub=empty,
			body="Vanya Robe",
			feet="Regal Pumps +1",
			left_ear="Mendi. Earring",
			ring1="Ephedra Ring",
			ring2="Haoma's Ring",
			waist="Cascade Belt",
			back="Pahtli Cape",}

	-- Curaga Set --
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure,{
			neck="Nuna Gorget +1",
			ring1="Leviathan Ring",
			ring2="Haoma's Ring",})

	-- Haste Set --
	sets.Midcast.Haste = {}

	-- Enhancing Set --
	sets.Midcast['Enhancing Magic'] = {}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{})

	-- Stun Sets --
	sets.Midcast.Stun = {}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			ring1="Archon Ring",
			ring2="Perception Ring",}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})

	-- Aspir Set --
	sets.Midcast.Aspir = set_combine(sets.Midcast['Dark Magic'],{})

	-- Drain Set --
	sets.Midcast.Drain = set_combine(sets.Midcast['Dark Magic'],{})

	-- Low Tier Set --
	sets.LowNuke = {
		back="Toro Cape"
	}

	-- MB Set --
	sets.MB = {
		back=geo_cape.fastcastint
	}

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
			main="Dowser's Wand",
			neck="Nefarious Collar +1",
			ring1="Perception Ring",
			ring2="Acumen Ring",
			back="Toro Cape"}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{})

	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {
			neck="Nefarious Collar +1",
			back=geo_cape.fastcastint}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})

	-- Impact Set --
	sets.Midcast.Impact = {
			body="Twilight Cloak"}

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Lightning = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Water = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Light = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {back="Twilight Cape",waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Life Cycle'] = {body="Geo. Tunic", back=geo_cape.luopon}
	sets.JA.Bolster = {body="Bagua Tunic"}
	sets.JA['Radial Arcana'] = {feet="Bagua Sandals"}
	sets.JA['Mending Halation'] = {feet="Bagua Pants"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {}

	sets.WS.Exudation = {}
	sets.WS["Hexa Strike"] = {}
	sets.WS.Realmrazer = {}
	sets.WS.Shattersoul = {}

	-- Idle Reive Set --
	sets.Reive = {neck="Arciela's Grace +1"}