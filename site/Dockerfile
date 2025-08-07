FROM debian:12

# Installer nginx, PHP-FPM et les extensions utiles
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx php8.2 php8.2-fpm php8.2-mysql && \
    apt update && apt install -y php-curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Créer les répertoires nécessaires
RUN mkdir -p /etc/nginx/certs/ /var/www/cv_en_ligne/
RUN rm /etc/nginx/sites-enabled/default
# Copier les fichiers du site
# COPY ./conf/SyntheSantePerso/ /var/www/synthesante/

# ⚠️ Définir les permissions appropriées
RUN chown -R www-data:www-data /var/www/cv_en_ligne && \
    chmod -R 755 /var/www/cv_en_ligne

# Config Nginx
COPY ./conf/cv_en_ligne /etc/nginx/sites-available/cv_en_ligne
RUN ln -s /etc/nginx/sites-available/cv_en_ligne /etc/nginx/sites-enabled/

# Config Nginx globale
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Nettoyer l'index par défaut
RUN rm -f /var/www/html/index.nginx-debian.html

# Exposer le port HTTPS (443)
EXPOSE 80

# Lancer PHP-FPM puis Nginx
CMD service php8.2-fpm start && nginx -g 'daemon off;'