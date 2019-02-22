%% DLM demo no 2, testing DLM functions
%% 初始化
clc
clear all

%% 
% 读入数据
 Fs = 22050;
filename = 'clicks.wav';
[y,Fs] = audioread(filename);
s = 0.1; % obs error std 
y=y(:,1);
A=1:10:length(y);
y=y(A);
N=length(y);
t = (0:N-1)'; % time

%%
figure(1); clf
plot(t,y,'o-'); xlabel('time'); ylabel('y'); title('observations');grid;

%% 
% Model error diagonal, first non zero values.
w123 = [0.0000,3.1e-5,1e-8,1e-8,1e-8,1e-8];

%%
% Options for |dlmfit| function. Use harmonic functions with 2
% components and 12 seasons. Optimize some variance parameters using maximum likelihood.
clear options
options.ns = 12;
options.trig = 2;
options.opt = 1;
options.winds = [0 1 2 2 2 2];

%% 
% DLM fit.
out = dlmfit(y,s,w123,[],[],[],options);

%%
% Default plots.
dlmplot(out);

