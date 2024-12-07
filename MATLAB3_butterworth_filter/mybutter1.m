clear all; clc;
%%
%Part1
%(a)

n=1:100;
TS=1/20;

xn=zeros(1,100);
for j=1:100
    xn(j)=cos(2*pi*(j-1)*TS);
end

figure
plot(n,xn)

%%
%(b)
L=3;
fc=0.05;

[b1,a1]=butter(L,fc,'low');
[H,w]=freqz(b1,a1,100);

figure
subplot(3,3,1),plot(w,db(abs(H)))

%figure
subplot(3,3,2),plot(w,unwrap(angle(H))*180/pi)

yn=filter(b1,a1,xn);
%figure
subplot(3,3,3),plot(n,yn)

%%
%(c)
L=7;
fc=0.05;

[b2,a2]=butter(L,fc,'low');
[H,w]=freqz(b2,a2,100);

%figure
subplot(3,3,4),plot(w,db(abs(H)))

%figure
subplot(3,3,5),plot(w,unwrap(angle(H))*180/pi)

yn=filter(b2,a2,xn);
%figure
subplot(3,3,6),plot(n,yn)

%%
%(d)
L=3;
fc=0.5;

[b3,a3]=butter(L,fc,'low');
[H,w]=freqz(b3,a3,100);

%figure
subplot(3,3,7),plot(w,db(abs(H)))

%figure
subplot(3,3,8),plot(w,unwrap(angle(H))*180/pi)

yn=filter(b3,a3,xn);
%figure
subplot(3,3,9),plot(n,yn)

