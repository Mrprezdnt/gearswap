	--=====================================--
	--========= Macros & Bindings =========--
	--=====================================--

--todo: add in variable to turn dual box on/off as well as specifying job of dual box --
	enter_remapped=false
	current_spell=""
	dualBox = "Deadmau"
	
	DBspell_1 = "Dia II"		-- Shift + 1
	DBspell_2 = "Distract"		-- Shift + 2
	DBspell_3 = "Frazzle"			-- Shift + 3
	DBspell_4 = ""			-- Shift + 4
	DBspell_5 = "Refresh"	-- Shift + 5
	DBspell_6 = "Haste"		-- Shift + 6
	DBspell_7 = ""			-- Shift + 7
	DBspell_8 = ""			-- Shift + 8
	DBspell_9 = ""			-- Shift + 9
	DBspell_0 = "Cure IV"	-- Shift + 0
	
	--DBspellIndex = 1
	--DBspellArray = {"Dia II","Distract","Frazzle","","Refresh","Haste","","","","Cure IV"}

	--DBspell_11 = ""          -- Ctrl+Shift+1
	--DBspell_12 = ""          -- Ctrl+Shift+2
	--DBspell_13 = ""          -- Ctrl+Shift+3
	--DBspell_14 = ""          -- Ctrl+Shift+4
	--DBspell_15 = "Silence"   -- Ctrl+Shift+5
	--DBspell_16 = "Blind"     -- Ctrl+Shift+6
	--DBspell_17 = "Slow"      -- Ctrl+Shift+7
	--DBspell_18 = "Paralyze"  -- Ctrl+Shift+8
	--DBspell_19 = "Frazzle"   -- Ctrl+Shift+9
	--DBspell_10 = "Distract"  -- Ctrl+Shift+0

	DBspell_indiIndex = 1
	DBspell_indiArray = {"Torpor","Haste", "Fury", "Fade","Regen", "Refresh", "Wilt", "Focus"}
	DBspell_geoIndex = 1
	DBspell_geoArray = {"Frailty", "Torpor", "Haste", "Regen", "Refresh"}
--	DBspell_entrust = ""   -- Ctrl+Shift+0

function DBcast_bindEnter()
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
end

function DBcast_clearBinds()
		enter_remapped = False
		send_command('unbind enter')
		send_command('unbind escape')
		send_command('unbind 1')
		send_command('unbind 2')
		send_command('unbind 3')
		send_command('unbind 4')
		send_command('unbind 5')
		send_command('unbind 6')
		send_command('unbind 7')
		send_command('unbind 8')
		send_command('unbind 9')
		send_command('unbind 0')
		send_command('unbind f1')
		send_command('unbind f2')
		send_command('unbind f3')
		send_command('unbind f4')
		send_command('unbind f5')
		send_command('unbind f6')
		send_command('unbind f7')
		send_command('unbind f8')
		send_command('unbind f9')
		send_command('unbind f10')
		send_command('unbind f12')
		
		send_command('unbind -')
		send_command('unbind =')
		
		send_command('unbind %]')
		send_command('unbind %[')
		
		send_command('unbind %!]')
		send_command('unbind %![')
		
		pld_keybinds()
		send_command('bind !a send '..dualBox..' /follow Mrpresident')
		send_command('bind f1 gs c DBcast_castMode')
end

---------------------------------------------------------------------------------------------
		-- Key Bindings --
---------------------------------------------------------------------------------------------
send_command('bind !a send '..dualBox..' /follow Mrpresident')
send_command('bind f1 gs c DBcast_castMode')
		
-------------------------------------------------------------------------------		
-- Dualbox Command Handlers --
-------------------------------------------------------------------------------
function DB_command(command)
	if command == 'DBcast_clear' then
		add_to_chat(123,'Canceled Dual-Box command')
		DBcast_clearBinds()
		
	elseif command == 'DBcast_castMode' then
		add_to_chat(123, '---=== Dual-Box Casting Mode ===---')
		send_command('bind 1 gs c DBcast1;input /echo DBcast1')
		send_command('bind 2 gs c DBcast2')
		send_command('bind 3 gs c DBcast3')
		send_command('bind 4 gs c DBcast4')
		send_command('bind 5 gs c DBcast5')
		send_command('bind 6 gs c DBcast6')
		send_command('bind 7 gs c DBcast7')
		send_command('bind 8 gs c DBcast8')
		send_command('bind 9 gs c DBcast9')
		send_command('bind 0 gs c DBcast0')
		
		send_command('bind f11 gs c DBcastCycleIndiBack')
		send_command('bind f12 gs c DBcastCycleIndi')

		send_command('bind f9 gs c DBcastCycleGeoBack')
		send_command('bind f10 gs c DBcastCycleGeo')
		
		send_command('bind f2 gs c DBcastIndi')
		send_command('bind f3 gs c DBcastGeo')
		
		DBcast_bindEnter()
	
	elseif command == 'DBcast1' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_1
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast2' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_2
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast3' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_3
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast4' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_4
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast5' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_5
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast6' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_6
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast7' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_7
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast8' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_8
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast9' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_9
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast0' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_0
		enter_remapped = True
		DBcast_bindEnter()
	
	elseif command == 'DBcast11' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_11
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast12' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_12
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast13' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_13
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast14' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_14
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast15' then
		send_command('input /ta <stnpc>')
		current_spell = DBspell_15
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast16' then
		send_command('input /ta <stnpc>')
		current_spell = DBspell_16
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast17' then
		send_command('input /ta <stnpc>')
		current_spell = DBspell_17
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast18' then
		send_command('input /ta <stnpc>')
		current_spell = DBspell_18
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast19' then
		send_command('input /ta <stnpc>')
		current_spell = DBspell_19
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBcast10' then
		send_command('input /ta <stnpc>')
		current_spell = DBspell_10
		enter_remapped = True
		DBcast_bindEnter()
		
