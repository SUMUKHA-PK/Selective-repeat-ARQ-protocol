**SELECTIVE REPEAT**

Selective Repeat is part of the automatic repeat-request (ARQ).
With selective repeat, the sender sends a number of frames specified by a window size even without the need to wait for individual ACK from the receiver as in Go-Back-N ARQ.
It may be used as a protocol for the delivery and acknowledgement of message units, or it may be used as a protocol for the delivery of subdivided message sub-units.

##### Working:

Receiver: <br>
The receiver process keeps track of the sequence number of the earliest frame it has not received, and sends that number with every acknowledgement (ACK) it sends.
Sender: <br>
If a frame from the sender does not reach the receiver, the sender continues to send subsequent frames until it has emptied its window.
Receiver:<br>
The receiver continues to fill its receiving window with the subsequent frames, replying each time with an ACK containing the sequence number of the earliest missing frame.
Sender:<br>
Once the sender has sent all the frames in its window, it re-sends the frame number given by the ACKs, and then continues where it left off.


![img1](https://10.100.13.215/16CO145/CO250-MP-131-145-207/blob/master/img1.png?raw=true)


##### Characteristics of Selective Repeat :<br>
Delay, queue length, and throughput are the main performance characteristics of a data transmission system with ARQ (automaticrepeat-request) error control.
In case of selective repeat protocol the window size may be calculated as follows.
Assume that the size of both the sender's and the receiver's window is w.
So initially both of them contain the values 0 to (w-1).
Consider that sender's data link layer transmits all the w frames, the receiver's data link layer receives them correctly and sends acknowledgements for each of them.
However, all the acknowledgemnets are lost and the sender does not advance it's window.
The receiver window at this point contains the values w to (2w-1).
To avoid overlap when the sender's data link layer retransmits, we must have the sum of these two windows less than sequence number space.



**GO-BACK-N ARQ**

Go-Back-N ARQ is a specific instance of the automatic repeat request (ARQ) protocol, in which the sending process continues to send a number of frames specified by a window size even without receiving an acknowledgement (ACK) packet from the receiver.
It is a special case of the general sliding window protocol with the transmit window size of N and receive window size of 1.
It can transmit N frames to the peer before requiring an ACK.

##### Working:

Receiver:<br>
The receiver process keeps track of the sequence number of the next frame it expects to receive, and sends that number with every ACK it sends.
Receiver:<br>
The receiver will discard any frame that does not have the exact sequence number it expects (either a duplicate frame it already acknowledged, or an out-of-order frame it expects to receive later) and will resend an ACK for the last correct in-order frame.
Sender:<br>
Once the sender has sent all of the frames in its window, it will detect that all of the frames since the first lost frame are outstanding, and will go back to the sequence number of the last ACK it received from the receiver process and fill its window starting with that frame and continue the process over again.


![img2](https://10.100.13.215/16CO145/CO250-MP-131-145-207/blob/master/img2.png "img2")


##### Characteristics of Go-Back-N ARQ Protocol:
If no acknowledgement is received after sending N frames, the sender takes the help of a timer. After the time-out,it resumes retransmission.
The go-back-N protocol also takes care of damaged frames and damaged ACKs.


**COMPARISION OF ALL THE PROTOCOLS**

![img3](https://10.100.13.215/16CO145/CO250-MP-131-145-207/blob/master/img3.png "img3")
