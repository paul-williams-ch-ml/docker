<img src="https://2s7gjr373w3x22jf92z99mgm5w-wpengine.netdna-ssl.com/wp-content/uploads/2017/02/Anaconda_Logo-300x150.png" height="100" width="200"  />
  
# Build the Anaconda Jupyter-Lab Docker container
Create a directory named docker-build.
```
mkdir docker-build
```
Change to the new directory.
```
cd docker-build
```
Download the Docker file from Bit Bucket.
```
get clone https://git.swisscom.com/scm/poc/docker-images.git
```
Build the container.
```
docker build . -t anaconda
```

<br/><br/>
# Launch the Anaconda Jupyter-Lab Docker container

To deploy a container from the image use the command:
```
docker run --name anaconda -p 8888:8888 --env="DISPLAY" -v "$PWD/notebooks:/home/ubuntu/notebooks" -d anaconda
```

This creates a directory: 
```
~/anaconda/notebooks 
```

Set the access rights of the directory: 
```
sudo chmod 777 ~/anaconda/notebooks 
```

This is where your notebooks will be placed.

To stop the container:
```
docker stop anaconda
```
To restart it:
```
docker start anaconda
```
The URL: 
```
<<YOUR IP ADDRESS>>:8888
```
The password is: 
```
root
```

<br/><br/>
# Anaconda Environments
The Conda base environment named: base is created by default. This has a Python 3.7 kernel.

To list your Conda environments. From Jupyter-Lab, open a terminal and type:

```
conda env list
```


You can create new environments with the Conda Create functionality. 
An examplei (Env with Python 2.7 Kernel): 
From Jupyter-Lab open a terminal and enter the commands:

Switch to the Bash shell.
 
```
bash
```

<br/><br/><img src="https://www.r-project.org/Rlogo.png" height="80" width="80"  />

To install the __R__ kernel. Open a termial and run the conda command.
```
conda install -c anaconda jupyter_client
```
You may have to answer 'y' or 'yes'.
  
Then start R.

```
R
```

Deploy the packages to enable the R Kernel.

```
install.packages('IRkernel')
```
You may have to answer 'y' to some questions.

Close the terminal.
If the R notebook icon is not shown, refresh your browser.

<br/><br/><img src="https://julialang.org/v2/img/logo.svg" height="80" width="80" />

To install the __julia__ kernel. Open a termial and start julia

```
cd /home/ubuntu/julia-1.2.0/bin/
./julia
```

Deploy the packages to enable the R Kernel.
```
using Pkg
Pkg.add("IJulia")
```

Close the terminal.
If the julia notebook icon is not shown, refresh your browser.


<br/><br/>In addition...<br/><br/><img src="https://www.python.org/static/img/python-logo.png" height="80" width="250"  />

The Docker file builds Jupyter lab with a default Python 3 Kernel. If you wish, it is possible to add a Python 2 Kernel aswell.
  
Open a termial and run the conda command.
```
conda create -n ipykernel_py2 python=2 ipykernel
```

Activate the environment.
```
source activate ipykernel_py2
```

Install the Kernel.
```
python -m ipykernel install --user
```

Now close Jupyter-Lab in the browser and re-open it.
You will have have both Python 3 & Python 2 Kernels available.
<br/><br/>__NOTE:__ - Python 2 End-Of-Life date is: 01.01.2020.
