function [v,w] = forwardKinematic(wR,wL)
%FOWARDKINEMATIC Summary of this function goes here
%% Load all parameters
[dt, wheelR, wheelD] = parameters();
%% Forward kinematics
v = wheelR/2*(wR+wL);
w = wheelR/wheelD*(wL-wR);
end