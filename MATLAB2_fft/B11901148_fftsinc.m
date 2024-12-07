clear all; clc;
%%
%(a)

N=1001;
N1=(N-1)/2;
T=100;
TS=T/N1;
n = -N1:1:N1;

%xn = sin(2*pi*(n*TS))/(2*pi*(n*TS));
xn = zeros(1,2*N1+1);
for j = 1:(2*N1+1)
    %xn(1,i) = i;
    %if i <= N1
    %    xn(1,i) = sin(2*pi*((i-N1)*TS))/(2*pi*((i-N1)*TS));
    %else
    t=n(j)*TS;
    xn(j)=sin(2*pi*t)/(2*pi*t);
    %end
end
xn(N1+1)=1;
%figure
plot(n,xn);

%%
%(b)
%X= fft(xn,N);
X=fft(xn);
omega = zeros(1,2*N1+1);
for j = 1:(2*N1+1)
    omega(j) = (2*pi*(j-N1-2))/N;
end

figure
plot(omega,abs(fftshift(X)));

%%
%(c)

X_manual = zeros(1,N);
for k = 1:N
    sigma = 0;
    for j = 1:N        
        sigma=sigma+xn(j)*exp(-1i*2*pi*(j-N1-2)*(k-N1-2)/N);
    end
    X_manual(k) = sigma;
end

figure
plot(omega,abs(X_manual));

%%
%(d)
wn = zeros(1,N);
Tw=T/2;
for j = 1:N
    t=n(j)*TS;
    if abs(t)<=(Tw/2)
        wn(j)=0.5*(1+cos(2*pi*abs(t)/Tw));
    end
end
figure
plot(n,wn);

%%
%(d)
yn = zeros(1,N);
for j = 1:N
    yn(j) = xn(j)*wn(j);
end
figure
plot(n,yn);

%%
%(f)
Y=fft(yn);

figure
plot(omega,abs(fftshift(Y)));