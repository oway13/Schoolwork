/* CSci4061 S2017 Assignment 1
 * login: huhnx025
 * date: 02/15/17
 * name: Wyatt Kormick, Vy Le, Jon Huhn
 * id: kormi001, lexxx600, huhnx025
 */

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#include "util.h"

void show_error_message(char * ExecName) {
  fprintf(stderr, "Usage: %s [options] [target] : only single target is allowed.\n", ExecName);
  fprintf(stderr, "-f FILE\t\tRead FILE as a makefile.\n");
  fprintf(stderr, "-h\t\tPrint this message and exit.\n");
  exit(0);
}

/*
 * Procedure to build a target and its dependencies. Iterates through
 * the dependencies listed for a particular target, and determines if
 * each dependency needs to be built or rebuilt. If a dependency needs
 * to be built, this function will be called recursively with the
 * dependency as the target. To build a target, a child process is
 * forked and calls exec() to run the command associated with the target.
 */
void build(char *TargetName, target_t targets[], int nTargetCount) {
    int targetIndex = find_target(TargetName, targets, nTargetCount);

    #ifdef DEBUG
    printf("D: Building target %s\n", TargetName);
    #endif

    if (targetIndex >= 0) {
        #ifdef DEBUG
        printf("D: Target %s exists in Makefile\n", TargetName);
        #endif

        if (!targets[targetIndex].Status) {
            #ifdef DEBUG
            printf("D: Target %s already built, returning\n", TargetName);
            #endif

            return;
        }

        if (!targets[targetIndex].DependencyCount) {
            #ifdef DEBUG
            printf("D: Target %s has no dependencies, needs to be built, set status to 2\n", TargetName);
            #endif
            targets[targetIndex].Status = 2;
        }

        for (int i = 0; i < targets[targetIndex].DependencyCount; i++) {
            char* depName = targets[targetIndex].DependencyNames[i];
            #ifdef DEBUG
            printf("D: Processing dependency %s of target %s, status = %d\n", depName, TargetName, targets[targetIndex].Status);
            #endif

            build(depName, targets, nTargetCount);

            if (does_file_exist(depName) == 0 && does_file_exist(TargetName) == 0) {
                #ifdef DEBUG
                printf("D: Both %s and %s are files, comparing modification times\n", TargetName, depName);
                #endif

                int modTime = compare_modification_time(TargetName, depName);
                switch(modTime) {
                    case -1:
                        #ifdef DEBUG
                        printf("D: Case -1: Error\n", TargetName, depName, TargetName);
                        #endif
                        fprintf(stderr, "Error: %s or %s does not exist\n", TargetName, depName);
                        exit(-1);
                    case 0:
                        #ifdef DEBUG
                        printf("D: Case 0: %s and %s updated at the same time, skip\n", TargetName, depName);
                        #endif
                        break;
                    case 1:
                        #ifdef DEBUG
                        printf("D: Case 1: %s updated later than %s, skip\n", TargetName, depName);
                        #endif
                        break;
                    case 2:
                        #ifdef DEBUG
                        printf("D: Case 2: Target %s needs to be rebuilt, but may need to process more dependencies\n", TargetName);
                        #endif
                        targets[targetIndex].Status = 2;
                        break;
                    default:
                        #ifdef DEBUG
                        printf("D: Default Case hit\n");
                        #endif
                        break;
                }
            }
            else {
                #ifdef DEBUG
                printf("D: Either %s or %s does not exist, set status to 2\n", TargetName, depName);
                #endif
                targets[targetIndex].Status = 2;
            }
        }
        if (targets[targetIndex].Status != 2) {
            #ifdef DEBUG
            printf("D: Target %s status = %d != 2, does not need to be built, returning\n", TargetName, targets[targetIndex].Status);
            #endif
            return;
        }
    }
    else if (does_file_exist(TargetName) == -1) {
        fprintf(stderr, "Error: '%s' is not a target or a file.\n", TargetName);
        exit(-1);
    }
    else {
        #ifdef DEBUG
        printf("D: %s is a file but not a target, returning\n", TargetName);
        #endif
        return;
    }

    #ifdef DEBUG
    printf("D: Running command for target %s, set status to 0\n", TargetName);
    #endif

    // Target will be built, set status
    targets[targetIndex].Status = 0;

    int p = fork();
    if (p == 0) {
        // child process
        char** cmd = build_argv(targets[targetIndex].Command);
        // printf("child  pid: %d\n", getpid());
        // printf("parent pid: %d\n", getppid());
        printf("%s\n", targets[targetIndex].Command);
        execvp(cmd[0], cmd);
        perror("Exec failed");
        exit(-1);
    }
    if (p > 0) {
        // parent process
        // The following code was taken from the project description
        int wstatus;
        wait(&wstatus);
        if (WEXITSTATUS(wstatus) != 0) {
            fprintf(stderr, "make4061: *** [%s] Error %d\n", TargetName, WEXITSTATUS(wstatus));
            exit(-1);
        }
    }
    if (p < 0) {
        perror("Could not fork");
        exit(-1);
    }

    #ifdef DEBUG
    printf("D: Target %s done\n", TargetName);
    #endif
}

int main(int argc, char *argv[]) {
  target_t targets[MAX_NODES];
  int nTargetCount = 0;

  /* Variables you'll want to use */
  char Makefile[64] = "Makefile";
  char TargetName[64];

  /* Declarations for getopt */
  extern int optind;
  extern char * optarg;
  int ch;
  char * format = "f:h";

  while((ch = getopt(argc, argv, format)) != -1) {
    switch(ch) {
      case 'f':
        strcpy(Makefile, strdup(optarg));
        break;
      case 'h':
      default:
        show_error_message(argv[0]);
        exit(1);
    }
  }

  argc -= optind;
  if(argc > 1) {
    show_error_message(argv[0]);
    return -1;
  }

  /* Init Targets */
  memset(targets, 0, sizeof(targets));

  /* Parse graph file or die */
  if((nTargetCount = parse(Makefile, targets)) == -1) {
    return -1;
  }

  /* Comment out the following line before submission */
  // show_targets(targets, nTargetCount);

  /*
   * Set Targetname
   * If target is not set, set it to default (first target from makefile)
   */
  if(argc == 1) {
    strcpy(TargetName, argv[optind]);
  } else {
    strcpy(TargetName, targets[0].TargetName);
  }

  /*
   * Now, the file has been parsed and the targets have been named.
   * You'll now want to check all dependencies (whether they are
   * available targets or files) and then execute the target that
   * was specified on the command line, along with their dependencies,
   * etc. Else if no target is mentioned then build the first target
   * found in Makefile.
   */

  /*
   * INSERT YOUR CODE HERE
   */

   /* Target Statuses
    * 0: Target has been built
    * 1: Target has not been built and does not need to be built
    * 2: Target has not been built, but needs to be built
    */

    // Initially set status of each target node
   for (int i = 0; i < nTargetCount; i++) {
       targets[i].Status = 1;
   }

   build(TargetName, targets, nTargetCount);

   int targetIndex = find_target(TargetName, targets, nTargetCount);

   // If the initial target status never gets set to 0 or 2, it was never updated
   if (targets[targetIndex].Status == 1) {
       printf("make4061: `%s' is up to date.\n", TargetName);
   }

  return 0;
}
