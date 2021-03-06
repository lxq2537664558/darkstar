-----------------------------------------
-- ID: 18104
-- Item: Fuscina
-- Additional Effect: Lightning Damage
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local dmg = math.random(3,10);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_LIGHTNING, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHTNING,0);
        dmg = adjustForTarget(target,dmg,ELE_LIGHTNING);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHTNING,dmg);

        local message = msgBasic.ADD_EFFECT_DMG;
        if (dmg < 0) then
            message = msgBasic.ADD_EFFECT_HEAL;
        end

        return SUBEFFECT_LIGHTNING_DAMAGE,message,dmg;
    end
end;