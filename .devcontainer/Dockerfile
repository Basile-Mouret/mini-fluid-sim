# Use an Ubuntu base image
FROM ubuntu:22.04

# Install necessary tools
RUN apt-get update && apt-get install -y \
    gfortran \
    make \
    cmake \
    vim \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set up a working directory
WORKDIR /app

# Set default command
CMD ["sh"]
