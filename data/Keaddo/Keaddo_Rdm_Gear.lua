function user_setup()

	include('Common/RDM_UserSetup_Common.lua')

end

function init_gear_sets()

	include('Common/RDM_Common.lua')


	state.Weapons:options('None','DualCrocea','DualCroDay','DualSavage','DualSavagebhron','DualEvis','DualClubs','Crocea','Naegling')

sets.weapons.DualCrocea = {main="Crocea Mors",sub="Crepuscular Knife"}
sets.weapons.DualClubs = {main="Maxentius",sub="Bunzi's Rod"}
sets.weapons.DualSavagebhron = {main="Naegling",sub="Machaera +2"}

autows_list = {['DualCrocea']='Sanguine Blade',['DualCroDay']='Sanguine Blade',['DualSavage']='Savage Blade',['DualSavagebhron']='Savage Blade',
['DualEvis']='Evisceration',['DualClubs']='Black Halo',['Crocea']='Sanguine Blade',['Naegling']='Savage Blade'}	

sets.precast.FC = {
	ammo={name="Impatiens", priority=1},													-- QC 2
	ranged=empty,
	head=gear.merlinic_fc_head,																-- 15
	body="Viti. Tabard +3",																-- 15
	neck="Loricate torque +1",																-- 
	legs="Aya. Cosciales +2",																-- 6	
	waist="Embla Sash",																		-- 5
	left_ear="Loquac. Earring",																-- 2
	right_ear="Enchntr. Earring +1",															-- 2
	left_ring="Kishar Ring",																-- 4
	right_ring="Rahab Ring",																-- 2
	back="Perimede Cape",																	-- QC 4
}

sets.precast.WS['Savage Blade'] = {
	range=empty,
	ammo="Coiste Bodhar",
	head="Viti. Chapeau +3",
	body="Nyame Mail",
	hands="Jhakri Cuffs +2",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Dls. Torque +2",
	waist="Sailfi Belt +1",
	left_ear="Regal Earring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	left_ring="Karieyh Ring",
	right_ring="Epaminondas's Ring",
	back=gear.jse_str_back,
}

sets.precast.WS['Sanguine Blade'] = {
	range=empty,
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	body="Nyame Mail",
	hands="Jhakri Cuffs +2",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Sanctity Necklace",
	waist="Orpheus's Sash",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	left_ring="Metamor. Ring +1",
	right_ring="Karieyh Ring",
	back=gear.jse_mab_back,
}

sets.midcast['Enhancing Magic'] = {
	main=gear.colada_enhancing_sword,												-- 4% 	
	sub="Ammurapi Shield",															-- 10%
	head=gear.telchine_enhancing_head,												-- 9%
	body="Viti. Tabard +3",															-- 15%
	hands="Atrophy Gloves +2",														-- 20%
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

sets.buff.ComposureOther = --set_combine(sets.midcast['Enhancing Magic'], {
{		
	head="Leth. Chappel +1",
	body="Lethargy Sayon +1",
	--hands="Leth. Gantherots +1",
	legs="Leth. Fuseau +1",
	feet="Leth. Houseaux +1",
}

sets.EnhancingSkill = {
	sub="Ammurapi Shield",
	range=empty,
	ammo="Staunch Tathlum",
	head="Befouled Crown",
	body="Viti. Tabard +3",
	hands="Viti. Gloves +3",
	legs="Carmine Cuisses",
	feet="Leth. Houseaux +1",
	neck=gear.rdm_jse_neck,
	waist="Olympus Sash",
	left_ear="Andoaa Earring",			-- 5
	right_ear="Mimir Earring",			-- 10
	left_ring="Defending Ring",
	right_ring="Stikini Ring +1",
	back=gear.jse_skill_back,
}

sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'],{
	head="Amalric Coif",
	body="Atrophy Tabard +2",
	hands="Atrophy Gloves +2",
	legs="Leth. Fuseau +1",
	feet="Leth. Houseaux +1",
	back="Grapevine Cape",
	waist="Gishdubar Sash"
})
sets.midcast.Aquaveil = {head="Amalric Coif",hands="Regal Cuffs"}

sets.midcast['Phalanx'] = {
	sub="Ammurapi Shield",
	range=empty,
	ammo="Staunch Tathlum +1",
	head=gear.taeon_phalanx_head,		-- Phalanx +3
	body=gear.taeon_phalanx_body,		-- Phalanx +3
	hands=gear.taeon_phalanx_hands,		-- Phalanx +3
	legs=gear.taeon_phalanx_legs,		-- Phalanx +3
	feet=gear.taeon_phalanx_feet,		-- Phalanx +3
	neck=gear.rdm_jse_neck,			-- 10
	waist="Embla Sash",
	left_ear="Andoaa Earring",			-- 5
	right_ear="Mimir Earring",			-- 10
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",		-- 8
	back=gear.jse_macc_back,
}

-- Main enfeebling with duration/potency
-- INT:	Sleep/Gravity/Bind/Distract/Frazzle/Blind/Poison/Dispel/Break
-- MND: Addle/Inundation/Paralyze/Slow/Silence/Dia

-- 45% Duration
sets.midcast['Enfeebling Magic'] = {
	main="Daybreak",
	sub="Ammurapi Shield",
	range=empty,
	ammo={name="Regal Gem", priority=15},
	head="Viti. Chapeau +3",
	body="Lethargy Sayon +1",
	hands="Regal Cuffs",
	legs=gear.chironic_enfeeble_legs,
	feet="Vitiation Boots +3",
	neck=gear.rdm_jse_neck,
	waist="Luminary Sash",
	left_ear="Regal Earring",
	right_ear="Snotra Earring",
	left_ring={name="Kishar Ring", priority=15},
	right_ring="Stikini Ring +1",
	back=gear.jse_macc_back,
}
	
-- -20% Duration
-- -24% Potency
-- +92 Macc/skill
sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=1},
	ammo=empty,
	body="Atrophy Tabard +2",
	hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
	left_ring="Metamor. Ring +1",
	right_ring="Stikini Ring +1",
})

