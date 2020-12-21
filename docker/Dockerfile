FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update

# Install packages
## Install R-base
RUN apt install -y r-base
## Install Python pip
RUN apt install -y python3-pip

# Create the working dir
RUN bash -c "mkdir -p /workspace/{project_name,input,output,tmp}"
## Switch to workspace
WORKDIR /workspace

# Install dependencies
COPY ./ ./tmp/
RUN cd ./tmp && ./build.sh release && cd ../

# Clean up txt files
RUN bash -c "rm -r ./tmp"

CMD ["bash", "run.sh"]
