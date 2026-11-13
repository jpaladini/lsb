-----------------------------------
-- Trust: Claude
-- The All-In-One Beast
-- Tanks, heals, buffs, debuffs, nukes
-- and hits like an absolute truck
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    -- No teamwork messages needed - Claude works alone just fine
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    -----------------------------------------------
    -- BEAST MODE STATS
    -----------------------------------------------
    -- Melee power
    mob:addMod(xi.mod.ATT, 200)          -- +200 Attack
    mob:addMod(xi.mod.ACC, 200)          -- +200 Accuracy
    mob:addMod(xi.mod.DEF, 200)          -- +200 Defense
    mob:addMod(xi.mod.EVA, 100)          -- +100 Evasion

    -- Magic power
    mob:addMod(xi.mod.MATT, 150)         -- +150 Magic Attack Bonus
    mob:addMod(xi.mod.MACC, 150)         -- +150 Magic Accuracy
    mob:addMod(xi.mod.MAGIC_DAMAGE, 100) -- +100 Magic Damage

    -- Multi-attack (stacking madness)
    mob:addMod(xi.mod.DOUBLE_ATTACK, 30) -- 30% Double Attack
    mob:addMod(xi.mod.TRIPLE_ATTACK, 20) -- 20% Triple Attack
    mob:addMod(xi.mod.CRITHITRATE, 30)   -- 30% Crit Rate

    -- TP and speed
    mob:addMod(xi.mod.STORETP, 50)       -- +50 Store TP (WS faster)
    mob:addMod(xi.mod.REGAIN, 150)       -- Passive TP regen
    mob:addMod(xi.mod.HASTE_MAGIC, 3000) -- 30% Magic Haste (cap)

    -- Casting
    mob:addMod(xi.mod.FASTCAST, 50)      -- 50% Fast Cast
    mob:addMod(xi.mod.CURE_POTENCY, 30)  -- +30% Cure Potency

    -- Sustain (never dies, never runs out of MP)
    mob:addMod(xi.mod.REFRESH, 50)       -- +50 MP/tick (infinite MP)
    mob:addMod(xi.mod.REGEN, 30)         -- +30 HP/tick
    mob:addMod(xi.mod.DMG, -2000)        -- Massive damage reduction

    -- Weapon skill accuracy
    mob:addMod(xi.mod.WSACC, 100)        -- +100 WS Accuracy

    -----------------------------------------------
    -- AI GAMBITS (evaluated top to bottom, first match wins)
    -----------------------------------------------

    -- === EMERGENCY HEALING (highest priority) ===
    -- Emergency self-heal
    mob:addGambit(ai.t.SELF, { ai.c.HPP_LT, 30 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    -- Emergency party heal
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 30 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    -- === RAISE DEAD ===
    mob:addGambit(ai.t.PARTY_DEAD, { ai.c.ALWAYS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.RAISE_III })

    -- === PARTY HEALING ===
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 70 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    -- === STATUS REMOVAL ===
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.POISON }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.PARALYSIS }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.BLINDNESS }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.PETRIFICATION }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.CURSE_I }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURSNA })

    -- === BUFFS ===
    -- Haste melee party members
    mob:addGambit(ai.t.MELEE, { ai.c.NOT_STATUS, xi.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE })

    -- Refresh casters and tanks
    mob:addGambit(ai.t.CASTER, {
        { ai.c.NOT_STATUS, xi.effect.REFRESH },
        { ai.c.NOT_STATUS, xi.effect.SUBLIMATION_ACTIVATED },
        { ai.c.NOT_STATUS, xi.effect.SUBLIMATION_COMPLETE },
    }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH })
    mob:addGambit(ai.t.TANK, { ai.c.NOT_STATUS, xi.effect.REFRESH }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH })

    -- Protect and Shell everyone
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA })

    -- Phalanx on whoever has hate
    mob:addGambit(ai.t.TOP_ENMITY, { ai.c.NOT_STATUS, xi.effect.PHALANX }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PHALANX_II })

    -- Stoneskin on self
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.STONESKIN }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONESKIN })

    -- === TANKING ===
    -- Flash the target
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH }, 15)

    -- === DEBUFFS ===
    -- Dispel enemy buffs
    mob:addGambit(ai.t.TARGET, { ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DISPEL })

    -- Slow the enemy
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW }, 60)

    -- Paralyze the enemy
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.PARALYSIS }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE }, 60)

    -- Dia for defense down
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.DIA }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DIA }, 60)

    -- === NUKING ===
    -- Magic burst when skillchain is open
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE })

    -- Nuke when no skillchain (30 second cooldown)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE }, 30)

    -----------------------------------------------
    -- COMBAT SETTINGS
    -----------------------------------------------
    -- Stay in melee range, auto-attack ON
    mob:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.MELEE)

    -- Weaponskill settings: close skillchains when possible, otherwise WS at 2000+ TP
    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 2000)
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject
