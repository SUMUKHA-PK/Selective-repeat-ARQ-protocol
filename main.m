# Throughput analysis for Selective repeat ARQ channel with time-out

ACK = 1;                   # Positive Acknowledgement
NAK = -1;                  # Negative Acknowledgement

n = input("Enter the size of the sender and receiver: ");

sender = zeros(n);         # The sender and receiver of size 'n'
receiver = zeros(n);

for(i = 1:n)
  d = input("Enter the data bits to be sent: ");
  sender(i) = d;           # Input the data to be sent 0's or 1's
end

while(1)
  {
    int i = n-(n-1);       # Block count numbers
    int ack;
    if(ack==ACK)           # Do not retransmit it the Acknowledgement for the particular block is Positive
    {

      n--;
    }
    else if(ack = NAK)     # Go on with the re transmission if the Acknowledgement is Negative
    {

    }
  }
