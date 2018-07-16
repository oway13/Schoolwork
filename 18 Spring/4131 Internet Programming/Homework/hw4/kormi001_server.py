# Wyatt Kormick | Kormi001
# Based on the EchoServerPlusHead.py example provided by:
# Shaden Smith, Koorosh Vaziri, Niranjan Tulajapure,
# Ambuj Nayab, Akash Kulkarni, and Daniel J. Challou 
#
# Calendar in: calendar.html
# Form in: form.html
# Addition Info URL Name: urlinfo

'''
TODO
----
OPTIONS
POST
Response for 406 Error Conditions
'''

import socket
import os
import stat
import sys
import urllib.parse
import datetime


from threading import Thread
from argparse import ArgumentParser




BUFSIZE = 4096
CRLF = '\r\n'
METHOD_NOT_ALLOWED = 'HTTP/1.1 405  METHOD NOT ALLOWED{}Allow: GET, HEAD{}Connection: close{}{}'.format(CRLF, CRLF, CRLF, CRLF)
OK = 'HTTP/1.1 200 OK{}{}{}'.format(CRLF, CRLF, CRLF)
CREATED = 'HTTP/1.1 201 CREATED{}{}{}'.format(CRLF, CRLF, CRLF)
NOT_FOUND = 'HTTP/1.1 404 NOT FOUND{}Connection: close{}{}'.format(CRLF, CRLF, CRLF)
FORBIDDEN = 'HTTP/1.1 403 FORBIDDEN{}Connection: close{}{}'.format(CRLF, CRLF, CRLF)
MOVED_PERMANENTLY = 'HTTP/1.1 301 MOVED PERMANENTLY{}Location:  https://www.cs.umn.edu/{}Connection: close{}{}'.format(CRLF, CRLF, CRLF, CRLF)



def get_contents(fname):
    with open(fname, 'r') as f:
        return f.read()


def check_perms(resource):
    """Returns True if resource has read permissions set on 'others'"""
    stmode = os.stat(resource).st_mode
    return (getattr(stat, 'S_IROTH') & stmode) > 0

def check_readwrite_perms(resource):
    """Returns True if resource has read and write permissions set on 'others'"""
    stmode = os.stat(resource).st_mode
    return (getattr(stat, 'S_IROTH') & stmode) > 0 and (getattr(stat, 'S_IWOTH') & stmode) > 0

class HTTP_HeadServer:  #A re-worked version of EchoServer
  def __init__(self, host, port):
    print('listening on port {}'.format(port))
    self.host = host
    self.port = port

    self.setup_socket()

    self.accept()

    self.sock.shutdown()
    self.sock.close()

  def setup_socket(self):
    self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    self.sock.bind((self.host, self.port))
    self.sock.listen(128)

  def accept(self):
    while True:
      (client, address) = self.sock.accept()
      th = Thread(target=self.accept_request, args=(client, address))
      th.start()

  # here, we add a function belonging to the class to accept 
  # and process a request
  def accept_request(self, client_sock, client_addr):
    print("accept request")
    data = client_sock.recv(BUFSIZE)
    req = data.decode('utf-8') #returns a string
    response = self.process_request(req) 
    #once we get a response, we chop it into utf encoded bytes
    #and send it (like EchoClient)
    client_sock.send(bytes(response,'utf-8'))
    
    #clean up the connection to the client
    #but leave the server socket for recieving requests open
    client_sock.shutdown(1)
    client_sock.close()

  # Checks if the request is a HEAD, GET, PUT, DELETE and calls the
  # appropriate handler function. Returns a METHOD_NOT_ALLOWED for
  # methods not implemented
  def process_request(self, request):
    print('######\nREQUEST:\n{}######'.format(request))
    linelist = request.strip().split(CRLF)
    reqline = linelist[0]
    rlwords = reqline.split()
    if len(rlwords) == 0:
      return ''
      
    if rlwords[0] == 'HEAD':
      resource = rlwords[1][1:] # skip beginning /
      return self.head_request(resource)
    elif rlwords[0] == 'GET':
      resource = rlwords[1][1:]
      return self.get_request(resource)
    elif rlwords[0] == 'PUT':
      resource = rlwords[1][1:]
      return self.put_request(resource, linelist[-1]) # Also gives the request body contents
    elif rlwords[0] == 'DELETE':
      resource = rlwords[1][1:]
      return self.delete_request(resource)
    else:
      return METHOD_NOT_ALLOWED

  def head_request(self, resource):
    """Handles HEAD requests."""
    path = os.path.join('.', resource) #look in directory where server is running
    if resource == 'csumn':
      ret = MOVED_PERMANENTLY
    elif not os.path.exists(resource):
      ret = NOT_FOUND
    elif not check_perms(resource):
      ret = FORBIDDEN
    else:
      ret = OK
    return ret

  # If the file does not exist, return the contents of 404.html and 404 NOT FOUND
  # if file does not have read permission, return the contents of 403.html and 403 FORBIDDEN
  # If no problems were found, return the contents of the request file and 200 OK
  def get_request(self, resource):
    path = os.path.join('.', resource)
    if resource == 'csumn':
      ret = MOVED_PERMANENTLY
    elif not os.path.exists(resource):
      ret = NOT_FOUND   
      with open('404.html') as file:
                ret += file.read()
    elif not check_perms(resource):
      ret = FORBIDDEN 
      with open('403.html') as file:
                ret += file.read()
    else:
      ret = OK 
      with open(path) as file:
                ret += file.read()
    ret+=CRLF
    return ret

  # If the file already exists replace it and return 200 OK
  # If the file does not exist, create it and return 201 CREATED
  def put_request(self, resource, data):
    path = os.path.join('.', resource)
    if os.path.isfile(path): 
      ret = "HTTP/1.1 200 OK"+CRLF
    else:
      ret = "HTTP/1.1 201 CREATED"+CRLF 
    ret+="Content-Location: /"+resource+CRLF+CRLF
    with open(path, 'w') as file: # Creates the File
      file.write(data)      # with the inputted data
    return ret

  # If the file does not exist, return 404 NOT FOUND
  # If the file does not have read/write permission, return 403 FORBIDDEN
  # If no problems were found, return 200 OK and the timestamp for the action
  def delete_request(self, resource):
    path = os.path.join('.', resource)
    if not os.path.exists(resource):
      ret = NOT_FOUND
    elif not check_readwrite_perms(resource):
      ret = FORBIDDEN
    else:
      ret = "HTTP/1.1 200 OK"+CRLF
      os.remove(path)
      t = datetime.datetime.now()
      ret += "Date: "+str(t.year)+"-"+str(t.month)+"-"+str(t.day)+" "+str(t.hour)+":"+ \
                    str(t.minute)+":"+str(t.second)+"."+str(t.microsecond)
      ret+=CRLF+CRLF
    return ret

        

def parse_args():
  parser = ArgumentParser()
  parser.add_argument('--host', type=str, default='localhost',
                      help='specify a host to operate on (default: localhost)')
  parser.add_argument('-p', '--port', type=int, default=9001,
                      help='specify a port to operate on (default: 9001)')
  args = parser.parse_args()
  return (args.host, args.port)


if __name__ == '__main__':
  (host, port) = parse_args()
  HTTP_HeadServer(host, port)

