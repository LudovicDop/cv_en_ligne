# Utilisation de l'image officielle Nginx
FROM nginx:alpine

# Suppression des fichiers par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copie de ton site dans le répertoire de Nginx
# COPY ./site /usr/share/nginx/html

# Exposition du port 80
EXPOSE 80
