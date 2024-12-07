clear all;clc;
%%
%Part2
%(a)

TS=0.002;
f1=100;
M=1000;
n=1:M;
xn=zeros(1,M);

for j=1:M
    xn(j)=cos(2*pi*(j-1)*TS)+2*cos(2*pi*f1*(j-1)*TS);
end

figure
subplot(3,1,1),plot(n,xn)

%%
%(b)
L=16;
fc=0.25;
[b1,a1]=butter(L,fc,'low');
[H,w]=freqz(b1,a1,M);
yn1=filter(b1,a1,xn);
subplot(3,1,2),plot(n,yn1)

%%
%(c)
L=16;
fc=[0.3,0.95];
[b2,a2]=butter(L,fc,'bandpass');
[H,w]=freqz(b2,a2,M);
yn2=filter(b2,a2,xn);
subplot(3,1,3),plot(n,yn2)
