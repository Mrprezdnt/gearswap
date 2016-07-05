	include('includes/'..main_job..'_keybinds.lua')

-- Clear-Binds
function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end
	send_command('unbind f12')
	send_command('unbind ^f12')
	send_command('unbind !f12')
    send_command('unbind f11')
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind !f10')
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !f9')
	send_command('unbind f1')
	send_command('unbind ^f1')
	send_command('unbind !f1')
	send_command('unbind !z')
	send_command('unbind !f')
	send_command('unbind !h')
	send_command('unbind !g')
end