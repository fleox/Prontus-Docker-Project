# Utiliser une image de base Ubuntu
FROM ubuntu:20.04

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y apache2 perl libapache2-mod-perl2 wget unzip && \
    apt-get clean

# Configurer le répertoire de travail
WORKDIR /var/www

# Télécharger et extraire Prontus 11
RUN wget http://download.prontus.cl/releases/Prontus_v11.0.zip && \
    unzip Prontus_v11.0.zip -d prontus && \
    rm Prontus_v11.0.zip

# Configurer Apache pour Prontus
COPY prontus.conf /etc/apache2/sites-available/prontus.conf
RUN a2ensite prontus && \
    a2enmod cgi && \
    a2enmod rewrite && \
    service apache2 restart

# Exposer le port 80 pour le serveur web
EXPOSE 80

# Démarrer Apache en premier plan
CMD ["apachectl", "-D", "FOREGROUND"]
