# Utiliser l'image de base FrankenPHP
FROM dunglas/frankenphp

# Définir le répertoire de travail
WORKDIR /app

# Cloner ton dépôt GitHub
# Assure-toi d'utiliser un token si nécessaire pour l'authentification
RUN apt-get update && apt-get install -y git \
    && git clone https://github.com/TON_UTILISATEUR/TON_DEPOT.git /app \
    && rm -rf /var/lib/apt/lists/*

# Installer les dépendances de Laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Copier les fichiers de configuration de FrankenPHP (ajuster selon ton setup)
COPY frankenphp-config.yaml /usr/local/etc/frankenphp/

# Exposer les ports
EXPOSE 80 443 443/udp

# Commande de démarrage
CMD ["frankenphp", "serve", "--config", "/usr/local/etc/frankenphp/frankenphp-config.yaml"]
