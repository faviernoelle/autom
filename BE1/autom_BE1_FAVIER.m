%% Clean Matlab and define parameters

% Clean matlab
clear 
close all
clc

% Paramètres du système
x1e = 0;
a1  = 0.25;
a2  = 0.5;
D   = 0.9;
De  = 0.1;
Cs  = 10;

%% USER DEFINITION
limit = -1; % Limite de stabilité des poles


%% Fonction de transfert en boucle ouverte
clc

disp('-------------------------------------------------------------------')
disp('Fonction de transfert en boucle OUVERTE')
H=tf(-a2*De,[1 (a1+a2+2*D+2*De) (a1+D+De)*(a2+D+De)]) % fonction de transfert

% Question 7 : Etude de la boucle fermée
disp('-------------------------------------------------------------------')
disp('7.a. Fonction de transfert en boucle FERMEE')
K_BF = 338; % Gain de la réponse en boucle fermé
H_BF = feedback(-K_BF*H,1) % H en boucle fermé

disp('-------------------------------------------------------------------')
disp('7.b. Pole du système en boucle FERMEE')
pole_HBF = pole(H_BF);

disp('-------------------------------------------------------------------')
disp('7.c. Tracer la réponse indicielle du système bouclé (step).')
figure(1)
step(H_BF)
title('Step : Reponse à un échelon (boucle fermée)')


disp('-------------------------------------------------------------------')
disp('7.d. Faire le lien entre la réponse indicielle et les poles.')
disp('Gain statique en boucle fermée : ')
gain_BF = dcgain(H_BF)

disp('-------------------------------------------------------------------')
disp('7.e. Determiner l erreur statique')
disp('L erreur statique est de :')
err_stat=1-gain_BF

disp('-------------------------------------------------------------------')
disp('7.f. Visualiser sur le diagramme de Bode les marges de stabilité correspondants à ce réglage.')
disp('Voir figure 2 pour marge de gain et de phase')
figure(2)
bode(H_BF); % diagramme de bode de la boucle fermée

%% Question 8

% K(s) = Kp (1+1/Ti s)
% Define parameters
Kp = 64.4;
Ti = 0.8;

K_BF2 = tf(Kp*[Ti 1],[Ti 0]);

disp('-------------------------------------------------------------------')
disp('8.a. Fonction de transfert en boucle FERMEE')
H_BF2=feedback(-H*K_BF2,1)

disp('-------------------------------------------------------------------')
disp('8.b. Pole du système en boucle FERMEE')
pole_HBF2=pole(H_BF2)

disp('-------------------------------------------------------------------')
disp('8.c. Tracer la réponse indicielle du système bouclé (step).')
figure(3)
step(H_BF2)
title('Step : Reponse à un échelon (boucle fermée)')

disp('-------------------------------------------------------------------')
disp('8.e. Determiner l erreur statique')
disp('L erreur statique est de :')
err_stat=1-dcgain(H_BF2)

disp('-------------------------------------------------------------------')
disp('8.f. Visualiser sur le diagramme de Bode les marges de stabilité correspondants à ce réglage.')
disp('Voir figure 4')
figure(4)
bode(H_BF2); % diagramme de bode de la boucle fermée





