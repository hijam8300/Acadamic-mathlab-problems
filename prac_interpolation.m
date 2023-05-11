clc
clear all
x=[1891 1901 1911 1921 1931];
y=[46 66 11 93 151];
len=length(y);
dt(1,1)=0;
for i=1:len
    dt(i,1)=x(i);
    dt(i,2)=y(i);
end
disp(dt);
n=len-1;
%{
for j=3:len+1
    for i=1:n
        dt(i,j)=dt(i+1,j-1)-dt(i,j-1);
    end
    n=n-1;
end
disp(dt);

%}
for j=3:len+1
    for i=j-1:len
        dt(i,j)=dt(i,j-1)-dt(i-1,j-1);
    end
    n=n-1;
end
disp(dt);  


z=1911;
h=(x(2)-x(1));
%u=(z-x(1))/h;
u=(z-x(len))/h;
term=1;
%sum=y(1);
sum=y(end);
%{
for i=1:len-1
    term=term*(u-i+1);
    sum=sum+(term*dt(1,i+2)/factorial(i));
end
%}
for i=1:len-1
    term=term*(u+i-1);
    sum=sum+(term*dt(len,i+2)/factorial(i));
end
disp(sum);

plot(x,y,':r');
hold on
plot(z,sum,'ok');





    