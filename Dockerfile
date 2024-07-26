FROM ubuntu:latest

# Prevent interactive prompts during package installat
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a symbolic link to make cowsay available in PATH
RUN ln -s /usr/games/cowsay /usr/local/bin/cowsay
RUN ln -s /usr/games/fortune /usr/local/bin/fortune

# Explicitly check if the commands are available
RUN which cowsay && which fortune && which netcat

# Copy the server script into the container
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port the server will run on
EXPOSE 4499

# Set the script as the entrypoint
ENTRYPOINT ["/usr/local/bin/wisecow.sh"]
