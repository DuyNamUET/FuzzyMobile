clear;
%% Load all parameters
[dt, R, L] = parameters();
%% Load Fuzyy model
fis = readfis('mobile');
%% init the fisrt position of Mobile Robot
pose = initPose();
%% Set goal for robot
goals = [[10,20];[40,15];[10,40]];
%% Move to goal
pose_set = pose;   % Save all position of Mobile Robot
goal_shape = size(goals);
for i = 1:goal_shape(1)
    done = false;
    goal = goals(i,:);
    while (~done)
        [angle, distance] = convertToError(pose, goal);
        wheel = evalfis(fis, [distance, angle]);
        wR = wheel(1); wL = wheel(2);
        [v,w] = forwardKinematic(wR, wL);
        vel = [v, w];
        pose = updatePose(pose, vel, dt);
        pose_set = cat(1, pose_set, pose);
%         pose
%         pause(dt);
        if abs(sqrt(sum((goal-pose(1,1:2)).^2))) < .1
            done = true;
        end
    end
end
%% Plot Movement of Mobile Robot
plotMobileRobot(pose_set, goals);