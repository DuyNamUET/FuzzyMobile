function [angle,distance] = convertToError(curr,goal)
%CONVERTTOERROR Convert goal and current pose to distance and angle
% curr - (x, y, theta)
% goal - (x, y)
error = goal - curr(1,1:2);
distance = sqrt(sum(error.^2));
angle = atan2(error(2), error(1))-curr(3);
end

