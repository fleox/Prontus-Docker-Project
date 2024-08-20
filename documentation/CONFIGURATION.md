# Prontus 11 Configuration Files Guide

This guide provides details on the configuration and purpose of key files in Prontus 11 CMS, specifically `admin.pl` and `config.pl`. Understanding these files is crucial for managing and configuring your Prontus 11 installation.

## Table of Contents

1. [admin.pl](#adminpl)
2. [config.pl](#configpl)
3. [Additional Configuration](#additional-configuration)
4. [Further Reading](#further-reading)

## `admin.pl`

### Purpose

The `admin.pl` file is a Perl script that provides the administrative interface for Prontus 11. It allows administrators to manage content, configure site settings, and perform various administrative tasks.

### Location

- **Path**: Typically located in the `cgi-bin` directory.
  
  ```plaintext
  /var/www/prontus/cgi-bin/admin.pl
  ```

### Key Functions

- **User Authentication**: Handles login and authentication for administrators.
- **Content Management**: Provides tools to add, edit, and delete content.
- **Site Configuration**: Allows modification of site-wide settings such as themes, layouts, and modules.
- **User Management**: Manages administrative users and their permissions.

### Usage

To access the administrative interface, navigate to the following URL in your web browser:

```plaintext
http://localhost:8080/cgi-bin/admin.pl
```

Ensure that the web server has permissions to execute this script and that it is correctly configured in your Apache or other web server setup.

## `config.pl`

### Purpose

The `config.pl` file is a Perl script used for configuring various settings of the Prontus 11 CMS. It defines important parameters such as database connections, site paths, and other configuration options.

### Location

- **Path**: Usually found in the `cgi-bin` or `cgi-cpn` directory.

  ```plaintext
  /var/www/prontus/cgi-bin/config.pl
  ```

### Key Configurations

- **Database Settings**: Configuration for connecting to the CMS database.

  ```perl
  $db_host = 'localhost';
  $db_name = 'prontus_db';
  $db_user = 'prontus_user';
  $db_pass = 'your_password';
  ```

- **Site Paths**: Definitions for various paths used by the CMS.

  ```perl
  $cgi_bin_path = '/var/www/prontus/cgi-bin';
  $media_path = '/var/www/prontus/noticias';
  ```

- **URL Settings**: Configurations for URLs and other web-specific settings.

  ```perl
  $site_url = 'http://localhost:8080';
  ```

### Usage

Edit the `config.pl` file to adjust settings according to your server environment and site requirements. Ensure that the file is readable by the web server but not accessible publicly for security reasons.

## Additional Configuration

- **Permissions**: Ensure both `admin.pl` and `config.pl` have appropriate file permissions for execution by the web server.

  ```sh
  chmod 755 /var/www/prontus/cgi-bin/admin.pl
  chmod 644 /var/www/prontus/cgi-bin/config.pl
  ```

- **Error Checking**: Regularly check error logs to troubleshoot any issues related to these configuration files.

  ```sh
  tail -f /var/log/apache2/error.log
  ```