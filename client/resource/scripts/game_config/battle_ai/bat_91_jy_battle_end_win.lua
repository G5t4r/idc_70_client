----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIBat_91_jy_battle_end_win = class("ClsAIBat_91_jy_battle_end_win", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIBat_91_jy_battle_end_win:getId()
	return "bat_91_jy_battle_end_win";
end


-- AI时机
function ClsAIBat_91_jy_battle_end_win:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIBat_91_jy_battle_end_win:getPriority()
	return 1;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

-- [备注]
local function cndBat_91_jy_battle_end_win(ai_obj, target)
	local owner = ai_obj:getOwner()
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if target and target >= 0 then
		target_obj = battleData:getShipByGenID(target)
		if not target_obj then return false end
	end

	-- 战场测试变量
	local Death_Cnt = battleData:GetData("_death_cnt") or 0;
	-- 离场数量==15
	if ( not (Death_Cnt==15) ) then  return false end

	-- 战场测试变量
	local Leave_Cnt = battleData:GetData("_leave_cnt") or 0;
	-- 逃跑<3
	if ( not (Leave_Cnt<3) ) then  return false end

	return true
end

-- 本AI的判定条件
function ClsAIBat_91_jy_battle_end_win:checkCondition()
	local owner = self:getOwner()
	local battleData = getGameData():getBattleDataMt()
	return cndBat_91_jy_battle_end_win(self, nil )
end

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"battle_stop", "", {1, }, }, 
	{"delete_ai", "", {{"bat_91_battle_end_win", }, }, }, 
}

function ClsAIBat_91_jy_battle_end_win:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIBat_91_jy_battle_end_win:getAllTargetMethod()
	return all_target_method
end

return ClsAIBat_91_jy_battle_end_win

----------------------- Auto Genrate End   --------------------
