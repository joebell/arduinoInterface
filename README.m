%%
% README.m
%
% This package contains example code for a MATLAB-Arduino interface.
%
% Contents:
%
% clearPorts.m          - Closes any open ports
% README.m              - This file
% readPort.m            - A sample callback to be executed when bytes are
%                         available on the computer's serial port to be read.
% setupSerialPort.m     - Creates and configures the serial port object
% writeToPort.m         - Writes bytes to the port.
%
% JSB 5/2014
%
% Example code:

listPorts();
myPort = setupSerialPort(5);
arrayOfBytes = [1,2,3,5];
writeToPort(myPort, arrayOfBytes);

% After receiving this transmission the Arduino LED will blink 5 times, 
% then send the number '5' back. When the serial port receives this it will 
% execute readPort.m and write the number '5' to the console.
