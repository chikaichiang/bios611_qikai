FROM  rocker/verse
RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*


RUN R -e "install.packages('readr', dependencies=TRUE)"
RUN R -e "install.packages('tidyverse', dependencies=TRUE)"
RUN R -e "install.packages('dplyr', dependencies=TRUE)"
RUN R -e "install.packages('stringr', dependencies=TRUE)"
RUN R -e "install.packages('ggplot2', dependencies=TRUE)"
RUN R -e "install.packages('janitor', dependencies=TRUE)"