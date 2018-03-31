% Throughput analysis for Selective repeat ARQ channel with time-out

ACK = 1;                                      % Positive Acknowledgement
NAK = -1;                                     % Negative Acknowledgement

BLOCK_LENGTH = input("Input the lenght of each blocks: ");
                                              % Number of packets each block has

n = input("Enter the size of the sender and receiver: ");
                                              % Number of bits that are to be transferred (must be greater than BLOCK_LENGTH)

sender = zeros(n,1);                          % The sender and receiver vectors of size 'n'
receiver = zeros(n,1);
buffer = [];                                  % Empty vector buffer

for i = 1:n
  d = input("Enter the data bits to be sent: ");
  sender(i) = d;                              % Input the data to be sent 0's or 1's
end

i=1;                                          % Block count
disp(sender);
while n>0

    receiver(i)=mod(randi(5),2);              % Using random function to mimic errors in transmission
    if receiver(i)==sender(i)                 % If what is recieved is correct,
      ack = 1;                                % Set Acknowledgement as 1,
    else
      ack = -1;                               % Else provide negative Acknowledgement
    end
    if ack==ACK                               % Move to next transmission if recieved  is correct.
      disp(ack);
      n--;
    else if ack == NAK                        % Go on with the re transmission if the Acknowledgement is Negative
      disp(ack);
    end
end
end

function queuepush(a,b)                       % Function to implement push in queue
  a=[a,b];
endfunction

function queuepop(a)                          % Function to implement pop in queue
  size = size(a);
  a(1)=[];
endfunction

% FOLLOW COMMENTING METHODOLOGY

% TODO :
% 1. Include block/packet transmission and introduce errors inside
% 2. Include whatever the hell Markov means. Something related to probability.
% 3. It is already sr arq, we have to find Throughput. Correctly recieved VS sent.
% 4. introduce other forms of loss of message
% 5. Include the concept of buffers
% 6. Timer for each packet (localtime(time()) --- Difference between t.secs)
% 7. Run from top to bottom, if there is an error in transmission put it to buffer, keep clearing buffer.
% 8. implement pop and push (DONE)
