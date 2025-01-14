----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIHs_event1_01 = class("ClsAIHs_event1_01", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIHs_event1_01:getId()
	return "hs_event1_01";
end


-- AI时机
function ClsAIHs_event1_01:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIHs_event1_01:getPriority()
	return -2;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]进入范围
local function cndIn_area1(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- math.abs(1216 - OX) < 200
	if ( not (math.abs(1216 - owner:getPositionX()) < 200) ) then  return false end

	-- math.abs(640 - OY) < 200
	if ( not (math.abs(640 - owner:getPositionY()) < 200) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIHs_event1_01:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndIn_area1(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

-- [备注]说话-[李大人！作战成功！]
local function hs_event1_01_act_1( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end




	local name = ""
	local word = T("李大人！作战成功！")

	target_obj:say( name, word )

end

-- [备注]离场-[]
local function hs_event1_01_act_3( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end


	target_obj:release(false, true)

end

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"enter_scene", "", {7, 1, 1, 0, 1, 0, }, }, 
	{"op", "", {hs_event1_01_act_1, }, }, 
	{"delay", "", {500, }, }, 
	{"op", "", {hs_event1_01_act_3, }, }, 
	{"play_plot", "", {{6, 7, 8, 9, }, }, }, 
	{"show_prompt", "", {T("小心！漩涡中航速极低！"), }, }, 
	{"delete_ai", "", {{"hs_event1_01", }, }, }, 
}

function ClsAIHs_event1_01:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIHs_event1_01:getAllTargetMethod()
	return all_target_method
end

return ClsAIHs_event1_01

----------------------- Auto Genrate End   --------------------
