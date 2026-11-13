-- Nyame helm / gauntlets / flanchard / sollerets: bake an approximation of
-- Odyssey Path B into the base item mods (ATT/RATT +35, ACC/RACC +10,
-- Double Attack +5, Weapon Skill Damage +11). These do not show in the tooltip.
-- Listed in modules/init.txt so dbtool re-applies it. Safe to run repeatedly.

DELETE FROM `item_mods` WHERE `itemId` IN (23761, 23775, 23782, 23789) AND `modId` IN (23, 24, 25, 26, 288, 570);

-- Nyame helm
INSERT INTO `item_mods` VALUES (23761,23,65);  -- ATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23761,24,65);  -- RATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23761,25,50);  -- ACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23761,26,50);  -- RACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23761,288,5);  -- DOUBLE_ATTACK: 5
INSERT INTO `item_mods` VALUES (23761,570,11); -- WEAPONSKILL_DAMAGE_BASE: 11

-- Nyame gauntlets
INSERT INTO `item_mods` VALUES (23775,23,65);  -- ATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23775,24,65);  -- RATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23775,25,50);  -- ACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23775,26,50);  -- RACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23775,288,5);  -- DOUBLE_ATTACK: 5
INSERT INTO `item_mods` VALUES (23775,570,11); -- WEAPONSKILL_DAMAGE_BASE: 11

-- Nyame flanchard
INSERT INTO `item_mods` VALUES (23782,23,65);  -- ATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23782,24,65);  -- RATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23782,25,50);  -- ACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23782,26,50);  -- RACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23782,288,5);  -- DOUBLE_ATTACK: 5
INSERT INTO `item_mods` VALUES (23782,570,11); -- WEAPONSKILL_DAMAGE_BASE: 11

-- Nyame sollerets
INSERT INTO `item_mods` VALUES (23789,23,65);  -- ATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23789,24,65);  -- RATT: 65 (stock 30)
INSERT INTO `item_mods` VALUES (23789,25,50);  -- ACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23789,26,50);  -- RACC: 50 (stock 40)
INSERT INTO `item_mods` VALUES (23789,288,5);  -- DOUBLE_ATTACK: 5
INSERT INTO `item_mods` VALUES (23789,570,11); -- WEAPONSKILL_DAMAGE_BASE: 11
