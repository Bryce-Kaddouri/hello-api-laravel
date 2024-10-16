FROM dunglas/frankenphp:latest-php8.3

# Be sure to replace "your-domain-name.example.com" by your domain name
ENV SERVER_NAME=localhost
# If you want to disable HTTPS, use this value instead:
#ENV SERVER_NAME=:80

# Enable PHP production settings
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# install git
RUN apt-get update && apt-get install -y git

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install laravel
RUN composer global require laravel/installer

# install laravel project
RUN git clone https://github.com/Bryce-Kaddouri/hello-api-laravel.git

# Copy the PHP files of your project in the public directory
# COPY . /app/public
# If you use Symfony or Laravel, you need to copy the whole project instead:
COPY . /hello-api-laravel

# install laravel dependencies
RUN cd /hello-api-laravel && composer install

# install laravel project
RUN cd /hello-api-laravel && php artisan key:generate

