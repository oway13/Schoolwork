/* CSci4061 S2017 Assignment 2
 * date: 03/22/2017
 * name: Vy Le, Jon Huhn, Wyatt Kormick
 * id: lexxx600, huhnx025, kormi001
 */

#include "wrapper.h"
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

#define MAX_TAB 100
extern int errno;

/*
 * Name:                uri_entered_cb
 * Input arguments:     'entry'-address bar where the url was entered
 *                      'data'-auxiliary data sent along with the event
 * Output arguments:    none
 * Function:            When the user hits the enter after entering the url
 *                      in the address bar, 'activate' event is generated
 *                      for the Widget Entry, for which 'uri_entered_cb'
 *                      callback is called. Controller-tab captures this event
 *                      and sends the browsing request to the ROUTER (parent)
 *                      process.
 */
void uri_entered_cb(GtkWidget* entry, gpointer data) {
	if(data == NULL) {
		return;
	}
	// browser_window *b_window = (browser_window *)data;
	// This channel have pipes to communicate with ROUTER.
	comm_channel channel = ((browser_window*)data)->channel;
	// Get the tab index where the URL is to be rendered
	int tab_index = query_tab_id_for_request(entry, data);
	if(tab_index <= 0) {
		fprintf(stderr, "Invalid tab index (%d).", tab_index);
		return;
	}
	// Get the URL.
	char * uri = get_entered_uri(entry);
	// Append your code here
	// Send 'which' message to 'which' process?
	//

	// Initialize new uri request
	new_uri_req uri_req = { .render_in_tab = tab_index };
	strcpy(uri_req.uri, uri);

	child_req_to_parent req = {
		.type = NEW_URI_ENTERED,
		.req = { .uri_req = uri_req }
	};

	// Write new request to router
	if (write(channel.child_to_parent_fd[1], &req, sizeof(child_req_to_parent)) == -1) {
		perror("error writing");
		exit(-1);
	}
}

/*
 * Name:                create_new_tab_cb
 * Input arguments:     'button' - whose click generated this callback
 *                      'data' - auxillary data passed along for handling
 *                      this event.
 * Output arguments:    none
 * Function:            This is the callback function for the 'create_new_tab'
 *                      event which is generated when the user clicks the '+'
 *                      button in the controller-tab. The controller-tab
 *                      redirects the request to the ROUTER (parent) process
 *                      which then creates a new child process for creating
 *                      and managing this new tab.
 */
void create_new_tab_cb(GtkButton *button, gpointer data)
{
	if(data == NULL) {
		return;
	}
	// browser_window *b_window = (browser_window *)data;
	// This channel have pipes to communicate with ROUTER.
	comm_channel channel = ((browser_window*)data)->channel;
	// Append your code here
	// Send 'which' message to 'which' process?
	//

	// Initialize create tab request
	child_req_to_parent req = {
		.type = CREATE_TAB,
		.req = NULL // Actual request doesn't matter, only type
	};

	// Write request to router
	if (write(channel.child_to_parent_fd[1], &req, sizeof(child_req_to_parent)) == -1) {
		perror("error writing");
		exit(-1);
	}
}

/*
 * Name:                url_rendering_process
 * Input arguments:     'tab_index': URL-RENDERING tab index
 *                      'channel': Includes pipes to communctaion with
 *                      Router process
 * Output arguments:    none
 * Function:            This function will make a URL-RENDRERING tab Note.
 *                      You need to use below functions to handle tab event.
 *                      1. process_all_gtk_events();
 *                      2. process_single_gtk_event();
 */
int url_rendering_process(int tab_index, comm_channel *channel) {
	browser_window * b_window = NULL;
	// Create url-rendering window
	create_browser(URL_RENDERING_TAB, tab_index, G_CALLBACK(create_new_tab_cb), G_CALLBACK(uri_entered_cb), &b_window, channel);
	child_req_to_parent req;
	int fd = channel->parent_to_child_fd[0];
	while (1) {
		usleep(1000);
		// Append your code here
		// Handle 'which' messages?
<<<<<<< HEAD
		// read the data from the pipe that share with the router process
		// if there is no data in the pipe -> call the process_single_gtk_event
		// char buf [10];
		// int rfile = read (channel->parent_to_child_fd[0], buf, 10);
		// if (rfile ==0){
		// 	processs_single_gtk_event();
		//}
		int fd = channel->parent_to_child_fd[0];
=======
		//
>>>>>>> 75e2f6f4171b8724b7ca3cc478fd877d273aae78

		// Read pipe from router
		if (read(fd, &req, sizeof(child_req_to_parent)) == -1) {
			// No data received
			if (errno != EAGAIN) {
				perror("error reading from pipe");
				exit(-1);
			}
			process_single_gtk_event();
		}
		else {
			// Received data
			switch(req.type) {
				case TAB_KILLED:
					process_all_gtk_events();

					// Terminate process, don't return control to router
					exit(0);
				case NEW_URI_ENTERED:
					render_web_page_in_tab(req.req.uri_req.uri, b_window);
					break;
				default:
					fprintf(stderr, "Bad message received from url_rendering_process.\n");
					break;
			}
		}
	}
}

