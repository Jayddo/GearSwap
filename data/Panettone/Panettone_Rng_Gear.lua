function user_setup()

	include('Common/RNG_UserSetup_Common.lua')

	state.OffenseMode:options('Normal')
state.HybridMode:options('DT','Normal')
state.RangedMode:options('Normal')
state.WeaponskillMode:options('Normal')
state.IdleMode:options('Normal')
if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
	state.Weapons:options('DualArma','DualFoma','DualSavage','None')
else
	state.Weapons:options('Armageddon','Fomalhaut','Naegling','None')
end
--state.Weapons:options('DualGastra','DualFoma','DualAnni','DualYoichi','DualFailNot','DualSavage','Gastraphetes','Fomalhaut','Annihilator','Yoichinoyumi','FailNot','Naegling','None')
--state.Weapons:options('Fomalhaut','Annihilator','Gastraphetes','Yoichinoyumi','FailNot','Naegling','DualFoma','DualAnni','DualGastra','DualYoichi','DualFailNot','DualKCSavage','DualKCTrueFlight','None')

WeaponType =  {['Fail-Not'] = "Bow",
			   ['Yoichinoyumi'] = "Bow",
			   ['Sparrowhawk +2'] = "Bow",
			   ['Fomalhaut'] = "Gun",
			   ['Armageddon'] = "Gun",
			   ['Anarchy +2'] = "Gun",
			   ['Annihilator'] = "Gun",
			   ['Gastraphetes'] = "Crossbow",
			   }

DefaultAmmo = {
	['Bow']  = {['Default'] = "Yoichi's Arrow",
				['WS'] = "Yoichi's Arrow",
				['Acc'] = "Yoichi's Arrow",
				['Magic'] = "Yoichi's Arrow",
				['MagicAcc'] = "Yoichi's Arrow",
				['Unlimited'] = "Yoichi's Arrow",
				['MagicUnlimited'] ="Yoichi's Arrow",
				['MagicAccUnlimited'] ="Yoichi's Arrow"},
				
	['Gun']  = {['Default'] = "Chrono Bullet",
				['WS'] = "Chrono Bullet",
				['Acc'] = "Chrono Bullet",
				['Magic'] = "Chrono Bullet",
				['MagicAcc'] = "Chrono Bullet",
				['Unlimited'] = "Chrono Bullet",
				['MagicUnlimited'] = "Chrono Bullet",
				['MagicAccUnlimited'] ="Chrono Bullet"},
				
	['Crossbow'] = {['Default'] = "Quelling Bolt",
					['WS'] = "Quelling Bolt",
					['Acc'] = "Quelling Bolt",
					['Magic'] = "Quelling Bolt",
					['MagicAcc'] = "Quelling Bolt",
					['Unlimited'] = "Quelling Bolt",
					['MagicUnlimited'] = "Quelling Bolt",
					['MagicAccUnlimited'] ="Quelling Bolt"}
}

gear.jse_agi_back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_mab_back = { name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_midshot_back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}}
gear.jse_snapshot_back = { name="Belenus's Cape", augments={'Snapshot +10',}}
gear.jse_tp_back = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Accuracy+10','Phys. dmg. taken-10%',}}
gear.jse_str_back = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_crit_back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}

-- Additional local binds
send_command('bind !` input /ra <t>')
send_command('bind !backspace input /ja "Bounty Shot" <t>')
send_command('bind @f7 gs c toggle RngHelper')
send_command('bind @` input /ja "Velocity Shot" <me>')
send_command('wait 15; input /lockstyleset 11;')
send_command('lua l hovershot')
ammostock = 198
--rangedautows = 'Last Stand'
state.MaintainAftermath	= M(true, 'Maintain Aftermath')
select_default_macro_book()

end

function init_gear_sets()

	include('Common/RNG_Common.lua')
	

	autows_list = {['Gastraphetes']='Trueflight',['Armageddon']='Wildfire',['Fomalhaut']='Last Stand',['Annihilator']='Last Stand',['Yoichinoyumi']='Namas Arrow',['FailNot']='Apex Arrow',['Naegling']='Savage Blade',['DualGastra']='Trueflight',['DualArma']='Wildfire',['DualFoma']='Last Stand',['DualAnni']='Last Stand',['DualYoichi']='Namas Arrow',['DualFailNot']='Apex Arrow',['DualSavage']='Savage Blade',}

