----------------------- Auto Genrate Begin --------------------


-- 自动生成AI,来源于[]

local ClsAIBase = require("gameobj/battle/ai/ai_base")

local ClsAIWorld_hpdown = class("ClsAIWorld_hpdown", ClsAIBase)

--------------------------- 基本属性函数开始 ------------------------------

-- AI ID
function ClsAIWorld_hpdown:getId()
	return "world_hpdown";
end


-- AI时机
function ClsAIWorld_hpdown:getOpportunity()
	return AI_OPPORTUNITY.TACTIC;
end

-- AI优先级别
function ClsAIWorld_hpdown:getPriority()
	return 48;
end

--------------------------- 基本属性函数结束 ------------------------------

--------------------------- 条件函数区开始 ------------------------------

--------------------------- 条件函数区结束 ------------------------------

--------------------------- 目标函数区开始 ------------------------------

-- [备注]
local function targetPlayer_all( ai_obj, last_targets )
	local battleData = getGameData():getBattleDataMt()

	-- 目标选择范围
	local fanwei = "all";
	-- 目标排序方法
	local sort_key = "";
	local sort_asc = 1;
	-- 目标选择数量
	local select_cnt = 3;

	local tmp_targets = ai_obj:selectTargets(fanwei)

	local owner = ai_obj:getOwner()

	-- sort_method
	tmp_targets = battleData:sortShipsByKey(owner, tmp_targets, sort_key, sort_asc)

	-- 目标处于状态列表
	local lst_in_buff = {}
	-- 目标不处于状态列表
	local lst_no_in_buff = {}

	local func_condition = function(ai_obj, target_obj)
		for k, v in pairs(lst_in_buff) do
			if not target_obj:hasBuff(v) then return false end
		end

		for k, v in pairs(lst_no_in_buff) do
			if target_obj:hasBuff(v) then return false end
		end

		-- 如果是条件直接调用，如果是普通条件，解析

		-- T玩家标记
		local TIsPlayer = target_obj:is_player();
		if not (TIsPlayer) then return false end

		return true
	end

	local tmp_cnt = 0
	local targets_result = {}
	for _, target in ipairs(tmp_targets) do
		local target_obj = battleData:getShipByGenID(target)
		if target == -2 then
			target_obj = battleData
		end
		if target_obj and func_condition(ai_obj, target_obj) then
			table.insert(targets_result, target)
			tmp_cnt = tmp_cnt + 1
			if tmp_cnt >= select_cnt then break end
		end
	end

	return targets_result
end


--------------------------- 目标函数区结束 ------------------------------

--------------------------- 动作函数区开始 ------------------------------

-- [备注]设置-[T耐久=T耐久-0.01*T耐久上限]
local function world_hpdown_act_1( ai_obj, act_obj, target, delta_time )
	local owner = ai_obj:getOwner();
	local battleData = getGameData():getBattleDataMt()

	local target_obj
	if ( target and target >= 0 ) then
		target_obj = battleData:getShipByGenID(target)
		if ( not target_obj ) then return false end
	end

	-- T耐久
	local THp = target_obj:getHp();
	-- T耐久上限
	local THpMax = target_obj:getMaxHp();

	-- 公式原文:T耐久=T耐久-0.01*T耐久上限
	target_obj:AIsetHp( THp-0.01*THpMax );

end

--------------------------- 动作函数区结束 ------------------------------

local actions = {
	{"delay", "", {500, }, }, 
	{"op", targetPlayer_all, {world_hpdown_act_1, }, }, 
}

function ClsAIWorld_hpdown:getActions()
	return actions
end

local all_target_method = {
}

function ClsAIWorld_hpdown:getAllTargetMethod()
	return all_target_method
end

return ClsAIWorld_hpdown

----------------------- Auto Genrate End   --------------------
