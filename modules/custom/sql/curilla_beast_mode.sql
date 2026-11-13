-- Curilla "beast mode" trust: database side.
-- Pairs with scripts/actions/spells/trust/curilla.lua.
--
-- dbtool re-imports the stock sql/ tables on every update, which resets these
-- rows. Listing this file in modules/init.txt makes dbtool re-apply it after
-- each import. It is safe to run repeatedly, by dbtool or by hand.

-- 5x melee damage (stock cmbDmgMult is 100)
UPDATE `mob_pools` SET `cmbDmgMult` = 500 WHERE `poolid` = 5902;

-- Weapon skills: Savage Blade only (stock: Red Lotus, Seraph, Swift Blade)
DELETE FROM `mob_skill_lists` WHERE `skill_list_id` = 1017;
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Curilla',1017,42); -- Savage Blade

-- Spell list: stock is Cure I-IV and Flash; expanded for the gambits in curilla.lua
DELETE FROM `mob_spell_lists` WHERE `spell_list_id` = 314;
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,1,5,255); -- cure
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,2,17,255); -- cure_ii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,3,30,255); -- cure_iii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,4,55,255); -- cure_iv
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,5,1,255); -- cure_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,6,1,255); -- cure_vi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,7,1,255); -- curaga
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,8,1,255); -- curaga_ii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,9,1,255); -- curaga_iii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,10,1,255); -- curaga_iv
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,11,1,255); -- curaga_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,12,1,255); -- raise
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,13,1,255); -- raise_ii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,14,1,255); -- poisona
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,15,1,255); -- paralyna
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,16,1,255); -- blindna
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,17,1,255); -- silena
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,18,1,255); -- stona
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,19,1,255); -- viruna
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,20,1,255); -- cursna
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,22,1,255); -- holy_ii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,25,1,255); -- dia_iii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,47,1,255); -- protect_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,52,1,255); -- shell_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,54,1,255); -- stoneskin
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,57,1,255); -- haste
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,79,1,255); -- slow_ii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,80,1,255); -- paralyze_ii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,109,1,255); -- refresh
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,112,45,255); -- flash
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,116,1,255); -- hailstorm
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,129,1,255); -- protectra_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,134,1,255); -- shellra_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,140,1,255); -- raise_iii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,143,1,255); -- erase
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,153,1,255); -- blizzard_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,168,1,255); -- thunder_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,173,1,255); -- water_v
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,260,1,255); -- dispel
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,477,1,255); -- regen_iv
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,511,1,255); -- haste_ii
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Curilla',314,894,1,255); -- ?
