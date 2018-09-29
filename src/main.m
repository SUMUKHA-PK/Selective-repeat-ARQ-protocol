%------------------------------Throughput analysis for Selective repeat ARQ channel with time-out------------------------------------

ACK = 1;                                                    % Positive Acknowledgement
NAK = -1;                                                   % Negative Acknowledgement
Sent_packets = 0;                                           % Total successful packets sent
Total_sent = 0;                                             % Total packets sent from the sender

test_run = input('Input the number of test runs: ');

running_variable = 1;
throughput = zeros(test_run,1);                             % Vectors for plotting the throughput vs input graph
input_bits = zeros(test_run,1);

%------------------------------------------------------Testing run begins-----------------------------------------------------------------
while test_run > 0
  n = input('Enter the size of the sender and receiver: ');
                                                           % Number of bits that are to be transferred
  input_bits(running_variable)=n;

  sender = packet.empty;                                   % Packet class vectors of sender and reciever
  receiver = packet.empty;

  for i = 1:n
    d = input('Enter the data bits to be sent: ');
    sender(i).data = d;                                    % Input the data to be sent 0's or 1's
  end

  for i = 1:n
    disp(sender(i).data);
  end

  buffer = packet.empty;                                   % Buffer for storing the copy of the sent bit, initialized to -1
   for i =1:n
       buffer(i).data = -1;
   end

  m = input('Enter the number of packets per block: (n%m must be zero)');

   t=1;
   temp=m;
   ack_block = zeros(n);                                   % Initialising the array of acknowledgements
   for i = 1:n
       ack_block(i)=-4;
   end

%-----------------------------------------------------------Simulation begins---------------------------------------------------

  while check_complete(sender,n)==0                        % Until all of sender is completed, repeat transmission process
      transmit_block = packet.empty;
      while check_complete_block(sender,temp,t,m)==0       % Repeat if this block is not transmitted
          while t<=temp
            if sender(t).success ~= 1
                transmit_block(t).t = get_random(5);       % Timer starts for individual packet
                transmit_block(t).data = sender(t).data;
                if check_empty(buffer,n) == 1              % checks for empty slots
                  fill_slot(buffer,sender(t).data,t,n);
                else
                  transmit_buffer(buffer,n);
                end
                receiver(t).data = mod(get_random(5),2);   % Using random function to mimic errors in transmission
                Total_sent = Total_sent + 1;               % Packet is sent
            end
            t= t+1;
          end
  %----------------Transmission of one block of m packets has been completed,receiver has recieved,next check for errors-------------------------------------

          t = t-m;                                         % Reset counter

          fprintf('Sender: \n')                            % Print sender and receiver every iteration
          for i = t:temp
            if sender(i).success ~=1
              disp(sender(i).data);
            end
          end
          fprintf('Receiver: \n')
          for i = t:temp
            disp(receiver(i).data);
          end
          while t<=temp
            if sender(t).success ~= 1                     % Check only unsent packets
                if transmit_block(t).t>4
                    fprintf('Bit with index %i Received late\n',t);
                else if receiver(t).data == transmit_block(t).data && transmit_block(t).t<= 4
                                                          % If what is recieved is correct and within time
                    ack_block(t) = ACK;                   % Set Acknowledgement as 1
                    buffer(t).data = -1;
                    sender(t).success = 1;
                    Sent_packets = Sent_packets+1;        % Packet sent successfully
                    fprintf('Packet with index %i sent and positive acknowledgement recieved\n',t);
                else if receiver(t).data ~= transmit_block(t).data && transmit_block(t).t<=4
                                                          % Corrupted data within time
                    ack_block(t) = NAK;                   % negative Acknowledgement
                    fprintf('Negative acknowledgement recieved for bit with index %i\n',t);
                     end
                    end
               end
           end
              t = t+1;
          end
          t = t-m;                                       % Same block is repeated

  %---------------------------------------------acknowledgement received for one block---------------------------------------------------
      end
      disp('Successfully sent packets: ');
      disp(Sent_packets)
      disp('Total Sent packets: ');
      disp(Total_sent)

      transmit_buffer(buffer,n);                         % Buffer is cleared to avoid repeating of data

      t = temp+1;                                        % Resetting counters
      if temp + m <= n
          temp = temp + m;
      else
          temp = m;
          t=1;
      end
  %-------------------------------------------------------One block completed---------------------------------------------------------------
  end                                                    % Multiple blocks transmit
  %-----------------------------------------------Message is transmitted,Simulation ends---------------------------------------------------------

  t = Sent_packets/Total_sent;
  t = t*100;
  fprintf('Throughput is %0.2f percent\n',t);
  throughput(running_variable)=t;                        % Setting variables to create vectors to plot
  running_variable = running_variable + 1;
  test_run = test_run -1;
end

plot(input_bits,throughput);                             % Plotting the graph of throughput vs bits per message
title('Variation of throughput with size of message');
xlabel('Size of input in bits');                          
ylabel('Throughput percentage');
%-------------------------------------------------------Throughput analysis done-----------------------------------------------------------
