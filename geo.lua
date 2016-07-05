-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --

--todo: set up variables for Geo & Indi spells, so that they can be defaulted to with macros--

function get_sets()
	include('includes/_included_files.lua')
	
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh","Luopan"} -- Default Idle Set Is Movement --
	Armor = 'None'
	StunIndex = 0
	Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
	Obi = 'ON' -- Set Default Obi ON or OFF Here --
	Elemental_Staff = 'ON' -- Set Default Precast Elemental Staff ON or OFF Here --
	LowNuke = 'ON' -- Set Default Low Tier Nuke ON or OFF Here --
	MB = 'OFF' -- Set Default MB ON or OFF Here --
	Warp = 'OFF' -- Sets Warp Ring auto equip for Idle ON or OFF
	target_distance = 5 -- Set Default Distance Here --
	define_geomancy_values()
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "GeoTorpor", SC2 = "GeoLanguor", SC3 = "IndiFocus"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Add or Remove Low Tier Spells Here --
	Low_Tier_Spells = S{
			'Fire','Aero','Water','Blizzard','Stone','Thunder','Fire II','Aero II','Water II',
			'Blizzard II','Stone II','Thunder II'}

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}

	Cities = S{
			"Ru'lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
			"Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
			"Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
			"Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
			"Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
			"Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham"}
	
	capacityback="Mecistopins Mantle"
end

---------------------------------------------------------------------------------------------
-- Pretarget
---------------------------------------------------------------------------------------------

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif spell.english:startswith('Geo') and pet.isvalid then -- Change Any Geo Spells To Full Circle If You Have A Luopan Active --
		cancel_spell()
		send_command('input /ja "Full Circle" <me>')
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

---------------------------------------------------------------------------------------------
-- Precast
---------------------------------------------------------------------------------------------

function precast(spell,action)
	if spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.type == "Geomancy" then
				if Cities:contains(world.area) then
					cancel_spell()
					add_to_chat(123,'Unable To Use Geomancy In Town')
					return
				else
					display_geomancy_info(spell)
					equip(sets.Precast.GeoCast)
				end
			elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
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
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and Elemental_Staff == 'ON' then
		equip(sets.Precast[spell.element])
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

---------------------------------------------------------------------------------------------
-- Midcast
---------------------------------------------------------------------------------------------

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if spell.type == "Geomancy" then
			if spell.english:startswith('Indi') then
				equipSet = equipSet.Indicolure
			else
				equipSet = equipSet.Geocolure
			end
		elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			if spell.english:startswith('Cure') then
				equipSet = equipSet.Cure
			elseif spell.english:startswith('Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Banish') then
			equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Aspir') then
			equipSet = equipSet.Aspir
		elseif spell.english == "Drain" then
			equipSet = equipSet.Drain
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif Low_Tier_Spells:contains(spell.english) and LowNuke == 'ON' then
			equipSet = set_combine(equipSet,sets.LowNuke)
		elseif spell.skill == 'Elemental Magic' and MB == 'ON' then
			equipSet = set_combine(equipSet,sets.MB)
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if (spell.skill == 'Elemental Magic' or spell.english:startswith('Cur') or spell.english:startswith('Bio') or spell.english:startswith('Dia') or spell.english == 'Aspir' or spell.english == 'Drain') and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' and spell.english ~= "Cursna" then -- Use Obi Toggle To Equip Normal Waist Gear --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

---------------------------------------------------------------------------------------------
-- Aftercast
---------------------------------------------------------------------------------------------

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		elseif spell.english:ifind("Indi") then
			send_command('input //timers c '..spell.english..' 225 down ../../plugins/settings/icons/Indi_Haste.png')
			--send_command('send Mrpresident ')
			--send_command('send '..dualBox..' //echo test')
			--send_command('wait 180;input /echo '..spell.english..' wearing off soon')
		end
	end
	status_change(player.status)
end

---------------------------------------------------------------------------------------------
-- Status Change
---------------------------------------------------------------------------------------------

