function job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','MDT')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','EnspellOnly')
	
	gear.stp_jse_back = {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.nuke_jse_back = {name="Sucellos's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	gear.wsd_STR_jse_back = {name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.fc_jse_back = {name="Sucellos's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+5','"Fast Cast"+10','Spell interruption rate down-10%',}}
	gear.dt_jse_back = {name="Sucellos's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Damage taken-5%',}}
		-- Additional local binds
	
	select_default_macro_book()
	send_command('gs c enable all')	
	send_command('wait 2; input /lockstyleset 1')
	
end

function user_unload()
    send_command('clearbinds')
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +2"}
	
	-- Fast cast sets for spells
	
	sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range=empty,ammo="Sapience Orb",
		head="Atro. Chapeau +2",body="Viti. Tabard +2",hands="Amalric Gages +1",legs="Volte Brais",
		feet="Amalric Nails +1",neck="Baetyl Pendant",waist="Embla Sash",left_ear="Loquac. Earring",
		right_ear="Enchntr. Earring +1",left_ring="Kishar Ring",right_ring="Weather. Ring",back=gear.fc_jse_back}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Culminus"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range=empty,ammo="Voluspa Tathlum",
		head="Viti. Chapeau +2",neck="Asperity Necklace",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Atrophy gloves +2",ring1="Pernicious Ring",ring2="K'ayres Ring",
		back="Atheling mantle",waist="Windbuffet Belt +1",legs="Jhakri slops +2",feet="Nyame sollerets"}
			
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {range=empty,ammo="Regal Gem",
		head="Viti. Chapeau +2",body="Lethargy Sayon +2",hands="Atrophy Gloves +2",legs="Nyame Flanchard",
		feet="Nyame Sollerets",neck="Rep. Plat. Medal",waist="Sailfi Belt +1",left_ear="Regal Earring",
		right_ear="Sherida Earring",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",back=gear.wsd_STR_jse_back}
	
	sets.precast.WS['Chant Du Cygne'] = {range=empty,ammo="Voluspa Tathlum",
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Merlinic Shalwar",
		feet="Aya. Gambieras +2",neck="Rep. Plat. Medal",waist="Sailfi Belt +1",left_ear="Telos Earring",
		right_ear="Sherida Earring",left_ring="Pernicious Ring",right_ring="Hetairoi Ring",back=gear.wsd_STR_jse_back}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = {range=empty,ammo="Voluspa Tathlum",
		head="Viti. Chapeau +2",body="Nyame Mail",hands="Jhakri Cuffs +2",legs="Nyame Flanchard",
		feet="Nyame Sollerets",neck="Rep. Plat. Medal",waist="Cornelia's Belt",left_ear="Telos Earring",
		right_ear="Sherida Earring",left_ring="Pernicious Ring",right_ring="Hetairoi Ring",back=gear.wsd_STR_jse_back}
		
	sets.precast.WS['Sanguine Blade'] = {range=empty,ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body=gear.merlinic_nuke_body,hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Archon Ring",
		back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
	sets.precast.WS['Seraph Blade'] = {range=empty,ammo="Pemphredo Tathlum",
		head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body=gear.merlinic_nuke_body,hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
		back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
	sets.precast.WS['Aeolian Edge'] = {range=empty,ammo="Pemphredo Tathlum",
		head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body=gear.merlinic_nuke_body,hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Freke Ring",
		back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet="Amalric Nails +1"}

	-- Midcast Sets

	sets.TreasureHunter = sets.TreasureHunter
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Alber Strap",head="Ea Hat +1",neck="Mizu. Kubikazari",body="Ea Houppe. +1",hands="Amalric Gages +1",ring1="Mujin Band",
		legs="Ea Slops +1",feet="Jhakri Pigaches +2"}
	
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range=empty,ammo="Hasty Pinion +1",
		head="Atrophy Chapeau +2",neck="Baetyl pendant",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.fc_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Medium's Sabots"}

    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Viti. Tabard +2",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back=gear.dt_jse_back,waist="Luminary Sash",legs="Carmine Cuisses",feet="Kaykaus Boots"}
		
    sets.midcast.LightWeatherCure = {main="Iridal Staff",sub="Curatio Grip",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back=gear.dt_jse_back,waist="Hachirin-no-Obi",legs="Carmine Cuisses",feet="Kaykaus Boots"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back=gear.dt_jse_back,waist="Hachirin-no-Obi",legs="Carmine Cuisses",feet="Kaykaus Boots"}
		
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {main="Colada", sub="Ammurapi Shield",range=empty, ammo="Staunch Tathlum",
    head="Telchine Cap",body="Viti. Tabard +2",hands="Atrophy Gloves +2", legs="Aya. Cosciales +2", feet="Leth. Houseaux +1",
    neck="Baetyl Pendant", waist="Embla Sash", left_ear="Augment. Earring", right_ear="Mimir Earring",
    left_ring="Stikini Ring +1", right_ring="Stikini Ring +1", back=gear.fc_jse_back,}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel +1",body="Lethargy Sayon +2",hands="Leth. Gantherots +1",
		legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {main="Pukulatmuj +1",head="Befouled Crown",neck="Incanter's Torque",ear2="Mimir Earring",
		hands="Viti. Gloves +2",back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +2"}
		
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +2",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub="Pukulatmuj"})
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub="Pukulatmuj"})
	sets.midcast.BoostStat = {hands="Viti. Gloves +2"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield",range=empty,ammo="Regal Gem",
		head="Viti. Chapeau +2",body="Lethargy Sayon +2",hands="Regal Cuffs",legs="Chironic Hose",feet="Vitiation Boots +2",
		neck="Imbodla Necklace",waist="Rumination Sash",left_ear="Snotra Earring",right_ear="Regal Earring",
		left_ring="Kishar Ring",right_ring="Stikini Ring +1",back=gear.fc_jse_back,}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main=gear.grioavolr_fc_staff,sub="Enki Strap",range=empty,ammo="Regal Gem",
		head="Viti. Chapeau +2",body="Atrophy Tabard +2",hands="Malignance Gloves",legs="Volte Brais",
		feet="Nyame Sollerets",neck="Imbodla Necklace",waist="Rumination Sash",left_ear="Snotra Earring",
		right_ear="Regal Earring",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",back=gear.fc_jse_back,}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {main="Bunzi's Rod",body="Atrophy Tabard +2",range="Kaja Bow"})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {ear1="Vor Earring",hands="Leth. Gantherots +1",ring1="Stikini Ring +1",legs="Psycloth Lappas"})
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast['Elemental Magic'] = {main=gear.grioavolr_fc_staff,sub="Enki Strap",range=empty,ammo="Ghastly Tathlum +1",
		head="Amalric Coif +1",body="Amalric Doublet +1",hands="Amalric Gages +1",
		legs="Amalric Slops +1",feet="Amalric Nails +1",neck="Baetyl Pendant",
		waist="Acuity Belt +1",left_ear="Friomisi Earring",right_ear="Regal Earring",
		left_ring="Shiva Ring +1",right_ring="Shiva Ring +1",back="Taubran Cape",}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range=empty,ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Dls. Torque +2",ear1="Regal Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Amalric Nails +1"}
		
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinic_nuke_head,ammo="Pemphredo Tathlum",ear1="Regal Earring",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=gear.merlinic_nuke_head,ear1="Regal Earring",ring1="Metamor. Ring +1"})
		
	sets.midcast.Impact = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Crepuscular Cloak",hands="Leth. Gantherots +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Merlinic Shalwar",feet="Amalric Nails +1"}

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Atrophy Tabard +2",hands="Leth. Gantherots +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Amalric Nails +1"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		head="Atrophy Chapeau +2",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Sailfi Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Stun.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Kaja Bow",ammo=empty,
		head="Atrophy Chapeau +2",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Atrophy Tabard +2",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Viti. Tabard +2",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back=gear.dt_jse_back,waist="Luminary Sash",legs="Carmine Cuisses",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Iridal Staff",sub="Oneiros Grip",range=empty,ammo="Impatiens",
		head="Viti. Chapeau +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Lengo Pants",feet=gear.chironic_refresh_feet}
	

	-- Idle sets
	sets.idle = {main="Mafic Cudgel",sub="Evalach +1",range=empty,ammo="Staunch Tathlum",
		head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",
		legs="Nyame Flanchard",feet="Nyame Sollerets",neck="Warder's Charm +1",
		waist="Carrier's Sash",left_ear="Hearty Earring",right_ear="Ethereal Earring",
		left_ring="Defending Ring",right_ring="Waterfall Ring",back=gear.dt_jse_back}
		
	sets.idle.PDT = set_combine({sub="Genmei shield",neck="Elite Royal Collar",ear1="Colossus's Earring",waist="Flume Belt +1"})
		
	sets.idle.MDT = set_combine({main="Daybreak",sub="Ammurapi shield",ear1="Etiolation Earring",ear2="Flashward earring",back="Mubvum. mantle",})
		
	-- Defense sets
	sets.defense.PDT = sets.idle.PDT 

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = sets.idle.MDT
		
    sets.defense.MEVA = {main="Daybreak",sub="Culminus",range=empty,ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.dt_jse_back,waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.Kiting = {legs="Carmine Cuisses"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.lowMP = {main={ name="Emissary", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+20','"Refresh"+1',}},
		sub="Evalach +1",range=empty,ammo="Homiliary",head="Viti. Chapeau +2",body="Jhakri Robe +2",
		hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets",
		neck="Sibyl scarf",waist="Fucho-no-Obi",left_ear="Moonshade Earring",right_ear="Ethereal Earring",
		left_ring="Stikini ring +1",right_ring="Stikini ring +1",back=gear.dt_jse_back,}
	
	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling",sub="Culminus",range=empty}
	sets.weapons.EnspellOnly = {main="Norgish Dagger",sub="Aern Dagger",range="Kaja Bow",ammo="Beetle Arrow"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses",feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Focal Orb",
		head="Malignance Chapeau", body="Malignance Tabard",  hands="Malignance Gloves", legs="Zoar Subligar",
		feet="Nyame Sollerets", neck="Asperity Necklace", waist="Sailfi Belt", left_ear="Telos Earring",
		right_ear="Sherida Earring", left_ring="Pernicious Ring", right_ring="Hetairoi Ring", back="Atheling Mantle",}
		
	sets.engaged.EnspellOnly = {
		head="Malignance Chapeau",neck="Dls. Torque +2",ear1="Suppanomimi",ear2="Digni. Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Metamor. Ring +1",ring2="Ramuh Ring +1",
		back="Ghostfyre Cape",waist="Windbuffet Belt +1",legs="Carmine Cuisses",feet="Malignance Boots"}

	sets.engaged.DT = {ammo="Focal Orb",
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",
		legs="Nyame Flanchard",feet="Nyame Sollerets",back=gear.dt_jse_back,
		neck="Sanctity Necklace",waist="Windbuffet Belt +1",left_ear="Telos Earring",
		right_ear="Sherida Earring",left_ring="Defending Ring",right_ring="Chirich Ring",}
		
		
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
		set_macro_page(1, 2)
end


autows_list = {['Naegling']='Savage Blade',['DualWeapons']='Savage Blade',['DualWeaponsAcc']='Savage Blade',['DualEvisceration']='Evisceration',['DualClubs']='Black Halo',['DualAeolian']='Aeolian Edge',['EnspellDW']='Sanguine Blade'}
