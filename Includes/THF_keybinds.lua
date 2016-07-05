function thf_keybinds()
	send_command('bind f10 gs c C7') --PDT--
	send_command('bind ^f10 gs c C3') --Evasion--
	send_command('bind f11 gs c C15') --MDT--
	send_command('bind f12 gs c C1') --ACC Level--
	send_command('bind f9 gs c th') --Full TH--
	send_command('bind ^f9 gs c C17') --Sub-Dagger-Melee/TH--
	send_command('bind ^f12 gs c C6') --Idle Toggle--
	send_command('bind !f12 gs c C4')--Capa Mantle--
	
	send_command('bind ] gs c procStep')
	send_command('bind %x input //send Deadmau /follow Mrpresident')
--	send_command('bind [ gs c DBsend9')
--	send_command('bind ] gs c DBsend0')
end

-- Pld DBcast spells
--	DBspellArray = {"Provoke","Flash","Distract","Frazzle","Refresh","Haste","","","Cursna","Cure IV"}

-- Run keybind function to initiate
	thf_keybinds()