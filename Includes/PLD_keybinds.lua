function pld_keybinds()
	send_command('bind f10 gs c pdt')					--PDT--
	send_command('bind f11 gs c mdt') 					--MDT--
	send_command('bind ^f9 gs c bdt') 					--BDT--
	send_command('bind f9 gs c hybrid') 				--Hybrid--
	send_command('bind f12 gs c C1') 					--ACC Level--
	send_command('bind ^f9 gs c C3') 					--Twilight--
	
	--send_command('bind %= gs c shield') 				--Ochain/Aegis/Priwen--
	--send_command('bind %m gs c sword') 					--Sword Toggle--
	send_command('bind %x input //send Deadmau /follow Mrpresident')
	send_command('bind [ gs c DBsend9')
--	send_command('bind ] gs c DBsend0')
	send_command('bind \ input //send Deadmau Cure IV Mrpresident')
end

-- Pld DBcast spells
--	DBspellArray = {"Provoke","Flash","Distract","Frazzle","Refresh","Haste","","","Cursna","Cure IV"}

-- Run keybind function to initiate
	pld_keybinds()