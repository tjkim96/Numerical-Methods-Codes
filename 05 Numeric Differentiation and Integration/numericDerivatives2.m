function dydx = numericDerivatives2(x,y)
% ME 2004: Function to compute numeric derivatives. Forward difference at
% the first point, backwards difference at the last point, and central
% difference at the interior points. Works best for discrete data. 
% 
% Works for any step size, constant or unequal.

% Determine vector sizes
sizeX = size(x);
sizeY = size(y);

if ~isequal(sizeX,sizeY)
    error('x and y are not the same size!')
end

% Compute forward, backward, and central differences
fd = (y(2)-y(1))/(x(2)-x(1));
cd = (y(3:end)-y(1:end-2))./(x(3:end)-x(1:end-2));
bd = (y(end)-y(end-1))/(x(end)-x(end-1));

% Assemble dydx vector in appropriate size
if isequal(sizeX(1),1)      % Row vector
    dydx = [fd cd bd];
else                        % Column vector
    dydx = [fd;
        cd;
        bd];
end
end