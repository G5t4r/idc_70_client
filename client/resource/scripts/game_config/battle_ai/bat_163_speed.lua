----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[0速改为60速]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_163_speed = class("ClsAIBat_163_speed", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_163_speed:getId()
	return "bat_163_speed";
end


-- AI时机
function ClsAIBat_163_speed:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_163_speed:getPriority()
	return 1;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

-- [备注]设置-[OAI变速=60]
local function bat_163_speed_act_0( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end


	-- 公式原文:OAI变速=60
	owner:setAISpeed( 60 );

end

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"op", "", {bat_163_speed_act_0, }, }, 
}

function ClsAIBat_163_speed:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_163_speed:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_163_speed

----------------------- Auto Genrate End   --------------------
