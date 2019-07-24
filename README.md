# owitools - metabarcoding pipeline based on obitools

This reproducible pipeline is based on [obtiools](https://git.metabarcoding.org/obitools/obitools/wikis/home) incorporating other software for A. chimera detection, B. clustering, and C. speeding things up a bit. 

We have packaged everything into a docker [environment](https://hub.docker.com/r/baillicharles/owitools/) that should get you going straight away. This image is built on the [rocker/rstudio](https://hub.docker.com/r/rocker/rstudio) image so the idea is that you can run all of the analyses through the familiar environment of rstudio, continue analyses in that environment once an OTU table is generated, and produce a report using RMarkdown. To switch formats between various software and conduct some other tasks, there are some scripts supplied written by Owen Wangensteen for [metabarpark](https://github.com/metabarpark) and the [SeaDNA project](https://github.com/boopsboops/reference-libraries). 

Included in the image is an .Rmd with all the pipeline steps laid out. Run these in a terminal one chunk at a time, or most, powerfully, set up the document and accessory scripts properly with correct file names etc., knit it, and grab a coffee.    

What the image does not include are reference databases and a taxonomy, or anyway to make these. These should be ready made and in [ecoPCR](https://pythonhosted.org/OBITools/scripts/ecoPCR.html) format. For the pipeline its probably easiest to have these in the same directory as your read and ngsfilter files, and this will be mounted to the image.  


## How to use the image.
### Connect to your server via SSH tunnel on the port used by RStudio (for multiple sessions change first port number):
```bash
ssh -L 8787:localhost:8787 <username>@<ip-address>
```
### In the terminal window, mount the docker container to the data directory and start it up in detached mode:
```bash
sudo docker run -d -p 8787:8787 -e PASSWORD=<password> -e USERID=$UID  -v /PATH/TO/DATA/FILES:/home/rstudio/working --name <name-of-analysis> bailliecharles/owitools
```
#### If you don't have sudo privileges ask your administrator to be added to the docker group.

### Open up a browser, enter the url and once loaded supply the username 'rstudio' and password given above:
```html
https://localhost:8787
```
