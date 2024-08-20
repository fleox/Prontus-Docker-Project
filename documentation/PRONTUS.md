# Prontus CMS Technical Overview

Prontus is a content management system (CMS) designed for managing and publishing web content. This document provides a technical overview of how Prontus operates, including its architecture, key components, and directory structure.

## Table of Contents

1. [System Architecture](#system-architecture)
2. [Key Components](#key-components)
3. [Directory Structure](#directory-structure)
4. [Technical Details](#technical-details)
5. [Configuration](#configuration)
6. [Running Prontus](#running-prontus)
7. [Further Reading](#further-reading)

## System Architecture

Prontus CMS operates on a traditional web server setup with a combination of CGI scripts, Perl modules, and static content. It relies on a web server like Apache to handle HTTP requests and serve dynamic content through CGI (Common Gateway Interface) scripts.

### Components

- **Web Server**: Typically Apache, configured to execute CGI scripts and serve static files.
- **CGI Scripts**: Perl scripts responsible for dynamic content generation and site management.
- **Static Content**: HTML, CSS, and JavaScript files that make up the website's frontend.

## Key Components

### CGI Scripts

- **`cgi-bin`**: This directory contains essential CGI scripts written in Perl. These scripts handle dynamic requests such as displaying articles, managing content, and interacting with the database.
- **`cgi-cpn`**: This directory is used for custom CGI scripts and modules that extend or complement the functionality provided by the core scripts in `cgi-bin`.

### Static Content

- **`noticias`**: This directory stores static content such as articles, images, and multimedia files. It is where the content managed by the CMS is stored and organized.

## Directory Structure

Here is a high-level view of the Prontus CMS directory structure:

```
prontus/
├── cgi-bin/
│   ├── admin.cgi
│   ├── dispatcher.cgi
│   └── ... (other CGI scripts)
├── cgi-cpn/
│   ├── custom_feature.cgi
│   ├── extra_module.pm
│   └── ... (custom scripts and modules)
└── noticias/
    ├── 2024/
    │   ├── 08/
    │   │   ├── article123.html
    │   │   └── ... (other articles and media)
    │   └── ... (other date-based directories)
    └── images/
        ├── logo.png
        └── ... (other images)
```

## Technical Details

### CGI Scripts

- **Execution**: CGI scripts are executed by the web server to handle dynamic content. They process user inputs, interact with the database, and generate HTML output.
- **Configuration**: Apache must be configured to allow execution of CGI scripts. This is typically achieved by enabling the CGI module and configuring the `cgi-bin` directory as a CGI directory in the Apache configuration.

### Custom Scripts

- **`cgi-cpn`**: Used for adding custom features or extensions. This modular approach allows for easy customization without modifying core CMS functionality.

### Static Content

- **Storage**: The `noticias` directory holds all content that is not dynamically generated. It includes articles, images, and other media files used by the site.

## Configuration

To configure Prontus, you'll need to:

1. **Set Up Apache**: Configure Apache to execute CGI scripts by setting up the appropriate `ScriptAlias` and `Directory` directives in your Apache configuration file (e.g., `prontus.conf`).
2. **Adjust File Permissions**: Ensure that the `cgi-bin` and `cgi-cpn` directories have the correct permissions to allow execution of scripts.

## Running Prontus

1. **Install Dependencies**: Ensure that Perl and any required Perl modules are installed on your server.
2. **Deploy**: Copy the Prontus files to the appropriate directories on your server.
3. **Configure Apache**: Set up Apache to serve the Prontus application, including configuration for CGI execution.
4. **Access**: Navigate to your site in a web browser to start using Prontus.

## Further Reading

- [Prontus Official Documentation](https://example.com/prontus-docs)
- [Apache CGI Configuration](https://httpd.apache.org/docs/current/howto/cgi.html)
- [Perl CGI Programming](https://perldoc.perl.org/CGI)

---

This `README.md` provides a technical overview of Prontus CMS, explaining its components, directory structure, and how it operates. Adjust the links and paths as necessary to match your specific setup and documentation.