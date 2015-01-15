%Recive walk command
%param  walk_patern:Motino Pattern
%return no
function walk_cmd(walk_patern)
    load('data/Motion');
    
    switch walk_patern
        case STRAIGHT   %Straight  
            straight_pos = [0 0 0 ; 0 0 0];
            straight_ang = Cal_Inv_Kine(straight_pos);
            Servo_OutPut(straight_ang,0.05);
        case READY      %Ready  
            ready_pos = [0 0 20 ; 0 -0 20];
            ready_ang = Cal_Inv_Kine(ready_pos);
            Servo_OutPut(ready_ang,0.05);
        case STEP       %Step
            zmp_p = [0 0 0;0.05 0 44;0.1 0 -44;0.15 0 44;0.2 0 -44;0.2 0 44;0.25 0 -44;0.3 0 44;100 0 0];   %Goal Foot Position
            motion_seq(zmp_p);
%         case FRONT      %Walk Front
%         case BACK       %Walk Back
%         case RIGHT      %Right Turn
%         case LEFT       %Left Turn
    end
end