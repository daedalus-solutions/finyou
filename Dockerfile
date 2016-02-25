############################################################
# Dockerfile to build mono asp-net container images
# Based on phusion/baseimage
############################################################ 
# Set the base image to mono
FROM daedalus/mono-asp-net:latest

# File Author / Maintainer
MAINTAINER Jonathan Temlett - Daedalus Solutions (jono@daedalus.co.za)

# set the working directory for subsequent commands
WORKDIR /app

# fetch the NuGet dependencies for our application
RUN kpm restore
# set the working directory for subsequent commands
WORKDIR /app/src/helloworldweb
# expose TCP port 5000 from container
EXPOSE 5000
# Configure the image as an executable
# When the image starts it will execute the “k web” command
# effectively starting our web application
# (listening on port 5000 by default)
ENTRYPOINT ["k", "web"]
