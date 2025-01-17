local config = {
	storage = 19042, --use empty storage
	exhaust = 600 --Exhaust is in seconds 600 equals 10min
}

local chilliConCarniphila = Condition(CONDITION_HASTE)
chilliConCarniphila:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
chilliConCarniphila:setParameter(CONDITION_PARAM_SPEED, 80)

local svargrondSalmonFilet = Condition(CONDITION_ATTRIBUTES)
svargrondSalmonFilet:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
svargrondSalmonFilet:setParameter(CONDITION_PARAM_SKILL_FISHING, 30)

local tropicalMarinatedTiger = Condition(CONDITION_ATTRIBUTES)
tropicalMarinatedTiger:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
tropicalMarinatedTiger:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)

local delicatessenSalad = Condition(CONDITION_ATTRIBUTES)
delicatessenSalad:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
delicatessenSalad:setParameter(CONDITION_PARAM_SKILL_MELEE, 3)

local roastedWyvernWings = Condition(CONDITION_ATTRIBUTES)
roastedWyvernWings:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
roastedWyvernWings:setParameter(CONDITION_PARAM_SKILL_SHIELD, 7)

local carrotPie = Condition(CONDITION_ATTRIBUTES)
carrotPie:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
carrotPie:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 7)

local hirelingFood = Action()

function hirelingFood.onUse(player, item, frompos, item2, topos)
	local cid = player:getId()
	if (player:getStorageValue(config.storage) <= os.time()) then
		if (item.itemid == 29408) then
			player:say("Chomp.", TALKTYPE_MONSTER_SAY)
			Creature(cid):addCondition(roastedWyvernWings)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29409) then
			player:say("Yummm.", TALKTYPE_MONSTER_SAY)
			Creature(cid):addCondition(carrotPie)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29410) then
			player:say("Munch.", TALKTYPE_MONSTER_SAY)
			Creature(cid):addCondition(tropicalMarinatedTiger)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29411) then
			player:say("Munch.", TALKTYPE_MONSTER_SAY)
			Creature(cid):addCondition(delicatessenSalad)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29412) then
			player:say("Yummm.", TALKTYPE_MONSTER_SAY)
			Creature(cid):addCondition(chilliConCarniphila)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29413) then
			player:say("Mmmmm.", TALKTYPE_MONSTER_SAY)
			Creature(cid):addCondition(svargrondSalmonFilet)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29414) then
			Creature(cid):addHealth(getCreatureMaxHealth(cid) * 0.3)
			player:say("Munch.", TALKTYPE_MONSTER_SAY)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29415) then
			Creature(cid):addMana(Creature(cid):getMaxMana() * 0.3)
			player:say("Chomp.", TALKTYPE_MONSTER_SAY)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		elseif (item.itemid == 29416) then
			player:say("Blurg.", TALKTYPE_MONSTER_SAY)
			item:remove(1)
			player:setStorageValue(config.storage, os.time() + config.exhaust)
		end
	else
		player:sendCancelMessage("You're still too full to eat any gourmet dishes for a while.")
	end
	return true
end

hirelingFood:id(29408, 29409, 29410, 29411, 29412, 29413, 29414, 29415, 29416)
hirelingFood:register()
