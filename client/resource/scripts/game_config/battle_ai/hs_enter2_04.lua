----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIHs_enter2_04 = class("ClsAIHs_enter2_04", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIHs_enter2_04:getId()
	return "hs_enter2_04";
end


-- AI时机
function ClsAIHs_enter2_04:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIHs_enter2_04:getPriority()
	return -2;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndNum2dy1(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 计数2
	local num2 = battleData:GetData("num2") or 0;
	-- num2>=1
	if ( not (num2>=1) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIHs_enter2_04:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndNum2dy1(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

-- [备注]说话-[哈哈，无法同时干掉我们吗]
local function hs_enter2_04_act_3( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end




	local name = ""
	local word = T("哈哈，无法同时干掉我们吗")

	target_obj:say( name, word )

end

-- [备注]设置-[num2=num2-1]
local function hs_enter2_04_act_2( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end

	-- 计数2
	local num2 = battleData:GetData("num2") or 0;

	-- 公式原文:num2=num2-1
	battleData:planningSetData("num2", num2-1);

end

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"delay", "", {6000, }, }, 
	{"enter_scene", "", {15, 0, 0, 1, 7, 0, }, }, 
	{"op", "", {hs_enter2_04_act_2, }, }, 
	{"op", "", {hs_enter2_04_act_3, }, }, 
	{"delete_ai", "", {{"hs_enter2_04", }, }, }, 
	{"add_ai", "", {{"hs_enter2_04", }, }, }, 
}

function ClsAIHs_enter2_04:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIHs_enter2_04:getAllTargetMethod()
	return all_target_method
end

return ClsAIHs_enter2_04

----------------------- Auto Genrate End   --------------------
