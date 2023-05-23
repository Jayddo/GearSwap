function user_setup()

	include('Common/COR_UserSetup_Common.lua')

end

function init_gear_sets()

	include('Common/COR_Common.lua')
	
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	--state.Weapons:options('Default','Ranged','Savage','Evisceration','DualWeapons','DualSavage','DualEvisceration','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','DualProcWeapons','None')
    state.Weapons:options('DualLeaden','DualLeadenRanged','DualSavage','DualWildfire','DualWildfireRanged','DualLastStand','DualLastStandRanged','DeathPenalty','Armageddon','Fomalhaut','Naegling','None')
    state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15
    --Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20

	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	
    gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken -10%',}}
    gear.tp_ranger_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
    gear.magic_agi_wsd_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
    gear.magic_wsd_jse_back = { name="Camulus's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.str_wsd_jse_back = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.snapshot_jse_back = { name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Phys. dmg. taken-10%',}}
    gear.nuke_qd_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}

    gear.rostam_roll = { name="Rostam", augments={'Path: C',}}
    gear.rostam_melee = { name="Rostam", augments={'Path: B',}}

	autofood= 'Squid Sushi'


    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons DualSavage;gs c update')
    send_command('bind @r gs c weapons DualLeaden;gs c update')
    send_command('bind @q gs c weapons DualWildfire;gs c update')
	send_command('bind ^q gs c weapons DualRanged;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +3"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}

    sets.precast.CorsairRoll = {
        main=gear.rostam_roll,
        range="Compensator",
        head="Lanun Tricorne +3",
        neck="Regal Necklace",
        ear1="Genmei Earring",
        ear2="Eabani Earring",
        body="Nyame Mail",
        hands="Chasseur's Gants +3",
        ring1="Defending Ring",
        ring2="Dark Ring",
        back=gear.tp_jse_back,
        waist="Flume Belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +3"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3"})
    
    sets.precast.CorsairShot = {
        ammo=gear.QDbullet,
        head="Laksa. Tricorne +3",
        neck="Comm. Charm +2",
        ear1="Enervating Earring",
        ear2="Telos Earring",
        body="Malignance Tabard",
        hands="Laksa. Gants +3",
        ring1="Mummu Ring",
        ring2="Regal Ring",
        back=gear.nuke_qd_jse_back,
        waist="K. Kachina Belt +1",
        legs="Malignance Tights",
        feet="Laksa. Bottes +3"
    }
		
	sets.precast.CorsairShot.Damage = {
        ammo=gear.QDbullet,
        head=gear.herculean_nuke_head,
        neck="Comm. Charm +2",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Lanun Frac +3",
        hands="Carmine Fin. Ga. +1",
        ring1="Dingir Ring",ring2="Regal Ring",
        back=gear.nuke_qd_jse_back,
        waist="Eschan Stone",
        legs=gear.herculean_nuke_legs,
        feet="Lanun Bottes +3"
    }
	
    sets.precast.CorsairShot.Proc = set_combine(sets.precast.CorsairShot,{})

    sets.precast.CorsairShot['Light Shot'] = set_combine(sets.precast.CorsairShot,{})

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot,{})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",
        ear1="Etiolation Earring",
        ear2="Loquac. Earring",
        body="Taeon Tabard",
        ring1="Kishar Ring",
        }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {
        ammo=gear.RAbullet,
        head="Chass. Tricorne +1",
        neck="Comm. Charm +2",
        body="Laksa. Frac +3",
        hands="Lanun Gants +3",
        back=gear.snapshot_jse_back,
        waist="Yemaya Belt",
        legs="Adhemar Kecks +1",
        feet="Meg. Jam. +2"
    }
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo=gear.WSbullet,
        head="Nyame Mail",
        neck="Fotia Gorget",
        ear1="Moonshade Earring",
        ear2="Ishvara Earring",
        body="Laksa. Frac +3",
        hands="Chasseur's Gants +3",
        ring1="Dingir Ring",
        ring2="Regal Ring",
        back=gear.ranger_wsd_jse_back,
        waist="Fotia Belt",
        legs="Nyame Flanchard",
        feet="Lanun Bottes +3"
    }
		
    sets.precast.WS.Acc = set_combine(sets.precast.WS,{})
		
    sets.precast.WS.Proc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Mache Earring +1",
        body="Mummu Jacket +2",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = {
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands="Mummu Wrists +2",
        legs="Mummu Kecks +2",
        feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+3','Accuracy+8',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Telos Earring",
        left_ring="Rufescent Ring",
        right_ring="Regal Ring",
        back=gear.str_wsd_jse_back,
    }

	sets.precast.WS['Evisceration'] = {
        ammo=gear.WSbullet,
        head="Adhemar Bonnet +1",
        neck="Fotia Gorget",
        ear1="Odr Earring",
        ear2="Moonshade Earring",
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        ring1="Mummu Ring",
        ring2="Regal Ring",
        back=gear.tp_jse_back,
        waist="Fotia Belt",
        legs="Mummu Kecks +2",
        feet="Mummu Gamash. +2"}
		
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'],{})

	sets.precast.WS['Savage Blade'] = {
        ammo=gear.WSbullet,
        head="Nyame Helm",
        neck="Comm. Charm +2",
        ear1="Moonshade Earring",
        ear2="Ishvara Earring",
        body="Laksa. Frac +3",
        hands="Chasseur's Gants +3",
        ring1="Epaminondas's Ring",
        ring2="Karieyh Ring",
        back=gear.str_wsd_jse_back,
        waist="Sailfi Belt +1",
        legs="Nyame Flanchard",
        feet="Lanun Bottes +3"}

    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'],{})
	
    sets.precast.WS['Last Stand'] = {
        ammo=gear.WSbullet,
        head="Nyame Helm",
        neck="Comm. Charm +2",
        ear1="Moonshade Earring",
        ear2="Ishvara Earring",
        body="Laksa. Frac +3",
        hands="Chasseur's Gants +3",
        ring1="Epaminondas's Ring",
        ring2="Karieyh Ring",
        back=gear.ranger_wsd_jse_back,
        waist="Fotia Belt",
        legs="Nyame Flanchard",
        feet="Lanun Bottes +3"
    }

    sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'],{})
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {
        ammo=gear.MAbullet,
        head="Pixie Hairpin +1",
        neck="Comm. Charm +2",
        ear1="Moonshade Earring",
        ear2="Friomisi Earring",
        body="Lanun Frac +3",
        hands="Chasseur's Gants +3",
        ring1="Archon Ring",
        ring2="Dingir Ring",
        back=gear.magic_agi_wsd_jse_back,
        waist="Orpheus's Sash",
        legs="Nyame Flanchard",
        feet="Lanun Bottes +3"
    }
		
    sets.precast.WS['Leaden Salute'].Acc = set_combine(sets.precast.WS['Leaden Salute'],{})

    sets.precast.WS['Aeolian Edge'] = {
        ammo=gear.WSbullet,
        head=gear.herculean_nuke_head,
        neck="Comm. Charm +2",
        ear1="Moonshade Earring",
        ear2="Friomisi Earring",
        body="Lanun Frac +3",
        hands="Chasseur's Gants +3",
        ring1="Metamor. Ring +1",
        ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,
        waist="Eschan Stone",
        legs="Nyame Flanchard",
        feet="Lanun Bottes +3"
    }

    sets.precast.WS['Wildfire'] = {
        ammo=gear.MAbullet,
        head="Nyame Helm",
        neck="Comm. Charm +2",
        ear1="Crematio Earring",
        ear2="Friomisi Earring",
        body="Lanun Frac +3",
        hands="Chasseur's Gants +3",
        ring1="Dingir Ring",
        ring2="Karieyh Ring",
        back=gear.magic_agi_wsd_jse_back,
        waist="Orpheus's Sash",
        legs="Nyame Flanchard",
        feet="Lanun Bottes +3"
    }

    sets.precast.WS['Wildfire'].Acc = set_combine(sets.precast.WS['Wildfire'],{})
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {
        ammo=gear.RAbullet,
        head="Malignance Chapeau",
        neck="Iskur Gorget",
        ear1="Enervating Earring",
        ear2="Telos Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Dingir Ring",
        ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,
        waist="Yemaya Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
    }

    sets.midcast.RA.Acc = set_combine(sets.midcast.RA,{})
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +3"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Mekosu. Harness",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets
    sets.weapons.DualSavage = 				{main="Naegling",sub="Gleti's Knife" ,range="Anarchy +2"}
    sets.weapons.DualLeaden = 				{main=gear.rostam_melee,sub="Gleti's Knife",range="Death Penalty"}
    sets.weapons.DualLeadenRanged = 		{main=gear.rostam_melee,sub="Tauret",range="Death Penalty"}
    sets.weapons.DualWildfire = 			{main=gear.rostam_melee,sub="Gleti's Knife",range="Armageddon"}
    sets.weapons.DualWildfireRanged = 		{main=gear.rostam_melee,sub="Tauret",range="Armageddon"}
    sets.weapons.DualLastStand = 			{main=gear.rostam_melee,sub="Gleti's Knife",range="Fomalhaut"}
    sets.weapons.DualLastStandRanged = 		{main=gear.rostam_melee,sub="Kustawi +1",range="Fomalhaut"}
    sets.weapons.DeathPenalty = 			{main=gear.rostam_melee,sub="Nusku Shield",range="Death Penalty"}
    sets.weapons.Armageddon =				{main=gear.rostam_melee,sub="Nusku Shield",range="Armageddon"}
    sets.weapons.Fomalhaut = 				{main=gear.rostam_melee,sub="Nusku Shield",range="Fomalhaut"}
    sets.weapons.Naegling = 				{main="Naegling",sub="Nusku Shield",range="Anarchy +2"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1",
        neck="Iskur Gorget",
        ear1="Cessance Earring",
        ear2="Brutal Earring",
		body="Malignance Tabard",
        hands="Adhemar Wrist. +1",
        ring1="Epona's Ring",
        ring2="Petrov Ring",
		back=gear.tp_jse_back,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet="Herculean Boots"
    }
    
    sets.engaged.Acc = set_combine(sets.engaged,{})
		
    sets.engaged.DT = set_combine(sets.engaged,{
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        back=gear.tp_jse_back,
        waist="Windbuffet Belt +1",
        legs="Malignance Tights",
        feet="Malignance Boots"
    })
    
    sets.engaged.Acc.DT = set_combine(sets.engaged.DT,{})

    sets.engaged.DW = {
		head="Adhemar Bonnet +1",
        neck="Iskur Gorget",
        ear1="Telos Earring",
        ear2="Suppanomimi",
		body="Adhemar Jacket +1",
        hands="Adhemar Wrist. +1",
        ring1="Epona's Ring",
        ring2="Petrov Ring",
		back=gear.tp_jse_back,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",feet="Herculean Boots"
    }
    
    sets.engaged.DW.Acc = set_combine(sets.engaged.DW,{})
		
    sets.engaged.DW.DT = set_combine(sets.engaged.DW,{
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        waist="Reiki Yotai",
        legs="Malignance Tights",
        feet="Malignance Boots"
    })
    
    sets.engaged.DW.Acc.DT = set_combine(sets.engaged.DW.DT,{})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 11)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 11)
    elseif player.sub_job == 'RNG' then
        set_macro_page(9, 11)
    elseif player.sub_job == 'DRG' then
        set_macro_page(5, 11)
    else
        set_macro_page(2, 11)
    end
end

autows_list = {['Default']='Savage Blade',['Evisceration']='Evisceration',['Naegling']='Savage Blade',['Ranged']='Last Stand',['RangedDP']='Leaden Salute',['DualWeapons']='Savage Blade',['DualSavage']='Savage Blade',['DualEvisceration']='Evisceration',['DualLeadenRanged']='Leaden Salute',['DualLeadenMelee']='Leaden Salute',['DualLeaden']='Leaden Salute',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand',['DualMeleeArmageddon']='Wildfire',['DualLastStand']='Last Stand'}

-- autows_list = {['Default']='Last Stand',['Ranged']='Last Stand',['RangedDP']='Leaden Salute',['DualLeadenRanged']='Leaden Salute',['DualLeadenMelee']='Leaden Salute',['DualRanged']='Last Stand'}
