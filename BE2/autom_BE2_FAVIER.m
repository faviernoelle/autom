%%
BE2 automatisme : FAVIER Noelle 

%% Clean Matlab and define parameters

% Clean matlab
clear all;
close all;
clc

% Paramètres du système 
k1=0.6;
k2=0.25;
Tau=5;

%% User definition 

N=100;
trdes=12.5;
Te=2;

%% correcteur definition 

% Correcteur PID avec réglage kp, Ti et Td :
kp=6*Tau/(trdes*k1);
Ti=2*Tau;
Td=Tau/2;

Kp=tf([kp*Ti*Td kp*Ti kp],[Ti 0]);

%% Fonction F(p) et P(p)

FP=tf(k1+k2,[Tau*Tau 2*Tau 1]);



%% Fonction de transfert boucle ouverte 

Hbo=Kp*FP;

disp('-------------------------------------------------------------------')
disp('fonction boucle ouverte : ')
Hbo

%% Compensation des poles 

Hbo_avec_compensation=tf(kp*(k1),[2*Tau 0]);
disp('-------------------------------------------------------------------')
disp('fonction boucle ouverte : ')
Hbo_avec_compensation

%% Fonction de transfert boucle fermée 

Hbf=feedback(Hbo_avec_compensation,1);
disp('-------------------------------------------------------------------')
disp('fonction boucle fermée : ')
Hbf

%% Reponse indicielle 

figure(1)
step(Hbf)
title('reponse a un echelon (boucle fermee)')

figure(2)
bode(Hbf)
title('diagramme de bode de la Hbf')

%% Discretisation 


Kz=c2d(Kp,Te,method);
