%Control Servo Motor
function servo_cntr_func(cog_x,cog_y,output_zmp_x,output_zmp_y)
    load('data/ServoID.mat');
    load('data/walk_parameter_table');
    
    i=1;
    while(1)
        %Calculation Invert Kinematics
        [cog_angle,zmp_angle] = cal_inv_kine_pc(cog_x(i),cog_y(i),output_zmp_x(i),output_zmp_y(i),output_zmp_z);
        
        %Servo Control Start
        vrep.simxPauseCommunication(clientID,1);
        
%         RSMove(KneeR_P,zmp_angle(1));    %EGsb`
%         RSMove(AnkleR_P,zmp_angle(2));   %E«ñsb`
        RSMove(HipR_R,cog_angle(1))      %EÒ[
        RSMove(AnkleR_R,cog_angle(2));   %E«ñ[
        %RSMove(HipR_Y,angle5);          %EÒ[
        
%         RSMove(KneeL_P,zmp_angle(1));    %¶Gsb`
%         RSMove(AnkleL_P,zmp_angle(2));   %¶«ñsb`
        RSMove(HipL_R,cog_angle(1));     %¶Ò[
        RSMove(AnkleL_R,cog_angle(2));   %¶«ñ[
        %RSMove(HipL_Y,angle10);         %¶Ò[

        vrep.simxPauseCommunication(clientID,0);
    
        i=i+1;
        wait(period);     %êèüúwait
    end
end
