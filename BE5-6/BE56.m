BE 5&6 : Automatisme 
 
%% FAVIER - - COUDERC

%% Clean MATLAB

clear all
close all
clc

%% Definition des parametres 


global m l k g;
x01=[-pi/5;pi/6];
x02=[-pi/2;pi/2];
m=0.35;
l=0.5;
k=0;
g=9.81;

%% Fonction de transfert

G_de_s=tf(1/m*l*l,[1 k/m g*l]);
A=[0 1;-g/l -k/m];
B=[0;1/m*l*l];
C=[1 0];
D=0;




