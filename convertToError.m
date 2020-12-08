function [angle,distance] = convertToError(curr,goal)
%CONVERTTOERROR Convert goal and current pose to distance and angle
% curr - (x, y, theta)
% goal - (x, y)

distance = sqrt((goal(1)-curr(1))^2 + (goal(2)-curr(2))^2);
angle = atan2(goal(2)-curr(2), goal(1)-curr(1))-curr(3);
end

