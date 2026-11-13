-- Skulker's Bonnet +3 and Vest +3: stock rows are unimplemented stubs
-- (no ilevel, jobs, model or mods). None of these are retail values:
-- bonnet and vest are scaled up from the +1 versions; armlets, culottes and
-- poulaines are the stock +2 mods with a small bump (DEF/HP/ATT/ACC/MACC/
-- MEVA/EVA +10, base stats +5, MDEF +1). The +2 set is still stubbed.
-- Listed in modules/init.txt so dbtool re-applies it. Safe to run repeatedly.

-- ilevel 119, THF only, model 287, correct slot per piece
REPLACE INTO `item_equipment` VALUES (23425,'skulkers_bonnet_+3',99,119,32,287,0,0,16,0,0,0);
REPLACE INTO `item_equipment` VALUES (23492,'skulkers_vest_+3',99,119,32,287,0,0,32,0,0,0);
REPLACE INTO `item_equipment` VALUES (23559,'skulkers_armlets_+3',99,119,32,287,0,0,64,0,0,0);
REPLACE INTO `item_equipment` VALUES (23626,'skulkers_culottes_+3',99,119,32,287,0,0,128,0,0,0);
REPLACE INTO `item_equipment` VALUES (23693,'skulkers_poulaines_+3',99,119,32,287,0,0,256,0,0,0);

DELETE FROM `item_mods` WHERE `itemId` IN (23425, 23492, 23559, 23626, 23693);

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

-- Skulker's Armlets +3
INSERT INTO `item_mods` VALUES (23559,1,121); -- DEF: 121
INSERT INTO `item_mods` VALUES (23559,2,57); -- HP: 57
INSERT INTO `item_mods` VALUES (23559,8,27); -- STR: 27
INSERT INTO `item_mods` VALUES (23559,9,53); -- DEX: 53
INSERT INTO `item_mods` VALUES (23559,10,39); -- VIT: 39
INSERT INTO `item_mods` VALUES (23559,11,27); -- AGI: 27
INSERT INTO `item_mods` VALUES (23559,12,22); -- INT: 22
INSERT INTO `item_mods` VALUES (23559,13,40); -- MND: 40
INSERT INTO `item_mods` VALUES (23559,14,27); -- CHR: 27
INSERT INTO `item_mods` VALUES (23559,23,72); -- ATT: 72
INSERT INTO `item_mods` VALUES (23559,25,62); -- ACC: 62
INSERT INTO `item_mods` VALUES (23559,29,6); -- MDEF: 6
INSERT INTO `item_mods` VALUES (23559,30,62); -- MACC: 62
INSERT INTO `item_mods` VALUES (23559,31,93); -- MEVA: 93
INSERT INTO `item_mods` VALUES (23559,68,86); -- EVA: 86
INSERT INTO `item_mods` VALUES (23559,160,-1000); -- DMG: -1000
INSERT INTO `item_mods` VALUES (23559,384,500); -- HASTE_GEAR: 500
INSERT INTO `item_mods` VALUES (23559,830,28); -- SNEAK_ATK_DEX: 28

-- Skulker's Culottes +3
INSERT INTO `item_mods` VALUES (23626,1,142); -- DEF: 142
INSERT INTO `item_mods` VALUES (23626,2,80); -- HP: 80
INSERT INTO `item_mods` VALUES (23626,8,44); -- STR: 44
INSERT INTO `item_mods` VALUES (23626,9,18); -- DEX: 18
INSERT INTO `item_mods` VALUES (23626,10,26); -- VIT: 26
INSERT INTO `item_mods` VALUES (23626,11,30); -- AGI: 30
INSERT INTO `item_mods` VALUES (23626,12,40); -- INT: 40
INSERT INTO `item_mods` VALUES (23626,13,27); -- MND: 27
INSERT INTO `item_mods` VALUES (23626,14,21); -- CHR: 21
INSERT INTO `item_mods` VALUES (23626,23,63); -- ATT: 63
INSERT INTO `item_mods` VALUES (23626,25,63); -- ACC: 63
INSERT INTO `item_mods` VALUES (23626,29,9); -- MDEF: 9
INSERT INTO `item_mods` VALUES (23626,30,63); -- MACC: 63
INSERT INTO `item_mods` VALUES (23626,31,125); -- MEVA: 125
INSERT INTO `item_mods` VALUES (23626,68,97); -- EVA: 97
INSERT INTO `item_mods` VALUES (23626,160,-1200); -- DMG: -1200
INSERT INTO `item_mods` VALUES (23626,165,6); -- CRITHITRATE: 6
INSERT INTO `item_mods` VALUES (23626,384,600); -- HASTE_GEAR: 600
INSERT INTO `item_mods` VALUES (23626,896,11); -- DESPOIL: 11

-- Skulker's Poulaines +3
INSERT INTO `item_mods` VALUES (23693,1,103); -- DEF: 103
INSERT INTO `item_mods` VALUES (23693,2,45); -- HP: 45
INSERT INTO `item_mods` VALUES (23693,8,27); -- STR: 27
INSERT INTO `item_mods` VALUES (23693,9,39); -- DEX: 39
INSERT INTO `item_mods` VALUES (23693,10,22); -- VIT: 22
INSERT INTO `item_mods` VALUES (23693,11,57); -- AGI: 57
INSERT INTO `item_mods` VALUES (23693,13,22); -- MND: 22
INSERT INTO `item_mods` VALUES (23693,14,40); -- CHR: 40
INSERT INTO `item_mods` VALUES (23693,23,60); -- ATT: 60
INSERT INTO `item_mods` VALUES (23693,25,60); -- ACC: 60
INSERT INTO `item_mods` VALUES (23693,29,9); -- MDEF: 9
INSERT INTO `item_mods` VALUES (23693,30,60); -- MACC: 60
INSERT INTO `item_mods` VALUES (23693,31,125); -- MEVA: 125
INSERT INTO `item_mods` VALUES (23693,68,130); -- EVA: 130
INSERT INTO `item_mods` VALUES (23693,160,-1000); -- DMG: -1000
INSERT INTO `item_mods` VALUES (23693,303,4); -- TREASURE_HUNTER: 4
INSERT INTO `item_mods` VALUES (23693,384,400); -- HASTE_GEAR: 400
INSERT INTO `item_mods` VALUES (23693,896,7); -- DESPOIL: 7
