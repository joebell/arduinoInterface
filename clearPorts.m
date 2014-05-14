%% 
% clearPorts.m
%
% This function will close all open serial ports. This frees them up for 
% other programs to use.
% 
% JSB 5/2014
function clearPorts()

    fclose(instrfind);