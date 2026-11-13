-- Skulker's Bonnet +3 and Vest +3: stock rows are unimplemented stubs
-- (no ilevel, jobs, model or mods). Stats are scaled up from the +1 versions,
-- not retail values. The rest of the +2/+3 set is still stubbed.
-- Listed in modules/init.txt so dbtool re-applies it. Safe to run repeatedly.

-- ilevel 119, THF only, model 287, head / body slot
REPLACE INTO `item_equipment` VALUES (23425,'skulkers_bonnet_+3',99,119,32,287,0,0,16,0,0,0);
REPLACE INTO `item_equipment` VALUES (23492,'skulkers_vest_+3',99,119,32,287,0,0,32,0,0,0);

DELETE FROM `item_mods` WHERE `itemId` IN (23425, 23492);

-- Skulker's Bonnet +3
INSERT INTO `item_mods` VALUES (23425,1,130);   -- DEF: 130
INSERT INTO `item_mods` VALUES (23425,2,55);    -- HP: 55
INSERT INTO `item_mods` VALUES (23425,8,30);    -- STR: 30
INSERT INTO `item_mods` VALUES (23425,9,45);    -- DEX: 45
INSERT INTO `item_mods` VALUES (23425,10,25);   -- VIT: 25
INSERT INTO `item_mods` VALUES (23425,11,30);   -- AGI: 30
INSERT INTO `item_mods` VALUES (23425,12,22);   -- INT: 22
INSERT INTO `item_mods` VALUES (23425,13,22);   -- MND: 22
INSERT INTO `item_mods` VALUES (23425,14,22);   -- CHR: 22
INSERT INTO `item_mods` VALUES (23425,25,40);   -- ACC: 40
INSERT INTO `item_mods` VALUES (23425,29,5);    -- MDEF: 5
INSERT INTO `item_mods` VALUES (23425,31,70);   -- MEVA: 70
INSERT INTO `item_mods` VALUES (23425,68,60);   -- EVA: 60
INSERT INTO `item_mods` VALUES (23425,302,6);   -- TRIPLE_ATTACK: 6
INSERT INTO `item_mods` VALUES (23425,384,800); -- HASTE_GEAR: 800

-- Skulker's Vest +3
INSERT INTO `item_mods` VALUES (23492,1,160);   -- DEF: 160
INSERT INTO `item_mods` VALUES (23492,2,80);    -- HP: 80
INSERT INTO `item_mods` VALUES (23492,8,35);    -- STR: 35
INSERT INTO `item_mods` VALUES (23492,9,53);    -- DEX: 53
INSERT INTO `item_mods` VALUES (23492,10,30);   -- VIT: 30
INSERT INTO `item_mods` VALUES (23492,11,35);   -- AGI: 35
INSERT INTO `item_mods` VALUES (23492,12,25);   -- INT: 25
INSERT INTO `item_mods` VALUES (23492,13,25);   -- MND: 25
INSERT INTO `item_mods` VALUES (23492,14,25);   -- CHR: 25
INSERT INTO `item_mods` VALUES (23492,29,8);    -- MDEF: 8
INSERT INTO `item_mods` VALUES (23492,31,80);   -- MEVA: 80
INSERT INTO `item_mods` VALUES (23492,68,65);   -- EVA: 65
INSERT INTO `item_mods` VALUES (23492,81,35);   -- DAGGER skill: 35
INSERT INTO `item_mods` VALUES (23492,384,600); -- HASTE_GEAR: 600
