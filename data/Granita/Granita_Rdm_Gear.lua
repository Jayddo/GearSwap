function user_setup()

	include('Common/RDM_UserSetup_Common.lua')


	state.Weapons:options('None','DualSavage','Naegling','Windy')


end

function init_gear_sets()

	include('Common/RDM_Common.lua')

	sets.weapons.Windy = {main="Wind Knife", sub="Wind Knife"}

	sets.precast.FC = {
		ammo={name="Impatiens", priority=1},													-- QC 2
		ranged=empty,
		head="Bunzi's Hat",																-- 15
		body="Zendik Robe",
		hands="Gende. Gages +1",																-- 15  																-- 4
		legs="Aya. Cosciales +2",																-- 6	
		waist="Embla Sash",																		-- 5
		left_ear="Loquac. Earring",																-- 2
		right_ear="Etiolation Earring",															-- 1
		left_ring="Kishar Ring",															-- 4
		right_ring="Lebeche Ring",																-- QC 2
		back="Perimede Cape",																	-- QC 4
	}

	sets.precast.WS['Savage Blade'] = {
		range=empty,
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Petrov Ring",
		right_ring="Rufescent Ring",
		back=gear.jse_str_back,
	}


	sets.midcast.Cure = {
		main="Bunzi's Rod",										-- 30
		sub="Ammurapi Shield",
		range=empty,
		ammo="Hydrocera",
		head="Kaykaus Mitra +1",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",								-- 11
		legs="Vanya Slops",
		feet="Kaykaus Boots +1",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Meili Earring",
		right_ear="Mendi. Earring",								-- 5
		left_ring="Janniston Ring",
		right_ring={name="Lebeche Ring",priority=500},
	}

		sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast['Enhancing Magic'] = {
		main=gear.colada_enhancing_sword,												-- 4% 	
		sub="Ammurapi Shield",															-- 10%
		head=gear.telchine_enhancing_head,												-- 9%
		body="Viti. Tabard +3",															-- 15%
		hands="Atrophy Gloves +3",														-- 20%
		legs=gear.telchine_enhancing_legs,												-- 9%
		feet="Leth. Houseaux +1",														-- 30%
		neck=gear.rdm_jse_neck,															-- ?
		waist="Embla Sash",																-- 10%
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back=gear.jse_macc_back,														-- 20%
	}

	sets.idle = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Malignance Chapeau",
		body="Shamash Robe",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Malignance Boots",
		neck="Loricate Torque",
		waist=gear.dt_waist,
		left_ear="Eabani Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back=gear.jse_macc_back,
	}

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=gear.jse_da_back,
	}
	
end