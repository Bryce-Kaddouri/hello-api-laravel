FROM dunglas/frankenphp
 
RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...

# install git 
RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/Bryce-Kaddouri/hello-api-laravel.git /app

RUN cd /app && composer install

WORKDIR /app
 
ENTRYPOINT ["php", "artisan", "octane:frankenphp"]