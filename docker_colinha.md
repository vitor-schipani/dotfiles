#Notes from my docker study
#Book: Docker In A Month Of Lunches (diamol)

#Terminology:
Dockerfile: "template" for building an image
Image: A ready and installed base where containers can be spun from.
Container: A running instance of an image.
Registries: Those are places where docker looks for images. The default is
dockerhub but it can be hosted in your own organization as well.

#Concepts:
##Difference between dockerfiles, images and containers
Dockerfiles are templates that can be optimized to build in as little time as
possible. 
Images on the other hand already have everything to run the container,
including filesystem, required files, packages, etc. Images should be as lightweight
as possible to keep the container small and consuming few resources.
You can check the size of an image using: docker image ls

##Image layers and optimization of image builds
Images are built by layers, each layer can be reused by other images to avoid
pulling the same information all the time. Most images have a very thin OS
layer that is reused between different images, other examples of layers that
can be reused are programming languages, etc.

Images follow a defined sequence specified in the Dockerfile, if the sequence
has been observed before then it uses a cache and speeds up the process. If
the sequence changes it only uses the cache up until that point and then
executes all instructions.

Leave all "heavy" steps (not likely to change too often) first.


#Getting help:
Best way to check for commands:
docker --help
docker container --help
docker run --help

#Important docker image commands:
docker image pull
docker image build
    --tag: name of the image, this is called by docker container run <img_tag>

#Important docker container commands:
docker container ls: displays all alive containers. Add "--all" if you want to
show all containers irrespective of running status.
docker container top <CONTAINER>: displays all running process in a container.
docker container logs <CONTAINER>: displays all output from the container.
docker container inspect <CONTAINER>: displays information from a container.
docker container run <CONTAINER>: runs the container
    --name: a custom name for the new container
    --detach OR -d: runs the container in a detached state
    --env OR -e: Set environment variables (that were specified in the dockerfile)
    --interactive OR -i: Run the container in interactive mode
    --publish OR -p: publish a container port to a port on the computer running
    the container

#Important dockerfile commands:
FROM: usually the first thing in a docker file. It specifies what is the base
image, usually coming from dockerhub or another source
Example: diamol/node

ENV: defines an environment variable that can be changed when the container is
invoked.
Syntax: [KEY]="[VALUE]"
Example: METHOD="HEAD"

WORKDIR: Creates directory and set it as workdir, aka where the code will run.
Example: /web-ping

COPY: Copy from local environment to the docker container.
Syntax: COPY [source path] [target path]
Example: COPY app.js .

CMD: Runs a command
Example: ["node", "/web-ping/app.js"]

#Chapter 3: Basic docker file
FROM diamol/node
ENV TARGET
ENV METHOD="HEAD"
ENV INTERVAL="3000"
WORKDIR /web-ping
COPY app.js .
CMD ["node", "/web-ping/app.js"]
