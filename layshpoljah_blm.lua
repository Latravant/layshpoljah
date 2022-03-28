-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
    
    state.MagicBurst = M(false, 'Magic Burst')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

    
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>')

    select_default_macro_book()
	send_command('wait 2; input /lockstyleset 1')
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {body="arch. coat +2"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {    main={ name="Nibiru Staff", augments={'Pet: Mag. Acc.+20','Pet: "Mag.Atk.Bns."+20','Pet: "Regen"+2',}},
		ammo="Impatiens",
		head={ name="Merlinic Hood", augments={'Crit.hit rate+4','INT+10','Accuracy+2 Attack+2','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
		body="Mallquis Saio +2",
		hands="Mallquis Cuffs +2",
		legs="Mallquis Trews +2",
		feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Crit.hit rate+2','Accuracy+1 Attack+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		waist="Witful Belt",
		left_ear="Enchntr. Earring +1",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Weatherspoon Ring",
		back="Swith Cape",}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ear2="earthcry earring",waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris", back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Hagondes Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Icesoul Ring",
        back="Refraction Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Colossus's Torque",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        head="befouled crown",
		neck="Colossus's Torque",
        body="Manasa Chasuble",hands="Ayao's Gages",
        legs="Portent Pants"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast['Enfeebling Magic'] = {    main="Kaja Staff",
		sub="Enki Strap",
		ammo="Kalboron Stone",
		head="Befouled Crown",
		body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		hands="Regal Cuffs",
		legs={ name="Arch. Tonban +2", augments={'Increases Elemental Magic debuff time and potency',}},
		feet="Mallquis Clogs +2",
		neck="Sorcerer's Stole",
		waist="Hachirin-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Vor Earring",
		left_ring="Jhakri Ring",
		right_ring="Weather. Ring",
		back={ name="Taranus's Cape", augments={'INT+10','Mag. Acc+10 /Mag. Dmg.+10','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {    hands={ name="Arch. Gloves +1", augments={'Increases Elemental Magic accuracy',}},
		legs="Spae. Tonban +1",
		feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Crit.hit rate+2','Accuracy+1 Attack+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		neck="Erra Pendant",
		waist="Hachirin-no-Obi",
		right_ear="Abyssal Earring",
		right_ring="Shiva Ring +1",}

    sets.midcast.Drain = {    hands={ name="Arch. Gloves +1", augments={'Increases Elemental Magic accuracy',}},
		legs="Spae. Tonban +1",
		feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Crit.hit rate+2','Accuracy+1 Attack+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		neck="Erra Pendant",
		waist="Hachirin-no-Obi",
		right_ear="Abyssal Earring",
		right_ring="Shiva Ring +1",}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Bokwus Boots"}

    sets.midcast.BardSong = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}


    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {   main={ name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
		sub="Elder's Grip +1",
		ammo="Erlene's Notebook",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Sanctity Necklace",
		waist="Hachirin-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Taranus's Cape", augments={'INT+10','Mag. Acc+10 /Mag. Dmg.+10','Magic Damage +10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}

    sets.midcast['Elemental Magic'].Resistant = {main="Lehbrailg +2",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Hagondes Coat",hands=gear.macc_hagondes,ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Bokwus Boots"}

    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})


    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main="Earth Staff", sub="Mephitis Grip",ammo="Impatiens",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Manasa Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Nares Trews",feet="Chelona Boots +1"}


    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",ammo="Clarus Stone",
        head="Nefer Khat +1",neck="Grandiose Chain",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {    main="Owleyes",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		body="Shamash Robe",
		hands="Serpentes Cuffs",
		legs="Miasmic Pants",
		feet="Serpentes Sabots",
		neck="Chrys. Torque",
		waist="Witful Belt",
		left_ear="ethereal earring",
		right_ear="moonshade earring",
		left_ring="Insect Ring",
		back="Solemnity Cape",
		}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {    main="Mafic Cudgel",
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body="Shamash Robe",
		hands="Mallquis Cuffs +2",
		legs="Mallquis Trews +2",
		feet="Mallquis Clogs +2",
		neck="Twilight Torque",
		waist="Witful Belt",
		left_ear="Colossus's Earring",
		left_ring="Defending Ring",
		right_ring="Chirich Ring",
		back="Solemnity Cape",}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Hagondes Sabots"}
    
    -- Town gear.
    sets.idle.Town = set_combine(sets.idle, {feet="Herald's Gaiters"})
        
    -- Defense sets

    sets.defense.PDT = sets.idle.PDT

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.magic_burst = {neck="Mizukage-no-Kubikazari"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {    main={ name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
		sub="Dilet.'s Grip +1",
		ammo="Hasty Pinion +1",
		head={ name="Merlinic Hood", augments={'Crit.hit rate+4','INT+10','Accuracy+2 Attack+2','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
		body={ name="Merlinic Jubbah", augments={'STR+7','"Fast Cast"+2','Magic Damage +7','Accuracy+15 Attack+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		hands="Jhakri Cuffs +2",
		legs="Mallquis Trews +2",
		feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Crit.hit rate+2','Accuracy+1 Attack+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		neck="Asperity Necklace",
		waist="Olseni Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Chirich Ring",
		right_ring="Chirich Ring",
		back="Solemnity Cape",}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        elseif spell.skill == 'Elemental Magic' then
            state.MagicBurst:reset()
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 15)
end
