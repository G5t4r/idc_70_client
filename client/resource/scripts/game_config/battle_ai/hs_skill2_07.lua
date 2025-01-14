----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIHs_skill2_07 = class("ClsAIHs_skill2_07", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIHs_skill2_07:getId()
	return "hs_skill2_07";
end


-- AI时机
function ClsAIHs_skill2_07:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIHs_skill2_07:getPriority()
	return 2;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndNum1is1(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 战场测试变量
	local num1 = battleData:GetData("num1") or 0;
	-- num1==1
	if ( not (num1==1) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIHs_skill2_07:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndNum1is1(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"add_skill", "", {1030, 1, "passive", }, }, 
	{"use_skill", "", {1030, }, }, 
	{"add_skill", "", {1030, 1, }, }, 
	{"delete_ai", "", {{"hs_skill2_07", }, }, }, 
}

function ClsAIHs_skill2_07:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIHs_skill2_07:getAllTargetMethod()
	return all_target_method
end

return ClsAIHs_skill2_07

----------------------- Auto Genrate End   --------------------
