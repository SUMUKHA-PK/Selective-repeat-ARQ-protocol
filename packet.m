classdef packet                     % Creation of packet classs
  properties                        % Defining properties of class
    data = -1;                      % Initially sender data will be -1, later assigned when instance is created
    t;                              % Time maintained for the packet
    success = 0;                    % Successful transmission of the packet
    index;                          % Index of the packet in the sender vector
  end
end
