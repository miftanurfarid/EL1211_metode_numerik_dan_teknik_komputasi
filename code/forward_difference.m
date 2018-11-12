clear all
clc
format long g
syms s
x=input('x=')
y=input('y=');
xs=input('xs=');
h=x(end)-x(end-1);x0=x(1);sh=(xs-x0)/h;
k=length(x)-1; b=zeros(k+1,k); yy=y; z=sym(zeros(k,1));
% if length(x)~=length(y)
%     disp('lengths must be same')
%     break
% end
for i=1:k
    for j=1:k-i+1
        yy(j)=yy(j+1)-yy(j);
        b(j,i)=yy(j);
    end
end
for i=1:k
    ss=1;
    for j=0:i-1
        ss=ss*(s-j);
    end
    z(i,1)=ss;
end
F=0;
for i=1:k
    F=F+(z(i,1)/factorial(i))*b(1,i);
end
F0=char(F);pn=inline(F0,'s');
disp('         x             y                     Dy(forward)s:')
disp('**************************************************************************')
disp([x' y' b])
disp('The NGFD interpolation is p(xs=x0+sh)= ')
pretty(F+y(1))
disp('  ')
disp(['Newton-Gregory forward interpolation p(x) for x=',{xs},'is',{pn(sh)+y(1)}])
          

