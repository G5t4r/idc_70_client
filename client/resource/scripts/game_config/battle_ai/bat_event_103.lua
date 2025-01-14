----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_event_103 = class("ClsAIBat_event_103", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_event_103:getId()
	return "bat_event_103";
end


-- AI时机
function ClsAIBat_event_103:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_event_103:getPriority()
	return 48;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndNum2is1(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 计数2
	local num2 = battleData:GetData("num2") or 0;
	-- num2==1
	if ( not (num2==1) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_event_103:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndNum2is1(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"delete_ai", "", {{"bat_shipout_103", }, }, }, 
	{"enter_scene", "", {8, }, }, 
	{"delay", "", {6000, }, }, 
	{"run_ai", "", {{"bat_event2_103", }, }, }, 
	{"delete_ai", "", {{"bat_event_103", }, }, }, 
}

function ClsAIBat_event_103:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_event_103:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_event_103

----------------------- Auto Genrate End   --------------------
