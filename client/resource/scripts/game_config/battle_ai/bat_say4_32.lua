----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[29]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_say4_32 = class("ClsAIBat_say4_32", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_say4_32:getId()
	return "bat_say4_32";
end


-- AI时机
function ClsAIBat_say4_32:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_say4_32:getPriority()
	return 1;
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

	-- 战场测试变量
	local num2 = battleData:GetData("num2") or 0;
	-- num2==1
	if ( not (num2==1) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_say4_32:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndNum2is1(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

-- [备注]说话-[撤什么，击沉它。]
local function bat_say4_32_act_1( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end




	local name = ""
	local word = T("撤什么，击沉它。")

	target_obj:say( name, word )

end

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"delay", "", {2000, }, }, 
	{"op", "", {bat_say4_32_act_1, }, }, 
	{"delete_ai", "", {{"bat_say4_32", }, }, }, 
}

function ClsAIBat_say4_32:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_say4_32:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_say4_32

----------------------- Auto Genrate End   --------------------
