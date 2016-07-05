-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	include('includes/_included_files.lua')
	
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	JugIndex = 1
	JugArray = {"Meaty Broth","Windy Greens","Muddy Broth","Blackwater Broth","Tant. Broth","Bubbly Broth","Livid Broth","Trans. Broth"} -- Default Jug Is Meaty Broth. Add/Delete Jugs Here --
	PetFoodIndex = 1
	PetFoodArray = {"Pet Food Theta","Pet Food Eta","Pet Food Zeta"} -- Default Pet Food Is Theta --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	PetIndex = 1
	PetArray = {"Haste","PDT","ACC"} -- Default Pet TP Set Is Haste --
	WeaponIndex = 1
	WeaponArray = {"Melee","PDT","Sic"} -- Default Weapon Type Is Melee. Don't Input Main/Sub In TP Sets. Melee = Damage Type Axes | PDT = Pet PDT/DT Type Axes | Sic = Sic/Ready Type Axes --
	Armor = 'None'
	Twilight = 'None'
	Pet = 'ON' -- Set Default Pet Set ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	-- Gavialis Helm --
	elements = {}
	elements.equip = {head="Gavialis Helm"}
	elements.Ruinator = S{"Ice","Water","Wind"}
	elements.Rampage = S{"Earth"}
	
	ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
        'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
        'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
        'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
        'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
        'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
        'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
        'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','1000 Needles',
        'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
        'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
        'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
        'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
        'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
        'Zealous Snort'}

	-- Ready Moves: Magic Type --
	Magical_Ready_Moves = S{
			'Acid Mist','Aqua Breath','Blaster','Bubble Shower','Chaotic Eye','Charged Whisker','Corrosive Ooze',
			'Cursed Sphere','Dark Spore','Drainkiss','Dream Flower','Dust Cloud','Filamented Hold','Fireball',
			'Foul Waters','Geist Wall','Gloeosuccus','Hi-Freq Field','Infrasonics','Intimidate','Jettatura',
			'Molting Plumage','Nectarous Deluge','Nepenthic Plunge','Noisome Powder','Numbing Noise','Numbshroom',
			'Palsy Pollen','Pestilent Plume','Plague Breath','Purulent Ooze','Queasyshroom','Roar','Sandblast','Sandpit',
			'Scream','Shakeshroom','Sheep Song','Silence Gas','Snow Cloud','Soporific','Spider Web','Spoil','Spore',
			'Stink Bomb','Toxic Spit','TP Drainkiss','Venom','Venom Spray'}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1="Ruinator", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
end

---------------------------------------------------------------------------------------------
-- Pretarget
---------------------------------------------------------------------------------------------
function pretarget(spell,action)
	if midaction() or pet_midaction() then
		cancel_spell()
		return
	elseif spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then
		if spell.english ~= 'Bora Axe' and spell.name ~= 'Mistral Axe' and spell.target.distance > target_distance then -- Cancel WS If You Are Out Of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
			return
		end
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	end
end

---------------------------------------------------------------------------------------------
-- Precast
---------------------------------------------------------------------------------------------
function precast(spell,action)
	if midaction() or pet_midaction() then
		cancel_spell()
		return
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
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if elements[spell.name] and elements[spell.name]:contains(world.day_element) then
				equipSet = set_combine(equipSet,elements.equip)
			end
			if buffactive['Killer Instinct'] then
				equipSet = set_combine(equipSet,{body="Nukumi Gausape +1"})
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if spell.english == "Ruinator" or spell.english == "Rampage" then
				if world.time <= (7*60) or world.time >= (17*60) then -- Equip Lugra Earring +1 From Dusk To Dawn --
					equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"})
				end
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
	elseif spell.type == "PetCommand" then
		equip(sets.Pet[spell.english])
	elseif ready_moves_to_check:contains(spell.english) and pet.status == 'Engaged' then
		equip(sets.Pet.Ready)
	end
	if Pet == 'ON' then -- Use Pet Toggle For Pet TP Set --
		equip(sets.TP.Pet[PetArray[PetIndex]])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

