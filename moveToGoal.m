clear;
%% Load all parameters
[dt, R, L] = parameters();
%% Load Fuzyy model
fis = readfis('mobile');
%% init the fisrt position of Mobile Robot
pose = initPose();
%% Set goal for robot
% goals = [[10,20];[40,15];[10,40]];
goals = [40,50];
%% Move to goal
pose_set = pose;   % Save all position of Mobile Robot
goal_shape = size(goals);
for i = 1:goal_shape(1)
    done = false;
    goal = goals(i,:);
    while (~done)
        [angle, distance] = convertToError(pose, goal);
        vel = evalfis(fis, [angle, distance]);
        pose = updatePose(pose, vel, dt);
        pose_set = cat(1, pose_set, pose);
        if abs(sqrt(sum((goal-pose(1,1:2)).^2))) < 1
            done = true;
        end
    end
end
%% Plot Movement of Mobile Robot
plotMobileRobot(pose_set, goals);