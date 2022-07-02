function user_setup()

	include('Common/BLU_UserSetup_Common.lua')

end

function init_gear_sets()

	include('Common/BLU_Common.lua')
	
end

function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Normal','Acc')
	state.CastingMode:options('Normal','SIRD','FullMacc','Proc')
    state.IdleMode:options('PDT','Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Tizbron','MeleeClubs','Tizalmace','Tizclub','Naegbron','MaccWeapons','None')
	state.AutoWSRestore = M(false, 'AutoWSRestore')
	state.AutoBLUSpam = M(false, 'AutoBLUSpam')
	state.AutoJumpMode = M(false, 'AutoJumpMode')
	state.MaintainAftermath	= M(true, 'Maintain Aftermath')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Schere'}

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken -10%',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.macc_unm_back 		= "Aurist's Cape +1"

	autows = 'Expiacion'

	autofood= 'Squid Sushi'

	-- Additional local binds
--	send_command('bind ^` input /ja "Chain Affinity" <me>')
--	send_command('bind @` input /ja "Efflux" <me>')
--	send_command('bind !` input /ja "Burst Affinity" <me>')
--	send_command('bind ^@!` gs c cycle SkillchainMode')
--	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
--	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
--	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
--	send_command('bind ^@!` gs c cycle MagicBurstMode')
--	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
--	send_command('bind !r gs c weapons None;gs c update')
--	send_command('bind @q gs c weapons MaccWeapons;gs c update')
--	send_command('bind ^q gs c weapons Almace;gs c update')
--	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Weapons sets
	sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.Tizclub = {main="Tizona",sub="Maxentius"}
	sets.weapons.Tizbron = {main="Tizona",sub="Machaera +2"}
	sets.weapons.MeleeClubs = {main="Maxentius",sub="Nibiru Cudgel"}
	sets.weapons.Almace = {main="Almace",sub="Sequence"}
	sets.weapons.Naegbron = {main="Naegling",sub="Machaera +2"}
	sets.weapons.Naegmace = {main="Naegling",sub="Almace"}
	sets.weapons.MaccWeapons = {main="Tizona",sub="Sakpata's Sword"}
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}


	sets.buff['Burst Affinity'] = {legs="Assim. Shalwar +3",feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +2"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +2"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +2"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {}
		
	sets.HPCure = {}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}

	sets.Enmity = {
		ammo="Sapience Orb",
		head="Rabid Visor",
		body="Emet Harness",
		neck="Unmoving Collar",
		back="Reiki Cloak",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Petrov Ring",
		right_ring="Begrudging Ring",
		}

	-- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Enmity for Provoke and other stuff
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})

	-- Fast cast sets for spells

	sets.precast.FC = {
		ammo="Sapience Orb",
		head="Amalric Coif",
		body="Vrikodara Jupon",
		hands="Leyline Gloves",
		legs="Psycloth Lappas",
		feet="Amalric Nails",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Swith Cape"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Adhemar Bonnet",
		body="Abnoba Kaftan",
		hands="Adhemar Wrist. +1",
		legs="Samnuha Tights",
		feet=gear.herculean_ta_feet,
		neck="Mirage Stole +2",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Begrudging Ring",
		back=gear.da_jse_back
	}

	sets.precast.WS.Acc = {ammo="Falcon Eye",
				  head="Carmine Mask +1",neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Telos Earring",
				  body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Epona's Ring",ring2="Ilabrat Ring",
			      back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}

	sets.precast.WS.FullAcc = {ammo="Falcon Eye",
				  head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Mache Earring +1",ear2="Odr Earring",
				  body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
			      back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.precast.WS.DT = {ammo="Aurgelmir Orb +1",
				  head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.precast.WS.Fodder = {ammo="Aurgelmir Orb +1",
				  head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket +1",hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Apate Ring",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		ammo="Aurgelmir Orb",
		head="Jhakri Coronal +2",
		neck="Fotia Gorget",
		ear1="Regal Earring",
		ear2="Moonshade Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		ring2="Epona's Ring",
		ring1="Ilabrat Ring",
		back=gear.wsd_jse_back,
		waist="Fotia Belt",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2"
	})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Requiescat'], {})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS['Requiescat'], {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
		ammo="Jukukik Feather",
		head="Adhemar Bonnet",
		body="Abnoba Kaftan",
		hands="Adhemar Wrist. +1",
		legs="Samnuha Tights",
		feet="Thereoid Greaves",
		neck="Mirage Stole +2",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Begrudging Ring",
		back=gear.crit_jse_back
	})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS['Chant du Cygne'], {
		ammo="Falcon Eye",
		legs="Carmine Cuisses +1"
	})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo="Amar Cluster",
		head="Nyame Helm",
		neck="Mirage Stole +2",
		ear1="Moonshade earring",
		ear2="Ishvara earring",
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		ring1="Karieyh ring",
		ring2="Shukuyu Ring",
		back=gear.wsd_jse_back,
		waist="Sailfi Belt +1",
		legs="Luhlaza Shalwar +3",
		feet="Nyame Sollerets"
	})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS['Savage Blade'].Acc, {})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS['Savage Blade'].FullAcc, {})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS['Savage Blade'].DT, {})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Black Halo'].Acc = set_combine(sets.precast.WS['Savage Blade'].Acc, {})
	sets.precast.WS['Black Halo'].FullAcc = set_combine(sets.precast.WS['Savage Blade'].FullAcc, {})
	sets.precast.WS['Black Halo'].DT = set_combine(sets.precast.WS['Savage Blade'].DT, {})

	sets.precast.WS['Sanguine Blade'] = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		ring1="Metamor. Ring +1",
		ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,
		waist="Orpheus's Sash",
		legs="Luhlaza Shalwar +3",
		feet="Nyame Sollerets"
	}
					
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	sets.precast.WS['Flash Nova'] = {ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Luhlaza Shalwar +3",feet="Amalric Nails +1"}
				
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast['Blue Magic'] = {
		ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +2",
		body="Assim. Jubbah +3",
		hands="Rawhide Gloves",
		feet="Luhlaza Charuqs +2",
        neck="Mirage Stole +2",
		back="Cornflower Cape",
		ear1="Njordr Earring"
	}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {
		ammo="Mavi Tathlum",
		head="Lilitu Headpiece",
		neck="Mirage Stole +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs+2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		waist="Prosilio Belt +1",
		ear1="Suppanomimi",
		ear2="Telos Earring",
		ring1="Shukuyu Ring",
		ring2="Apate Ring",
		back=gear.wsd_jse_back
	}

	sets.midcast['Blue Magic'].Physical.Resistant = set_combine(sets.midcast['Blue Magic'].Physical, {

	})

	sets.midcast['Blue Magic'].Physical.Fodder = set_combine(sets.midcast['Blue Magic'].Physical, {
		
	})

	sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {
		
	})

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = set_combine(sets.midcast['Blue Magic'].Fodder, {})

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {
		ammo="Pemphredo Tathlum",
		head=None,
		neck="Sanctity Necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
		body="Cohort Cloak +1",
		hands="Jhakri Cuffs +2",
		ring1="Metamor. Ring +1",
		ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,
		waist="Orpheus's Sash",
		legs="Luhlaza Shalwar +3",
		feet="Jhakri Pigaches +2"
		}


		sets.midcast['Tenebral Crush'] = set_combine(sets.midcast['Blue Magic'].Magical, {})

		sets.midcast['Tenebral Crush'].Resistant = set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {
			head="Assim. Keffiyeh +3",
			back="Aurist's Cape +1",
		})

	sets.midcast['Blue Magic'].Magical.SIRD = set_combine(sets.midcast['Blue Magic'].Magical,{})

	sets.midcast['Blue Magic'].Subduction = set_combine(sets.midcast['Blue Magic'].Magical,{})

	sets.midcast['Blue Magic'].Magical.Proc = set_combine(sets.midcast['Blue Magic'].Magical,{})

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{})

	sets.midcast['Blue Magic'].Magical.Fodder = set_combine(sets.midcast['Blue Magic'].Magical,{})

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical,{
		main="Tizona",
		sub="Sakpata's Sword",
		ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Mirage Stole +2",
		ear1="Digni. Earring",
		ear2="Gwati Earring",
		body="Malignance Tabard",
		hands="Nyame Gauntlets",
		ring1="Kishar Ring",
		ring2="Metamor. Ring +1",
		back="Aurist's Cape +1",
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Nyame Sollerets"
	})

	sets.midcast['Blue Magic'].Magical.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy
	sets.midcast['Blue Magic'].Subduction.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy

	sets.midcast['Enfeebling Magic'] = {
		main="Tizona",
		sub="Sakpata's Sword",
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		neck="Mirage Stole +2",
		ear1="Regal Earring",
		ear2="Digni. Earring",
		body="Jhakri Robe +2",
		hands="Regal Cuffs",
		ring1="Metamor. Ring +1",
		ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,
		waist="Acuity Belt +1",
		legs="Psycloth Lappas",
		feet="Jhakri Pigaches +2"
	}

	sets.midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		ring1="Metamor. Ring +1",
		ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,
		waist="Yamabuki-no-Obi",
		legs="Luhlaza Shalwar +3",
		feet="Jhakri Pigaches +2"
	}

	sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Sakpata's Sword",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Pukulatmuj +1",sub="Sakpata's Sword",head="Carmine Mask +1",ear2="Mimir Earring",body=gear.taeon_phalanx_body,hands=gear.herculean_phalanx_hands,legs="Carmine Cuisses +1",feet=gear.herculean_nuke_feet})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Amalric Doublet",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Luhlaza Shalwar +3",feet="Amalric Nails"}

	sets.midcast['Elemental Magic'] = {main="Maxentius",sub="Sakpata's Sword",ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet",hands="Amalric Gages",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Luhlaza Shalwar +3",feet="Amalric Nails"}

	sets.midcast['Elemental Magic'].Resistant = {main="Maxentius",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Kishar Ring"

	sets.midcast.Cure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
		back="Moonlight Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Medium's Sabots"}
		
	sets.midcast.UnlockedCure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Metamor. Ring +1",ring2="Janniston Ring",
		back="Moonlight Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = set_combine(sets.midcast['Blue Magic'].Magical, {})

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Luminary Sash",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Resistant = set_combine(sets.midcast['Blue Magic'].Stun, {})

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['Cruel Joke'] = {
		main="Tizona",
		sub="Sakpata's Sword",
		ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Mirage Stole +2",
		ear1="Digni. Earring",
		ear2="Gwati Earring",
		body="Malignance Tabard",
		hands="Nyame Gauntlets",
		ring1="Kishar Ring",
		ring2="Metamor. Ring +1",
		back="Aurist's Cape +1",
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Nyame Sollerets"
	}

	sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Hydrocera",
		head="Nyame Helm",
		body="Vrikodara Jupon",
		hands=gear.telchine_enhancing_hands,
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Mendi. Earring",
		right_ear="Odnowa Earring +1",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Lebeche Ring",
		back="Solemnity Cape",
	}

	sets.midcast['Blue Magic'].UnlockedAoEHealing = set_combine(sets.midcast['Blue Magic']['White Wind'],{})
					
	sets.midcast['Blue Magic'].AoEHealing = set_combine(sets.midcast['Blue Magic']['White Wind'],{})

	sets.midcast['Blue Magic'].Healing = set_combine(sets.midcast['Blue Magic']['White Wind'],{})
		
	sets.midcast['Blue Magic'].UnlockedHealing = set_combine(sets.midcast['Blue Magic']['White Wind'],{})

	sets.midcast['Blue Magic'].SkillBasedBuff = {
		ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +2",
		body="Assim. Jubbah +3",
		hands="Rawhide Gloves",
		feet="Luhlaza Charuqs +2",
        neck="Mirage Stole +2",
		back="Cornflower Cape",
		ear1="Njordr Earring",
		legs="Hashishin Tayt +1"

	}

	sets.midcast['Blue Magic'].Buff = set_combine(sets.midcast['Blue Magic'], {})

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif ",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif ",hands="Regal Cuffs",waist="Emphatikos Rope"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = set_combine(sets.midcast['Blue Magic'], {
		hands="Magus Bazubands",
	})

	-- Resting sets
	sets.resting = sets.idle

	-- Idle sets
	sets.idle = {
		ammo="Staunch Tathlum",
		head="Rawhide Mask",
		neck="Sanctity Necklace", 
		ear1="Infused Earring", 
		ear2="Eabani Earring",
		body="Jhakri Robe +2",
		hands=gear.herculean_refresh_hands,
		ring1="Sheltered Ring",
		ring2="Chirich Ring +1",
		back="Solemnity Cape",
		waist="Flume Belt +1",
		legs="Carmine Cuisses +1",
		feet=gear.herculean_refresh_feet
	} 

	-- sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		neck="Loricate Torque +1", 
		ear1="Etiolation Earring", 
		ear2="Eabani Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Gelatinous Ring +1",
		back="Solemnity Cape",
		waist="Flume Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.idle.Town = set_combine(sets.idle, {})

	-- sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {main="Sakpata's Sword",sub="Genmei Shield",ammo="Staunch Tathlum",
	head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
	body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
	back="Shadow Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = sets.defense.PDT

    sets.defense.MEVA = sets.defense.PDT

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
		hands=gear.herculean_treasure_hands,
		feet=gear.herculean_treasure_feet
	})
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}
	sets.Schere = {ear1="Schere Earring"}

	-- Engaged sets

	sets.engaged = {
		-- squishy
		--		ammo="Ginsen",
		--		head="Adhemar Bonnet",
		--		body="Adhemar Jacket",
		--		hands="Adhemar Wrist. +1",
		--		legs="Samnuha Tights",
		--		feet=gear.herculean_ta_feet,
		--		neck="Mirage Stole +2",
		--		waist="Windbuffet Belt +1",
		--		ear1="Cessance Earring",
		--		ear2="Brutal Earring",
		--		ring1="Epona's Ring",
		--		ring2="Petrov Ring",
		--		back=gear.da_jse_back

		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		neck="Mirage Stole +2",
		ear1="Telos Earring",
		ear2="Cessance Earring",
		body="Malignance Tabard",
		hands="Adhemar Wrist. +1",
		ring1="Epona's Ring",
		ring2="Chirich Ring +1",
		back=gear.da_jse_back,
		waist="Reiki Yotai",
		legs="Malignance Tights",
		feet="Malignance Boots"
			}

	sets.engaged.AM = set_combine(sets.engaged, {})


	sets.engaged.Acc = set_combine(sets.engaged,{
		ammo="Ginsen",
		ring1="Cacoethic Ring +1",
	})


	sets.engaged.Acc.AM = set_combine(sets.engaged.AM,{
		ammo="Ginsen",
		ring1="Cacoethic Ring +1",
	})

	sets.engaged.FullAcc = set_combine(sets.engaged.Acc,{
		legs="Carmine Cuisses +1",
	})
	sets.engaged.FullAcc.AM = set_combine(sets.engaged.Acc.AM,{
		legs="Carmine Cuisses +1",
	})
	sets.engaged.Fodder = set_combine(sets.engaged,{})
	sets.engaged.Fodder.AM = set_combine(sets.engaged.AM,{})
	sets.engaged.DT = {
			ammo="Staunch Tathlum", -- 2 dt
			head="Malignance Chapeau", -- 6 dt
			neck="Mirage Stole +2",
			ear1="Telos Earring",
			ear2="Cessance Earring",
			body="Malignance Tabard", -- -- 9 dt
			hands="Adhemar Wrist. +1",
			ring1="Defending Ring", -- 10 dt
			ring2="Epona's Ring",
			back=gear.da_jse_back, -- 10 pdt
			waist="Reiki Yotai",
			legs="Malignance Tights", -- 7 dt
			feet="Malignance Boots" -- 4 dt
			}

	sets.engaged.DT.AM = set_combine(sets.engaged.DT,{
		ear2="Cessance Earring",
		waist="Windbuffet Belt +1",
	})

	sets.engaged.Acc.DT = set_combine(sets.engaged.DT,{
		amnmo="Falcon Eye",
		ring2="Chirich Ring +1"
	})
	sets.engaged.Acc.DT.AM = set_combine(sets.engaged.DT.AM,{
		amnmo="Falcon Eye",
		ring2="Chirich Ring +1"
	})
	sets.engaged.FullAcc.DT = set_combine(sets.engaged.Acc.DT,{})
	sets.engaged.Fodder.DT = set_combine(sets.engaged.DT,{})
	sets.engaged.Fodder.DT.AM = set_combine(sets.engaged.DT.AM,{})
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",head="Amalric Coilf"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",legs="Assim. Shalwar +3",ring1="Mujin Band",ring2="Locus Ring"}
	sets.Phalanx_Received = {hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
end

autows_list = {['Tizbron']='Expiacion',['Tizalmace']='Expiacion',['Almace']='Chant Du Cygne',['MeleeClubs']='Black Halo',
['HybridWeapons']='Sanguine Blade',['Naegbron']='Savage Blade',['Naegmace']='Savage Blade',['MaccWeapons']='Expiacion'}	

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},
	--	{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	When='Always'},
	--	{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Combat'},
	},
	
	Default = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
	--	{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	Reapply=false},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	Reapply=false},
	},
	
	Cleave = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	Reapply=false},
		{Name='Memento Mori',		Buff='Magic Atk. Boost',SpellID=538,	Reapply=false},
	},
}