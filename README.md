# Prontus 11 Docker Project

This project provides a Dockerized setup for running Prontus 11 using Docker and Docker Compose. It includes a complete configuration for the web server and optional database support.

## Project Structure

```
prontus-docker/
├── Dockerfile
├── docker-compose.yml
├── prontus.conf
├── data/
│   └── ... (Prontus data, mounted in the container)
└── mysql_data/
    └── ... (Database data, if using MariaDB)
```

### Files and Directories

- **`Dockerfile`**: Defines the Docker image with Prontus 11 and all required dependencies.
- **`docker-compose.yml`**: Manages the deployment of the Prontus service and an optional MariaDB database service.
- **`prontus.conf`**: Apache configuration file for serving Prontus.
- **`data/`**: Directory to store persistent data for Prontus.
- **`mysql_data/`**: Directory to store persistent data for the MariaDB database.

## Getting Started

### Prerequisites

- Docker installed on your machine.
- Docker Compose installed on your machine.

### Setup and Running

1. **Clone the Repository**

   ```bash
   git clone https://your-repo-url/prontus-docker.git
   cd prontus-docker
   ```

2. **Build and Start the Containers**

   Use Docker Compose to build and run the containers:

   ```bash
   docker-compose up -d
   ```

   This command will:
   - Build the Docker image for Prontus 11.
   - Start the Prontus service on port 8080.
   - Optionally, start a MariaDB service if configured.

3. **Access Prontus**

   Once the containers are up and running, you can access Prontus through your web browser:

   ```url
   http://localhost:8080
   ```

   The admin interface is available at:

   ```url
   http://localhost:8080/cgi-bin/admin.cgi
   ```

4. **Stop the Containers**

   To stop and remove the containers, run:

   ```bash
   docker-compose down
   ```

   This command stops the containers and removes the network, but keeps the persistent data intact.

## Customization

### Apache Configuration

- Modify the `prontus.conf` file to customize the Apache server settings. This file is located in the project root and is mounted inside the Docker container.

### Data Persistence

- The `data/` directory is mounted as a volume in the Docker container to ensure that your Prontus data (articles, images, etc.) is preserved across container restarts.

- If using MariaDB, the `mysql_data/` directory is used to persist database data.

## Environment Variables

You can configure the environment variables in the `docker-compose.yml` file:

```yaml
environment:
  - APACHE_RUN_USER=www-data
  - APACHE_RUN_GROUP=www-data
  - APACHE_LOG_DIR=/var/log/apache2
```

Adjust these variables as needed to suit your environment.

## Additional Notes

- **MariaDB Support**: The `docker-compose.yml` includes an optional MariaDB service. This can be used if your Prontus setup requires a database.
- **Volumes**: Ensure that the `data/` and `mysql_data/` directories have appropriate permissions, especially if running Docker on Linux.

## Troubleshooting

- If you encounter issues, check the Docker logs for more information:

  ```bash
  docker-compose logs prontus
  ```

- Ensure that no other services are using port 8080 before starting the containers.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This `README.md` provides all necessary instructions for setting up and running Prontus 11 using Docker and Docker Compose, with sections for customization, troubleshooting, and additional notes.
