-- ToDo:  --
-- doom status -> equip saida ring --
-- add HP+ before fast cast etc, make sure not taking massive hit to HP --
-- some kind of safeguard here to keep HP above certain lvl --
-- night/day/weather gear adjustments --
-- latent refresh gear for idle under certain MP --
-- function that will check Blu spell and cycle through enmity spells if cooldown not rdy --
-- shits real variable to lock extra cure potency, etc. for harder content --

----------------- Paladin Gearswaps ------------------
------------ "Welcome to the Thunderdome" ------------
function get_sets()
	include('includes/_included_files.lua')

	AccIndex = 1
	AccArray = { "Normal", "MidACC", "HighACC" } -- Default ACC Set is Normal --
	HybIndex = 1
	HybArray = { "DT", "PDT", "MDT" } -- Default Hybrid Set is Normal --
	ShieldIndex = 1
	ShieldArray = { "Ochain", "Aegis", "Priwen" } -- Default Shield Set is Ochain --
	SwordIndex = 1
	SwordArray = { "Claidheamh Soluis", "Demers. Degen +1", "Herkuleskeule" } -- Default Sword is Claidheamh --
	IdleIndex = 4
	IdleArray = { "Movement", "Regen", "Refresh", "Hybrid" } -- Default Idle Set Is Hybrid --
	DualBox = 'ON'
	Armor = 'None'
	Twilight = 'None'
	Repulse = 'OFF' -- Set Default Repulse ON or OFF Here --
	Capa = 'OFF' -- Set Default Capacity Points+ Mantle ON or OFF Here --
	target_distance = 6 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --
	--wsIndex = 1
	--wsArray = {"Savage Blade", "Chant du Cigne", "Requiescat"}
	--ws2Index = 3
	--ws2Array = {"Savage Blade", "Chant du Cigne", "Requiescat"}

	--GeoArray = {}
	--IndiIndex = 1
	--IndiArray = {"Haste", "Regen", "Refresh"}


	-- Variables and Tables
	Cure_Spells = { "Cure", "Cure II", "Cure III", "Cure IV" } -- Cure Degradation --
	sc_map = { SC1 = "Flash", SC2 = "UtsusemiNi", SC3 = "UtsusemiIchi" } -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
	EnmityBlueMagic = S { "Jettatura", "Sheep Song", "Soporific", "Blank Gaze", "Geist Wall" } -- BlueMagic --

	-- Equipment that Locks Current slot (rings & back)
	locked_equipment = S { "Capacity Ring, Warp Ring, Trizec Ring" }

	Cities = S {
		"Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
		"Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
		"Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria",
		"Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks",
		"Aht Urhgan Whitegate", "Nashmau", "Tavanazian Safehold",
		"Selbina", "Mhaura", "Norg", "Eastern Adoulin", "Western Adoulin", "Kazham", "Tavnazia"
	}
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	state.Buff.Sentinel = buffactive.sentinel or false
	state.Buff.Cover = buffactive.cover or false
	state.Buff.Doom = buffactive.Doom or false
end