---------------------------------------------------------------------------------------------
-- Midcast
---------------------------------------------------------------------------------------------
function midcast(spell,action)
	if pet_midaction() then
		return
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			equip(sets.Midcast.Cure)
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then -- Cancel Sneak --
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Flash' or spell.english == 'Drain' or spell.english == 'Aspir' or spell.english == 'Dispel' or spell.english:startswith('Dia') or spell.english:startswith('Bio') or spell.english:startswith('Sleep') then
			equip(set_combine(sets.Midcast.Haste,{waist="Chaac Belt"}))
		else
			equip(sets.Midcast.Haste)
		end
	end
end

---------------------------------------------------------------------------------------------
-- Aftercast
---------------------------------------------------------------------------------------------
function aftercast(spell,action)
	if pet_midaction() then
		return
	elseif spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	elseif not spell.type == "PetCommand" then
		status_change(player.status)
	end
end

---------------------------------------------------------------------------------------------
-- Status Change
---------------------------------------------------------------------------------------------
function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'Kiting' then
		equip(sets.Kiting)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if (buffactive.Embrava and (buffactive.March or buffactive.Haste)) or (buffactive.March == 2 and buffactive.Haste) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava)) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
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
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	end
	if Pet == 'ON' then -- Use Pet Toggle For Pet TP Set --
		equip(sets.TP.Pet[PetArray[PetIndex]])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
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
	if not midaction() and not pet_midaction() then
		status_change(player.status)
	end
end

---------------------------------------------------------------------------------------------
-- Pet Midcast
---------------------------------------------------------------------------------------------

function pet_midcast(spell,action)
	if spell.target.type == 'MONSTER' then
		if Magical_Ready_Moves:contains(spell.english) then
			equip(sets.Magical_Ready_Moves)
		else
			equip(sets.Physical_Ready_Moves)
		end
	end
end

function pet_aftercast(spell,action)
	status_change(player.status)
end

function pet_change(pet,gain)
	status_change(player.status)
end

---------------------------------------------------------------------------------------------
-- Self-Commands -- //gs c (command), Macro: /console gs c (command), Bind: gs c (command)
---------------------------------------------------------------------------------------------
function self_command(command)
	if command:match('^DB') then
		DB_command(command)
	elseif command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C17' then -- Weapon Type Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Weapon Type: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C16' then -- Pet TP Set Toggle --
		PetIndex = (PetIndex % #PetArray) + 1
		add_to_chat(158,'Pet TP Set: ' .. PetArray[PetIndex])
		status_change(player.status)
	elseif command == 'C10' then -- Jug Toggle --
		JugIndex = (JugIndex % #JugArray) + 1
		add_to_chat(158,'Jug: ' .. JugArray[JugIndex])
		sets.JA['Call Beast'].ammo = JugArray[JugIndex]
		status_change(player.status)
	elseif command == 'C11' then -- Pet Food Toggle --
		PetFoodIndex = (PetFoodIndex % #PetFoodArray) + 1
		add_to_chat(158,'Pet Food: ' .. PetFoodArray[PetFoodIndex])
		sets.JA.Reward.ammo = PetFoodArray[PetFoodIndex]
		status_change(player.status)
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
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Pet Toggle --
		if Pet == 'ON' then
			Pet = 'OFF'
			add_to_chat(123,'Pet Set: [Unlocked]')
		else
			Pet = 'ON'
			add_to_chat(158,'Pet Set: [Locked]')
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
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
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
	else
		enable('ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] or buffactive["Addendum: White"] then
		return originalCost*.9
	elseif buffactive["Dark Arts"] or buffactive["Addendum: Black"] then
		return originalCost*1.1
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

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
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
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
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
		set_macro_page(1, 5)
	elseif player.sub_job == 'WHM' then
		set_macro_page(2, 5)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 5)
	else
		set_macro_page(1, 5)
	end
end