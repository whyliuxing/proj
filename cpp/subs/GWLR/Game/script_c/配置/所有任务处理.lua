定义函数 做_梦的起点()
	等待角色可以移动(1000 * 60 * 10)
	按W键()
	延迟(500)
	按S键()
	延迟(500)
	按A键()
	延迟(500)
	按D键()
	延迟(5000)

	设置角色坐标(1667.11, 1550.9, 127.45)
	延迟(2000)
	移动到指定的房间(1)
	等待角色可以移动(1000 * 60 * 3)
	等待出现可打的怪物("新手香菇猪", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("新手香菇猪"), 400)
	收刀()
	按空格键()
	移动到指定的房间(2)
	延迟(50000)
	按空格键()
	等待角色可以移动(1000 * 60)
	按空格键()
	等待出现可打的怪物("新手河狸兽", 1000 * 60)
	按空格键()
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("新手河狸兽"), 400)
	按空格键()
	等待出现可打的怪物("新手河狸兽", 1000 * 60)
	按空格键()
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("新手河狸兽"), 400)
	按空格键()
	通用_等待返回城镇()
结束

定义函数 做_采集猎人之道( 任务ID )
	存物品到仓库("烤肉架")
	存物品到仓库("铁镐")
	存物品到仓库("回复药")
	如果 没有 移动到指定的副本("[采集！猎人之道]") 那么
		返回 假
	结束

	获取补给箱物品("烤肉架")
	获取补给箱物品("铁镐")

	通用_强制采集指定的数量("草", 1, 0)

	通用_强制采集指定的数量("蘑菇", 1, 0)

	延迟(1000 * 5)
	制作调和物品("回复药")

	通用_强制采集指定的数量("矿", 1, 0)

	延迟(1000)

	移动到指定的房间(1);
	延迟(5000)

	--杀死指定名字和数量的怪物("野猪", 1)
	杀光指定房间中所有怪物(500, 真, -1)
	通用_等待剥皮并剥皮()

	延迟(2000)
	使用背包物品("烤熟的肉")
	通用_等待返回城镇()
结束

定义函数 做_狩猎的准备()
	使用背包物品("配方『回复药』")
结束

定义函数 做_采集与调和()
	如果 没有 移动到指定的副本("[采集，猎人之道]") 那么
		返回 假
	结束

	获取补给箱物品("携带食料")

	延迟(1000 * 10)
	自动采集一次房间所有对象(5000)
	延迟(2000)
	自动采集一次房间所有对象(5000)

	移动到指定的房间(1);

	延迟(2000)
	杀光本房间怪物(500)

	延迟(8000)
	收刀()
	制作调和物品("回复药")

	通用_等待返回城镇()
结束

--[[
定义函数 做_晓风山谷()
	如果 没有 移动到指定的副本_ID(0x00018767) 那么
		返回 假
	结束

	移动到指定的房间(1);

	杀死指定名字和数量的怪物("蓝速龙", 5)

	通用_等待返回城镇()
结束
]]

定义函数 做_猎人的武器( 任务ID, 任务名 )
	移动到指定的村庄("米拉德村")

	局部变量 npc = 查找NPC("雷欧")
	如果 不 是有效的对象(npc) 那么
		LuaLogE("在做\"" .. 任务名 .. "\"任务时，没有找到\"雷欧\"");
		返回 假
	结束

	延迟(1000)
	锻造装备("晓风短剑")
结束

定义函数 做_物灵与匠心( 任务ID, 任务名 )
	如果 得到指定物品的所有数量("蓝速龙王的爪") < 4 那么
		LuaLog("蓝速龙王的爪数量少于4")

		通用_杀死指定副本的BOSS("试练！蓝速龙王")
		返回
	结束

	移动到指定的村庄("米拉德村")

	局部变量 npc = 查找NPC("雷欧")
	如果 不 是有效的对象(npc) 那么
		LuaLogE("在做\"" .. 任务名 .. "\"任务时，没有找到\"雷欧\"");
		返回 假
	结束

	延迟(1000)
	锻造装备("初阶蓝速龙王头盔")
结束

定义函数 做_猛兽现身()
	如果 没有 移动到指定的副本("[猛兽现身]") 那么
		返回 假
	结束

	移动到指定的房间(1);
	杀光本房间怪物(400)
	移动到指定的房间(2);
	杀光本房间怪物(400)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

--[[
定义函数 做_决战河狸兽()
	如果 没有 移动到指定的副本("[夙愿的河狸兽]") 那么
		返回 假
	结束

	获取补给箱物品("应急药")
	获取补给箱物品("支给用染色玉")

	移动到指定的房间(2);
	杀光本房间怪物(400)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束
]]