--------------------------------------------------------------------------------
-- PreTarget
--------------------------------------------------------------------------------
function pretarget(spell, action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
	cancel_spell()
	send_command('input /item "Echo Drops" <me>')
	elseif enter_remapped then
		cancel_spell()
		dualBoxTarget = spell.target.name
		dualBoxSpell = spell.name
		add_to_chat(123, 'target name: ' .. dualBoxTarget)
		add_to_chat(123, 'spell name: ' .. dualBoxSpell)
		--	elseif EnmityBlueMagic:contains(spell.english) then
		--		if spell.english.send_command('')
	elseif spell.english:ifind("Cure") and player.mp < actualCost(spell.mp_cost) then
		degrade_spell(spell, Cure_Spells)
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Cancel Berserk If Berserk Is On --
	send_command('cancel Berserk')
	elseif spell.english == "Defender" and buffactive.Defender then -- Cancel Defender If Defender Is On --
	send_command('cancel Defender')
	elseif spell.english == "Souleater" and buffactive.Souleater then -- Cancel Souleater If Souleater Is On --
	send_command('cancel Souleater')
	elseif spell.english == "Last Resort" and buffactive["Last Resort"] then -- Cancel Last Resort If Last Resort Is On --
	send_command('cancel Last Resort')
	-- test to see if this fixes problem of <stnpc> with weaponskills
	--elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
	--	cancel_spell()
	--	add_to_chat(123, spell.name..' Canceled: [Out of Range]')
	return
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

--------------------------------------------------------------------------------
-- PreCast
--------------------------------------------------------------------------------
function precast(spell, action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
		cancel_spell()
		add_to_chat(123, 'Unable To Use WeaponSkill: [Disengaged]')
		return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if player.tp > 2999 then
				if spell.english == "Resolution" then -- Equip Kokou's Earring When You Have 3000 TP --
				equipSet = set_combine(equipSet, { ear1 = "Kokou's Earring" })
				elseif spell.english == "Chant du Cygne" then -- Equip Jupiter's Pearl When You Have 3000 TP --
				equipSet = set_combine(equipSet, { ear1 = "Jupiter's Pearl" })
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16 + target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: [Silenced or Out of Casting Range]')
		return
		else
			if string.find(spell.english, 'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Reprisal" then
				if buffactive['Blaze Spikes'] or buffactive['Ice Spikes'] or buffactive['Shock Spikes'] then -- Cancel Blaze Spikes, Ice Spikes or Shock Spikes When You Cast Reprisal --
				cast_delay(0.2)
				send_command('cancel Blaze Spikes,Ice Spikes,Shock Spikes')
				end
				equip(sets.Precast.FastCast)
			elseif string.find(spell.english, 'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif string.find(spell.type, 'Flourish') then
		if spell.english == "Animated Flourish" then
			equip(sets.Enmity)
		else
			equip(sets.Flourish)
		end
	elseif spell.type == "Step" then
		equip(sets.Step)
	elseif spell.type == "Waltz" then
		refine_waltz(spell, action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
	if Capa == 'ON' then
		equip(sets.Capa)
	end
end

--------------------------------------------------------------------------------
-- MidCast
--------------------------------------------------------------------------------
function midcast(spell, action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (string.find(spell.english, 'Cur') or spell.english == "Wild Carrot" or spell.english == "Healing Breeze") and spell.english ~= "Cursna" then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
		elseif string.find(spell.english, 'Protect') or string.find(spell.english, 'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet, { ring2 = "Sheltered Ring" })
			end
		elseif spell.english == "Phalanx" then
			equipSet = set_combine(equipSet, sets.Midcast.phalanx)
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif string.find(spell.english, 'Banish') then
			equipSet = set_combine(equipSet, { ring1 = "" })
		elseif EnmityBlueMagic:contains(spell.english) or spell.english == "Stun" or string.find(spell.english, 'Absorb') or spell.english == 'Aspir' or spell.english == 'Drain' then
			if buffactive.Sentinel then
				equipSet = equipSet.Recast
			else
				equipSet = equipSet.Flash
			end
		elseif string.find(spell.english, 'Spikes') then
			equipSet = equipSet.Recast
		elseif string.find(spell.english, 'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Recast
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if Capa == 'ON' then
		equip(sets.Capa)
	end
end

--------------------------------------------------------------------------------
-- AfterCast
--------------------------------------------------------------------------------
function aftercast(spell, action)
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
		send_command('@wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		elseif spell.english == "Holy Circle" then -- Holy Circle Countdown --
		send_command('wait 260;input /echo ' .. spell.name .. ': [WEARING OFF IN 10 SEC.];wait 10;input /echo ' .. spell.name .. ': [OFF]')
		end
	end
	status_change(player.status)
end

--------------------------------------------------------------------------------
-- Status Change
--------------------------------------------------------------------------------
function status_change(new, old)
	--	check_equip_lock()
	equipSet = {}
	if Armor == 'PDT' then
		equipSet = (sets.PDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'MDT' then
		equipSet = (sets.MDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'BDT' then
		equipSet = (sets.BDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'Kiting' then
		equipSet = (sets.Kiting[ShieldArray[ShieldIndex]])
	elseif Armor == 'Weakness' then
		equipSet = (sets.Weakness[ShieldArray[ShieldIndex]])
	elseif Armor == 'DT' then
		equipSet = (sets.DT[ShieldArray[ShieldIndex]])
	elseif buffactive["Sublimation: Activated"] then
		equipSet = (sets.Sublimation)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		--if Armor == 'Hybrid' and equipSet["Hybrid"] then
		--	equipSet = equipSet["Hybrid"]
		--end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if Armor == 'Hybrid' and equipSet[HybArray[HybIndex]] then -- See if this works
		equipSet = equipSet[HybArray[HybIndex]]
		end
		--if equipSet[HybArray[HybIndex]] then
		--	equipSet = equipSet[HybArray[HybIndex]]
		--end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if Armor == 'ShieldSkill' then
			equipSet = set_combine(equipSet, sets.TP.ShieldSkill)
		end
		if swordIndex == 1 then
			equipSet = set_combine(equipSet, { main = sword_claid })
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if equipSet[SwordIndex] then
			equipSet = equipSet[SwordIndex]
		end

		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
		equipSet = set_combine(equipSet, { neck = "Ygnas's Resolve +1" })
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet, { body = "Councilor's Garb" })
		end
		if Warp == "ON" then
			equipSet = set_combine(equipSet,{ring1="Warp Ring"})
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Repulse == 'ON' then -- Use Repulse Toggle To Lock Repulse Mantle --
	equip(sets.Repulse[ShieldArray[ShieldIndex]])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
	if Capa == 'ON' then
		equip(sets.Capa)
	end
	if Cities:contains(world.area) then
		equipSet = equip(sets.Town[ShieldArray[ShieldIndex]])
	end
	check_main()
end

--------------------------------------------------------------------------------
-- Buff Gained
--------------------------------------------------------------------------------
function buff_change(buff, gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
	if gain then
		send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
	else
		send_command('timers delete "Aftermath: Lv.3"')
		add_to_chat(123, 'AM3: [OFF]')
	end
	elseif buff == 'weakness' then -- Weakness Timer --
	if gain then
		send_command('timers create "Weakness" 300 up')
	else
		send_command('timers delete "Weakness"')
	end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
	equip({ neck = "" })
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end


---------------------------------------------------------------------------------------------
-- Helper Functions
---------------------------------------------------------------------------------------------
-- Lock Equipment Here --
-- function check_equip_lock()
-- if locked_equipment:contains(player.equipment.left_ring) then
-- disable('ring1')
-- else
-- enable('ring1')
-- end
-- elseif locked_equipment:contains(player.equipment.right_ring) then
-- disable('ring2')
-- else
-- enable('ring2')
-- end
-- end
-- end
-- if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
-- disable('ring1','ring2')
-- Fix: not sure if if there is a point for this?
-- elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
-- disable('back')
-- else
-- enable('ring1','ring2','back')
-- end
-- end

-- Custom Check Main Weapon --
function check_main()
	wepOnList = nil
	for key, value in pairs(SwordArray) do
		if SwordArray[key] == player.equipment.main then
			wepOnList = true
		end
	end
	if wepOnList or player.equipment.main == "empty" then
		equipSet = set_combine(equipSet, { main = SwordArray[SwordIndex] })
		equip(equipSet)
	end
end

-- Reduced MP cost
function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost * .5
	elseif buffactive["Light Arts"] then
		return originalCost * .9
	else
		return originalCost
	end
end

-- Degrade Spell
function degrade_spell(spell, degrade_array)
	spell_index = table.find(degrade_array, spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell, spell.target.raw)
		add_to_chat(8, spell.name .. ' Canceled: [' .. player.mp .. '/' .. player.max_mp .. 'MP::' .. player.mpp .. '%] Casting ' .. new_spell .. ' instead.')
	end
end

-- Change Spell
function change_spell(spell_name, target)
	cancel_spell()
	send_command('//' .. spell_name .. ' ' .. target)
end

-- Refine Waltz
function refine_waltz(spell, action)
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
		local est_max_hp = target.hp / (target.hpp / 100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123, 'Full HP!')
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

	local waltzTPCost = { ['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80 }
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP [' .. tostring(player.tp) .. ']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
		end

		downgrade = 'Insufficient TP [' .. tostring(player.tp) .. ']. Downgrading to ' .. newWaltz .. '.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "' .. newWaltz .. '" ' .. tostring(spell.target.raw))
		if downgrade then
			add_to_chat(206, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(206, 'Trying to cure ' .. tostring(missingHP) .. ' HP using ' .. newWaltz .. '.')
	end
end

-- Find Alliance Name
function find_player_in_alliance(name)
	for i, v in ipairs(alliance) do
		for k, p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

-- Sub-Job Change
function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book(13)
end

-- Auto-Set Macro Book
function set_macro_page(set, book)
	if not tonumber(set) then
		add_to_chat(123, 'Error setting macro page: Set is not a valid number (' .. tostring(set) .. ').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123, 'Error setting macro page: Macro set (' .. tostring(set) .. ') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123, 'Error setting macro page: book is not a valid number (' .. tostring(book) .. ').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123, 'Error setting macro page: Macro book (' .. tostring(book) .. ') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book ' .. tostring(book) .. ';wait .1;input /macro set ' .. tostring(set))
	else
		send_command('@input /macro set ' .. tostring(set))
	end
end

-- Default Macro Books
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'BLU' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'RUN' then
		set_macro_page(3, 1)
	elseif player.sub_job == 'DNC' then
		set_macro_page(4, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(5, 1)
	elseif player.sub_job == 'WHM' then
		set_macro_page(6, 1)
	else
		set_macro_page(1, 1)
	end
end

---------------------------------------------------------------------------------------------
-- Self-Commands -- //gs c (command), Macro: /console gs c (command), Bind: gs c (command)
---------------------------------------------------------------------------------------------
function self_command(command)

-- DBcast Macros
	if command:match('^DB') then
		DB_command(command)

-- Accuracy Level Toggle
	elseif command == 'C1' then
		if Armor == 'Hybrid' then
			HybIndex = (HybIndex % #HybArray) + 1
			status_change(player.status)
			add_to_chat(206, 'Hybrid Mode: ' .. HybArray[HybIndex])
		else
			AccIndex = (AccIndex % #AccArray) + 1
			status_change(player.status)
			add_to_chat(206, 'Accuracy Level: ' .. AccArray[AccIndex])
		end
		status_change(player.status)

-- Auto Update Gear Toggle
	elseif command == 'C5' then
		status_change(player.status)
		add_to_chat(206, 'Auto Update Gear')

-- Sword Type Toggle
	elseif command == 'sword' then
		SwordIndex = (SwordIndex % #SwordArray) + 1
		status_change(player.status)
		add_to_chat(206, 'Sword Type: ' .. SwordArray[SwordIndex])

-- Shield Type Toggle
	elseif command == 'shield' then
		ShieldIndex = (ShieldIndex % #ShieldArray) + 1
		status_change(player.status)
		add_to_chat(206, 'Shield Type: ' .. ShieldArray[ShieldIndex])

-- Idle Toggle
	elseif command == 'idle' then
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(206, 'Idle Set: ' .. IdleArray[IdleIndex])

-- Hybrid Toggle
	elseif command == 'hybrid' then
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123, 'Hybrid Mode [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(206, 'Hybrid Mode [Locked] ~~> ' .. HybArray[HybIndex])
		end
		status_change(player.status)

-- PDT Toggle
	elseif command == 'pdt' then
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123, 'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(206, 'PDT Set: [Locked]')
		end
		status_change(player.status)

-- MDT Toggle
	elseif command == 'mdt' then
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123, 'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(206, 'MDT Set: [Locked]')
		end
		status_change(player.status)

-- DT Toggle
	elseif command == 'dt' then
		if Armor == 'DT' then
			Armor = 'None'
			add_to_chat(123, 'DT Set: [Unlocked]')
		else
			Armor = 'DT'
			add_to_chat(206, 'DT Set: [Locked]')
		end
		status_change(player.status)

-- BDT Toggle
	elseif command == 'bdt' then
		if Armor == 'BDT' then
			Armor = 'None'
			add_to_chat(123, 'BDT Set: [Unlocked]')
		else
			Armor = 'BDT'
			add_to_chat(206, 'BDT Set: [Locked]')
		end
		status_change(player.status)

-- Kiting Toggle
	elseif command == 'kite' then
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123, 'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(206, 'Kiting Set: [Locked]')
		end
		status_change(player.status)

-- Capa Back Toggle
	elseif command == 'capa' then
		if Capa == 'ON' then
			Capa = 'OFF'
			add_to_chat(123, 'Capacity Mantle: [Unlocked]')
		else
			Capa = 'ON'
			add_to_chat(206, 'Capacity Mantle: [Locked]')
		end
		status_change(player.status)

-- Weakness Set Toggle
	elseif command == 'weak' then
		if Armor == 'Weakness' then
			Armor = 'None'
			add_to_chat(123, 'Weakness Set: [Unlocked]')
		else
			Armor = 'Weakness'
			add_to_chat(206, 'Weakness Set: [Locked]')
		end
		status_change(player.status)

-- Repulse Mantle Toggle
	elseif command == 'repulse' then
		if Repulse == 'ON' then
			Repulse = 'OFF'
			add_to_chat(123, 'Repulse Mantle: [Unlocked]')
		else
			Repulse = 'ON'
			add_to_chat(206, 'Repulse Mantle: [Locked]')
		end
		status_change(player.status)

-- Twilight Toggle
	elseif command == 'C3' then
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123, 'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(206, 'Twilight Set: [locked]')
		end
		status_change(player.status)

-- Distance Toggle
	elseif command == 'C8' then
		if player.target.distance then
			target_distance = math.floor(player.target.distance * 10) / 10
			add_to_chat(206, 'Distance: ' .. target_distance)
		else
			add_to_chat(123, 'No Target Selected')
		end

-- TP Return Command
	elseif command == 'TP' then
		add_to_chat(206, 'TP Return: [' .. tostring(player.tp) .. ']')

-- Other
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])

-- Pld buffs
	elseif command == 'buffme' then
		send_command('input /ma "Crusade" <me>;wait 6.5;input /ma "Phalanx" <me>;wait 6.5;input /ma "Enlight II" <me>')

	elseif command == 'moarbuffs' then
		check_reprisal()

-- Warp Toggle
	elseif command == 'warp' then
		if Warp == 'ON' then
			Warp = 'OFF'
			add_to_chat(123,'Warp: [OFF]')
		else
			Warp = 'ON'
			add_to_chat(158,'Warp: [ON]')
		end
		status_change(player.status)
	end
	
-- Escha Bead pouch
	if command == 'Bead' then
   		cycle = 0
   		invCount = windower.ffxi.get_bag_info(0).count
   		if invCount == 80 then
   			add_to_chat(140,'Inv. full. Ending cycle')
   		elseif player.inventory["Bead Pouch"] then
   			send_command('input /item "Bead Pouch" <me> ')
   			cycle = 1
   		else
   			add_to_chat(140,'No Pouches found in inv.')
   			send_command('findall  Bead Pouch')
   		end
   		if cycle == 1 then
   			send_command('wait 3;gs c Bead')        
		end
	end
	
-- Escha Silt Pouch
	if command == 'Silt' then
   		cycle = 0
   		invCount = windower.ffxi.get_bag_info(0).count
   		if invCount == 80 then
   			add_to_chat(140,'Inv. full. Ending cycle')
   		elseif player.inventory["Silt Pouch"] then
   			send_command('input /item "Silt Pouch" <me> ')
   			cycle = 1
   		else
   			add_to_chat(140,'No Pouches found in inv.')
   			send_command('findall  Silt Pouch')
   		end
   		if cycle == 1 then
   			send_command('wait 3;gs c Silt')        
		end
	end
end

function check_reprisal()
	if not buffactive['Reprisal'] then
		if not windower.ffxi.get_ability_recasts()[97] then
			add_to_chat(206,"poop")
			send_command('input /ma "Reprisal" <me>')
			--send_command('input /echo reprisal recast:'..windower.ffxi.get_ability_recasts()[97]..'')
		else
			check_phalanx()
		end
	else
		check_phalanx()
	end
end

function check_phalanx()
	if not buffactive['Phalanx'] then
		if windower.ffxi.get_ability_recasts()[106] then
			send_command('wait .5;input /echo Phalanx recast:'..windower.ffxi.get_ability_recasts()[106]..'')
			check_enlight()
		else send_command('input /ma "Phalanx" <me>')
		end
	else
		check_enlight()
	end
end

function check_enlight()
	if not buffactive['Enlight'] then
		if windower.ffxi.get_ability_recasts()[310] then
			add_to_chat(206,"poop")
			send_command('wait 1;input /echo enlight II recast:'..windower.ffxi.get_ability_recasts()[310]..'')
			check_crusade()
		else send_command('input /ma "Enlight" <me>')
		end
	else
		check_crusade()
	end
end

function check_crusade()
	if not buffactive['Enmity Boost'] then
		if windower.ffxi.get_ability_recasts()[310] then
			send_command('wait 1.5;input /echo crusade recast:'..windower.ffxi.get_ability_recasts()[310]..'')
		else send_command('input /ma "Crusade" <me>')
		end
	else
		add_to_chat(206,"All buffs are active")
	end
end