FROM ubuntu:latest

#ENV http_proxy=http://clientproxy.corproot.net:8079
#ENV HTTP_PROXY=$http_proxy
#ENV https_proxy=$http_proxy
#ENV HTTPS_PROXY=$http_proxy

# Updating Ubuntu packages
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && yes|apt-get upgrade
RUN apt-get install -y emacs wget bzip2 sudo libgl1-mesa-glx python3 software-properties-common curl libcurl4-gnutls-dev libssl-dev

# Install R
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
RUN apt-get update
RUN apt-get install -y r-base r-recommended r-cran-devtools

# Add user ubuntu with no password, add to sudo group
RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu/
RUN chmod a+rwx /home/ubuntu/

# Install julia
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.2/julia-1.2.0-linux-x86_64.tar.gz -q
RUN tar xfz julia-1.2.0-linux-x86_64.tar.gz && rm julia-1.2.0-linux-x86_64.tar.gz
ENV JULIABIN home/ubuntu/julia-1.2.0/bin
ENV JULIALIB ome/ubuntu/julia-1.2.0/lib
ENV PATH /home/ubuntu/R-3.6.1/bin:$JULIABIN:$JULIALIB:$PATH

# Anaconda installing
RUN mkdir /home/ubuntu/.conda/
RUN chmod 777 /home/ubuntu/.conda/

RUN wget https://repo.continuum.io/archive/Anaconda3-2019.03-Linux-x86_64.sh
RUN bash Anaconda3-2019.03-Linux-x86_64.sh -b
RUN rm Anaconda3-2019.03-Linux-x86_64.sh

# Set path to conda
ENV PATH /home/ubuntu/anaconda3/bin:$PATH
ENV PYTHONPATH=/home/ubuntu/anaconda3/Lib/site-packages

# Updating Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all

# Configuring access to Jupyter
RUN mkdir /home/ubuntu/notebooks
RUN jupyter notebook --generate-config --allow-root
# The PASSWORD is: root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py

# Jupyter listens port: 8888
EXPOSE 8888

# Run Jupytewr notebook as Docker main process
CMD ["jupyter-lab", "--allow-root", "--notebook-dir=/home/ubuntu/notebooks", "--ip='0.0.0.0'", "--port=8888", "--no-browser"  ]


