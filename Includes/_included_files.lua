	main_job = tostring(player.main_job)
	
	include('gearsets/'..player.name..'/_augment_equip.lua')
	include('gearsets/'..player.name..'/'..main_job..'_gearsets.lua')
	include('includes/keybinds') -- includes all common keybinds, also pulls in job-specific binds & DBcasts
	include('organizer-lib')
	include('includes/DBcast')
