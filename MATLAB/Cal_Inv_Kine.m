%Calulation InvertKinematics function
%ř      target:ÚWlxyzĚzń clientID:
%ßčl    d1:Gsb` d2:Ťńsb` d3:Ň[ d4:Ťń[ d5:Ň[
%zńÉľÄÔˇ
function Target_Angle = cal_inv_kine(target_position)
    load('data/ServoID');
    
    %Np[^
    %sb`˛
    L0  = 41;
    L1  = 105;
    L12 = 41;
    L2  = 105;
    L3  = 43.5;
    
    L   = L0 + L1 + L12 + L2 + L3;
    
    %t^ŽwvZ
    %EŤ
    w1 = atan2(target_position(1,1),L-target_position(1,3)-L3-L0);
    w2 = sqrt(target_position(1,1)^2+target_position(1,2)^2+(L-target_position(1,3)-L3-L0)^2);
    w3 = acos((w2-L12)/(2*L1));
    w4 = atan(target_position(1,2)/(L-target_position(1,3)-L3-L0));
    
    d1 = -1 * (w1+w3) * 180 / 3.14;    %Gsb`
    d2 = -1 * (w1-w3) * 180 / 3.14;    %Ťńsb`
    d3 = w4 * 180 / 3.14;                            %Ň[
    d4 = w4 * 180 / 3.14;                            %Ťń[
    d5 = 0;                            %Ň[
    
    %śŤ
    w5 = atan2(target_position(2,1),L-target_position(2,3)-L3-L0);
    w6 = sqrt(target_position(2,1)^2+target_position(2,2)^2+(L-target_position(2,3)-L3-L0)^2);
    w7 = acos((w6-L12)/(2*L1));
    w8 = atan(target_position(2,2)/(L-target_position(2,3)-L3-L0));
    
    d6 = (w5+w7) * 180 / 3.14;         %Gsb`
    d7 = (w5-w7) * 180 / 3.14;         %Ťńsb`
    d8 = w8 * 180 / 3.14;                            %Ň[
    d9 = w8 * 180 / 3.14;                           %Ťń[
    d10 = 0;                            %Ň[
    
    Target_Angle = [d1 d2 d3 d4 d5  d6 d7 d8 d9 d10];
end
