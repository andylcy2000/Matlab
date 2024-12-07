clear all; clc;
%%
%(a)

%N = 0.09*((z-1)^2)*((z+1)^2);
%D = (z-0.3-0.4i)(z-0.3+0.4i)(z-0.1-0.1i)(z-0.1+0.1i);
z = [1,1,-1,-1];
p = [0.3+0.4i, 0.3-0.4i, 0.1+0.1i, 0.1-0.1i];
k = 0.09;


b = 0.09*[1,0,-2,0,1];
a = [1,-0.8,0.39,-0.062,0.005];
subplot(4,2,1);
zplane(b,a);
%H = 0.09*H;

%%
%(b)
[r,p,k] = residuez(b,a);
n = 0:20;
syms z
F = r(1)/(1-p(1)/z) + r(2)/(1-p(2)/z) + r(3)/(1-p(3)/z) + r(4)/(1-p(4)/z) + k;
hn = iztrans(F);
%sam_hn = zeros(1,21);
%for j =1:21
%    sam_hn(j) = hn(j-1);
%end
sub_hn = subs(hn,n);
subplot(4,2,2);
stem(n,sub_hn);

%%
%(c)
[H,w] = freqz(b,a,100);
subplot(4,2,3);
plot(w,(abs(H)));
subplot(4,2,4);
plot(w,angle(H));

%%
%(d)
z = [1,1,-1,-1];
p = [0.3+0.4i, 0.3-0.4i, 0.1+0.1i, 0.1-0.1i];
k = 0.09;
sos = zp2sos(z,p,k);

%%
%(e)
bH1 = zeros(1,3);
bH2 = zeros(1,3);
aH1 = zeros(1,3);
aH2 = zeros(1,3);
for j =1:3
    bH1(j) = sos(1,j);
    bH2(j) = sos(2,j);
end

aH1(1) = 1;
aH2(1) = 1;

for j = 2:3
    aH1(j) = sos(1,3+j);
    aH2(j) = sos(2,3+j);
end

[H1,w1] = freqz(bH1,aH1,100);
[H2,w2] = freqz(bH2,aH2,100);

subplot(4,2,5);
plot(w1,(abs(H1)));

subplot(4,2,6);
plot(w2,(abs(H2)));

HH = zeros(1,100);
for j =1:100
    HH(j)  = abs(H1(j))*abs(H2(j));
end
subplot(4,2,7);
plot(w,(HH));

%%
%(f)
b = 0.09*[1,0,-2,0,1];
a = [1,-0.8,0.39,-0.062,0.005];

xn = zeros(1,21);
xn(1) = 1;
yn = filter(b,a,xn);
n = 0:20;
subplot(4,2,8);
%plot(n,yn);
stem(n,yn);
