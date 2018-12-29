function [yi, R] = bulirschstoer(x, y, xi)

% BULIRSCHSTOER Rational interpolation using the Bulirsch-Stoer Method
%    BULIRSCHSTOER(X,Y,XI) interpolates to find YI, the value of
%    the underlying function Y at the points in the array XI,
%    using the Bulirsch-Stoer Method.  X and Y must be vectors of
%    length N.
%
%    [YI,R] = BULIRSCHSTOER() also returns the rational polynomial
%    table R calculated for the last XI.

% Joe Henning - Fall 2011

n = length(x);

tol = n * max(y) * eps(class(y));

for k = 1:length(xi)
   isiny = 0;
   for i = 1:n
      if (xi(k) == x(i))
         yi(k) = y(i);
         isiny = 1;
         break
      end
   end

   if (isiny)
      continue
   end

   xd = [];
   for i = 1:n
      xd(i) = abs(x(i) - xi(k));
   end

   [xds,i] = sort(xd);

   x = x(i);
   y = y(i);

   R = zeros(n,n);
   R(:,1) = y(:);

   for i = 1:n-1
      for j = 1:(n-i)
         if ((i-1) < 1)
            R(j,i+1) = R(j,i) + (R(j,i) - R(j+1,i))/(((xi(k)-x(j+i))/(xi(k)-x(j)))*(1 - (R(j,i) - R(j+1,i))/(R(j,i)+tol)) - 1);
         else
            R(j,i+1) = R(j,i) + (R(j,i) - R(j+1,i))/(((xi(k)-x(j+i))/(xi(k)-x(j)))*(1 - (R(j,i) - R(j+1,i))/(R(j,i) - R(j+1,i-1)+tol)) - 1);
         end
      end
   end

   yi(k) = R(1,n);
end
