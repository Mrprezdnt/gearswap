function whm_keybinds()
	send_command('bind f10 gs c pdt')					--PDT--
	send_command('bind f11 gs c mdt') 					--MDT--
	send_command('bind ^f9 gs c bdt') 					--BDT--
	send_command('bind f9 gs c hybrid') 				--Hybrid--
	send_command('bind f12 gs c C1') 					--ACC Level--
	send_command('bind ^f9 gs c C3') 					--Twilight--
	
	--send_command('bind %= gs c shield') 				--Ochain/Aegis/Priwen--
	--send_command('bind %m gs c sword') 					--Sword Toggle--
	send_command('bind %x input /lockstyleset 1')		--Lockstyle--
end

-- Whm DBcast spells
	--DBbuff = {"Refresh","Haste"}
	--DBenfeeble = {"Paralyze","Silence","Slow"}
	--DBrestore = {"Cure IV", "Curaga III","Cursna"}
	--DBnuke = {"Holy II"}

-- Run keybind function to initiate
	whm_keybinds()