/*
 * Name:                controller_process
 * Input arguments:     'channel': Includes pipes to communctaion with
 *                      Router process
 * Output arguments:    none
 * Function:            This function will make a CONTROLLER window and
 *                      be blocked until the program terminates.
 */
int controller_process(comm_channel *channel) {
	// Do not need to change code in this function
	close(channel->child_to_parent_fd[0]);
	close(channel->parent_to_child_fd[1]);
	browser_window * b_window = NULL;
	// Create controler window
	create_browser(CONTROLLER_TAB, 0, G_CALLBACK(create_new_tab_cb), G_CALLBACK(uri_entered_cb), &b_window, channel);
	show_browser();
	return 0;
}

/*
 * Name:                new_nonblocking_pipes
 * Input arguments:     comm_channel array pointer, index of array
 * Output arguments:    none
 * Function:            This function will allocate space for a new channel and create non-blocking pipes for it
 */
void new_nonblocking_pipes(int index, comm_channel **channel) {
	// Allocate space for new comm_channel
	channel[index] = (comm_channel*) malloc(sizeof(comm_channel));

	// Create pipes
	if (pipe(channel[index]->parent_to_child_fd) < 0 || pipe(channel[index]->child_to_parent_fd) < 0) {
		perror ("Pipe error");
		exit(-1);
	}

	// Make pipes non-blocking
	int nb = fcntl (channel[index]->parent_to_child_fd[0], F_GETFL, 0);
	fcntl (channel[index]->parent_to_child_fd[0], F_SETFL, nb | O_NONBLOCK);

	nb = fcntl (channel[index]->child_to_parent_fd[0], F_GETFL, 0);
	fcntl (channel[index]->child_to_parent_fd[0], F_SETFL, nb | O_NONBLOCK);
}

/*
 * Name:                router_process
 * Input arguments:     none
 * Output arguments:    none
 * Function:            This function will make a CONTROLLER window and be blocked until the program terminate.
 */
