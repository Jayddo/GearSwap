state.OffenseMode:options('Normal')
state.CastingMode:options('Normal','Resistant','DT')
state.IdleMode:options('Normal','DT')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.ResistDefenseMode:options('MEVA')
state.Weapons:options('None','Yagrush','Tishtrya','Maxentius','DualYag','DualTish','DualMaxen')

autows="Judgment"
autowstp=1250
--state.MiniQueue	= M(false, 'MiniQueue')

gear.jse_macc_fc_back  ={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
gear.jse_cure_back  ={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Phys. dmg. taken-10%',}}
	
gear.obi_cure_waist = "Porous Rope"
gear.obi_cure_back = gear.jse_cure_back

gear.obi_nuke_waist = "Porous Rope"
gear.obi_high_nuke_waist = "Porous Rope"
gear.obi_nuke_back = gear.jse_cure_back

-- Additional local binds
send_command('bind ^` input /ma "Arise" <t>')
send_command('bind @` gs c buffup Rebuff')
send_command('bind @f7 gs c set toggle CastingMode DT; gs c set toggle IdleMode DT')
send_command('bind ^@!` gs c toggle AutoCaress')
send_command('bind ^backspace input /ja "Sacrosanctity" <me>')

send_command('bind @backspace input /ma "Aurora Storm" <me>')
send_command('bind !backspace input /ja "Accession" <me>')
send_command('bind != input /ja "Sublimation" <me>')

send_command('bind ^\\\\ input /ma "Protectra V" <me>')
send_command('bind @\\\\ input /ma "Shellra V" <me>')
send_command('bind !\\\\ input /ma "Reraise IV" <me>')

