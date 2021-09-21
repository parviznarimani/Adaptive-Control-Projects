% In the name of God
clear ;close all; clc

Td=.01;
t=800;% simulation time
tp=200;


%% main system diagram ----------------------------------------------------
%% DC Motor Parameter for Sliding Mode Controller
J=6.87*1e-5;
nu=1.041*1e-3;
k=.21;
lambda=-100000;
b=k/J;
Gamma=119.7*1e-3;

%% DC Motor Transfer Function
B=k/J;
A=[1,(nu+Gamma)/J,0];
%{          
                b0
    Gs = ----------------
          a0*s^2+a1*s+a2
%}
b0=B;
a0=A(1);
a1=A(2);
a2=A(3);


%% Gains
gamma=1000;
 g=gamma*ones(1,3)
 g1=g(1);
 g2=g(2);
  g3=g(3);

%% model parameters
bm=B;
% 
am1=2*.9*sqrt(B);
am2=B;
%%-------------------------------------------------------------------------
% model system diagram
num_m=bm;
den_m = [1,am1,am2];
Gm=tf(num_m,den_m)
step(Gm)

sim adaptiv_proj_6
figure(2)
subplot(211);
title('DC Motor Position Controller');
plot(input,'linewidth',2);
hold on;
grid on;
plot(controlled,'--','linewidth',2);
xlabel('time');
ylabel('Amplitude');
legend('Controlled Signal','Model out Signal');
subplot(212);
plot(model,'-.','linewidth',1);
xlabel('time');
ylabel('Amplitude');
legend('Input Signal');
grid on;

figure(3)

subplot(311)
plot(out_f)
grid on;
title('f')
subplot(312)
plot(out_q1)
grid on;
title('q1')
subplot(313)
plot(out_q0)
grid on;
title('q0')


