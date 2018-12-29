function [yi, ypi] = qspline(x, y, c0, xi)

% QSPLINE 1-D piecewise quadratic spline interpolation
%    QSPLINE(X,Y,C0,XI) interpolates to find YI, the values of
%    the underlying function Y at the points in the array XI, using
%    piecewise quadratic spline interpolation.  X and Y must be
%    vectors of length N.
%
%    C0 specifies the quadratic coefficient of the first 
%    interpolation interval.  If it is empty, the function is
%    signaled to set the bound condition for a natural spline.
%
%    [YI,YPI] = QSPLINE() also returns the interpolated linear
%    derivative of the underlying function Y at points XI.

% Joe Henning - Fall 2012

n = length(x);
u = zeros(1,n);
v = zeros(1,n-1);

% The boundary is set to natural
if (isempty(c0))
   u(1) = 0;
else
   u(1) = (y(2)-y(1))/(x(2)-x(1)) - (x(2)-x(1))*c0;
end

for i = 2:n
   u(i) = -u(i-1) + 2*(y(i)-y(i-1))/(x(i)-x(i-1));
end

for i = 1:n-1
   v(i) = (u(i+1)-u(i))/(2*(x(i+1)-x(i)));
end

for i = 1:length(xi)
   % Find the right place in the table by means of a bisection.
   klo = 1;
   khi = n;
   while (khi-klo > 1)
      k = fix((khi+klo)/2.0);
      if (x(k) > xi(i))
         khi = k;
      else
         klo = k;
      end
   end
   
   h = x(khi) - x(klo);
   if (h == 0.0)
      fprintf('??? Bad x input to qspline ==> x values must be distinct\n');
      yi(i) = NaN;
      ypi(i) = NaN;
      continue;
   end
   
   % Evaluate quadratic spline polynomial
   yi(i) = y(klo) + u(klo)*(xi(i)-x(klo)) + v(klo)*(xi(i)-x(klo))*(xi(i)-x(klo));

   % Differentiate to find the first-order interpolant
   ypi(i) = u(klo) + 2*v(klo)*(xi(i)-x(klo));
end