int router_process() {
	comm_channel *channel[MAX_TAB];
	// Append your code here
	// Prepare communication pipes with the CONTROLLER process
	// Fork the CONTROLLER process
	//   call controller_process() in the forked CONTROLLER process
	// Poll child processes' communication channels using non-blocking pipes.
	//   handle received messages:
	//     CREATE_TAB:
	//       Prepare communication pipes with a new URL-RENDERING process
	//       Fork the new URL-RENDERING process
	//     NEW_URI_ENTERED:
	//       Send message to the URL-RENDERING process in which the new url is going to be rendered
	//     TAB_KILLED:
	//       If the killed process is the CONTROLLER process, send messages to kill all URL-RENDERING processes
	//       If the killed process is a URL-RENDERING process, send message to the URL-RENDERING to kill it
	//   sleep some time if no message received
	//

	// Parallel to channel[], keeps pids of child processes
	int channel_pids[MAX_TAB];

	// Initialize to NULL for easy boolean checking if channel is initialized
	for (int i = 0; i < MAX_TAB; i++)
		channel[i] = NULL;

	// Allocate controller process and pipes
	new_nonblocking_pipes(0, channel);

	// Create controller process
	int pid = fork();
	if (pid == 0) { // Child
		controller_process(channel[0]);
	}
	else if (pid > 0) { // Parent
		channel_pids[0] = pid;
		close(channel[0]->child_to_parent_fd[1]);
		close(channel[0]->parent_to_child_fd[0]);

		// Poll child processes until none remain
		while (1) {

			for (int i = 0; i < MAX_TAB; i++) {
				usleep(1000);
				child_req_to_parent child_req;

				if (channel[i]) {
					// Channel exists

					int fd = channel[i]->child_to_parent_fd[0];

					// Read data from child
					int r;
					if ((r = read(fd, &child_req, sizeof(child_req_to_parent))) == -1) {
						// No data read
						if (errno != EAGAIN) {
							perror("error reading from pipe");
							exit(-1);
						}
						// Nothing from this process, try the next one
						continue;
					}

					// Handle external kill signals, close fds and delete channel
					else if (r == 0) {
						fprintf(stderr, "peer %d has closed!\n", i);

						close(channel[i]->parent_to_child_fd[1]);
						close(channel[i]->child_to_parent_fd[0]);
						free(channel[i]);
						channel[i] = NULL;

						// Try again without parsing any request
						continue;
					}

					// Data received from child
					switch(child_req.type) {
						case CREATE_TAB: {
							int next_index; // Index of new tab to be created

							// Find first available open slot in channel[]
							for (next_index = 0; next_index < MAX_TAB; next_index++) {
								if (!channel[next_index]) {
									break;
								}
							}

							// No open channels available
							if (next_index == MAX_TAB) {
								fprintf(stderr, "Ran out of tabs\n");
							}
							else {
								// Create new process and pipes
								new_nonblocking_pipes(next_index, channel);
								int pid_new_tab = fork();
								if (pid_new_tab == 0) { // Child
									url_rendering_process(next_index, channel[next_index]);
								}
								else if (pid_new_tab > 0) { // Parent
									channel_pids[next_index] = pid_new_tab;

									// Close unnecessary fds
									close(channel[next_index]->child_to_parent_fd[1]);
									close(channel[next_index]->parent_to_child_fd[0]);
								}
								else { // pid_new_tab < 0
									perror("fork error");
									exit(-1);
								}
							}
							break;
						}
						case NEW_URI_ENTERED: {
							char *uri = child_req.req.uri_req.uri;
							int url_index = child_req.req.uri_req.render_in_tab;

							// Check for valid index from request
							if (!channel[url_index]) {
								fprintf(stderr, "Invalid index %d received\n", url_index);
							}
							else {
								int url_process_fd = channel[url_index]->parent_to_child_fd[1];

								// Write request from controller to url process
								if (write(url_process_fd, &child_req, sizeof(child_req)) == -1) {
									perror("error writing");
									exit(-1);
								}
							}
							break;
						}
						case TAB_KILLED: {
							int kill_index = child_req.req.killed_req.tab_index;
							if (!kill_index) { // Controller killed
								// Kill children
								for (int j = MAX_TAB - 1; j >= 0; j--) {
									if (channel[j]) {
										int tab_fd = channel[j]->parent_to_child_fd[1];

										// Initialize kill tab request
										tab_killed_req kill_req = { .tab_index = j };
										child_req_to_parent req = {
											.type = TAB_KILLED,
											.req = { .killed_req = kill_req }
										};

										// Send kill request to url_rendering_process
										if (write(tab_fd, &req, sizeof(child_req_to_parent)) == -1) {
											perror("error writing");
											exit(-1);
										}

										// Wait for child to die
										if (waitpid(channel_pids[j], NULL, 0) == -1) {
											perror("error waiting");
											exit(-1);
										}

										// Child is dead, clean up rescources
										close(channel[j]->parent_to_child_fd[1]);
										close(channel[j]->child_to_parent_fd[0]);
										free(channel[j]);
										channel[j] = NULL;
									}
								}

								// Controller is closed, end the program
								exit(0);
							}
							else if (kill_index > 0 && kill_index < MAX_TAB) {
								// URL rendering process killed
								int process_index = child_req.req.killed_req.tab_index;
								int url_process_fd = channel[process_index]->parent_to_child_fd[1];

								// Send kill request to url_rendering_process
								if (write(url_process_fd, &child_req, sizeof(child_req)) == -1) {
									perror("error writing");
									exit(-1);
								}

								// Wait for child to die
								int wait_return;
								if ((wait_return = waitpid(channel_pids[process_index], NULL, 0)) == -1) {
									perror("error waiting");
									exit(-1);
								}

								printf("%d\n", wait_return);

								// Child is dead, clean up resources
								close(channel[process_index]->parent_to_child_fd[1]);
								close(channel[process_index]->child_to_parent_fd[0]);
								free(channel[process_index]);
								channel[process_index] = NULL;
							}
							else { // Bad index, error
								fprintf(stderr, "Bad index received: %d\n", kill_index);
								break;
							}
							break;
						}
						default: // Unknown request from child
							break;
					}
				}
			}
		}
	}
	else {
		perror("Fork Error");
		exit(-1);
	}

	return 0;
}

int main() {
	return router_process();
}
