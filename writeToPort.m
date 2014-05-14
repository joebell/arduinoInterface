%% 
% writeToPort.m
%
% This function will write an array of bytes to an open serial port. It
% writes them synchronously, meaning that MATLAB will pause execution until
% the bytes are actually written.
% 
% JSB 5/2014
function writeToPort(serialPort, arrayOfBytes)

    fwrite(serialPort, arrayOfBytes, 'uint8','sync');