function Init_Walk_Parameter()
    period=0.01;        %歩行計算周期
    lift_leg_time = 0.5; %遊脚を生成する時間
    up_leg_length = 45; %足上げ量
    z_leg_counter = 0;
    save('data/walk_paramter_table');
end