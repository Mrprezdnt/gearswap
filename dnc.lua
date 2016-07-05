-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	include('gearsets/'..player.name..'/_augment_equip.lua')
	include('organizer-lib')
	AccIndex = 1
	AccArray = {"Normal","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	WeaponIndex = 1
	WeaponArray = {"Melee","TH"} -- Default Sub Weapon Is Melee. Don't Input Main/Sub In TP Sets. Melee = Damage Type Dagger | TH = TH Type Dagger --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	SA = false
	TA = false
	TH = 'OFF' -- Set Default Full TH ON or OFF Here --
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --
	ProcStep = 'OFF'

	sc_map = {SC1="Exenterator", SC2="HasteSamba", SC3="Ranged"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
	
	sets.Idle = {}
	-- Regen Set --
	sets.Idle.Regen = {
			head="Smilodon Mask +1",
			left_ear="Infused Earring",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring"}
	-- Movement Set --
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			feet="Jute Boots +1"})

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
    		head="Smilodon Mask +1",
    		body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1',}},
    		hands={ name="Taeon Gloves", augments={'Accuracy+7 Attack+7','"Triple Atk."+1',}},
    		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
    		feet={ name="Taeon Boots", augments={'Attack+18','"Triple Atk."+2','STR+5',}},
    		neck="Asperity Necklace",
    		waist="Windbuffet Belt +1",
    		left_ear="Steelflash Earring",
    		right_ear="Bladeborn Earring",
    		left_ring="Etana Ring",
    		right_ring="Mouflon Ring",
    		back="Bleating Mantle"}
    -- Mid-Accuracy --
	sets.TP.MidACC = set_combine(sets.TP,{
			head="Alhazen Hat +1",
			hands="Rawhide Gloves",
    		waist="Chiner's Belt +1",
    		right_ring="Toreador's Ring",
    		back={ name="Canny Cape", augments={'DEX+4','AGI+5','"Dual Wield"+1','Crit. hit damage +2%',}}})
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
	sets.TP.TH = {
			head="Smilodon Mask +1",
			body={ name="Taeon Tabard", augments={'Accuracy+10','"Triple Atk."+1',}},
			hands="Plun. Armlets +1",
			legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
    		feet="Skulker's Poulaines",
			neck="Asperity Necklace",
			waist="Windbuffet Belt +1",
			left_ear="Dudgeon Earring",
    		right_ear="Heartseeker Earring",
			left_ring="Oneiros Ring",
			right_ring="Mouflon Ring", 
			back="Bleating Mantle"}

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
end

include('_DBcasts')

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.action_type == 'Ranged Attack' and spell.target.distance > 24.9 then
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	--elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
	--	cancel_spell()
	--	add_to_chat(123, spell.name..' Canceled: [Out of Range]')
	--	return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if SA and equipSet["SA"] then
				equipSet = equipSet["SA"]
			end
			if TA and equipSet["TA"] then
				equipSet = equipSet["TA"]
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if spell.english == "Evisceration" and player.tp > 2990 then -- Equip Jupiter's Pearl When You Have 3000 TP --
				equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type=="JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
		if spell.english == "Sneak Attack" then
			SA = true
		end
		if spell.english == "Trick Attack" then
			TA = true
		end
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.Utsusemi)
				end
			else
				equip(sets.Precast.Utsusemi)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == 'Step' then
		equip(sets.Step)
		--proc_step()
	elseif spell.type:endswith('Flourish') then
		equip(sets.Flourish)
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end
--======= Midcast Sets =======--
function midcast(spell,action)
	if spell.action_type == 'Ranged Attack' then
		equip(sets.RA)
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
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
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'EVA' then
		equip(sets.Evasion)
		
