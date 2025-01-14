----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_2022_time = class("ClsAIBat_2022_time", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_2022_time:getId()
	return "bat_2022_time";
end


-- AI时机
function ClsAIBat_2022_time:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_2022_time:getPriority()
	return 1;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndBat_22_time(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 战斗已进行时间
	local BattleTime = battleData:getBattleTime();
	-- 战斗进行时间>6000
	if ( not (BattleTime>6000) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_2022_time:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndBat_22_time(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

-- [备注]设置-[OAI变速=20]
local function bat_2022_time_act_1( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end


	-- 公式原文:OAI变速=20
	owner:setAISpeed( 20 );

end

-- [备注]说话-[都怪你！兄弟们！干掉这个多管闲事的家伙！]
local function bat_2022_time_act_0( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end




	local name = ""
	local word = T("都怪你！兄弟们！干掉这个多管闲事的家伙！")

	target_obj:say( name, word )

end

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"op", "", {bat_2022_time_act_0, }, }, 
	{"op", "", {bat_2022_time_act_1, }, }, 
	{"delete_ai", "", {{"bat_2022_time", }, }, }, 
}

function ClsAIBat_2022_time:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_2022_time:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_2022_time

----------------------- Auto Genrate End   --------------------
