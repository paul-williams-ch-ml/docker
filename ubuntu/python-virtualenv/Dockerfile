FROM ubuntu:trusty

# Prevent dpkg errors
ENV TERM=xterm-256color

# Install Python with virtual environments
# Note: switch off recommended package install
RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommend=false \
    -o APT::Install-Suggests=false \
    python python-virtualenv
    
# Create virtual environment "myApp"
# Upgrade pip in the virtual environment to the latest version
RUN virtual /myApp && \
    . /myApp/bin/activate && \
    pip instll pip -- upgrade
