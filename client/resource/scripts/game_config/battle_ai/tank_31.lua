----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAITank_31 = class("ClsAITank_31", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAITank_31:getId()
	return "tank_31";
end


-- AI时机
function ClsAITank_31:getOpportunity()
	return AI_OPPORTUNITY.FIGHT_START;
end

-- AI优先级别
function ClsAITank_31:getPriority()
	return 1;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"add_status", "", {"unmovable", }, }, 
	{"add_status", "", {"unspeedable", }, }, 
	{"add_status", "", {"unstun", }, }, 
}

function ClsAITank_31:getActions()
	return actions
end

local all_target_method = {
}

function ClsAITank_31:getAllTargetMethod()
	return all_target_method
end

return ClsAITank_31

----------------------- Auto Genrate End   --------------------
