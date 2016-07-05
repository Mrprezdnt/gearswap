sets.Idle = {}
	-- Refresh Set --
	sets.Idle.Refresh = {
			main="Bolelabunga",
			sub="Genbu's Shield",
			head=none,
			body="Respite Cloak",
			hands="Serpentes Cuffs",
			neck="Wiglen Gorget",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Kumbira Cape",
			legs="Assid. Pants +1",
			feet="Serpentes Sabots"}

	-- Movement Set --
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			feet="Herald's Gaiters"})

	-- Resting Set --
	sets.Resting = {}

	-- PDT Set --
	sets.PDT = {
			main="Terra's Staff",
			neck="Veisa Collar",
			ring1="Defending Ring",}

	-- Sublimation Set --
	sets.Sublimation = {}

--------------------------------------------------------------------------------
	-- Pre-Cast Sets --
--------------------------------------------------------------------------------
	
	sets.Precast = {}
	-- Fastcast Set (empty = To Fix Club/Staff Issue) --
	sets.Precast.FastCast = {
			sub=empty,
			feet="Regal Pumps +1",
			back="Alaunus's Cape"}

	-- Elemental Staves --
	sets.Precast.Lightning = {main='Apamajas I'}
	sets.Precast.Water = {main='Haoma I'}
	sets.Precast.Fire = {main='Atar I'}
	sets.Precast.Ice = {main='Vourukasha I'}
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Earth = {main='Vishrava I'}
	sets.Precast.Light = {main='Arka I'}
	sets.Precast.Dark = {main='Xsaeta I'}

	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{main="Yagrush",waist="Siegel Sash"})
	sets.Precast['Healing Magic'] = set_combine(sets.Precast.FastCast,{main="Yagrush",legs="Ebers Pant. +1"})

	sets.Precast.Stoneskin = set_combine(sets.Precast.FastCast,{head="Umuthi Hat",waist="Siegel Sash"})

	-- Cure Precast Set --
	sets.Precast.Cure = {
			main="Ababinili",
			sub=empty,
			ear1="Nourishing Earring",
			ear2="Mendicant's Earring",
			back="Alaunus's Cape"}
	
--------------------------------------------------------------------------------
	-- Mid-Cast Sets --
--------------------------------------------------------------------------------

-- Midcast Base Set --
	sets.Midcast = {}

-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{})

-- Cure Set --
	sets.Midcast.Cure = {
			ammo="Kalboron Stone",
			main="Chatoyant Staff",
			sub="Achaq Grip",
			head="Telchine Cap",
			body="Vanya Robe",
			hands="Telchine Gloves",
			legs="Ebers Pantaloons",
			feet="Regal Pumps +1",
			ear1="Nourish. Earring",
			ear2="Mendi. Earring",
			ring1="Haoma's Ring",
			ring2="Ephedra Ring",
			neck="Nuna Gorget +1",
			waiste="Cascade Belt",
			back="Alaunus's Cape"}

	-- Cure Enmity Set --
	sets.Midcast.Cure.Enmity = set_combine(sets.Midcast.Cure,{})

	-- Curaga Set --
	sets.Midcast.Curaga = {
			sub="Achaq Grip",
			ammo="Kalboron Stone",
			neck="Nuna Gorget +1",
			earring1="Nourishing Earring",
			earring2="Mendicant's Earring",
			ring1="Leviathan Ring",
			ring2="Haoma's Ring",
			legs="Ebers Pant. +1"}

	-- Curaga Enmity Set --
	sets.Midcast.Curaga.Enmity = set_combine(sets.Midcast.Curaga,{})

	-- Enhancing Set --
	sets.Midcast['Enhancing Magic'] = {
		main="Beneficus",
		legs="Piety Pantaloons",}

	-- Barspells Set --
	sets.Midcast.Bar = {
		main="Beneficus",
		legs="Piety Pantaloons",}

	-- Regen Set --
	sets.Midcast.Regen = set_combine(sets.Midcast.Haste,{
			main="Bolelabunga",
			body="Piety Briault +1",
			hands="Ebers Mitts +1",
			legs="Theo. Pant. +1"})

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast.Haste,{})

	-- Na Set --
	sets.Midcast.Na = set_combine(sets.Midcast.Haste,{main="Yagrush",legs="Ebers Pant. +1"})

-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			body="Vanya Robe",
			ring1="Ephedra Ring",
			ring2="Haoma's Ring",
			back="Alaunus's Cape",
			legs="Theo. Pant. +1",
			feet="Vanya Clogs"})

	-- Divine Set --
	sets.Midcast['Divine Magic'] = {}

	-- Banish Set --
	sets.Midcast.Banish = set_combine(sets.Midcast['Divine Magic'],{
			hands="Piety Mitts +1",
			ring1="Fenian Ring"})

	-- Holy Set --
	sets.Midcast.Holy = set_combine(sets.Midcast['Divine Magic'],{})
	
	-- Enfeebling Set --
	sets.Midcast['Enfeebling Magic'] = {
			hands="Inyanga Dastanas",
			legs="Inyanga Shalwar",
			feet="Inyanga Crackows",
			back=whm_cape}

	-- Dark Magic Set --
	sets.Midcast['Dark Magic'] = {}

	-- Impact Set --
	sets.Midcast.Impact = {}

--------------------------------------------------------------------------------
	-- JA Sets --
--------------------------------------------------------------------------------
	-- JA Sets --
	sets.JA = {}
	sets.JA.Benediction = {body="Piety Briault +1"}
	sets.JA.Martyr = {hands="Piety Mitts +1"}
	sets.JA.Devotion = {head="Piety Cap +1"}

	-- Divine Caress Set --
	sets['Divine Caress'] = {
		main="Yagrush",
		hands="Ebers Mitts +1",
		back="Mending Cape"}
	
--------------------------------------------------------------------------------
	-- Melee & WS Sets --
--------------------------------------------------------------------------------
	
	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {}
	sets.WS['Hexa Strike'] = {}
	sets.WS['Mystic Boon'] = {}
	sets.WS.Dagan = {}