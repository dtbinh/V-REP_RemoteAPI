%|----------------------------------------------------|
%|-@file    Init_PreviewControl_Parameter.m           |
%|-@brief   Initializing Paramter of Preview Control  |
%|-@date    2015.1.23                                 |
%|-@author  Ryu Yamamoto                              |
%|----------------------------------------------------|
function Init_PreviewControl_Paramter()
    pc_time=1;          %Preview Width
    calc_time=10;       %Time for Walk Pattern
    sample_time=0.01;   %Sampling Time
    center_z=290;       %Position of Center Of Gravity(z)
    g=-9810;            %Acceleration Of Gravity

    %Coefficient Matrix of System
    A=[0 1 0;0 0 1;0 0 0];
    B=[0;0;1];
    C=[1 0 center_z/g];
    D=0;
    E_d=[sample_time;1;0];              %Disturbance Matrix
    sys=ss(A,B,C,D);                    %State Space Model
    sys_d=c2d(sys,sample_time);         %Discretization
    [A_d,B_d,C_d,D_d]=ssdata(sys_d);

    %Error System
    ZERO=[0;0;0];
    phi=[1 -C_d*A_d;ZERO A_d];
    G=[-C_d*B_d;B_d];
    GR=[1;ZERO];
    G_d=[-C_d*E_d;E_d];

    Q=zeros(4,4);   
    Q(1)=1e+8;     
    H=1;   
    
    %Riccati Equation
    [K,P]=dlqr(phi,G,Q,H);
    K=-(H+G'*P*G)^(-1)*G'*P*phi;

    xi = (eye(4,4)-G*(H+G'*P*G)^(-1)*G'*P)*phi;
    
    save('data/PreviewControl_Table');
end