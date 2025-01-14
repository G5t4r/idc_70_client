----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[16]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_enter2_61 = class("ClsAIBat_enter2_61", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_enter2_61:getId()
	return "bat_enter2_61";
end


-- AI时机
function ClsAIBat_enter2_61:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_enter2_61:getPriority()
	return 1;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndTimeis35(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 战斗已进行时间
	local BattleTime = battleData:getBattleTime();
	-- 战斗进行时间>=35000
	if ( not (BattleTime>=35000) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_enter2_61:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndTimeis35(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"enter_scene", "", {13, 0, 0, 0, 1, 0, }, }, 
	{"enter_scene", "", {14, 0, 0, 0, 1, 0, }, }, 
	{"delete_ai", "", {{"bat_enter2_61", }, }, }, 
}

function ClsAIBat_enter2_61:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_enter2_61:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_enter2_61

----------------------- Auto Genrate End   --------------------