--======= Engaged Set Conditions =======--
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		-- double check this, need to make only work when using normal TP set --
		--if player.mp < 100 then
			--if equipSet == sets.TP then
    	--		equipSet = set_combine(sets.TP,{left_ring = "Etana Ring"})
		--	else	
        --		equipSet = set_combine(sets.TP,{left_ring = "Oneiros Ring"})
		--	end
		if (buffactive.Embrava and (buffactive.March or buffactive.Haste) and buffactive['Haste Samba']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Haste Samba']) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava) and buffactive['Haste Samba']) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if ((buffactive.Embrava or buffactive[580]) and (buffactive.March or buffactive.Haste or buffactive['Haste Samba'])) or (buffactive.March == 1 and buffactive.Haste and buffactive['Haste Samba']) or (buffactive.March == 2 and (buffactive.Haste or buffactive['Haste Samba'])) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if SA then
			equipSet = set_combine(equipSet,sets.JA["Sneak Attack"])
		end
		if TA then
			equipSet = set_combine(equipSet,sets.JA["Trick Attack"])
		end
		if buffactive.Feint then
			equipSet = set_combine(equipSet,sets.TP.Feint)
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
		end
		if TH == 'ON' then -- Use TH Toggle To Lock Full TH Set --
			equipSet = set_combine(equipSet,sets.TP.TH)
		end
		if buffactive['Reive Mark'] then -- Equip Homestead Dagger & Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{sub="Homestead Dagger",neck="Ygnas's Resolve +1"})
		end
		equip(equipSet)
		proc_step()
	else
--======= Idle Set Conditions =======--
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Homestead Dagger & Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{sub="Homestead Dagger",neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "sneak attack" then
		SA = gain
	elseif buff == "trick attack" then
		TA = gain
	elseif buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command:match('^DBcast') then
		DB_command(command)
	
	elseif command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
	elseif command == 'C17' then -- Sub Weapon Type Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Sub Weapon Type: '..WeaponArray[WeaponIndex])
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
	elseif command == 'C9' then -- Full TH Set Toggle --
		if TH == 'ON' then
			TH = 'OFF'
			add_to_chat(123,'Full TH Set: [Unlocked]')
		else
			TH = 'ON'
			add_to_chat(158,'Full TH Set: [Locked]')
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
	elseif command == 'C3' then -- Evasion Toggle --
		if Armor == 'EVA' then
			Armor = 'None'
			add_to_chat(123,'Evasion Set: [Unlocked]')
		else
			Armor = 'EVA'
			add_to_chat(158,'Evasion Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'procStep' then -- Dynamis Proc-step --
		if ProcStep == 'ON' then
			ProcStep = 'OFF'
			add_to_chat(123,'ProcStep: [Unlocked]')
		else
			ProcStep = 'ON'
			add_to_chat(158,'ProcStep: [Locked]')
			send_command('input /ja "Quickstep" <t>')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Rancor Toggle --
		if Rancor == 'ON' then
			Rancor = 'OFF'
			add_to_chat(123,'Rancor: [OFF]')
		else
			Rancor = 'ON'
			add_to_chat(158,'Rancor: [ON]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

--=======================================================================================================================--
--Macros--
send_command('bind f10 gs c C7') --PDT--
send_command('bind ^f10 gs c C3') --Evasion--
send_command('bind f11 gs c C15') --MDT--
send_command('bind ^f9 gs c C17') --Sub-Dagger-Melee/TH--
send_command('bind f12 gs c C1') --ACC Level--
send_command('bind f9 gs c C9') --Full TH--
send_command('bind ^f12 gs c C6') --Idle Toggle--
send_command('bind !f12 gs c C4') --Capa Mantle--
send_command('bind ] gs c procStep')

function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end

	send_command('unbind f12')
    send_command('unbind f11')
    send_command('unbind f10')
	send_command('unbind f9')
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.range ~= 'empty' then
		disable('range','ammo')
	elseif player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	else
		enable('range','ammo','ring1','ring2','back')
	end
end

function proc_step()
	add_to_chat('step function is executing')
	if ProcStep == 'ON' then
		add_to_chat('ProcStep registering as set to "ON"')
		send_command('wait 5;input /ja "Quickstep" <t>')
	end
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
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

	if player.tp < tpCost and not buffactive.trance then

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
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
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
		set_macro_page(4, 4)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 4)
	else
		set_macro_page(1, 4)
	end
end