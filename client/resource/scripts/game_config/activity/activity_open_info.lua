-- ------------------------------
-- desc: generated by xls2data.py
-- source: 新活动开启提示.xlsx
-- sheet: 新活动开启提示
-- ------------------------------


local activity_open_info = {
	[1] = {
		['activity_name'] = T('海上新星'),
		['activity_open_lv'] = 15,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_7.png',
		['activity_bg'] = 'activity_pic_3.png',
		['activity_time_txt'] = T('活动开启7天'),
		['activity_info_txt'] = T('限时活动，活动开启7天内，完成指定目标能获得大量奖励，还有A级航海士哦。'),
		['activity_reward'] = {"activity_award_diamond.png","activity_award_sailor.png"},
		['activity_next_id'] = {1,3,12},
		['activity_next_mission'] = '',
		['skip_info'] = {"newstar"},
	},
	[2] = {
		['activity_name'] = T('商会讨伐'),
		['activity_open_lv'] = 20,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_5.png',
		['activity_bg'] = 'activity_pic_2.png',
		['activity_time_txt'] = T('每天19:30-19:45'),
		['activity_info_txt'] = T('大量海盗入侵商会所在港口，讨伐并击退海盗，赢得大量金币、商会贡献和经验。'),
		['activity_reward'] = {"activity_award_coin.png","activity_award_contribution.png"},
		['activity_next_id'] = {4,5},
		['activity_next_mission'] = '',
		['skip_info'] = {"guild_boss_rank"},
	},
	[3] = {
		['activity_name'] = T('商会战争'),
		['activity_open_lv'] = 25,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'common_icon_guild.png',
		['activity_bg'] = 'activity_pic_2.png',
		['activity_time_txt'] = T('周六20:30-21:00'),
		['activity_info_txt'] = T('两方商会互相攻占对方据点，赢取宝物，赢得荣耀！'),
		['activity_reward'] = {"activity_award_cannon4.png","activity_award_keepsake_a.png"},
		['activity_next_id'] = {11},
		['activity_next_mission'] = '',
		['skip_info'] = {"time_activity"},
	},
	[4] = {
		['activity_name'] = T('深渊乱斗'),
		['activity_open_lv'] = 20,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'common_icon_battle.png',
		['activity_bg'] = 'activity_pic_2.png',
		['activity_time_txt'] = T('每周一四20:30-21:00'),
		['activity_info_txt'] = T('30人被困在海岛深渊的生死乱斗，只有用实力和智慧才能存活，赢得最后的强者宝藏！'),
		['activity_reward'] = {"activity_award_hammer3.png","activity_award_drawing.png"},
		['activity_next_id'] = {4,5},
		['activity_next_mission'] = '',
		['skip_info'] = {"time_activity"},
	},
	[5] = {
		['activity_name'] = T('成长基金'),
		['activity_open_lv'] = 21,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_23.png',
		['activity_bg'] = 'activity_pic_1.png',
		['activity_time_txt'] = T('不限时间'),
		['activity_info_txt'] = T('成长返利，最高可以获得10倍价值的钻石返还。'),
		['activity_reward'] = {"activity_award_diamond.png"},
		['activity_next_id'] = {6},
		['activity_next_mission'] = '',
		['skip_info'] = {"growth_fund"},
	},
	[6] = {
		['activity_name'] = T('每日礼包'),
		['activity_open_lv'] = 21,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'common_item_gift.png',
		['activity_bg'] = 'activity_pic_3.png',
		['activity_time_txt'] = T('每日全天'),
		['activity_info_txt'] = T('每日特惠礼包，快去看看袋子里是什么好东西吧。'),
		['activity_reward'] = {"activity_award_hammer1.png","activity_award_letter.png","activity_award_drawing.png"},
		['activity_next_id'] = {6},
		['activity_next_mission'] = '',
		['skip_info'] = {"daily_gift"},
	},
	[7] = {
		['activity_name'] = T('黑市商人'),
		['activity_open_lv'] = 22,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_22.png',
		['activity_bg'] = 'activity_pic_3.png',
		['activity_time_txt'] = T('每天21:30-22:00'),
		['activity_info_txt'] = T('黑市商人活动期间在随机港口出现，限量出售珍稀道具。和商会伙伴分散寻找吧！'),
		['activity_reward'] = {"activity_award_medal.png","activity_award_cannon4.png","activity_award_skillbook_a.png"},
		['activity_next_id'] = {7},
		['activity_next_mission'] = '',
		['skip_info'] = {"time_activity"},
	},
	[8] = {
		['activity_name'] = T('海神挑战'),
		['activity_open_lv'] = 23,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_21.png',
		['activity_bg'] = 'activity_pic_2.png',
		['activity_time_txt'] = T('全天开放，每天一次'),
		['activity_info_txt'] = T('前往战胜海洋女神梦境的十位征服者，可获得A级航海士等珍稀奖励。'),
		['activity_reward'] = {"activity_award_honour.png","activity_award_sailor.png"},
		['activity_next_id'] = {8,9},
		['activity_next_mission'] = '',
		['skip_info'] = {"team_haishen"},
	},
	[9] = {
		['activity_name'] = T('海上运镖'),
		['activity_open_lv'] = 24,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_25.png',
		['activity_bg'] = 'activity_pic_1.png',
		['activity_time_txt'] = T('10点起，每2小时开放，每天一次'),
		['activity_info_txt'] = T('安全地将宝物运达目的地，可获得钻石。当心那些贪婪的掠夺者！'),
		['activity_reward'] = {"activity_award_diamond.png"},
		['activity_next_id'] = {2,10},
		['activity_next_mission'] = '',
		['skip_info'] = {"time_activity"},
	},
	[10] = {
		['activity_name'] = T('海怪突袭'),
		['activity_open_lv'] = 24,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_24.png',
		['activity_bg'] = 'activity_pic_3.png',
		['activity_time_txt'] = T('9点起，每2小时开放，每天一次'),
		['activity_info_txt'] = T('海上最凶残的大海怪—库拉肯的……子嗣来袭，团结起来，将它们赶回海洋深渊！'),
		['activity_reward'] = {"activity_award_coin.png","activity_award_cannon4.png"},
		['activity_next_id'] = {2,10},
		['activity_next_mission'] = '',
		['skip_info'] = {"time_activity"},
	},
	[11] = {
		['activity_name'] = T('港口争夺'),
		['activity_open_lv'] = 25,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_20.png',
		['activity_bg'] = 'activity_pic_2.png',
		['activity_time_txt'] = T('周三20:30-21:00'),
		['activity_info_txt'] = T('和商会伙伴一起占领港口，成为城主，领取丰厚俸禄，享受无上特权！'),
		['activity_reward'] = {"activity_award_contribution.png","activity_award_cannon4.png"},
		['activity_next_id'] = {11},
		['activity_next_mission'] = '',
		['skip_info'] = {"time_activity"},
	},
	[12] = {
		['activity_name'] = T('传奇航海士活动'),
		['activity_open_lv'] = 30,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'common_letter_legend.png',
		['activity_bg'] = 'activity_pic_3.png',
		['activity_time_txt'] = T('不限时间'),
		['activity_info_txt'] = T('每周都会有一个伟大的传奇航海士来袭， 助你纵横七海，快去觉醒获得吧！'),
		['activity_reward'] = {},
		['activity_next_id'] = {13},
		['activity_next_mission'] = '',
		['skip_info'] = {"activity_sailor_awake"},
	},
	[13] = {
		['activity_name'] = T('市政官试炼'),
		['activity_open_lv'] = 20,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = 'activity_icon_2.png',
		['activity_bg'] = 'activity_pic_2.png',
		['activity_time_txt'] = T('周二五20:30-21:00'),
		['activity_info_txt'] = T('挑战各地市政官，赢取珍贵道具和尊重。仅限两轮喔~'),
		['activity_reward'] = {"activity_award_coin.png","activity_award_exp.png"},
		['activity_next_id'] = {4,5},
		['activity_next_mission'] = '',
		['skip_info'] = {"time_activity"},
	},
	[0] = {
		['activity_name'] = '',
		['activity_open_lv'] = 0,
		['activity_open_mission'] = 0,
		['activity_big_icon'] = '',
		['activity_bg'] = '',
		['activity_time_txt'] = '',
		['activity_info_txt'] = ' ',
		['activity_reward'] = nil,
		['activity_next_id'] = nil,
		['activity_next_mission'] = '',
		['skip_info'] = nil,
	},
}

return activity_open_info