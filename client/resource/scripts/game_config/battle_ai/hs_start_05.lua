----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIHs_start_05 = class("ClsAIHs_start_05", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIHs_start_05:getId()
	return "hs_start_05";
end


-- AI时机
function ClsAIHs_start_05:getOpportunity()
	return AI_OPPORTUNITY.FIGHT_START;
end

-- AI优先级别
function ClsAIHs_start_05:getPriority()
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
	{"play_plot", "", {{1, 2, 3, 4, }, }, }, 
	{"show_prompt", "", {T("护送哥伦布抵达新大陆"), }, }, 
}

function ClsAIHs_start_05:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIHs_start_05:getAllTargetMethod()
	return all_target_method
end

return ClsAIHs_start_05

----------------------- Auto Genrate End   --------------------
