import sys, socket, threading, select, hashlib

argc = len(sys.argv)
HOST, PORT = sys.argv[1], int(sys.argv[2])
if argc == 4:
    run = "client"
    FILENAME = sys.argv[3]
else:
    run = "server"


#Main
def main():
    if run == "client":
        runClient()
    elif run == "server":
        runServer()
    else:
        print('Invalid Arguments')


#Helpers
def checksumData(data):
    return hashlib.sha1(data.encode('ascii')).digest()
def packetify(sequence, size, fin, data):
    #put the info into an array 512 bytes long
    #use encode()
    #needs to be an array of ASCII Chars
    b = []
    b.extend(checksumData(data))
    b.extend(str(sequence).encode('ascii'))
    b.extend(str(size).encode('ascii'))
    b.extend(str(fin).encode('ascii'))
    b.extend(str(data).encode('ascii'))
    while len(b) < 512:
        b.append('\0')
    #print(b)
    return b
    
def packetSend(packetArray, client_socket):
    timeOut = 10
    #send
    print("Sending Packet")
    sendingpacket = str(packetArray).encode('ascii')
    #print(sendingpacket)
    client_socket.send(sendingpacket)
    #start timeout
    print("Starting Time Out")
    ready = select.select([client_socket], [], [], timeOut)
    #Wait for Ack
    if ready[0]:
        data = client_socket.recv(512).decode()
        #print(data)
        print("Received Ack Packet")
        #if correct ack
        if data[20] == packetArray[20] and data[27] == 1:
            print("Received Correct Ack Packet")
            return
        print("Received Incorrect Ack Packet")
    #if timed out or incorrect ack
    print("Resending Packet")
    packetSend(packetArray, client_socket)
    return


#Main Functions
def runClient():
    cSock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cSock.connect((HOST, PORT))

    fd = open(FILENAME, 'rb')
    print("File "+FILENAME+" opened for reading.")
    #read file
    res = fd.read(487)
    lookahead = fd.read(487)
    current = 0
    
    print("Sending File Name to Server")
    packetSend(packetify(current, b'000', 0, FILENAME), cSock)
    current =  1 - current
    size = os.stat(FILENAME).st_size

    #turn file into packets
    #send the packets until no more to read
    while lookahead != '':
        print("Sending packet to server")
        packetSend(packetify(current, size, 0, res), cSock)
        current = 1 - current
        res = lookahead
        lookahead = fd.read(487)
    print("Sending Final Packet to Server")
    packetSend(packetify(current, size, 1, res), cSock)
    fd.close()
    cSock.close()
    
def runServer():
    cx = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cx.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    cx.bind(('', PORT))
    cx.listen(20)
    sSock, addr = cx.accept()
    print("Connection successful")
    
    
    #Receive File Name
    result = sSock.recv(512).decode()
    print(result)
    print("Received filename packet")
    
    print("Sending Ack Packet")
    sSock.send(str(packetify(0, b'000', 1, '\0')).encode('ascii'))
    
    FILENAME = str(result[25:29])
    #Create File
    #Open File for Writing
    matchfile = open(FILENAME, 'w')
    print("Created file "+FILENAME+" and opened for writing")
    
    writeArray = []
    current = 1
    while True:
        result = sSock.recv(512).decode()
        print("Received Packet with sequence number "+result[20])
        #check if packet is the correct one in the order (think if ACK packet was lost)
        if result[20] == current:
        #check if the data is correct
            print("Packet has the correct sequence number")
            if checksumData(result[25:]).decode() == result[:19]:
                print("Packet has the correct data")
                #send ACK if it is
                print("Sending Ack Packet")
                sSock.send(str(packetify(result[20], b'000', 1, '\0')).encode('ascii'))
                #put packet data in correct spot in output
                writeArray.extend(result[25:])
            else:
                print("Packet's data has been mangled")
                continue
        else:
            print("Packet has the incorrect sequence number")
            continue
        current = 1 - current
        #check if FINished
        #if so break
        if result[24] == 1:
            print("Received FINal packet")
            break
    matchfile.write(writeArray)
    matchfile.close()
    sSock.close()
    return


main()
