----------------------- Auto Genrate Begin --------------------

-- 定义技能继承类型

local clsSkillInitiative = require("module/battleAttrs/skill_initiative")

cls_sk13001 = class("cls_sk13001", clsSkillInitiative);


-- 属性段
---------------------------------------------------------------

-- 技能ID 
cls_sk13001.get_skill_id = function(self)
	return "sk13001";
end


-- 技能名 
cls_sk13001.get_skill_name = function(self)
	return T("援助");
end

-- 精简版技能描述 
cls_sk13001.get_skill_short_desc = function(self)
	return T("召唤一艘持续8秒的普通舰艇。");
end

-- 获取技能的描述
cls_sk13001.get_skill_desc = function(self, skill_data, lv)
	return T("召唤一艘持续8秒的普通舰艇（属性为施法者属性百分比，速度越高收益越大）。")
end

-- 获取技能的富文本描述
cls_sk13001.get_skill_color_desc = function(self, skill_data, lv)
	return string.format(T("$(c:COLOR_CAMEL)召唤一艘持续8秒的普通舰艇，强度为施法者属性$(c:COLOR_GREEN)%0.1f%%$(c:COLOR_CAMEL)。"), (50+10*lv))
end

-- 公共CD 
cls_sk13001.get_common_cd = function(self)
	return 3;
end


-- 技能CD
cls_sk13001._get_skill_cd = function(self, attacker)
	local result
	
	-- 公式原文:结果=10
	result = 10;

	return result
end

-- 施法方状态限制 
local status_limit = {"silence", "stun", }

cls_sk13001.get_status_limit = function(self)
	return status_limit
end

-- 技能施法范围 
cls_sk13001.get_select_scope = function(self)
	return "SELF";
end


-- SP消耗公式
cls_sk13001.calc_sp_cost = function(self, attacker, lv, target)
	local result
	
	-- 公式原文:结果=0
	result = 0;

	return result
end

---------------------------------------------------------------

-- 添加Buff区
-- 状态结算用的函数



-- 前置动作[分身]
local sk13001_pre_action_fenshen_0 = function(attacker, target, lv, objStatus, tbParam)
	local tbResult = {}
	
	return tbResult
end

-- 目标选择基础数量[分身]
local sk13001_select_cnt_fenshen_0 = function(attacker, lv)
	return 
1
end

-- 目标选择忽视状态[分身]
local sk13001_unselect_status_fenshen_0 = function(attacker, lv)
	return {"seal", "die", }
end

-- 状态持续时间[分身]
local sk13001_status_time_fenshen_0 = function(attacker, lv)
	return 
11
end

-- 状态心跳[分身]
local sk13001_status_break_fenshen_0 = function(attacker, lv)
	return 
0
end

-- 命中率公式[分身]
local sk13001_status_rate_fenshen_0 = function(attacker, target, lv, tbParam)
	local result
	
	-- 公式原文:结果=1000
	result = 1000;

	return result
end

-- 处理过程[分身]
local sk13001_calc_status_fenshen_0 = function(attacker, target, lv, objStatus, tbParam)
	local tbResult = {}
	
	-- 公式原文:分身强度=(0.5+0.1*技能等级)*1000
	tbResult.fenshen_strength = (0.5+0.1*lv)*1000;
	-- 公式原文:分身数量=1
	tbResult.fenshen_cnt = 1;
	-- 公式原文:分身造型=3
	tbResult.fenshen_ship_id = 3;

	return tbResult
end


-- 操作区

-- 添加状态数据
cls_sk13001.get_add_status = function(self)
		return {
	{
		["calc_status"]=sk13001_calc_status_fenshen_0, 
		["effect_name"]="", 
		["effect_time"]=0, 
		["effect_type"]="", 
		["pre_action"]=sk13001_pre_action_fenshen_0, 
		["scope"]="SELF", 
		["select_cnt"]=sk13001_select_cnt_fenshen_0, 
		["sort_method"]="", 
		["status"]="fenshen", 
		["status_break"]=sk13001_status_break_fenshen_0, 
		["status_rate"]=sk13001_status_rate_fenshen_0, 
		["status_time"]=sk13001_status_time_fenshen_0, 
		["unselect_status"]=sk13001_unselect_status_fenshen_0, 
	}, 
}
end

---------------------------------------------------------------


----------------------- Auto Genrate End   --------------------

cls_sk13001.end_display_call_back = function(self, attacker, target, idx, dir, is_bullet)
	local battle_data = getGameData():getBattleDataMt()
	dir = battle_data:fenshenPosition(attacker)

	self.super.end_display_call_back(self, attacker, target, idx, dir, is_bullet)
end