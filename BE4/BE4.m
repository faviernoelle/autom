
BE4 : Automatisme

%% FAVIER - COUDERC

%% Clean Matlab 

% Clean matlab
clear all;
close all;
clc

%% define parameters

% Paramètres du système 
Te=1;

%% User definition 

trdes = 10 ;
Tau_des = trdes/3 ;
p_des = -1/Tau_des ;
z_des = exp(p_des*Te);



%% Cas avec compensation 


K_avec = (1-z_des)/2.5 
a_avec = 1.5 ;

H_de_z_avec = tf(2.5,[1 -a_avec],Te) ;
C_de_z = tf([K_avec -K_avec*a_avec],[1 -1],Te) ;
Hbo_avec = series(H_de_z_avec,C_de_z) ;
FTBF_avec_compensation = feedback(Hbo_avec,1) ;
Hregul = feedback (H_de_z_avec,C_de_z);

figure(1)
step(FTBF_avec_compensation);
title('compensation pole instable, asservissement')
figure(2)
step (Hregul) ;
title('compensation pole instable regulation')

%% cas sans compensation 


Tau_desire = trdes/4.75 ;
zi = exp(-Te/Tau_desire) ;
K_ss = -2*zi/2.5+1;
a_ss = (1.5-zi*zi)/(K_ss*2.5);

H_de_z_ss = tf([2.5*K_ss -2.5*K_ss*a_ss],[1 2.5*K_ss-2.5 1.5-a_ss*K_ss*2.5],Te);
Hbo_ss = series(H_de_z_ss,C_de_z);
Hbf_ss=feedback(Hbo_ss,1);
Hregul_bis=feedback(H_de_z_ss,C_de_z);

figure(3)
step(Hbf_ss);
title('sans compensation pole instable,asservissement')

figure(4)
step(Hregul_bis);
title('sans compensation pole instable, regulation');

% a revoir 

%% Compensation de zeros instables 

a= 0.5 ;
b= 0.8 ;
c= -1.5 ;
K = 0.259 ; 

H2 = tf([1 1.5],[1 -0.5-0.8 0.5*0.8],Te);
C2 = tf([K -K*a-b*K K*a*b],[1 -1-c c],Te);

Hbo_2=series(H2,C2);
Hbf_2=feedback(Hbo_2,1);

figure(5)
step(Hbf_2);
title('compensation de zero instable, asservissement');

Hregul2 = feedback ( H2 , C2 ) ;

figure(6)
step (Hregul2);
title('compensation de zero instable, regulation');


%% Sans compensation de zeros 

a= 0.5 ;
b= 0.8 ;
c= 0.3 ;
K= 0.0572 ; 

H3 = tf([1 1.5],[1 -0.5-0.8 0.5*0.8],Te);
C3 = tf([K -K*a-b*K K*a*b],[1 -1-c c],Te);

Hbo_3=series(H3,C3);
Hbf_3=feedback(Hbo_3,1);

figure(7)
step(Hbf_3);
title('sans compensation de zero, asservissement');

Hregul3 = feedback ( H3 , C3 ) ;

figure(8)
step (Hregul3);
title('sans compensation de zero, regulation');