定义函数 做_达成！赏金目标()
	返回 通用_做悬赏任务({ { "限时" }, { "初阵" }, { "倒地" }, { "白金" } }, "希美伦山路", "赏金看板")
结束

定义函数 做_杀光试练大怪鸟()
	如果 没有 移动到指定的副本("试练！大怪鸟") 那么
		返回 假
	结束

	杀光指定房间中所有怪物(400, 假, -1)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_新的狩猎流派( 任务ID, 任务名 )
	进入新手训练()
	延迟(3000)
	退出新手训练()
结束

--[[
定义函数 做_林中特产()
	如果 没有 移动到指定的副本("[喧嚣的丛林]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("野猪", 8)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束
]]

定义函数 做_合格的武器( 任务ID, 任务名, 自定义参数 )
	如果 得到指定物品的所有数量("铁铸大太刀") < 1 那么
		保持购买一定数量的物品("新手狩猎装备", "铁铸大太刀", 1, 1, "米拉德村", "雷欧", 假)
		延迟(4000)
	结束
	穿戴物品("铁铸大太刀")

	如果 得到指定物品的所有数量("怪鸟的翼") < 5 那么
		LuaLog("怪鸟的翼数量少于5")
		去获取指定的材料("怪鸟的翼", 5)
		返回
	结束

	如果 得到指定物品的所有数量("小石子") < 3 那么
		LuaLog("小石子数量少于3")
		去获取指定的材料("小石子", 3)
		返回
	结束

	如果 得到指定物品的所有数量("圆盘石") < 3 那么
		LuaLog("圆盘石数量少于4")
		去获取指定的材料("圆盘石", 3)
		返回
	结束

	如果 没有 打开某个城镇的某个NPC("米拉德村", "雷欧") 那么
		LuaLogE("做任务时，打开某个城镇的某个NPC失败，任务名：" .. 任务名)
		返回 假
	结束

	升级装备("铁铸大太刀", 1)
结束

定义函数 做_庄园的经营( 任务ID, 任务名, 自定义参数 )
	进入到自己的庄园()

	升级庄园采集("育菇木床", 1)

	自动庄园采集(5000, -1, 空, "育菇木床")
	离开庄园()
结束

定义函数 做_名为沙漠的地方()
	如果 没有 移动到指定的副本("[沙漠救助]") 那么
		返回 假
	结束

	移动到指定的房间(7);
	杀死指定名字和数量的怪物("黄速龙", 5)

	等待角色可以移动(1000 * 60)
	移动到指定的房间(6);
	等待角色可以移动(1000 * 60)
	杀死指定名字和数量的怪物("黄速龙", 5)
	杀光指定房间中所有怪物(500, 真, -1)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束

--[[
定义函数 做_猫猫小偷哪里跑！()
	如果 没有 移动到指定的副本("[挽救失足猫]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	杀光本房间怪物(400)
	移动到指定的房间(3);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束
]]

定义函数 做_突击黑猫盗贼总部()
	如果 没有 移动到指定的副本("[夺回赃物]") 那么
		返回 假
	结束

	延迟(3000)
	移动到指定的房间(2);
	杀光本房间怪物(300)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_艾露故事的收藏()
	使用背包物品("『艾露一族』")
结束

定义函数 做_新的随从猫( 任务ID, 任务名 )

	保持购买一定数量的物品("艾露猫雇佣", "呢特", 1, -1, "米拉德村", "猫婆婆", 假)

	延迟(1000)

结束

定义函数 做_随从猫的武装( 任务ID, 任务名 )
	如果 没有 打开某个城镇的某个NPC("米拉德村", "焦胡艾普") 那么
		LuaLogE("做任务时，打开某个城镇的某个NPC失败，任务名：" .. 任务名)
		返回 假
	结束

	进行NPC对话(任务ID)
	延迟(1000)

	如果 得到指定物品的所有数量("矿石端材") < 2 那么
		LuaLog("矿石端材数量少于2")
	结束

	锻造装备("村丁斗气锤")
	延迟(1000)
结束

定义函数 做_工匠的尊严()
	如果 没有 移动到指定的副本("[工匠的尊严]") 那么
		返回 假
	结束

	等待出现可打的怪物("大野猪", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("大野猪"), 400)
	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_前辈莉莉()
	如果 没有 移动到指定的副本("[少女猎人莉莉]") 那么
		返回 假
	结束

	移动到指定的房间(7)
	杀死指定名字和数量的怪物("黄速龙", 8)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_调查_晓风山谷( 任务ID, 任务名 )
	如果 没有 移动到指定的副本("[调查-晓风山谷]") 那么
		返回 假
	结束

	移动到指定的房间(1);
	杀光本房间怪物(400)
	移动到指定的房间(3);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_调查_隐士之森( 任务ID, 任务名 )
	如果 没有 移动到指定的副本("[调查-隐士之森]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	杀光本房间怪物(400)
	移动到指定的房间(3);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束

--[[
定义函数 做_调查_昆贝尔沼泽( 任务ID, 任务名 )
	如果 没有 移动到指定的副本("[调查-昆贝尔沼泽]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("小盾蟹", 8)
	通用_等待返回城镇()
结束
]]

定义函数 做_调查_雷鸣沙海( 任务ID, 任务名 )
	如果 没有 移动到指定的副本("[调查-雷鸣沙海]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("黄速龙", 10)
	通用_等待返回城镇()
结束

定义函数 做_星辰的传闻()
	使用背包物品("『星龙的传闻』")

结束

定义函数 做_灵光的踪迹()
	如果 没有 移动到指定的副本("[灵光的踪迹]") 那么
		返回 假
	结束

	移动到指定的房间(6);
	移动到指定的房间(8)

	通用_打死副本BOSS()
结束

定义函数 做_罗登的见面礼()
	如果 没有 移动到指定的副本("[会长的见面礼]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(1000)
	获取补给箱物品("支给用冷饮")
	延迟(1000)
	使用背包物品("支给用热饮")
	延迟(1000)
	使用背包物品("支给用冷饮")

	移动到指定的房间(7);
	如果 通用_强制采集指定的数量("其他", 空, 7) <= 0 那么
		返回 假
	结束

	通用_返回营地缴纳物品()
	通用_等待返回城镇()
结束

定义函数 做_沼泽特产()
	如果 没有 移动到指定的副本("[沼泽特产]") 那么
		返回 假
	结束
	移动到指定的房间(1)
	如果 通用_强制采集指定的数量("其他", 5, 1, 2, "酸酸果", 通用_推迟使用一次背包物品("爆裂果")) <= 0 那么
		返回 假
	结束

	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束

定义函数 做_过去的米拉德()
	如果 没有 移动到指定的副本("试练！大怪鸟") 那么
		返回 假
	结束

	使用背包物品("《米拉德村纪事》")

	通用_打死副本BOSS()
结束

定义函数 做_失踪的莉莉()
	如果 没有 移动到指定的副本("[两个人的冒险]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	设置角色坐标(796.89, 250.86, 20.65)

	通用_打死副本BOSS()
结束

定义函数 做_贺菲相助()
	如果 没有 移动到指定的副本("[闪光的原因]") 那么
		返回 假
	结束
	移动到指定的房间(1);
	循环 得到指定物品的所有数量("发光的东西") < 12 执行
		步过闪光的东西()
	结束

	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束

--[[
定义函数 做_友情的羁绊？()
	如果 没有 移动到指定的副本_ID(204008) 那么
		返回 假
	结束

	通用_打死副本BOSS()
结束
]]

--[[
定义函数 做_粉色系的毛()
	如果 没有 移动到指定的副本("[粉色的赠礼]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("桃毛兽", 8)

	通用_等待返回城镇()
结束
]]

定义函数 做_抱歉打扰了()
	如果 移动到指定的副本("[沙漠之光]") 那么
		杀死指定名字和数量的怪物("雷光虫", 10)

		通用_等待返回城镇()
	结束

	--如果 移动到指定的副本("[沙漠之影]") 那么
	如果 移动到指定的副本_ID(0x00031902) 那么
		通用_打死副本BOSS()
	结束
结束

定义函数 做_回收零件()
	如果 没有 移动到指定的副本("[收集零件]") 那么
		LuaLogE("没有成功进入到副本")
		返回 假
	结束

	如果 通用_强制采集指定的数量("其他", 4, 7, 8, "滑翔翼的碎片") <= 0 那么
		返回 假
	结束

	延迟(3000)
	杀光指定房间中所有怪物(400, true, 7)

	通用_等待返回城镇()
结束

--[[
定义函数 做_有用？无用？()
	如果 移动到指定的副本("[沼泽的奇面族]") 那么
		杀死指定名字和数量的怪物("刀奇面", 5)
		杀死指定名字和数量的怪物("箭奇面", 4)
		杀死指定名字和数量的怪物("盾奇面", 1)

		通用_等待返回城镇()
	结束

	如果 移动到指定的副本("[奇特的爱好]") 那么

		获取补给箱物品("灭火玉")
		获取补给箱物品("灭火玉")
		移动到指定的房间(3)

		遍历执行_灭火玉(定义函数 (对象标识)
			延迟(2000)
			如果 移动到指定的对象身后(对象标识, 3) 那么
				返回 使用背包物品("灭火玉")
			结束
			返回 假
		结束, 3)

		通用_等待返回城镇()
	结束
结束
]]

定义函数 做_有仇必报的猎人()
	如果 没有 移动到指定的副本("[贺菲与沙雷鸟]") 那么
		返回 假
	结束

	移动到指定的房间(4);
	如果 通用_强制采集指定的数量("其他", 10) <= 0 那么
		返回 假
	结束

	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束

定义函数 做_莉莉的美食单()
	如果 没有 移动到指定的副本("[莉莉的美食单]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	如果 通用_强制采集指定的数量("其他", 空, 2) <= 0 那么
		返回 假
	结束

	通用_返回营地缴纳物品()
	通用_等待返回城镇()
结束

定义函数 做_烤肉精通()
	如果 没有 移动到指定的副本("[莉莉的菜单]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("野猪", 8)

	通用_等待返回城镇()
结束

定义函数 做_丛林盛宴()
	如果 没有 移动到指定的副本("[丛林盛宴]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	通用_等待杀死BOSS并剥皮()
	等待角色可以移动(1000 * 60 * 5)

	移动到指定的房间(0);
	等待角色可以移动(1000 * 60 * 5)

	使用背包物品("烤肉架")
	通用_等待返回城镇()
结束

定义函数 做_遏制红潮()
	如果 没有 移动到指定的副本("[重要之物]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("小盾蟹", 10)

	移动到指定的房间(0);

	通用_等待返回城镇()

结束

定义函数 做_湿地盛宴()
	如果 没有 移动到指定的副本_ID(100496) 那么
		返回 假
	结束

	移动到指定的房间(1);

	杀死指定名字和数量的怪物("小盾蟹", 11)

	移动到指定的房间(0);

	通用_等待返回城镇()

结束

定义函数 做_商队失踪()
	如果 没有 移动到指定的副本("[沙漠救助]") 那么
		返回 假
	结束

	获取补给箱物品("支给用冷饮")
	获取补给箱物品("支给用热饮")
	延迟(1000)
	使用背包物品("支给用冷饮")
	使用背包物品("支给用热饮")

	移动到指定的房间(6)
	杀死指定名字和数量的怪物("黄速龙", 10)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()

结束

--[[
定义函数 做_群岭回声()
	如果 没有 移动到指定的副本("[群岭的生态]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("小雪狮子", 8)

	通用_等待返回城镇()

结束
]]

定义函数 做_群岭原住民()
	如果 没有 移动到指定的副本("[群岭的原住民]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("刀奇面", 5)
	杀死指定名字和数量的怪物("箭奇面", 4)
	杀死指定名字和数量的怪物("盾奇面", 1)

	通用_等待返回城镇()
结束

定义函数 做_毛茸茸的讨伐()
	如果 没有 移动到指定的副本("[毛茸茸的讨伐]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("河狸兽", 2)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_父辈的报复()
	如果 没有 移动到指定的副本("[父辈的报复]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("河狸兽", 2)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束

--[[
定义函数 做_珍贵的食物()
	如果 没有 移动到指定的副本("[珍贵的食物]") 那么
		返回 假
	结束
	延迟(10000)
	如果 通用_强制采集指定的数量("其他", 6) <= 0 那么
		返回 假
	结束

	通用_等待杀死BOSS并剥皮()

	如果 通用_强制采集指定的数量("其他", 2) <= 0 那么
		返回 假
	结束
	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束
]]

定义函数 做_考场预热()
	如果 没有 移动到指定的副本("[湖地的盾蟹]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("小盾蟹", 11)

	通用_等待返回城镇()
结束

定义函数 做_教官的考验()
	如果 没有 移动到指定的副本("[沙之怒号]") 那么
		返回 假
	结束

	等待出现可打的怪物("沙雷鸟", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("沙雷鸟"), 400)

	等待出现可打的怪物("沙狸兽", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("沙狸兽"), 400)
	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_教官的考验②()
	如果 没有 移动到指定的副本("[制霸昆贝尔]") 那么
		返回 假
	结束

	等待出现可打的怪物("大名盾蟹", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("大名盾蟹"), 400)

	等待出现可打的怪物("桃毛兽王", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("桃毛兽王"), 400)

	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_似曾相识的考察()
	如果 移动到指定的副本("[虾兵蟹将]") 那么
		杀死指定名字和数量的怪物("小盾蟹", 5)

		杀死指定名字和数量的怪物("小镰蟹", 5)

		通用_等待返回城镇()
	结束

	如果 移动到指定的副本("[猎人与工匠的约定]") 那么
		通用_打死副本BOSS()
	结束
结束

--[[
定义函数 做_莉莉的大考验()
	如果 没有 移动到指定的副本("[三倍噩梦]") 那么
		返回 假
	结束
	杀死指定名字和数量的怪物("鬼狩蛛", 3)

	通用_等待返回城镇()
结束
]]

定义函数 做_猛炎的试炼()
	如果 没有 移动到指定的副本("[猛炎的试练]") 那么
		返回 假
	结束

	移动到指定的房间(3);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_芭丝商会的危机()
	如果 没有 移动到指定的副本("[莉莉的风格]") 那么
		返回 假
	结束

	移动到指定的房间(3);
	延迟(1000 * 7)
	摧毁静态可打的怪物("HardRock1", 30, 1, 700)
	摧毁静态可打的怪物("HardRock2", 30, 1, 700)
	摧毁静态可打的怪物("HardRock3", 30, 1, 700)
	摧毁静态可打的怪物("HardRock4", 30, 1, 700)
	摧毁静态可打的怪物("HardRock5", 30, 1, 700)
	摧毁静态可打的怪物("HardRock6", 30, 1, 700)
	摧毁静态可打的怪物("HardRock7", 30, 1, 700)

	通用_等待返回城镇()
结束

定义函数 做_最不搭的队伍()
	如果 没有 移动到指定的副本("[最不搭的队伍]") 那么
		返回 假
	结束

	如果 通用_强制采集指定的数量("其他", 10, 6) <= 0 那么
		返回 假
	结束

	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束

--[[
定义函数 做_簇拥的王者()
	如果 移动到指定的副本("[大王的簇拥]") 那么
		杀死指定名字和数量的怪物("刀奇面", 5)
		杀死指定名字和数量的怪物("箭奇面", 5)
		返回 假
	结束

	通用_等待返回城镇()
结束
]]

定义函数 做_前往梅杰波尔坦( 任务ID, 任务名 )
	如果 没有 打开某个城镇的某个NPC("米拉德村", "斯帕达局长") 那么
		LuaLogE("做任务时，打开某个城镇的某个NPC失败，任务名：" .. 任务名)
		返回 假
	结束

	任务_做热气球()

	延迟(3000)
	npc = 查找NPC("公会秘书普蕾妮")
	移动到指定的对象身前(npc)
	打开NPC面板(npc)
	进行NPC对话(任务ID)
结束

定义函数 做_奇面族的威胁()
	如果 没有 移动到指定的副本("[奇面族的威胁]") 那么
		返回 假
	结束

	移动到指定的房间(1);
	杀光本房间怪物(400)

	移动到指定的房间(2);
	杀光本房间怪物(400)

	移动到指定的房间(3);
	杀光本房间怪物(400)

	移动到指定的房间(4);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_被俘的新兵()
	如果 没有 移动到指定的副本("[被俘的猎人]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(1000)
	使用背包物品("支给用热饮")

	移动到指定的房间(5);
	等待出现BOSS(1000 * 60)
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_莉莉的风格()
	如果 没有 移动到指定的副本("[糟糕的电龙]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(1000)
	使用背包物品("支给用热饮")

	等待出现BOSS(1000 * 60)
	杀死指定名字和数量的怪物("电龙", 3)

	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束

--[[
定义函数 做_新人地狱()
	如果 没有 移动到指定的副本("[涅尔的新人培训]") 那么
		返回 假
	结束
	移动到指定的房间(1);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束
]]

定义函数 做_果实收割者()
	如果 没有 移动到指定的副本("[果实收割者]") 那么
		返回 假
	结束

	如果 通用_强制采集指定的数量("其他", 10) <= 0 那么
		返回 假
	结束
	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束

定义函数 做_爷们的锻造魂()
	如果 没有 移动到指定的副本("[爷们的锻造魂]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(1000)
	使用背包物品("支给用热饮")

	移动到指定的房间(5);
	设置角色坐标(1939.25, 3448.53, 276.94)

	移动到指定的房间(7);
	如果 通用_强制采集指定的数量("其他", 2, 7) <= 0 那么
		返回 假
	结束

	如果 通用_强制采集指定的数量("其他", 3, 7) <= 0 那么
		返回 假
	结束
	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束
--[[
定义函数 做_男子汉的玉()
	如果 移动到指定的副本("[大地之拳]") 那么
		移动到指定的房间(5)
		通用_打死副本BOSS()
	结束
结束
]]

定义函数 做_速龙的聚集()
	如果 没有 移动到指定的副本("[速龙的聚集]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("红速龙", 6)

	杀死指定名字和数量的怪物("蓝速龙", 6)

	通用_等待返回城镇()
结束

--[[
定义函数 做_甲壳的逆袭()
	如果 没有 移动到指定的副本("[甲壳的逆袭]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("小盾蟹", 6)

	杀死指定名字和数量的怪物("小镰蟹", 6)

	通用_等待返回城镇()
结束
]]

--[[
定义函数 做_湖地的危机()
	如果 没有 移动到指定的副本("[湖地的危机]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("蚊子", 15)

	通用_等待返回城镇()
结束
]]

定义函数 做_梅拉露盗贼团的覆灭()
	如果 没有 移动到指定的副本("[梅拉露盗贼团覆灭]") 那么
		返回 假
	结束

	移动到指定的房间(5)
	杀光本房间怪物(500, 假)
	移动到指定的房间(6)
	杀光本房间怪物(500, 假)
	移动到指定的房间(3)
	杀光本房间怪物(500, 假)

	通用_等待返回城镇()
结束
--[[
定义函数 做_莉莉的求助()
	如果 没有 移动到指定的副本("[最不搭的队伍]") 那么
		返回 假
	结束

	移动到指定的房间(6);
	如果 通用_强制采集指定的数量("其他", 空, 6) <= 0 那么
		返回 假
	结束
	通用_返回营地缴纳物品()
	通用_等待返回城镇()
结束
--]]

--[[
定义函数 做_莉莉的神经衰弱()
	如果 没有 移动到指定的副本("[队长莉莉]") 那么
		返回 假
	结束

	延迟(5000)
	移动到指定的房间(1);
	延迟(12000)
	移动到指定的房间(2);
	延迟(12000)
	移动到指定的房间(3);
	延迟(12000)
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束
]]

定义函数 做_探访群星()
	如果 没有 移动到指定的副本("[探访群星]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("金毛兽王", 2)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_恶臭的源头()
	如果 移动到指定的副本("[气味的报复]") 那么
		通用_打死副本BOSS()
	结束

	如果 移动到指定的副本("[恶臭的源头]") 那么
		通用_打死副本BOSS()
	结束
结束

定义函数 做_抓狂的斗士们()
	如果 没有 移动到指定的副本("[抓狂的斗士们]") 那么
		返回 假
	结束

	移动到指定的房间(1);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_特殊的训练技巧()
	如果 不 物品是太刀(获取当前所穿武器()) 那么
		去获取指定的材料("铁铸大太刀", 1)
		穿戴物品("铁铸大太刀")
	结束

	如果 没有 移动到指定的副本("[特训练习]") 那么
		返回 假
	结束

	移动到指定的房间(8);

	设置此次攻击模式("右键攻击")
	杀死指定名字和数量的怪物("小雪狮子", 1000)

	通用_等待返回城镇()
结束

定义函数 做_怪光魔术师()
	如果 移动到指定的副本("[琳蒂斯的生态研究]") 那么
		如果 通用_强制采集指定的数量("其他", 5) <= 0 那么
			返回 假
		结束
		通用_返回营地缴纳物品()

		通用_等待返回城镇()
	结束

	如果 移动到指定的副本("[怪光魔术师]") 那么
		通用_打死副本BOSS()
	结束
结束

定义函数 做_持有利刃的生物()
	如果 没有 移动到指定的副本("[神秘的龙人]") 那么
		返回 假
	结束

	延迟(15000)
	移动到指定的房间(3);
	延迟(80000)
	移动到指定的房间(7);

	通用_打死副本BOSS()
结束

定义函数 做_埃兰的故事()
	如果 移动到指定的副本("[龙人的巡猎]") 那么
		杀死指定名字和数量的怪物("冰雷鸟", 2)

		通用_等待返回城镇()
	结束

	如果 移动到指定的副本("[埃兰的往事]") 那么
		通用_打死副本BOSS()
	结束
结束

定义函数 做_交配的好时节()
	如果 没有 移动到指定的副本("[交配的好时节]") 那么
		返回 假
	结束

	等待出现BOSS(1000 * 60)
	杀死指定名字和数量的怪物("毒怪鸟", 1)
	杀死指定名字和数量的怪物("紫毒怪鸟", 1)
	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_狩猎祭第二日()
	如果 移动到指定的副本("[调查升月之地·终]") 那么
		移动到指定的房间(9)
		杀死指定名字和数量的怪物("黄速龙王", 1)
		延迟(1000 * 40)
		摧毁静态可打的怪物("Collapse1", 30, 1, 600)

		移动到指定的房间(10)
		通用_打死副本BOSS()
	结束

	如果 移动到指定的副本("[狩猎祭第二日]") 那么
		通用_打死副本BOSS()
	结束
结束

定义函数 做_高空的狩猎派对！()
	如果 没有 移动到指定的副本("[空降考场]") 那么
		返回 假
	结束

	等待出现BOSS(1000 * 60 * 5)

	获取补给箱物品("支给用热饮")
	使用背包物品("支给用热饮")
	延迟(1000)

	移动到指定的房间(5);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_白王复仇()
	如果 没有 移动到指定的副本("[白王复仇]") 那么
		返回 假
	结束

	移动到指定的房间(7);
	等待出现BOSS(1000 * 60 * 1)
	杀光本房间怪物(400)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_雪山的梅拉露()
	如果 没有 移动到指定的副本("[雪山的梅拉露族]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("野生梅露", 10)
	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

--[[
定义函数 做_沼泽双雄()
	如果 没有 移动到指定的副本("[制霸昆贝尔]") 那么
		返回 假
	结束

	等待出现可打的怪物("大名盾蟹", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("大名盾蟹"), 400)

	等待出现可打的怪物("桃毛兽王", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("桃毛兽王"), 400)

	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束
]]

--[[
定义函数 做_反击的奇面族()
	如果 没有 移动到指定的副本("[鬼脸满山]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("刀奇面", 3)
	杀死指定名字和数量的怪物("箭奇面", 7)
	杀死指定名字和数量的怪物("盾奇面", 2)
	通用_等待剥皮并剥皮()
	通用_等待返回城镇()
结束
]]

定义函数 做_暗夜的雷光()
	如果 没有 移动到指定的副本("[暗夜的雷光]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("雷光虫", 10)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

--[[
定义函数 做_奇面族大进击()
	如果 没有 移动到指定的副本("[进击的奇面族]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束
]]

定义函数 做_空中前哨()
	如果 没有 移动到指定的副本("[险恶之山]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(1000)
	使用背包物品("支给用热饮")

	移动到指定的房间(4);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_贺菲的调查()
	如果 没有 移动到指定的副本("[暗幕下的秘密]") 那么
		返回 假
	结束

	移动到指定的房间(3);
	杀光本房间怪物(400)
	移动到指定的房间(1);
	杀光本房间怪物(400)
	通用_打死副本BOSS()
结束

--[[
定义函数 做_英雄的资格()
	如果 没有 移动到指定的副本("[英雄的资格]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(300)
	使用背包物品("支给用热饮")

	移动到指定的房间(5);
	延迟(50000)
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束
]]

定义函数 做_雪山事件()
	如果 没有 移动到指定的副本("[银封战线]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(300)
	使用背包物品("支给用热饮")

	等待出现可打的怪物("冰雷鸟", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("冰雷鸟"), 400)

	等待出现可打的怪物("雪狮子王", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("雪狮子王"), 400)

	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_流星之下()
	如果 没有 移动到指定的副本("[流星之下]") 那么
		返回 假
	结束

	获取补给箱物品("支给用热饮")
	延迟(300)
	使用背包物品("支给用热饮")

	移动到指定的房间(9)

	等待出现可打的怪物("尾晶蝎", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("尾晶蝎"), 400)
	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_双星现世()
	如果 没有 移动到指定的副本("[双星现世]") 那么
		返回 假
	结束

	获取补给箱物品("支给用冷饮")
	获取补给箱物品("支给用热饮")
	使用背包物品("支给用冷饮")
	延迟(300)
	使用背包物品("支给用热饮")
	延迟(300)

	等待出现可打的怪物("尾晶蝎", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("尾晶蝎"), 400)

	等待出现可打的怪物("星龙", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("星龙"), 400)

	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_亮晶晶的宝石()
	如果 没有 移动到指定的副本("[调查升月之地]") 那么
		返回 假
	结束

	移动到指定的房间(5);
	杀死指定名字和数量的怪物("黄速龙", 3)

	移动到指定的房间(9);
	杀死指定名字和数量的怪物("沙龙", 5)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_沙漠之影()
	--[[
	如果 没有 移动到指定的副本("[沙漠之影]") 那么
		返回 假
	结束
	]]
	如果 没有 移动到指定的副本_ID(0x00031902) 那么
		返回 假
	结束

	通用_打死副本BOSS()
结束

定义函数 做_雪山撼动()
	如果 没有 移动到指定的副本("[雪山撼动]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("小雪狮子", 8)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_升月之地()
	如果 没有 移动到指定的副本("[调查升月之地·续]") 那么
		返回 假
	结束

	移动到指定的房间(9);
	杀死指定名字和数量的怪物("沙龙", 10)
	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束

定义函数 做_集结的猎人之都()
	如果 没有 移动到指定的副本("[火热的猎场]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	等待出现可打的怪物("一角龙", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("一角龙"), 400)

	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_试练一角龙()
	如果 没有 移动到指定的副本("试练！一角龙") 那么
		返回 假
	结束

	移动到指定的房间(2);
	等待出现可打的怪物("一角龙", 1000 * 60)
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("一角龙"), 400)

	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_斗狂黑狼()
	如果 没有 移动到指定的副本("[颓废的斗士们]") 那么
		返回 假
	结束

	移动到指定的房间(3);
	延迟(2000)

	移动到指定的房间(6);
	通用_打死副本BOSS()
结束

定义函数 做_战鬼的终焉()
	如果 没有 移动到指定的副本("[月狸兽的终结]") 那么
		返回 假
	结束

	移动到指定的房间(2);
	杀光本房间怪物(400)

	通用_等待剥皮并剥皮()

	通用_等待返回城镇()
结束


定义函数 做_再临，烈焰女王()
	如果 没有 移动到指定的副本("[御石的秘密]") 那么
		返回 假
	结束

	等待角色可以移动(1000 * 60)
	移动到指定的房间(5);
	等待角色可以移动(1000 * 60)

	收刀()
	延迟(2000)
	设置角色坐标(1011.31, 971.74, 61.1)
	延迟(4000)
	按Z键()
	延迟(4000)
	设置角色坐标(983.84, 985.55, 61.43)
	延迟(4000)
	按Z键()
	延迟(4000)
	设置角色坐标(978.91, 1016.26, 61.02)
	延迟(4000)
	按Z键()
	延迟(4000)
	设置角色坐标(1015.78, 1030.35, 61.19)
	延迟(4000)
	按Z键()
	延迟(4000)
	设置角色坐标(1027.22, 1015.92, 61.32)
	延迟(4000)
	按Z键()
	延迟(1000 * 50)

	移动到指定的房间(8);
	等待角色可以移动(1000 * 60)
	如果 通用_强制采集指定的数量("其他") <= 0 那么
		返回 假
	结束

	等待出现可打的怪物("烈焰女王", 1000 * 60)
	移动到指定的房间(6);
	攻击指定的怪物直到死亡(查找指定名字的可打的对象("烈焰女王"), 400)

	通用_等待剥皮并剥皮()

	通用_杀死BOSS并剥皮()
	通用_等待返回城镇()
结束

定义函数 做_厄之起点()
	如果 没有 移动到指定的副本("[厄之起点]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("蛇龙", 10)
	通用_等待返回城镇()
结束

定义函数 做_治愈的高岭之花()
	如果 没有 移动到指定的副本("[治愈的高岭之花]") 那么
		返回 假
	结束

	如果 通用_强制采集指定的数量("其他", 6) <= 0 那么
		返回 假
	结束
	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束

定义函数 做_口袋里的珍馐()
	如果 没有 移动到指定的副本("[口袋里的珍馐]") 那么
		返回 假
	结束

	杀死指定名字和数量的怪物("雪狮子", 6)


	通用_等待返回城镇()
结束

定义函数 做_虚无的供奉()
	如果 没有 移动到指定的副本("[又是龙晶！]") 那么
		返回 假
	结束

	移动到指定的房间(6);
	如果 通用_强制采集指定的数量("其他", 10) <= 0 那么
		返回 假
	结束
	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束

定义函数 做_厄运连连()
	如果 没有 移动到指定的副本("[厄运连连]") 那么
		返回 假
	结束

	移动到指定的房间(4)
	延迟(3000)
	移动到指定的房间(6)


	返回 通用_打死副本BOSS()
结束

定义函数 做_易耗品？燃石炭！()
	如果 没有 移动到指定的副本("[易耗品燃石炭]") 那么
		返回 假
	结束

	移动到指定的房间(5);
	如果 通用_强制采集指定的数量("其他", 10) <= 0 那么
		返回 假
	结束
	通用_返回营地缴纳物品()

	通用_等待返回城镇()
结束