-- Weapons sets
sets.weapons.Gastraphetes = {main="Tauret",sub="Nusku Shield",range="Gastraphetes",ammo="Quelling Bolt"}
sets.weapons.Armageddon = {main="Perun +1",sub="Nusku Shield",range="Armageddon",ammo="Chrono Bullet"}
sets.weapons.Fomalhaut = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut",ammo="Chrono Bullet"}
sets.weapons.Annihilator = {main="Perun +1",sub="Nusku Shield",range="Annihilator",ammo="Chrono Bullet"}
sets.weapons.Yoichinoyumi = {main="Perun +1",sub="Nusku Shield",range="Yoichinoyumi",ammo="Chrono Arrow"}
sets.weapons.FailNot = {main="Perun +1",sub="Nusku Shield",range="Fail-Not",ammo="Chrono Arrow"}
sets.weapons.Naegling = {main="Naegling",sub="Nusku Shield",range="Sparrowhawk +2"}
-- K club
sets.weapons.DualKCSavage = {main="Naegling",sub="Kraken Club",range="Sparrowhawk +2"}
sets.weapons.DualKCTrueFlight = {main="Tauret",sub="Kraken Club",range="Gastraphetes",ammo="Quelling Bolt"}
-- DW
sets.weapons.DualGastra = {main="Tauret",sub="Ternion Dagger +1",range="Gastraphetes",ammo="Quelling Bolt"}
sets.weapons.DualArma = {main="Tauret",sub="Ternion Dagger +1",range="Armageddon",ammo="Chrono Bullet"}
sets.weapons.DualFoma = {main="Perun +1",sub="Kustawi +1",range="Fomalhaut",ammo="Chrono Bullet"}
sets.weapons.DualAnni = {main="Perun +1",sub="Kustawi +1",range="Annihilator",ammo="Chrono Bullet"}
sets.weapons.DualYoichi = {main="Perun +1",sub="Kustawi +1",range="Yoichinoyumi",ammo="Chrono Arrow"}
sets.weapons.DualFailNot = {main="Perun +1",sub="Kustawi +1",range="Fail-Not",ammo="Chrono Arrow"}
sets.weapons.DualSavage = {main="Naegling",sub="Ternion Dagger +1",range="Sparrowhawk +2"}

--------------------------------------
-- Precast sets
--------------------------------------

-- Precast sets to enhance JAs
sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {})	--{hands="Amini Glove. +1"}
sets.precast.JA['Camouflage'] = {}	--{body="Orion Jerkin +1"}
sets.precast.JA['Scavenge'] = {}	--{feet="Orion Socks +1"}
sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +3"}
sets.precast.JA['Double Shot'] = {body="Arc. Jerkin +3", back=gear.jse_midshot_back}
sets.precast.JA['Velocity Shot'] = {body="Amini Caban +1"}

-- Fast cast sets for spells
sets.precast.FC = {
	head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
	body="Adhemar Jacket +1",
		hands="Malignance Gloves",	-- leyline
	legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
	feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
	neck="Baetyl Pendant",
	waist="Flume Belt +1",
	left_ear="Loquac. Earring",
	right_ear="Etiolation Earring",
	left_ring="Weather. Ring +1",
	right_ring="Lebeche Ring",
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

-- Ranged sets (snapshot)

-- (10% Snapshot, 5% Rapid from Merits)
-- Snapshot: the cap is simply 70% and all sources count.
-- Flurry I = 15% snapshot	-- Flurry II = 30% snapshot
-- merit 10%
-- Rapid Shot no cap
-- Snapshot cap = 70%, 5/5 Snapshot merits = 10%, so:
	-- Flurry 2: need 30 snapshot
	-- Flurry 1: need 45 snapshot
	-- Flurry 0: need 60 snapshot 

-- 60% + 10% = 70%
sets.precast.RA = {
	head="Ikenga's Hat",
	body="Ikenga's Vest",
	hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},	-- 8
	legs="Adhemar Kecks +1",																			-- 15
	feet="Meg. Jam. +2",		
	neck="Scout's Gorget +2",																		-- 10																		-- 4
	waist="Yemaya Belt",																	-- 3
	back=gear.jse_snapshot_back,																		-- 10
}
	
sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
-- 51% WSD
sets.precast.WS = {
	head="Nyame Helm",																									-- 10
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",											-- 10
	feet="Nyame Sollerets",
	neck="Scout's Gorget +2",
	waist="Fotia Belt",
	left_ear="Telos Earring",																								-- 2
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Dingir Ring",																								
	back=gear.jse_agi_back,																									-- 10
}

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Last Stand'] = sets.precast.WS
sets.precast.WS['Coronach'] = sets.precast.WS
	
