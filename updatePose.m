function cur = updatePose(pos, vel, dt)
%UPDATEPOSE Summary of this function goes here
% pos, cur - [x, y, theta]
% vel - [v, w]

cur(1) = pos(1) + vel(1)*cos(pos(3))*dt;
cur(2) = pos(2) + vel(1)*sin(pos(3))*dt;
cur(3) = pos(3) + vel(2)*dt;

end

