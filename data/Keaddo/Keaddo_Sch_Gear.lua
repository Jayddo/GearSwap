function user_setup()

	include('Common/SCH_UserSetup_Common.lua')

end

function init_gear_sets()

	include('Common/SCH_Common.lua')
	
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen','9k')
    state.IdleMode:options('Normal','PDT')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Khatvanga')

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}
	sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells

    sets.precast.FC = {
        main=gear.grioavolr_fc_staff, -- 7 FC
        sub="Niobid Strap",
        ammo="Impatiens",
        head=gear.merlinic_fc_head,
        neck="Voltsurge Torque",
        ear1="Loquacious Earring",
        ear2="Malignance Earring",
        body="Merlinic Jubbah",
        hands="Merlinic Dastanas",
        ring1="Kishar Ring",
        ring2="Prolix Ring",
        back="Perimede Cape",
        waist="Witful Belt",
        legs="Psycloth Lappas",
        feet=gear.merlinic_fc_feet
    }
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Malignance Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {
		main="Akademos",
		sub="Niobid Strap",
        ammo="Psilomene",
        head="Amalric Coif",
        neck="Sanctity Necklace",
        ear1="Etiolation Earring",
        ear2="Loquacious Earring",
        body="Amalric Doublet",
        hands="Amalric Gages",
        ring1="Mephitas's Ring",
        ring2="Mephitas's Ring +1",
        back="Bane Cape",
        waist="Refoccilation Stone",
        legs="Amalric Slops",
        feet="Amalric Nails",
    }

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {
        main=gear.grioavolr_fc_staff, -- 7 FC
        sub="Niobid Strap",
        ammo="Impatiens",
        head=gear.merlinic_fc_head,
        neck="Voltsurge Torque",
        ear1="Loquacious Earring",
        ear2="Malignance Earring",
        body="Merlinic Jubbah",
        hands="Merlinic Dastanas",
        ring1="Kishar Ring",
        ring2="Prolix Ring",
        back="Perimede Cape",
        waist="Witful Belt",
        legs="Psycloth Lappas",
        feet=gear.merlinic_fc_feet
    }
		
    sets.midcast.Cure = {
        main="Serenity",
        sub="Curatio Grip",
        ammo="Hydrocera",
        head="Vanya Hood",
        neck="Incanter's Torque",
        ear1="Mendi. Earring",
        ear2="Loquacious Earring",
        body="Vanya Robe",
        hands="Telchine Gloves",
        ring1="Haoma's Ring",
        ring2="Sirona's Ring",
        back="Tempered Cape +1",
        waist="Bishop's Sash",
        legs="Vanya Slops",
        feet="Vanya Clogs"
    }
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure,{})
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure,{})

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Debilis Medallion",ear1="Meili Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring",
		back="Oretan. Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Savant's Treatise",
		head="Telchine Cap",
		body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
		ear1="Andoaa Earring",
		neck="Incanter's Torque",
		waist="Olympus Sash"
    }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
        sub="Genbu's Shield",
        ammo="Savant's Treatise",
        head="Arbatel Bonnet +1",
        neck="Incanter's Torque",
        ear1="Andoaa Earring",
        body="Telchine Chasuble",
        hands="Telchine Gloves",
        back="Bookworm's Cape",
        waist="Cascade Belt",
        legs="Telchine Braconi",
        feet="Telchine Pigaches"
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"
    })
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
		main="Akademos",
		sub="Mephitis Grip",
		ammo="Hydrocera",
		head="Amalric Coif",
		neck="Sanctity Necklace",
		ear1="Digni. Earring",
		ear2="Barkarole Earring",
		body="Vanya Robe",
		hands="Amalric Gages",
		ring1="Metamorph Ring",
		ring2="Weatherspoon Ring",
		back="Refraction Cape",
		waist="Rumination Sash",
		legs="Psycloth Lappas",
		feet="Medium's Sabots"
    }
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +3",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Chironic Doublet",hands="Acad. Bracers +3",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
        head="Amalric Coif",
        ear2="Malignance Earring",
        back=gear.nuke_jse_back,
        waist="Acuity Belt +1"}
    )
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        head="Amalric Coif",
        ear1="Malignance Earring",
        back=gear.nuke_jse_back,
        waist="Acuity Belt +1"
    })
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring2="Stikini Ring +1",feet=gear.chironic_nuke_feet})

    sets.midcast['Dark Magic'] = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Hydrocera",
		head=gear.merlinic_nuke_head,
		neck="Incanter's Torque",
		ear1="Barkarole Earring",
		ear2="Dignitary's Earring",
		body="Psycloth Vest",
		hands="Lurid Mitts",
		ring1="Weatherspoon Ring",
		ring2="Evanescence Ring",
		back="Bookworm's Cape",
		waist="Witful Belt",
		legs="Pedagogy Pants",
		feet="Medium's Sabots"
    }

    sets.midcast.Kaustra = set_combine(sets.midcast['Elemental Magic'], {})
    sets.midcast.Kaustra.Resistant = set_combine(sets.midcast.Kaustra, {})

    sets.midcast.Drain = {
        main="Rubicundity",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Mizu. Kubikazari",
		ear1="Hirudinea Earring",
		ear2="Barkarole Earring",
        body="Merlinic Jubbah",
        hands=gear.merlinic_aspir_hands,
		ring1="Evanescence Ring",
		ring2="Weatherspoon Ring",	
		back="Bane Cape",
		waist="Fucho-no-Obi",
        legs=gear.merlinic_aspir_legs,
		Feet=gear.merlinic_aspir_feet
    }
		
    sets.midcast.Drain.Resistant = set_combine(sets.midcast.Drain, {})

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
		main="Akademos",
		sub="Niobid Strap",
        ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,
        body="Zendik Robe",
        hands="Hagondes Cuffs +1",
        legs=gear.merlinic_nuke_legs,
        feet=gear.nuke_feet,
        neck="Incanter's Torque",
        waist="Refoccilation Stone",
        left_ear="Barkaro. Earring",
        right_ear="Digni. Earring",
        left_ring="Evanescence Ring",
        right_ring="Vertigo Ring",
    }

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum"})

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head=gear.merlinic_nuke_head,
		body=gear.merlinic_nuke_body,
		hands="Amalric Gages",
		legs="Amalric Slops",
		feet=gear.merlinic_aspir_feet,
		neck="Saevus Pendant +1",
		ear1="Friomisi Earring",
		ear2="Barkarole Earring",
		ring1="Metamor. Ring +1",
		ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,
		waist="Refoccilation Stone"
    }
		
    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {})
		
    sets.midcast['Elemental Magic']['9k'] = set_combine(sets.midcast['Elemental Magic'], {})
		
    sets.midcast['Elemental Magic'].Proc = set_combine(sets.midcast['Elemental Magic'], {})
		
    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'], {})
		
	-- Gear for Magic Burst mode.
    sets.MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
        main="Akademos",
		sub="Niobid Strap",
		neck="Mizukage-no-Kubikazari",
		ring1="Mujin Band",
    })

    sets.HelixBurst = set_combine(sets.midcast['Elemental Magic'], {
        main="Akademos",
		sub="Niobid Strap",
		neck="Mizukage-no-Kubikazari",
		ring1="Mujin Band",
    })
		
    sets.ResistantHelixBurst = set_combine(sets.HelixBurst, {})
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
		
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {})

	sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {
        neck="Sanctity Necklace",
    })
	
	sets.midcast.Helix.Resistant = set_combine(sets.midcast.Helix, {})
		
	sets.midcast.Helix.Proc = set_combine(sets.midcast.Helix, {})

	sets.midcast.Impact = {
        main="Akademos",
		sub="Mephitis Grip",
		ammo="Hydrocera",
		head=empty,
		neck="Sanctity Necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
		body="Twilight Cloak",
		hands=chiro_hands_MAB,
		ring1="Weatherspoon Ring",
		ring2="Sangoma Ring",
		back="Refraction Cape",
		waist="Luminary Sash",
		legs="Chironic Hose",
		feet="Medium's Sabots"
    }
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric Doublet +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
    main="Mpaca's Staff",
    sub="Niobid Strap",
    ammo="Homiliary",
    head="Nyame Helm",
    neck="Sanctity Necklace",
    ear1="Infused Earring",
    ear2="Ethereal Earring",
    body="Jhakri Robe +2",
    hands="Nyame Gauntlets",
    ring1="Sheltered Ring",
    ring2="Paguroidea Ring",
    back="Solemnity Cape", 
    waist="Fucho-no-Obi",
    legs="Assiduity Pants +1",
    feet="Nyame Sollerets"
    }

    sets.idle.PDT = set_combine(sets.idle, {
        main="Malignance Pole",
        sub="Umbra Strap",
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        neck="Loricate Torque +1",
        ear1="Etiolation Earring",
        ear2="Ethereal Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back="Solemnity Cape",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    })
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = set_combine(sets.idle, {})
		
    -- Defense sets

    sets.defense.PDT = {
        main="Malignance Pole",
        sub="Umbra Strap",
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        neck="Loricate Torque +1",
        ear1="Etiolation Earring",
        ear2="Ethereal Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back="Solemnity Cape",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.defense.MDT = {
        main="Malignance Pole",
        sub="Umbra Strap",
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        neck="Loricate Torque +1",
        ear1="Etiolation Earring",
        ear2="Ethereal Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back="Solemnity Cape",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }
		
    sets.defense.MEVA = {
        main="Malignance Pole",
        sub="Umbra Strap",
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        neck="Loricate Torque +1",
        ear1="Etiolation Earring",
        ear2="Ethereal Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back="Solemnity Cape",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
	sets.engaged.PDT = {main="Malignance Pole", sub="Oneiros Grip",ammo="Staunch Tathlum +1",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet=gear.chironic_refresh_feet}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Carrier's Sash",legs="Shedir Seraweels",feet=""}
		
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonlight Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.Sublimation = {head="Acad. Mortar. +3",body="Pedagogy Gown +1",ear1="Savant's Earring",waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Akademos = {main="Akademos",sub="Enki Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 03')
end