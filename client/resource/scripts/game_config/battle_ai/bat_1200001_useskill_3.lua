----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_1200001_useskill_3 = class("ClsAIBat_1200001_useskill_3", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_1200001_useskill_3:getId()
	return "bat_1200001_useskill_3";
end


-- AI时机
function ClsAIBat_1200001_useskill_3:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_1200001_useskill_3:getPriority()
	return -2;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndBat_1200001_time_3(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 战斗已进行时间
	local BattleTime = battleData:getBattleTime();
	-- 战斗进行时间>20500
	if ( not (BattleTime>20500) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_1200001_useskill_3:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndBat_1200001_time_3(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

-- [备注]说话-[*&%……（你们！）]
local function bat_1200001_useskill_3_act_0( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end




	local name = ""
	local word = T("*&%……（你们！）")

	target_obj:say( name, word )

end

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"op", "", {bat_1200001_useskill_3_act_0, }, }, 
	{"delay", "", {500, }, }, 
	{"use_skill", "", {99003, }, }, 
	{"delete_ai", "", {{"bat_1200001_useskill_3", }, }, }, 
}

function ClsAIBat_1200001_useskill_3:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_1200001_useskill_3:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_1200001_useskill_3

----------------------- Auto Genrate End   --------------------
