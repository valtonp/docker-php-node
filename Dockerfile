# Utiliser l'image officielle d'Apache avec PHP 8.3
FROM php:8.3-apache

RUN echo "ServerName localhost" | tee -a /etc/apache2/apache2.conf

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    curl \
    git \
    lsb-release \
    ca-certificates \
    gnupg \
    wget \
    && apt-get clean

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install zip

# Ajout de l'extension MySQL PDO
RUN docker-php-ext-install pdo_mysql

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installer Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_23.x | bash - && \
    apt-get install -y nodejs

# Configurer Apache pour accepter les fichiers .htaccess et activer les modules nécessaires
RUN a2enmod rewrite

# Donner les permissions nécessaires (www-data pour apache)
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 8000

# Commande pour démarrer Apache en mode foreground
CMD ["apache2-foreground"]
