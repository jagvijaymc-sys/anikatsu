# Use a PHP + Apache image
FROM php:8.2-apache

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Copy your PHP files to the server
COPY . /var/www/html/

# Copy your API files to a subfolder
COPY ./api-folder /app/api

# Install API dependencies
RUN cd /app/api && npm install

# Start both: API in background, Apache in foreground
CMD node /app/api/index.js & apache2-foreground
