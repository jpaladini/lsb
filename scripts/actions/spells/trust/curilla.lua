-----------------------------------
-- Trust: Curilla (BEAST MODE)
-- All-in-one god tier trust
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
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.TRION] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.RAINEMARD] = xi.trust.messageOffset.TEAMWORK_2,
        [xi.magic.spell.RAHAL] = xi.trust.messageOffset.TEAMWORK_3,
        [xi.magic.spell.HALVER] = xi.trust.messageOffset.TEAMWORK_4,
    })

    -----------------------------------------------
    -- BEAST MODE STATS
    -----------------------------------------------
    -- 3x HP pool
    mob:addMod(xi.mod.HPP, 200)

    -- Massive melee power
    mob:addMod(xi.mod.ATT, 500)
    mob:addMod(xi.mod.ACC, 400)
    mob:addMod(xi.mod.DEF, 400)
    mob:addMod(xi.mod.EVA, 200)

    -- Magic power
    mob:addMod(xi.mod.MATT, 300)
    mob:addMod(xi.mod.MACC, 300)
    mob:addMod(xi.mod.MAGIC_DAMAGE, 200)

    -- Multi-hit madness
    mob:addMod(xi.mod.DOUBLE_ATTACK, 40)
    mob:addMod(xi.mod.TRIPLE_ATTACK, 25)
    mob:addMod(xi.mod.CRITHITRATE, 40)

    -- TP and speed
    mob:addMod(xi.mod.STORETP, 75)
    mob:addMod(xi.mod.REGAIN, 200)
    mob:addMod(xi.mod.HASTE_MAGIC, 3000)

    -- Casting
    mob:addMod(xi.mod.FASTCAST, 80)
    mob:addMod(xi.mod.CURE_POTENCY, 100)
    mob:addMod(xi.mod.CURE_POTENCY_II, 30)
    mob:addMod(xi.mod.MND, 200)

    -- Sustain
    mob:addMod(xi.mod.REFRESH, 50)
    mob:addMod(xi.mod.REGEN, 50)
    mob:addMod(xi.mod.DMG, -3000)

    -- WS power
    mob:addMod(xi.mod.WSACC, 200)

    -----------------------------------------------
    -- AI GAMBITS
    -----------------------------------------------
    -- Emergency heals
    mob:addGambit(ai.t.SELF, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 40 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    -- Raise dead
    mob:addGambit(ai.t.PARTY_DEAD, { ai.c.ALWAYS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.RAISE_III })

    -- Party healing
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 85 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE })

    -- Status removal
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.POISON }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.PARALYSIS }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.BLINDNESS }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.PETRIFICATION }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, xi.effect.CURSE_I }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURSNA })

    -- Buffs
    mob:addGambit(ai.t.MELEE, { ai.c.NOT_STATUS, xi.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE })
    mob:addGambit(ai.t.CASTER, { ai.c.NOT_STATUS, xi.effect.REFRESH }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.STONESKIN }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONESKIN })

    -- Tanking
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.SENTINEL }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL })
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH }, 15)

    -- Debuffs
    mob:addGambit(ai.t.TARGET, { ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DISPEL })
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.PARALYSIS }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.DIA }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DIA }, 60)

    -- Nuking
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE })
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE }, 30)

    -----------------------------------------------
    -- COMBAT SETTINGS
    -----------------------------------------------
    mob:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.MELEE)
    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.SPECIFIC, 42) -- Savage Blade spam at 1000 TP
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject
