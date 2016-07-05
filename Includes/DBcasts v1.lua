	--=====================================--
	--========= Macros & Bindings =========--
	--=====================================--

--todo: add in variable to turn dual box on/off as well as specifying job of dual box --
	enter_remapped=false
	current_spell=""
	dualBox = "Deadmau"
	DBspell_1 = ""
	DBspell_2 = ""
	DBspell_3 = "Cure IV"
	DBspell_4 = ""
	DBspell_5 = "Refresh"
	DBspell_6 = "Haste"
	DBspell_7 = ""
	DBspell_8 = ""
	DBspell_9 = ""
	DBspell_0 = ""

send_command('bind numpad1 gs c DBcast1')
send_command('bind numpad2 gs c DBcast2')
send_command('bind numpad3 gs c DBcast3')
send_command('bind numpad4 gs c DBcast4')
send_command('bind numpad5 gs c DBcast5')
send_command('bind numpad6 gs c DBcast6')
send_command('bind numpad7 gs c DBcast7')
send_command('bind numpad8 gs c DBcast8')
send_command('bind numpad9 gs c DBcast9')
send_command('bind numpad0 gs c DBcast0')
		
-------------------------------------------------------------------------------		
-- Dualbox Command Handlers --
-------------------------------------------------------------------------------
function DB_command(command)
	if command == 'DBcast_clear' then
		enter_remapped = False
		send_command('unbind enter')
		send_command('unbind escape')
		add_to_chat(123,'Canceled Dual-Box command')
	elseif command == 'DBcast1' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_1
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast2' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_2
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast3' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_3
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast4' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_4
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast5' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_5
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast6' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_6
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast7' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_7
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast8' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_8
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast9' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_9
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast0' then
		send_command('input /ta <stpc>')
		current_spell = DBspell_0
		enter_remapped = True
		send_command('bind enter gs c DBcast_ex')
		send_command('bind escape gs c DBcast_clear')
	elseif command == 'DBcast_ex' then
		send_command('send '..dualBox..' '..current_spell..' '..player.subtarget.id)
		enter_remapped = False
		send_command('unbind enter')
		send_command('unbind escape')
	end
end