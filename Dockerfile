FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum install wget unzip -y

# Change directory
WORKDIR /var/www/html

# Download web files
RUN wget https://github.com/Ahmednas211/jupiter-zip-file/raw/main/jupiter-main.zip

# Unzip folder
RUN unzip jupiter-main.zip && \
    rm jupiter-main.zip

# Copy files into HTML directory
RUN cp -r jupiter-main/* . && \
    rm -rf jupiter-main

# Expose port 80 on the container
EXPOSE 80

# Set the default application that will start when the container starts
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]