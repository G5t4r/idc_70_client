----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_end_1_181 = class("ClsAIBat_end_1_181", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_end_1_181:getId()
	return "bat_end_1_181";
end


-- AI时机
function ClsAIBat_end_1_181:getOpportunity()
	return AI_OPPORTUNITY.RUN;
end

-- AI优先级别
function ClsAIBat_end_1_181:getPriority()
	return -2;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndBat_lose_1(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 战场测试变量
	local SIT1 = battleData:GetData("__sit_1") or 0;
	-- 位置1>=1
	if ( not (SIT1>=1) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_end_1_181:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndBat_lose_1(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"play_plot", "", {{11, 3, }, }, }, 
	{"run_ai", "", {{"bat_lose_181", }, }, }, 
}

function ClsAIBat_end_1_181:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_end_1_181:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_end_1_181

----------------------- Auto Genrate End   --------------------
