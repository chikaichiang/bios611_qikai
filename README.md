Hi, this is my 611 Data Science Project. More to come.

I am interested in conducting exploratary analysis of cervical cancer patients based on four types of testing result Hinselamnn, Schiller, Citology and Bioposy. 

The dataset used for this project is kag_risk_factors_cervical_cancer.csv. The dataset can be downloaded from https://www.kaggle.com/datasets/vincent625/risk-factors-cervical-cancer. 

Instruction to build the docker file:

 1: Clone the repository in git bash using the repository URL.

```
git clone https://github.com/chikaichiang/bios611_qikai.git
```

 2: Build the docker using the command "docker build . -t bios611"
    In a new terminal/window build the docker container with image name "bios611".

```
docker build . -t bios611
```

 3: Run the docker container
    For Mac/terminal, use the following command to run the container.

```
docker run "docker run -v $(pwd):/home/rstudio/work -p 8787:8787 -it bios611"
```

  For Powershell, use the following command to run the container.

```
docker run "docker run -v ${pwd}:/home/rstudio/work -p 8787:8787 -it bios611"
```

Once the container is built and run, open the rstudio container image in a web browser. Type localhost:8787 in a browser window. Use "rstudio" as username and password generated in the terminal from previous step.

Once you are into the rstudio docker container cd into the work directory using terminal interface.

```
cd work
ls
```

`ls` command should list all the files in the repository, including a Dockerfile and Makefile.

The Makefile is used to create the images.

To create a figure describing the demographics run "make figure1.png"

```
make figure1.png
```

To create a figure for the prevalence of mutations run "make figure2.png"

```
make figure2.png
```

To create a figure for the prevalence of mutations run "make figure3.png"

```
make figure3.png
```

To run all the scripts in the Makefile

```
make all
```
