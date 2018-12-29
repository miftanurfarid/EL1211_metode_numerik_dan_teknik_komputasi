function [yi, p, pval] = hermitediv(x, y, yp, ypp, xi)

% HERMITEDIV Hermite divided difference interpolation
%    HERMITEDIV(X,Y,YP,YPP,XI) interpolates to find YI, the
%    values of the underlying function Y at the points in
%    the array XI, using divided difference hermite
%    interpolation.  X and Y must be vectors of length N.
%    YP can be used to specify the first derivative of Y,
%    and YPP can be used to specify the second derivative.
%
%    [YI,P,PVAL] = HERMITEDIV() also returns P, the coefficients
%    of the interpolating Hermite polynomial calculated via
%    divided difference, and PVAL, which specifies the maximum
%    degree of the interpolating polynomial.

% Joe Henning - Fall 2011

if (nargin < 5)
   help hermitediv;
   yi = NaN;
   p = NaN;
   pval = NaN;
   return
end

if (isempty(yp) && isempty(ypp))
   order = 1;
   yp = [];
   ypp = [];
   pval = length(x)*(0+1) - 1;
elseif (isempty(ypp))
   order = 2;
   ypp = [];
   pval = length(x)*(1+1) - 1;
else
   order = 3;
   pval = length(x)*(2+1) - 1;
end

x = reshape(repmat(x,order,1),1,length(x)*order);
y = reshape(repmat(y,order,1),1,length(y)*order);
yp = reshape(repmat(yp,order,1),1,length(yp)*order);
ypp = reshape(repmat(ypp,order,1),1,length(ypp)*order);

n = length(x)-1;
D = zeros(n+1,n+1);
D(:,1) = y(:);

tol = n * max(x) * eps(class(x));
   
if (order == 1)
   for i = 1:n
      for j = 1:i
         D(i+1,j+1) = (D(i+1,j)-D(i,j))/(x(i+1)-x(i-j+1));
      end
   end
elseif (order == 2)
   for i = 1:n
      for j = 1:i
         h = (x(i+1)-x(i-j+1));
         if (j == 1 && h < tol)
            D(i+1,j+1) = yp(i)/1;
         else
            D(i+1,j+1) = (D(i+1,j)-D(i,j))/h;
         end
      end
   end
else
   for i = 1:n
      for j = 1:i
         h = (x(i+1)-x(i-j+1));
         if (j == 1 && h < tol)
            D(i+1,j+1) = yp(i)/1.0;
         elseif (j == 2 && h < tol)
            D(i+1,j+1) = ypp(i)/2.0;
         else
            D(i+1,j+1) = (D(i+1,j)-D(i,j))/h;
         end
      end
   end
end

p = diag(D);

for k = 1:length(xi)
   % Evaluate polynomial with the difference coefficients
   yi(k) = 0;
   for i = 1:length(p)
      term = p(i);
      for j = 1:i
         if (j == 1)
            term = term*1;
         else
            term = term*(xi(k)-x(j-1));
         end
      end
      yi(k) = yi(k) + term;
   end
end
