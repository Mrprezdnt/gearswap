--todo: add in variable to turn dual box on/off as well as specifying job of dual box --
	enter_remapped=false
	subtarget = True
	current_spell=""
	dualBoxIndex = 1
	DBspellIndex = 1 -- default DBspell is 1
	
if player.name == "Mrpresident" then
	dualBox = "Deadmau"
else dualBox = "Mrpresident"
end

		--send_command('bind !a send '..dualBox..' /follow Mrpresident')
		--send_command('bind ` gs c DBcast_castMode')
		--send_command('bind %~1|numpad1 gs c DBcast1')
		--send_command('bind %~2|numpad2 gs c DBcast2')
		--send_command('bind %~3|numpad3 gs c DBcast3')
		--send_command('bind %~4|numpad4 gs c DBcast4')
		--send_command('bind %~5|numpad5 gs c DBcast5')
		--send_command('bind %~6|numpad6 gs c DBcast6')
		--send_command('bind %~7|numpad7 gs c DBcast7')
		--send_command('bind %~8|numpad8 gs c DBcast8')
		--send_command('bind %~9|numpad9 gs c DBcast9')
		--send_command('bind %~0|numpad0 gs c DBcast0')

function BST_spells ()
	DBspell_1 = "Bstpet 2"
	DBspell_2 = "Bstpet 1"
	DBspell_3 = "Distract"
	DBspell_4 = "Frazzle"
	DBspell_5 = "Refresh"
	DBspell_6 = "Haste"
	DBspell_7 = ""
	DBspell_8 = ""
	DBspell_9 = "Cursna"
	DBspell_0 = "Cure IV"
end

function GEO_spells ()
	DBspell_1 = "Thunder IV"
	DBspell_2 = "Blizzard III"
	DBspell_3 = "Distract"
	DBspell_4 = "Frazzle"
	DBspell_5 = "Refresh"
	DBspell_6 = "Haste"
	DBspell_7 = ""
	DBspell_8 = ""
	DBspell_9 = "Poisona"
	DBspell_0 = "Cure IV"
end

--if dualBox == "Deadmau" then
	--BST_spells()
	--send_command('bind ] input //send Deadmau Bstpet1')
	--send_command('bind [ input //send Deadmau Bstpet2')
--else
--	PLD_spells()
--	send_command('bind ] input //send Mrpresident Provoke')
--	send_command('bind [ input //send Mrpresident Flash')
--end
	
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


---------------------------------------------------------------------------------------------

function DBcast_bindEnter()
		--send_command('bind enter gs c DBcast_ex')
		send_command('bind 	enter setkey Enter;setkey Enter up;pause 0.5;gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
end

function DBcast_clearBinds()
		enter_remapped = False
		send_command('unbind enter')
		send_command('unbind escape')
		
		--send_command('unbind -')
		--send_command('unbind =')
		
		--send_command('unbind %]')
		--send_command('unbind %[')
		
		--send_command('unbind %!]')
		--send_command('unbind %![')
		
		--pld_keybinds()
		--send_command('bind !a send '..dualBox..' /follow Mrpresident')
		--send_command('bind f1 gs c DBcast_castMode')
end
		
-------------------------------------------------------------------------------		
-- Dualbox Command Handlers --
-------------------------------------------------------------------------------
function DB_command(command)
	if command == 'DBcast_clear' then
		add_to_chat(123,'Canceled Dual-Box command')
		DBcast_clearBinds()
		
	elseif command == 'DBcast_castMode' then
		add_to_chat(158, '---------- Dual-Box Casting Mode ----------')
		DBcast_bindEnter()

-- Receiver end; need to parse for "cast" for the receiver ex. //gs c DBcastenfeeble1 or DBcastbuff2
	elseif command == 'DBcast1' then
		send_command(''..DBspellArray[1]..'')

-- Sender end
--	elseif string.match(command, send) then -- command is parsed for keyword "send"
--		if string.match(command, restore) then -- command is parsed for keyword to determine target type
--			send_command('input /ta <stpt>')
--			current_spell = DBrestore[string.match(command, %d)] -- command is parsed for number to determine spell
--			enter_remapped = True
--			subtarget = True
--			DBcast_bindEnter()
--		elseif string.match(command, buff) then
--			current_spell = string.match(command, %d)
--			send_command('send Mrpresident gs c DBbuff['..current_spell..']')
--		elseif string.match(command, enfeeble) then
--			send_command('input /ta <stpt>')
--			current_spell = string.match(command, %d)
--			send_command('send Mrpresident gs c DBenfeeble['..current_spell..']')
--		end
		--send_command('input /ta <stnpc>')
		--current_spell = DBspellArray[1]
		--enter_remapped = True
		--DBcast_bindEnter()
	elseif command == 'bstready1' then
		send_command('send '..dualBox..' Sensilla Blades '..dualBox)
	elseif command == 'bstready2' then
		send_command('send '..dualBox..' Tegmina Buffet '..dualBox)
	elseif command == 'DBsend2' then
		send_command('input /ta <stnpc>')
		current_spell = "Provoke"
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend3' then
		send_command('input /ta <stnpc>')
		current_spell = "Flash"
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend4' then
		send_command('input /ta <stnpc>')
		current_spell = "Savage Blade"
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend5' then
		send_command('input /ta <stpt>')
		current_spell = DBspell_5
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend6' then
		send_command('input /ta <stpt>')
		current_spell = DBspell_6
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend7' then
		send_command('input /ta <stnpc>')
		add_to_chat(158,'Sensilla Blades -> <t>')
		current_spell = "Sensilla Blades"
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend8' then
		send_command('input /ta <stpt>')
		current_spell = "Tegmina Buffet"
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend9' then
		send_command('input /ta <stpt>')
		current_spell = "Silena"
		enter_remapped = True
		DBcast_bindEnter()
	elseif command == 'DBsend0' then
		send_command('input /ta <stpt>')
		current_spell = "Cure IV"
		enter_remapped = True
		DBcast_bindEnter()
		
	elseif command == 'DBcast_ex' then
		if player.last_subtarget.id then
			send_command('send '..dualBox..' '..current_spell..' '..player.last_subtarget.id)
			add_to_chat(158,"["..dualBox.."] "..current_spell.." -> "..player.last_subtarget.name)
			enter_remapped = False
			DBcast_clearBinds()
		else
			add_to_chat(123,"No valid target selected, exiting dual-box casting mode")
			enter_remapped = False
			DBcast_clearBinds()
		end
	end
end