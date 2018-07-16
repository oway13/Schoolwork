csci4061 S2016 Assignment 4
section: 11
date: 05/03/17
names: Jon Huhn, Vy Le, Wyatt Kormick
UMN huhnx025, lexxx600, kormi001

To compile the project, inside the src directory run the command "make web_server".
"make clean" will remove any generated files.

To start the web seriver run "./web_server port path num_dispatchers num_workers queue_length"
inside the src directory.

Our web server first changes directory to the one specified in the arugments, It
then allocates a number of worker and dispatcher threads also specified by
the in the arguments (max 100). It also creates a bounded buffer using semaphores
that the worker and dispatcher threads use to transfer requests between them. 

The dispatcher threads accept incoming connections, and put the requests these connections
have into the bounded buffer, and sends a signal to the workers that they did so.

When a worker thread receives this signal, it gets the request from the bounded buffer,
parses  it, and opens the file in the request to test if it exists. If it succeeds,
the worker writes all of the information about the file to the webs_server_log, and
returns the parsed request back to the server.

Generally, we each worked on our own function for the web server. Jon worked on main(),
Vy worked on dispatch(), and Wyatt worked on worker(). We helped each other work on their
functions when the help was needed.
