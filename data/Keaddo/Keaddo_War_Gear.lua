function user_setup()

	include('Common/WAR_UserSetup_Common.lua')


state.Weapons:options('Naegling','ShiningOne','Loxotic','None')

gear.jse_str_back ={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
gear.jse_da_back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
gear.jse_vit_back ={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}




end

function init_gear_sets()

	include('Common/WAR_Common.lua')

	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		neck="War. Beads +2",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Epaminondas's Ring",
		ring2="Karieyh Ring",
		back=gear.jse_str_back,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}


	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		waist="Sailfi Belt +1"
	})

	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS['Savage Blade'],{})

	sets.precast.WS['Judgment'] = set_combine(sets.precast.WS['Savage Blade'],{})

	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'],{})

	sets.idle = {
		ammo="Staunch Tathlum",
		head="Sakpata's Helm",
		neck="Loricate Torque",
		ear1="Etiolation Earring",
		ear2="Infused Earring",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		ring1="Defending Ring",
		ring2="Dark Ring",
		back="Cichol's Mantle",
		waist="Flume Belt",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings"
	}

	sets.engaged.Naegling = {
		ammo="Coiste Bodhar",
		head="Hjarrandi Helm",
		neck="War. Beads +2",
		ear1="Schere Earring",
		ear2="Boii Earring",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		ring1="Niqmaddu Ring",
		ring2="Petrov Ring",
		back=gear.jse_da_back,
		waist="Sailfi Belt +1",
		legs="Sakpata's Cuisses",
		feet="Nyame Sollerets"
	}

	sets.engaged.Loxotic = {
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +1",
		neck="Sanctity Necklace",
		ear1="Brutal Earring",
		ear2="Boii Earring +1",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		ring1="Niqmaddu Ring",
		ring2="Flamma Ring",
		back=gear.jse_da_back,
		waist="Sailfi Belt +1",
		legs="Sakpata's Cuisses",
		feet="Flam. Gambieras +2"
	}

	sets.engaged.ShiningOne = {
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +1",
		neck="Sanctity Necklace",
		ear1="Brutal Earring",
		ear2="Boii Earring +1",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		ring1="Niqmaddu Ring",
		ring2="Flamma Ring",
		back=gear.jse_da_back,
		waist="Sailfi Belt +1",
		legs="Sakpata's Cuisses",
		feet="Flam. Gambieras +2"
	}


	sets.engaged.Naegling.DT = set_combine(sets.engaged.Naegling,{
		head="Sakpata's Helm",
		feet="Sakpata's Leggings"
	})
	

	sets.weapons.ShiningOne = {main="Shining One",sub="Flanged Grip"}
	autows_list = {['Naegling']='Savage Blade',['DualWeapons']='Savage Blade',['Loxotic']='Judgment',['ShiningOne']='Impulse Drive'}

end
