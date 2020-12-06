function plotMobileRobot(pose_set, check_points)
%PLOTMOBILEROBOT Plot movemant of Robot
% pose_set - list pose
%% Load all parameters
[dt, R, L] = parameters();
%% Config  plot
xlim_graph = [0 100];
ylim_graph = [0 100];
pos_graph = animatedline('Marker','o');
point_graph = animatedline('Marker','h','Color','r','LineStyle','none');
%% Plot
pos_shape = size(pose_set);
point_shape = size(check_points);
% Declare graph
xlim(xlim_graph);
ylim(ylim_graph);
% Plot CheckPoint
for k = 1:point_shape(1)
    check_point = check_points(k,:);
    addpoints(point_graph,check_point(1),check_point(2))
    drawnow limitrate
end
% Plot Pose
for k = 1:pos_shape(1)
    pose = pose_set(k,:);
    addpoints(pos_graph,pose(1),pose(2))
    drawnow limitrate
    pause(dt)
end
end

