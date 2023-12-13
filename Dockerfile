FROM  rocker/verse

#Install packages
RUN R -e "install.packages('readr', dependencies=TRUE)"
RUN R -e "install.packages('tidyverse', dependencies=TRUE)"
RUN R -e "install.packages('dplyr', dependencies=TRUE)"
RUN R -e "install.packages('stringr', dependencies=TRUE)"
RUN R -e "install.packages('janitor', dependencies=TRUE)"
RUN R -e "install.packages('R.utils', dependencies=TRUE)"
RUN R -e "install.packages('ggplot2', dependencies=TRUE)"
RUN R -e "install.packages('matlab', dependencies=TRUE)"
RUN R -e "install.packages('plotly', dependencies=TRUE)"
RUN R -e "install.packages('htmlwidgets', dependencies=TRUE)"
RUN R -e "install.packages('aricode', dependencies=TRUE)"
RUN R -e "install.packages('mclust', dependencies=TRUE)"

#Introduce Python3 for tSNE
RUN apt update && apt install -y python3 python3-pip

RUN pip3 install numpy scikit-learn pandas