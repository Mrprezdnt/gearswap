function geo_keybinds()
	send_command('bind f12 gs c C6') --Idle Level--
	send_command('bind f10 gs c pdt')
	send_command('bind \'\ input /targetnpc')
	send_command('bind %t input /assist Mrpresident')
end

-- geo DBcast spells
	--DBbuff = {"Refresh","Haste"}
	--DBenfeeble = {"Paralyze","Silence","Slow"}
	--DBrestore = {"Cure IV", "Curaga III","Cursna"}
	--DBnuke = {"Holy II"}

-- Run keybind function to initiate
	geo_keybinds()