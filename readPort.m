%% 
% readPort.m
%
% This function is an example callback. It's executed whenever MATLAB
% detects bytes available on the serial port. (see setupSerialPort.m)
%
% This function reads in any available bytes and displays them to the
% console.
% 
% JSB 5/2014
function readPort(obj, event)

    serialPort = obj;

    % As long as there are still bytes to be read in the buffer...
    while (serialPort.BytesAvailable > 0)
        % Read in the bytes and display them.
        bytesIn = fread(serialPort,serialPort.BytesAvailable);
        disp(bytesIn);
    end