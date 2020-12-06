function [wR,wL] = inverseKinematic(v,w)
%INVERSEKINEMATIC Summary of this function goes here
%% Load all parameters
[dt, R, L] = parameters();
%% Inverse kinematics
wL = 1/R*(v-w*L/2);
wR = 1/R*(v+w*L/2);
end