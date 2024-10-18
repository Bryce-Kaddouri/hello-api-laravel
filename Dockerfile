FROM dunglas/frankenphp

# install zip, 7zip, unzip
RUN apt-get update && apt-get install -y zip p7zip-full unzip
 
RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...

# install git 
RUN apt-get update && apt-get install -y git

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN git clone https://github.com/Bryce-Kaddouri/hello-api-laravel.git


RUN cd hello-api-laravel && composer install

# Start of Selection
WORKDIR /app/hello-api-laravel

# create .env file
RUN cp .env.example .env

# generate app key
RUN php artisan key:generate



# End of Selection


 
ENTRYPOINT ["php", "artisan", "octane:frankenphp"]