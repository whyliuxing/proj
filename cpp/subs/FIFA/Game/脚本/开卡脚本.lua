加载脚本文件("配置信息.lua");

加载脚本文件("开卡流程.lua");

定义函数 主逻辑循环()
	如果 可以选择教练() 那么
		进入游戏();
	否则如果 进入到游戏() 那么
		关闭每日任务框();

		如果 可以买GP礼包(3) 那么
			买GP礼包(3);
		结束

		选择友谊赛();
		选择经理人模式();
	否则如果 比赛完需要续约() 那么
		关闭每日任务框();
		按ESC键();
		解决卡续约问题()
		延迟(300);
		选择对阵好友()
	否则如果 只是在比赛房间() 那么
		关闭每日任务框();
		延迟(500);
		关闭每日任务框();
		选择对阵好友()
	否则如果 在比赛房间() 那么
		关闭每日任务框();
		如果 没有 选择了对阵电脑() 且 没有 选择了随机对手() 那么
			选择对阵电脑();
			输出脚本信息("第一次选择对阵电脑");
		否则
			如果 选择了随机对手() 那么
				解决有时不能交易问题();
				延迟(200);
				选择对阵电脑();
				输出脚本信息("选择对阵电脑");
			否则如果 选择了对阵电脑() 那么
				解决有时不能交易问题();
				延迟(200);
				选择随机对手();
				输出脚本信息("选择随机对手");
			结束
		结束

		延迟(500);

		开卡流程();
	结束
	返回 真
结束

循环 主逻辑循环() 执行
	延迟(4000);
	按ESC键();
结束
