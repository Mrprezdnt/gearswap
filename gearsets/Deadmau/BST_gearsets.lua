	sets.Idle = {}
-- Regen Set --
	sets.Idle.Regen = {}

-- Damage Type Axe & Shield --
	sets.Idle.Regen.Melee = set_combine(sets.Idle.Regen,{
			main="Hunahpu",
			sub="Beatific Shield +1"})
-- Damage Type Axes: NIN Sub --
	sets.Idle.Regen.Melee.NIN = set_combine(sets.Idle.Regen,{
			main="Hunahpu",
			sub="Hatxiik"})
-- Damage Type Axes: DNC Sub --
	sets.Idle.Regen.Melee.DNC = set_combine(sets.Idle.Regen,{
			main="Hunahpu",
			sub="Hatxiik"})

-- Pet PDT/DT Type Axe & Shield --
	sets.Idle.Regen.PDT = set_combine(sets.Idle.Regen,{
			main="Izizoeksi",
			sub="Beatific Shield +1"})
-- Pet PDT/DT Type Axes: NIN Sub --
	sets.Idle.Regen.PDT.NIN = set_combine(sets.Idle.Regen,{
			main="Izizoeksi",
			sub="Astolfo"})
-- Pet PDT/DT Type Axes: DNC Sub --
	sets.Idle.Regen.PDT.DNC = set_combine(sets.Idle.Regen,{
			main="Izizoeksi",
			sub="Astolfo"})

-- Sic/Ready Type Axe & Shield --
	sets.Idle.Regen.Sic = set_combine(sets.Idle.Regen,{
			main="Charmer's Merlin",
			sub="Beatific Shield +1"})
-- Sic/Ready Type Axes: NIN Sub --
	sets.Idle.Regen.Sic.NIN = set_combine(sets.Idle.Regen,{
			main="Aymur",
			sub="Charmer's Merlin"})
-- Sic/Ready Type Axes: DNC Sub --
	sets.Idle.Regen.Sic.DNC = set_combine(sets.Idle.Regen,{
			main="Aymur",
			sub="Charmer's Merlin"})

	-- Movement Set --
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			feet="Skd. Jambeaux +1"})

	-- Damage Type Axe & Shield --
	sets.Idle.Movement.Melee = set_combine(sets.Idle.Movement,{
			main="Hunahpu",
			sub="Beatific Shield +1"})
	-- Damage Type Axes: NIN Sub --
	sets.Idle.Movement.Melee.NIN = set_combine(sets.Idle.Movement,{
			main="Hunahpu",
			sub="Hatxiik"})
	-- Damage Type Axes: DNC Sub --
	sets.Idle.Movement.Melee.DNC = set_combine(sets.Idle.Movement,{
			main="Hunahpu",
			sub="Hatxiik"})

	-- Pet PDT/DT Type Axe & Shield --
	sets.Idle.Movement.PDT = set_combine(sets.Idle.Movement,{
			main="Izizoeksi",
			sub="Beatific Shield +1"})
	-- Pet PDT/DT Type Axes: NIN Sub --
	sets.Idle.Movement.PDT.NIN = set_combine(sets.Idle.Movement,{
			main="Izizoeksi",
			sub="Astolfo"})
	-- Pet PDT/DT Type Axes: DNC Sub --
	sets.Idle.Movement.PDT.DNC = set_combine(sets.Idle.Movement,{
			main="Izizoeksi",
			sub="Astolfo"})

	-- Sic/Ready Type Axe & Shield --
	sets.Idle.Movement.Sic = set_combine(sets.Idle.Movement,{
			main="Charmer's Merlin",
			sub="Beatific Shield +1"})
	-- Sic/Ready Type Axes: NIN Sub --
	sets.Idle.Movement.Sic.NIN = set_combine(sets.Idle.Movement,{
			main="Aymur",
			sub="Charmer's Merlin"})
	-- Sic/Ready Type Axes: DNC Sub --
	sets.Idle.Movement.Sic.DNC = set_combine(sets.Idle.Movement,{
			main="Aymur",
			sub="Charmer's Merlin"})

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

