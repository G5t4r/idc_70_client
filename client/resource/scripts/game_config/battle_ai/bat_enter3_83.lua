----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[19]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_enter3_83 = class("ClsAIBat_enter3_83", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_enter3_83:getId()
	return "bat_enter3_83";
end


-- AI时机
function ClsAIBat_enter3_83:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_enter3_83:getPriority()
	return 1;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndTimeis30(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 战斗已进行时间
	local BattleTime = battleData:getBattleTime();
	-- 战斗进行时间>=30000
	if ( not (BattleTime>=30000) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_enter3_83:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndTimeis30(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"enter_scene", "", {14, }, }, 
	{"enter_scene", "", {15, }, }, 
	{"delete_ai", "", {{"bat_enter3_83", }, }, }, 
}

function ClsAIBat_enter3_83:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_enter3_83:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_enter3_83

----------------------- Auto Genrate End   --------------------
