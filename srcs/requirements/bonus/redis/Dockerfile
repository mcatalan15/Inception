FROM debian:11.7

# Install Redis
RUN apt-get update && \
    apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

# Configure Redis (if needed)
COPY ./conf/redis.conf /etc/redis/redis.conf

# Expose Redis port
EXPOSE 6379

# Run Redis in the foreground
CMD ["redis-server", "/etc/redis/redis.conf"]

