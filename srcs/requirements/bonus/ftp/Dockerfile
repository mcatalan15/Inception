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
CMD if ! id -u "${FTP_USER}" >/dev/null 2>&1; then \
	useradd -m -d /home/${FTP_USER} -s /bin/bash ${FTP_USER} && \
	echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd; \
	fi && \
	/usr/sbin/vsftpd /etc/vsftpd.conf -opasv_enable=YES

