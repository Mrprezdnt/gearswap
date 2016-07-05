Geo1 = "Refresh"
Indi1 = "Torpor"
Spell1 = "Dia"
Spell2 = "Bio"

Geo2 = "Regen"
Indi2 = "Precision"
Spell3 = "Stone"
Spell4 = "Stone"
Spell5 = "Stone"
Spell6 = "Stone"
Spell7 = "Stone"
Spell8 = "Stone"
Spell9 = "Cure"
Spell10 = "Cure2"
Spell11 = "Barfire"
Spell12 = "Shell"
Spell13 = "Refresh"
HateSpell = "Flash"

function self_command(command)

--Leads with 2 Geo-spells, alternates between spell1 & spell2 for 3 minutes then loops
	if command == 'Loop1' then
		send_command('input /ma Indi-'..Indi1..' <me>;wait 10;input /ja Full Circle <me>;wait 5;input /Geo-'..Geo1..' <me>;wait 10;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input /ma '..Spell1..' <t>;wait 5;input /ma '..Spell2..' <t>;wait 5;input //gs c Loop1')

--Leads with Hate-spell to keep mob in place every 30-sec, then Indi2 & Geo2, then Spell3 - Spell6 for 3 minutes, then loops
	elseif command == 'HateLoop' then
		send_command('input /ma '..HateSpell..' <t>;wait 5;input /ma Indi-'..Indi2..' <me>;wait 10;input /ja Full Circle <me>;wait 5;input /Geo-'..Geo2..' <me>;wait 10;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..HateSpell..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..Spell5..' <t>;wait 5;input /ma '..Spell6..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..HateSpell..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..Spell5..' <t>;wait 5;input /ma '..Spell6..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..HateSpell..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..Spell5..' <t>;wait 5;input /ma '..Spell6..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..HateSpell..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..Spell5..' <t>;wait 5;input /ma '..Spell6..' <t>;wait 5;input /ma '..Spell3..' <t>;wait 5;input /ma '..Spell4..' <t>;wait 5;input /ma '..HateSpell..' <t>;wait 5;input //gs c HateLoop')
	elseif command == 'CureLoop' then
		send_command('input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 5;input /ma '..Spell10..' <me>;wait 5;input /ma '..Spell12..' <me>;wait 5;input //gs c CureLoop')
	elseif command == 'HealLoop' then
		send_command('input /heal;wait 300;input /heal;wait1800;input //gs c HealLoop')
	elseif command == 'CureLoop2' then
		send_command('input /ma '..Spell13..' <me>;wait 10;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /ma '..Spell9..' <me>;wait 5;input /ma '..Spell11..' <me>;wait 4;input /echo new cycle;wait 1;input //gs c CureLoop2')
	end
end