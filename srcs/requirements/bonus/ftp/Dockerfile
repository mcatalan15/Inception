FROM debian:11.7

# Install vsftpd
RUN apt-get update && apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

# Configure vsftpd
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# Set up permissions for the WordPress volume
RUN mkdir -p /var/www/html && \
    chown -R ${FTP_USER}:${FTP_PASSWORD} /var/www/html

# Create the required secure chroot directory
RUN mkdir -p /var/run/vsftpd/empty

# Expose FTP ports
EXPOSE 20 21 30000-30100

# Run vsftpd in the foreground with passive mode enabled and create the user
CMD useradd -m -d /home/${FTP_USER} -s /bin/bash ${FTP_USER} && \
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd && \
    /usr/sbin/vsftpd /etc/vsftpd.conf -opasv_enable=YES

# FROM debian:11.7

# # Install vsftpd
# RUN apt-get update && apt-get install -y vsftpd && \
#     rm -rf /var/lib/apt/lists/*

# # Configure vsftpd
# COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# # Create FTP user and set home directory
# RUN useradd -m -d /home/${USER} -s /bin/bash ${FTP_USER} && \
#     echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

# # Set up permissions for the WordPress volume
# RUN mkdir -p /var/www/html && \
#     chown -R ftpuser:ftpuser /var/www/html

# # Expose FTP ports
# EXPOSE 20 21 30000-30100

# RUN mkdir -p /var/run/vsftpd/empty

# # Run vsftpd in foreground
# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf", "-opasv_enable=YES"]

