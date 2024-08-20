# Use an appropriate base image
FROM ubuntu:20.04

# Set non-interactive mode to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the timezone to UTC to avoid interactive timezone configuration prompts
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 perl libapache2-mod-perl2 wget unzip

# Copy your Prontus files into the Docker image
COPY prontus-11 /var/www/prontus

# Set the correct permissions for the Prontus directory
RUN chown -R www-data:www-data /var/www/prontus && \
    chmod -R 755 /var/www/prontus

# Configure Apache to handle CGI scripts and set up the correct directories
COPY apache-config.conf /etc/apache2/sites-available/prontus.conf

# Enable the necessary Apache modules
RUN a2enmod cgi

# Enable the Prontus site configuration
RUN a2ensite prontus

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
