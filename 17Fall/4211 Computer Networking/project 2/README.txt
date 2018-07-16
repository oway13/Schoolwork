To run the program properly, a copy of program.py needs to be in a folder along with
the file to be sent. Another copy needs to be in a different folder. The network
layer program then needs to be run on port 5002. The server then needs to run on port
5001, and then the client on port 5002 and with the specified file to be sent.

When the program starts, it captures the command line arguments and uses those to
determine if it is to run the client or the server function. There are a couple functions used to help these two main functions. checksumData() is
used as a way to save some space when call the long hashlib digest function. Packetify()
is used to take all of the parts of the packet, encode them as ascii bytes, and put them
all in order in an array. packetSend() contains the actual sending of the packets, including
checking for timeouts and acknowledgements. If there is a failure in these two, it calls itself
recursively in an attempt to try again, which means the base case is a successful packet send.
The client function itself opens the file, and starts reading it to see if it works. It then it
sends the file name to the server, and begins turning the file into packets 487 bytes at a
time and sending them to the server. The server function receives these packets, checks if
they are the correct sequence number and if the data has not been mangled. It sends an ack if
the packet is correct, and puts the packet data into a file that it creates of the same name
as the file. It finishes when it detects a packet with the correct fin byte.

The structure of a packet in my program is the same as the one in the write up.
20 checksum bytes, 1 sequence byte, 3 size bytes, 1 FIN byte, and 487 data bytes.
