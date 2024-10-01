
# Use of Debina 12 (current OS on the VM) as the base image
FROM debian:12

# Set the DEBIAN_FRONTED environment variable to noninteractive
ENV DEBIAN_FRONTED=noninteractive

# Set a default domain name mcatalan.42.fr
ARG DOMAIN_NAME=mcatalan.42.fr

# Update the repositories and install necesarry packages
RUN apt-get update && apt-cache policy apt-utils && \
apt-get install -y apt-utils openssl neovim \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Create the directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl && chmod 700 /etc/nginx/ssl

# Display OpenSSL req help
RUN openssl req -help

# Generate self-signed SSL certificates for TLSv1.2/1.3
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \	
	-subject "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=mcatalan.42.fr" || (echo "OpenSSL comand failed" && exit 1)
	#-subject "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=${DOMAIN_NAME}"

# Copy the nginx configuration file from the host
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Command to start NGINX in non-deamon mode
CMD ["nginx", "-g", "deamon off;"]

