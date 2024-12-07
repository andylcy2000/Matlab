clear all; clc;
%%
%(a)

n = -100:1:100;
x1 = 0*(n<=0&n>=40)+n.*(n>=1&n<=20)+(40-n).*(n>=21&n<=39);
%x2 = heaviside(n-11);
unitstep1 = n>=1;
unitstep11 = n>=11;
x2 = unitstep1 - unitstep11;
figure
stem(n,x1);
figure
stem(n,x2);

%%
%(b)

N1 = 1:1:39;
x1 = 0*(N1<=0&N1>=40)+N1.*(N1>=1&N1<=20)+(40-N1).*(N1>=21&N1<=39);
N2 = 1:1:10;
unitstep1 = N2>=1;
unitstep11 = N2>=11;
x2 = unitstep1 - unitstep11;
x1 = transpose(x1);
x2 = transpose(x2);
y = conv(x1,x2);
n = 2:1:49
figure
stem(n,y);

%%
%(c)

%matrix1 = [x1(1), 0, 0, 0, 0, 0, 0, 0, 0, 0;
%           x1(2), x1(1), 0, 0, 0, 0, 0, 0, 0, 0;
%           x1(3), x1(2), x1(1), 0, 0, 0, 0, 0, 0, 0;
%           ]

matrix1 = zeros(48,10);
for i = 1:39
    for j = 1:min(i,10)
        matrix1(i,j) = x1(i-j+1);
    end
end

for i =40:48
    for j = i-38:10
        matrix1(i,j) = x1(39-(j-(i-38)));
    end
end

y = matrix1*x2;
figure
stem(n,y);

%%
%(d)

n = 1:1:3;
x1 = zeros(1,3);
x_extend = zeros(1,10)
for i = n
    x1(1,i) = 0*(i<=0&i>=4)+3^i.*(i>=1&i<=3);
end
x1_extend = [x_extend,x1,x_extend];

n = -9:1:13;
figure
stem(n,x1_extend);

n = 1:1:5;
x2 = zeros(1,5);
for i = n
    x2(1,i) = 0*(i<=0&i>=6)+2^i.*(i>=1&i<=5);
end
x2_extend = [x_extend,x2,x_extend];
n = -9:1:15;
figure
stem(n,x2_extend);


N1 = 1:1:3;
N2 = 1:1:5;
x1 = transpose(x1);
x2 = transpose(x2);
y = conv(x1,x2);
n = 2:1:8;
figure
stem(n,y);


matrix2 = zeros(7,5);
for i = 1:3
    for j = 1:min(i,5)
        matrix2(i,j) = x1(i-j+1);
    end
end

for i =4:7
    for j = i-2:5
        if 3-(j-(i-2))>0
            matrix2(i,j) = x1(3-(j-(i-2)));
        end
    end
end

y = matrix2*x2;
figure
stem(n,y);