---------------------------------------------------------------------------------------------
-- TP Sets
---------------------------------------------------------------------------------------------
	-- TP Base Set --
	sets.TP = {}

	--Normal TP Sets --
	sets.TP = {
			main=bstaxe,
			sub="Arktoi",
			ammo="Demonry Core",
			head=despair_pet.head,
			body=taeon_pet.body,
			hands=taeon_pet.hands,
			legs=acro_pet.legs,
			feet=taeon_pet.feet,
			ear1="Handler's Earring",
			ear2="Handler's Earring +1",}
	sets.TP.MidACC = set_combine(sets.TP,{})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{})

	-- High Haste Sets --
	-- March x2 + Haste --
	-- Embrava + (March or Haste) --
	-- Geo Haste + (March or Haste or Embrava) --
	sets.TP.HighHaste = set_combine(sets.TP,{})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{})

	sets.TP.Pet = {}
	-- Pet Haste Gear --
	sets.TP.Pet.Haste = {}

	-- Pet PDT Gear --
	sets.TP.Pet.PDT = set_combine(sets.TP.Pet.Haste,{})

	-- Pet ACC Gear --
	sets.TP.Pet.ACC = set_combine(sets.TP.Pet.Haste,{})

	-- PDT/MDT/Kiting Sets --
	sets.PDT = {}

	sets.MDT = set_combine(sets.PDT,{})

	sets.Kiting = set_combine(sets.PDT,{feet="Skd. Jambeaux +1"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS.Ruinator = {}
	sets.WS.Ruinator.MidACC = set_combine(sets.WS.Ruinator,{})
	sets.WS.Ruinator.HighACC = set_combine(sets.WS.Ruinator.MidACC,{})
			
	sets.WS.Onslaught = {}

	sets.WS.Cloudsplitter = {}

	sets.WS["Primal Rend"] = {}

	sets.WS.Rampage = {}

	-- JA Sets --
	sets.JA = {}
	TH_Gear = {waist="Chaac Belt"}
	sets.JA.Reward = {body="An. Jackcoat +1",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}
	sets.JA.Charm = {}
	sets.JA.Tame = {head="Totemic Helm +1"}
	sets.JA.Familiar = {legs="Ankusa Trousers +1"}
	sets.JA["Call Beast"] = {body="Mirke Wardecors",hands="Ankusa Gloves +1",feet="Armada Sollerets"}
	sets.JA["Bestial Loyalty"] = sets.JA["Call Beast"]
	sets.JA["Feral Howl"] = {body="An. Jackcoat +1",waist="Chaac Belt"}
	sets.JA["Killer Instinct"] = {head="Ankusa Helm +1"}
	sets.JA.Provoke = TH_Gear
	sets.JA.Steal = TH_Gear
	sets.JA.Mug = TH_Gear

	sets.Pet = {}
	sets.Pet.Sic = {legs="Desultor Tassets"}
	sets.Pet.Ready = {
			main="Charmer's Merlin",
			legs="Desultor Tassets"}
	sets.Pet.Spur = {feet="Nukumi Ocreae +1"}

-- Physical Type Ready Moves: Add Pet Attack & Accuracy Gear Here --
	sets.Physical_Ready_Moves = {
			main=bstaxe,
			sub="Arktoi",
			ammo="Demonry Core",
			head=despair_pet.head,
			body=taeon_pet.body,
			hands=taeon_pet.hands,
			legs=acro_pet.legs,
			feet=taeon_pet.feet,
			ear1="Ferine Earring",
			hands="Nukumi Manoplas +1"}

-- Magic Type Ready Moves: Add Pet Magic Attack & Magic Accuracy Gear Here --
	sets.Magical_Ready_Moves = {}

	-- Step Set --
	sets.Step = set_combine({},TH_Gear)

	-- Flourish Set --
	sets.Flourish = set_combine({},TH_Gear)

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	-- Cure Set --
	sets.Midcast.Cure = {
			neck="Phalaina Locket",
			hands="Macabre Gaunt. +1",
			ring1="Asklepian Ring",
			ring2="Kunaji Ring",
			belt="Chuq'aba Belt"}