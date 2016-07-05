		--send_command('bind f1 gs c DBcastIndi')
		--send_command('bind f2 gs c DBcastGeo')
		
-- Indi- Cycling Binds
		--send_command('bind f11 gs c DBcastCycleIndiBack')
		--send_command('bind f12 gs c DBcastCycleIndi')
-- Geo- Cycling Binds
		--send_command('bind f9 gs c DBcastCycleGeoBack')
		--send_command('bind f10 gs c DBcastCycleGeo')

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
			elseif DBspell_indiArray[DBspell_indiIndex] == "Torpor" then
				add_to_chat(206,'Indi-Torpor ='..(' Physical-Evasion Down'):color(8))
			elseif DBspell_indiArray[DBspell_indiIndex] == "Precision" then
				add_to_chat(206,'Indi-Precision ='..(' Physical-Accuracy Up'):color(8))
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