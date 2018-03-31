% Throughput analysis for Selective repeat ARQ channel with time-out

ACK = 1;                                      % Positive Acknowledgement
NAK = -1;                                     % Negative Acknowledgement

n = input('Enter the size of the sender and receiver: ');

sender = zeros(n,1);                          % The sender and receiver vectors of size 'n'
receiver = zeros(n,1);

for i = 1:n
  d = input('Enter the data bits to be sent: ');
  sender(i) = d;                              % Input the data to be sent 0's or 1's
end

i=1;                                          % Block count
disp(sender);

    while n>0
        ack = 0;
        t = timer;
        flag = 0;
        t.StartDelay = 3;
        t.TimerFcn = @(myTimerObj, thisEvent)disp('3 seconds have elapsed');
        start(t)
        receiver(i)=mod(randi(5),2);              % Using random function to mimic errors in transmission
        
        pause(rand(5));
        if receiver(i)==sender(i)                 % If what is recieved is correct,
          ack = 1;                                % Set Acknowledgement as 1,
          
        else
          ack = -1;                               % Else provide negative Acknowledgement
          
        end
        
        %delete(t)
        
        if ack==ACK                               % Move to next transmission if recieved  is correct.
          disp(ack);
          n = n-1;
          i = i+1;
        
        elseif ack == NAK                        % Go on with the re transmission if the Acknowledgement is Negative
          disp(ack);
           
        elseif ack == 0
           disp(ack);     
        end
end
