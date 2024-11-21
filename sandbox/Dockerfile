# Use an official Ubuntu as the base image
FROM ubuntu:20.04

# Set non-interactive mode to avoid interactive prompts during the build
ENV DEBIAN_FRONTEND=noninteractive



# Update apt sources and install essential packages
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y nodejs npm
RUN apt-get install -y gcc g++ 
RUN apt-get install -y make 
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y coreutils
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*



# Create a non-root user for security purposes
RUN useradd -m sandbox-user

# Set the working directory where user code will be mounted
WORKDIR /home/sandbox-user

# Copy the entrypoint script into the container as root
COPY entrypoint.sh /home/sandbox-user/entrypoint.sh

# Change permissions for the entrypoint script as root
RUN chmod +x /home/sandbox-user/entrypoint.sh

# Switch to the non-root user for all subsequent instructions
USER sandbox-user

# Set the entrypoint to execute the user's code
ENTRYPOINT ["/home/sandbox-user/entrypoint.sh"]