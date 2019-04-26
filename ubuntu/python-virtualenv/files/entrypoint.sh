#!/bin/bash

. /myApp/bin/activate

# This will pass any command appended to the docker run command.
exec $@

# Note: exec is used to hand over PID 1 from the shell to the defined command/script.
#       This ensures that when the Docker Daemon wishes to stop the container. The
#       linux SIGKILL signal is sent directly to the primary command/script and a 
#       clean shutdown is performed. Failure to do this may result in applications
#       crashing out and corrupting data.