sets.midcast['Enfeebling Magic'].Resistant.INT = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
	main="Bunzi's Rod", 
	left_ring={name="Metamor. Ring +1", priority=1},
})
	
sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=1},
	ammo=empty,
	body="Atrophy Tabard +2", 
})

sets.midcast.DurationOnlyEnfeebling.INT = set_combine(sets.midcast['Enfeebling Magic'], {
	range={name="Ullr", priority=1},
	ammo=empty,
	main="Bunzi's Rod", 
	body="Atrophy Tabard +2", 
})	

sets.midcast.DurationOnlyEnfeebling.Melee = set_combine(sets.midcast['Enfeebling Magic'], {
	body="Atrophy Tabard +2", 
})

-- Idle sets
sets.idle = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Homiliary",
	head="Viti. Chapeau +3",
	body="Jhakri Robe +2",
	hands="Nyame Gauntlets",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Flume Belt +1",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring={name="Defending Ring",priority=50},
	right_ring="Stikini Ring +1",
	back=gear.jse_da_back,
}

sets.idle.DT = 
{
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Homiliary",
	head="Viti. Chapeau +3",
	body="Jhakri Robe +2",
	hands="Nyame Gauntlets",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Sanctity Necklace",
	waist="Flume Belt +1",
	left_ear="Infused Earring",
	right_ear="Etiolation Earring",
	left_ring={name="Defending Ring",priority=50},
	right_ring="Stikini Ring +1",
	back=gear.jse_da_back,																-- 10
}

sets.idle.Town = sets.idle

-- Engaged sets
sets.engaged = {
	ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	body="Malignance Tabard",
	hands="Aya. Manopolas +2",
	legs="Malignance Tights",
	feet="Malignance Boots",
	neck="Lissome Necklace",
	waist="Windbuffet Belt +1",
	left_ear="Sherida Earring",
	right_ear="Telos Earring",
	left_ring="Chirich Ring +1",
	right_ring="Ilabrat Ring",
	back=gear.jse_da_back,
}

sets.engaged.Crocea = set_combine(sets.engaged,{
	neck="Sanctity Necklace",
	hands="Aya. Manopolas +2",
	waist="Orpheus's Sash"
})
	
sets.engaged.DW = set_combine(sets.engaged, {
	waist="Reiki Yotai", 
	--right_ear="Suppanomimi"
})		

sets.engaged.DualCrocea = set_combine(sets.engaged, {
	waist="Orpheus's Sash",
	neck="Sanctity Necklace",
	hands="Aya. Manopolas +2",
	ear2="Suppanomimi"
})
	
end