function status_change(new,old)
	--check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
			equipSet = set_combine(equipSet,sets.Reive)
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		if Warp == "ON" then
			equipSet = set_combine(equipSet,{ring1="Warp Ring"})
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

---------------------------------------------------------------------------------------------
-- Buff Change
---------------------------------------------------------------------------------------------

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
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


function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end

	send_command('unbind f12')
    send_command('unbind f11')
    send_command('unbind f10')
	send_command('unbind f9')
end
---------------------------------------------------------------------------------------------
-- Self Commands -- //gs c (command), Macro: /console gs c (command), Bind: gs c (command)
---------------------------------------------------------------------------------------------

function self_command(command)
	if command == 'macc' then -- Magic Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Magic Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)

-- Stun Toggle
	elseif command == 'stun' then
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
		end
		status_change(player.status)
		
-- Auto-update Gear Toggle
	elseif command == 'C5' then
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')

-- Obi Toggle
	elseif command == 'obi' then
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
		end
		status_change(player.status)

-- PDT Toggle
	elseif command == 'pdt' then
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	
-- Idris Toggle
	elseif command == 'C10' then
		if Idris == 'ON' then
			Idris = 'OFF'
			add_to_chat(123,'Idris: [OFF]')
		else
			Idris = 'ON'
			add_to_chat(158,'Idris: [ON]')
		end
		status_change(player.status)

-- LowNuke Toggle
	elseif command == 'C15' then
		if LowNuke == 'ON' then
			LowNuke = 'OFF'
			add_to_chat(123,'Low Nuke: [OFF]')
		else
			LowNuke = 'ON'
			add_to_chat(158,'Low Nuke: [ON]')
		end
		status_change(player.status)
	
-- MB Toggle	
	elseif command == 'C9' then
		if MB == 'ON' then
			MB = 'OFF'
			add_to_chat(123,'MB: [OFF]')
		else
			MB = 'ON'
			add_to_chat(158,'MB: [ON]')
		end
		status_change(player.status)

-- Lock Main Weapon Toggle
	elseif command == 'lockmain' then
		if Lock_Main == 'ON' then
			Lock_Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Lock_Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	
-- Idle Toggle
	elseif command == 'idle' then
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
		
-- Other
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	
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

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	elseif Lock_Main == 'ON' then
		disable('main','sub')
	else
		enable('main','sub','ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function define_geomancy_values()
	geomancy = {
		Frailty = {bonus="Defense Down"},
		Torpor = {bonus="Evasion Down"},
		Languor = {bonus="Magic Evasion Down"},
		Focus = {bonus="Magic Accuracy"},
		Malaise = {bonus="Magic Defense Down"},
		Precision = {bonus="Accuracy"},
		Refresh = {bonus="Refresh"},
		Fade = {bonus="Magic Attack Down"},
		Wilt = {bonus="Attack Down"},
		Vex = {bonus="Magic Accuracy Down"},
		Slip = {bonus="Accuracy Down"},
		Acumen = {bonus="Magic Attack"},
		Fend = {bonus="Magic Defense"},
		Fury = {bonus="Attack"},
		Attunement = {bonus="Magic Evasion"},
		Voidance = {bonus="Evasion"},
		Barrier = {bonus="Defense"},
		Haste = {bonus="Haste"}
		}
end

function display_geomancy_info(spell)
	geoType=nil 
	string.gsub(spell.english.."-","-(.-)-",function(geo) geoType=geo end)
	geoInfo = geomancy[geoType]
	if geoInfo then
		add_to_chat(158, spell.english..' = '..tostring(geoInfo.bonus))
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

function check_macro_set()
	if MacroIndex == 1 then
		set_macro_page(1, 6)
	elseif MacroIndex == 2 then
		set_macro_page(2, 6)
	elseif MacroIndex == 3 then
		set_macro_page(3, 6)
	else
		set_macro_page(1, 6)
	end
end
		

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'RDM' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'BLM' then
		set_macro_page(3, 6)
	elseif player.sub_job == 'WHM' then
		set_macro_page(2, 6)
	else
		set_macro_page(1, 6)
	end
end