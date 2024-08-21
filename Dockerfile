# Utilisez une image de base appropriée
FROM ubuntu:20.04

# Définissez le mode non interactif pour éviter les invites lors de l'installation des paquets
ENV DEBIAN_FRONTEND=noninteractive

# Mettez à jour les listes de paquets et installez tzdata pour la configuration du fuseau horaire
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Installez les paquets nécessaires pour Prontus et les modules Perl
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php \
    libapache2-mod-perl2 \
    perl \
    perl-modules \
    libdbi-perl \
    libdbd-mysql-perl \
    libhttp-date-perl \
    libwww-perl \
    liblockfile-simple-perl \
    libmail-sender-perl \
    libgd-perl \
    libxml-parser-perl \
    libnet-dns-perl \
    libjson-perl \
    liburi-perl \
    mysql-client \
    sendmail \
    libgd-dev \
    libgif-dev \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copiez les fichiers de Prontus dans l'image Docker
COPY prontus /var/www/prontus

# Définissez les permissions correctes pour le répertoire Prontus
RUN chown -R www-data:www-data /var/www/prontus && \
    find /var/www/prontus -type f -name "*.cgi" -exec chmod +x {} \; \
    && chmod -R 755 /var/www/prontus

# Copiez le fichier de configuration Apache dans l'image Docker
COPY prontus.conf /etc/apache2/sites-available/prontus.conf

# Activez les modules Apache nécessaires et la configuration du site
RUN a2enmod cgi && \
    a2ensite prontus.conf && \
    a2dissite 000-default.conf

# Exposez le port 80
EXPOSE 80

# Démarrez Apache en premier plan
CMD ["apachectl", "-D", "FOREGROUND"]