---------------------------------------------------------------------------------------------
		-- Geo/Indi Casting Spell Commands --
---------------------------------------------------------------------------------------------	
	elseif command == 'DBcastIndi' then
		current_spell = DBspell_indiArray[DBspell_indiIndex]
		send_command('send '..dualBox..' Indi-'..current_spell..' '..dualBox)
		send_command('timers create "Indi-'..current_spell..'" 180 down 00084.png;wait 150;input /echo Indi-'..current_spell..': [WEARING OFF IN 30 SEC.];wait 30;input /echo Indi-'..current_spell..' [WEARING OFF IN 10 SEC.]')
		enter_remapped = False
		send_command('unbind enter')
		send_command('unbind escape')
	elseif command == 'DBcastGeo' then
		send_command('input /ta <stnpc>')
		current_spell = "Geo-"..DBspell_geoArray[DBspell_geoIndex]
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcastEntrust' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_entrust
		enter_remapped = True
		DBcast_bindEnter()
		
---------------------------------------------------------------------------------------------
		-- Cycle Geo/Indi Spell Commands --
---------------------------------------------------------------------------------------------		
	elseif command == 'DBcastCycleIndi' then
		DBspell_indiIndex = (DBspell_indiIndex % #DBspell_indiArray) + 1
		status_change(player.status)
			if DBspell_indiArray[DBspell_indiIndex] == "Haste" then
				add_to_chat(206,'Indi-Haste ='..(' Haste'):color(167))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Regen" then
				add_to_chat(206,'Indi-Regen ='..(' Regen'):color(158))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Refresh" then
				add_to_chat(206,'Indi-Refresh ='..(' Refresh'):color(215))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Fury" then
				add_to_chat(206,'Indi-Fury ='..(' Physical-Attack Up'):color(3))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Fade" then
				add_to_chat(206,'Indi-Fade ='..(' Magic-Attack Down'):color(8))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Wilt" then
				add_to_chat(206,'Indi-Wilt ='..(' Physical-Attack Down'):color(8))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Focus" then
				add_to_chat(206,'Indi-Focus ='..(' Magic-Attack Up'):color(8))
			end
	elseif command == 'DBcastCycleIndiBack' then
		DBspell_indiIndex = (DBspell_indiIndex % #DBspell_indiArray) - 1
		status_change(player.status)
			if DBspell_indiArray[DBspell_indiIndex] == "Haste" then
				add_to_chat(206,'Indi-Haste ='..(' Haste'):color(167))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Regen" then
				add_to_chat(206,'Indi-Regen ='..(' Regen'):color(158))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Refresh" then
				add_to_chat(206,'Indi-Refresh ='..(' Refresh'):color(215))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Fury" then
				add_to_chat(206,'Indi-Fury ='..(' Physical-Attack Up'):color(3))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Fade" then
				add_to_chat(206,'Indi-Fade ='..(' Magic-Attack Down'):color(8))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Focus" then
				add_to_chat(206,'Indi-Focus ='..(' Magic-Attack Up'):color(8))
			end
	elseif command == 'DBcastCycleGeo' then
		DBspell_geoIndex = (DBspell_geoIndex % #DBspell_geoArray) + 1
		status_change(player.status)
			if DBspell_geoArray[DBspell_geoIndex] == "Frailty" then
				add_to_chat(122,'Geo-Frailty ='..(' Physical-Defense Down'):color(3))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Torpor" then
				add_to_chat(122,'Geo-Torpor ='..(' Physical-Evasion Down'):color(205))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Languor" then
				add_to_chat(122,'Geo-Languor ='..(' Magic-Defense Down'):color(8))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Voidance" then
				add_to_chat(122,'Geo-Voidance ='..(' Physical-Evasion Up'):color(205))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Haste" then
				add_to_chat(122,'Geo-Haste ='..(' Haste'):color(167))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Regen" then
				add_to_chat(122,'Geo-Regen ='..(' Regen'):color(158))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Refresh" then
				add_to_chat(206,'Geo-Refresh ='..(' Refresh'):color(215))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Fury" then
				add_to_chat(122,'Geo-Fury ='..(' Physical-Attack Up'):color(3))
			end
	elseif command == 'DBcastCycleGeoBack' then
		DBspell_geoIndex = (DBspell_geoIndex % #DBspell_geoArray) - 1
		status_change(player.status)
			if DBspell_geoArray[DBspell_geoIndex] == "Frailty" then
				add_to_chat(122,'Geo-Frailty ='..(' Physical-Defense Down'):color(3))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Torpor" then
				add_to_chat(122,'Geo-Torpor ='..(' Physical-Evasion Down'):color(205))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Languor" then
				add_to_chat(122,'Geo-Languor ='..(' Magic-Defense Down'):color(8))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Voidance" then
				add_to_chat(122,'Geo-Voidance ='..(' Physical-Evasion Up'):color(205))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Haste" then
				add_to_chat(122,'Geo-Haste ='..(' Haste'):color(167))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Regen" then
				add_to_chat(122,'Geo-Regen ='..(' Regen'):color(158))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Refresh" then
				add_to_chat(206,'Geo-Refresh ='..(' Refresh'):color(215))
			elseif DBspell_geoArray[DBspell_geoIndex] == "Fury" then
				add_to_chat(122,'Geo-Fury ='..(' Physical-Attack Up'):color(3))
			
			end
	elseif command == 'DBcast_ex' then
		send_command('send '..dualBox..' '..current_spell..' '..player.subtarget.id)
		enter_remapped = False
		DBcast_clearBinds()
	end
end