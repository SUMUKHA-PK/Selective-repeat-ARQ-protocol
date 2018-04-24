**DESIGN OF ALGORITHM FOR SOLUTION OF THE PROBLEM**
<br>
<br>
##### STEPS:
<br>

**Step 1**:  Input the size of sender and receiver
<br><br>
**Step 2**:  Input the data elements of the sender 
<br><br>
**Step 3**:  Enter number of packets per block (Block Size)
<br><br>
**Step 4**:  Now , Check if the messaged is correctly received by the receiver which has following cases:
            <br>
            <br>
            Case 1: Positive Acknowledgment (ACK=1) (in case of positive feedback)
            <br>
            <br>
            Case 2: Negative Acknowledgment (NAK=-1) (In case of negative feedback or no feedback )
            <br>
            <br>
    
**Step 5**: The messaged is being copied to a buffer every time data is transmitted and then if a positive acknowledgment is received then, the buffer with that particular data is cleared .The success field of a transmitted data element is updated every time a data element is successfully transmitted.  
<br><br>
**Step 6**: If negative Acknowledgment is recieved then the buffer is not cleared which gives an indication of retransmission of the particular data element.
<br><br>
**Step 7**: The data elements which were already there in the buffer i.e the data elements for which positive acknowledgement has not been received have to be retransmitted again .
<br><br>
**Step 8**: If the buffer is completely filled before moving onto the next block of the message , the buffer has to be cleared (i.e to ensure that all the data elemnts  have been retransmitted) for completely transmitting the particular block of message .
<br><br>
**Step 9**: The throughput is calculated by keeping a count of the successfully sent bits and the total sent bits.
<br><br>
**Step 10**:  Then the throughput is displayed by taking the ratio of successfully sent bits and total sent bits. 
<br><br>
**Step 11**:  Graph is plotted between the number of bits(input) on the x-axis and throughput on the y-axis.
<br><br>


**Files**<br>
1.main.m - The main file that is run is matlab, controls the whole process of simulation.
2.packet.m - The class packet is implemented in this.
<br>

**Functions used**<br>
1.check_empty - Checks whether a vector is empty.<br>
2.check_complete - Checks whether a vector is full.<br>
3.fill_slot - function to fill the buffer.<br>
4.transmit_buffer - indicates the retransmission of the negatively acknowledged bits.
<br>

**Graph**<br>
1.Graph - Graph between number of inputs and throughput.
<br><br>
![Graph_test_run](https://10.100.13.215/16CO145/CO250-MP-131-145-207/blob/master/Graph_test_run.png "Graph_test_run")

            
            