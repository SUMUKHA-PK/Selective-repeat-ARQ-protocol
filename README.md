**Title :**   

Throughput analysis of ARQ selective-repeat protocol with time diversity in markov channels.

**Members :**

Polkampally Keerthana       (16CO131) - 16co131.keerthana@nitk.edu.in

Sumukha PK                  (16CO145) - 16co145.peekay@nitk.edu.in

Archana Priyadarshani Sahoo (16CO207) - 16co207.archana@nitk.edu.in

**Abstract :**


Most of the communication channels experience some pitfalls.This paper begins by looking at other types of protocols for transfer of data and quoting the flaws in them. Later it focuses on implementation of ARQ selective repeat protocol with timeout mechanism and its throughput efficiency.The go-back-n protocol works well if errors are rare,but if the line is poor it wastes a lot of bandwidth on retransmitted frames. An alternative strategy, the selective repeat protocol is to allow the receiver to accept and buffer the frames following a buffered or lost one .In Selective repeat protocol, both the sender and the receiver maintain a window of outstanding and acceptable sequence number respectively.In this paper the channel is modelled as Gilbert channel in each direction.Thus the patterns of packet and feedback are represented by transition matrices, one for each direction. It is assumed that the packet length is a constant and equal to one time unit. Generalization of the standard version of the Selective Repeat ARQ strategy is considered to analyze the throughput. The focus on ARQ selective repeat is because its power efficiency. A dependent structure for error process on two channels is assumed and modeled as markov chain which allows to compute throughput. It is shown that the use of an appropriate degree of time diversity makes it possible to approach the ideal protocol performance obtained with perfect feedback. Simulation results, that confirm the analysis and document the tightness of the bounds are also shown, and a number of implementation issues are discussed.



**Objectives :**

  1. Implementing ARQ selective-repeat protocol with time-diversity in Markov channels in MATLAB programming language.
  2. Finding the throughput of the ARQ selective repeat protocol.