sets.precast.WS['Wildfire'] = {
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Scout's Gorget +2",
	waist="Eschan Stone",
	left_ear="Friomisi Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Dingir Ring",
	back=gear.jse_mab_back,
}

sets.precast.WS['Trueflight'] = set_combine(sets.precast.WS['Wildfire'], {left_ring="Weather. Ring +1"})

sets.precast.WS['Savage Blade'] = {
	ammo="Hauksbok Arrow",
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Sailfi Belt +1",
	left_ear="Sherida Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Regal Ring",
	right_ring="Karieyh Ring",
	back=gear.jse_str_back,
}

-- Swap to these on Moonshade using WS if at 3000 TP
sets.MaxTP = {}
sets.AccMaxTP = {}

--------------------------------------
-- Midcast sets
--------------------------------------

-- Fast recast for spells
sets.midcast.FastRecast = sets.precast.FC
	
-- Ranged sets
sets.midcast.RA = {
	head="Ikenga's Hat",
	body="Ikenga's Vest",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Scout's Gorget +2",
	waist="Yemaya Belt",
	left_ear="Telos Earring",
	right_ear="Dedition Earring",
	left_ring="Regal Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_midshot_back,
}

sets.midcast.RA.AM = {
	head="Meghanada Visor +2",
	body="Meg. Cuirie +2",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Osh. Leggings +1",
	neck="Scout's Gorget +2",
	waist="K. Kachina Belt +1",
	left_ear="Telos Earring",
	right_ear="Odr Earring",
	left_ring="Dingir Ring",
	right_ring="Ilabrat Ring",
	back=gear.jse_crit_back,
}

--These sets will overlay based on accuracy level, regardless of other options.
sets.buff.Camouflage = {} 	--{body="Orion Jerkin +1"}
sets.buff['Double Shot'] = {head="Arcadian Beret +3", body="Arc. Jerkin +3", hands="Oshosi Gloves +1", legs="Osh. Trousers +1", feet="Osh. Leggings +1", back=gear.jse_midshot_back,}
sets.buff.Barrage = {hands="Orion Bracers +3"}

sets.Self_Healing = {waist="Gishdubar Sash"}
sets.Cure_Received = {waist="Gishdubar Sash"}
sets.Self_Refresh = {waist="Gishdubar Sash"}

sets.midcast.Utsusemi = sets.midcast.FastRecast

--------------------------------------
-- Idle/resting/defense/etc sets
--------------------------------------

-- Idle sets
sets.idle = {
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",					
	legs="Malignance Tights",
	feet="Malignance Boots",					
	neck="Sanctity Necklace",
	waist="Flume Belt +1",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",					
	right_ring="Gelatinous Ring +1",
	back=gear.jse_midshot_back,				
}
sets.resting = sets.idle

sets.idle.Town = {
	head="Nyame Helm",
	body="Ikenga's Vest",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Scout's Gorget +2",
	waist="Windbuffet Belt +1",
	left_ear="Telos Earring",
	right_ear="Crepuscular Earring",
	left_ring="Regal Ring",
	right_ring="Dingir Ring",
	back=gear.jse_midshot_back,
}

-- Defense sets
sets.defense.PDT = {
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1",
	waist="Flume Belt +1",
	left_ear="Odnowa Earring +1",
	right_ear="Etiolation Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back=gear.dt_moon_back,
}

sets.defense.MDT = sets.defense.PDT
sets.defense.MEVA = sets.defense.PDT

sets.Kiting = {legs="Carmine Cuisses +1"}
sets.DayIdle = {}
sets.NightIdle = {}

--------------------------------------
-- Engaged sets
--------------------------------------

sets.engaged = {
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Combatant's Torque",
	waist="Windbuffet Belt +1",
	left_ear="Telos Earring",
	right_ear="Sherida Earring",
	left_ring="Petrov Ring",
	right_ring="Epona's Ring",
	back=gear.jse_tp_back,
}

sets.engaged.DT = {
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Combatant's Torque",
	waist="Windbuffet Belt +1",
	left_ear="Telos Earring",
	right_ear="Sherida Earring",
	left_ring="Defending Ring",
	right_ring="Epona's Ring",
	back=gear.jse_tp_back,
}
	
sets.engaged.DW = set_combine(sets.engaged, {left_ear="Suppanomimi"})
sets.engaged.DW.DT = set_combine(sets.engaged.DT, {left_ear="Suppanomimi"})

--------------------------------------
-- Custom buff sets
--------------------------------------
sets.buff.Doom = set_combine(sets.buff.Doom, {})

end