# Fall 2016 CSci4211: Introduction to Computer Networks
# This program serves as the server of DNS query.
# Written in Python v3.

import sys, threading, os
from socket import *

def main():
	host = "localhost" # Hostname. It can be changed to anything you desire.
	port = 5001 # Port number.

	#create a socket object, SOCK_STREAM for TCP
	try:
		sSock = socket(AF_INET, SOCK_STREAM)
	except error as msg:
		sSock = None # Handle exception
		
	#bind socket to the current address on port 5001
	try:
		sSock.bind((host, port))
	except error as msg:
		sSock = None # Handle exception

	if sSock is None:
		print("Error: cannot open server socket")
		sys.exit(1) # If the socket cannot be opened, quit the program.

	#Listen on the given socket maximum number of connections queued is 20
	sSock.listen(20)

	monitor = threading.Thread(target=monitorQuit, args=[])
	monitor.start()

	print("Server is listening...")

	while 1:
		#blocked until a remote machine connects to the local port 5001
		connectionSock, addr = sSock.accept()
		server = threading.Thread(target=dnsQuery, args=[connectionSock, addr[0]])
		server.start()

def dnsQuery(connectionSock, srcAddress):
	data = connectionSock.recv(1024).decode()
	print("Received: " + data)
	found = False
	#check the DNS_mapping.txt to see if the host name exists
	
	#set local file cache to predetermined file.
	#create file if it doesn't exist
	dnstext = open("DNS_mapping.txt", "a+")
	
	#if it does exist, read the file line by line to look for a
	#match with the query sent from the client
	dnstext.seek(0,0)
	lines = dnstext.readlines()
	for i in range(len(lines)):
		line = lines[i]
		name = line[:line.find(":")]
		if data == name:
		       retstr = "Local DNS:" + data + ":" +line[line.find(":"):]
		       found = True
		       break
		
	#If no lines match, query the local machine DNS lookup to get the IP resolution 
	#write the response in DNS_mapping.txt
	if not found:
		try:
			ip = gethostbyname(data)
			dnstext.write(data+":"+ip+"\n")
			retstr  = "Root DNS:" + data + ": " + ip
		except error as msg:
			retstr = "Error getting Address Info"
		
	dnstext.close()
	#print response to the terminal
	print(retstr)
	#send the response back to the client
	connectionSock.send(retstr.encode())
	#Close the server socket.
	connectionSock.close()

	
	

def monitorQuit():
	while 1:
		sentence = input()
		if sentence == "exit":
			os.kill(os.getpid(),9)

main()
