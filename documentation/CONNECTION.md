# Prontus 11 CMS Connection Guide

This guide explains how to connect to and use the Prontus 11 CMS. It covers accessing the public site and the administrative interface, along with troubleshooting tips if you encounter issues.

## Accessing the Public Site

To view the content managed by Prontus 11:

1. **Open your web browser.**
2. **Enter the URL of your Prontus site.** This could be:
   - **Local Development**: `http://localhost:8080`
   - **Live Server**: `http://your-domain.com`

   ```plaintext
   http://localhost:8080
   ```

3. **Navigate through the site** to view articles, images, and other media published by the CMS.

## Accessing the Administrative Interface

To manage content and configure the CMS:

1. **Open your web browser.**
2. **Enter the URL for the admin interface.** This is typically:
   - **Local Development**: `http://localhost:8080/cgi-bin/admin.cgi`
   - **Live Server**: `http://your-domain.com/cgi-bin/admin.cgi`

   ```plaintext
   http://localhost:8080/cgi-bin/admin.cgi
   ```

3. **Log in to the Admin Interface:**
   - **Username**: Enter your administrative username.
   - **Password**: Enter your administrative password.

   **Example Login Form:**

   ```plaintext
   Username: [your-username]
   Password: [your-password]
   ```

4. **Administrative Functions:**
   - **Manage Content**: Add, edit, or delete articles and pages.
   - **Configuration**: Adjust site settings, themes, and preferences.
   - **User Management**: Manage user accounts and permissions.
   - **Media Management**: Upload and organize images, files, and other media.

## Troubleshooting Access Issues

If you encounter problems, consider the following steps:

- **Check Web Server Status**: Ensure that your web server (e.g., Apache) is running and correctly configured.
- **Verify URL and Port**: Make sure you’re using the correct URL and port. For Docker setups, ensure the port mappings are correct.
- **Check Permissions**: Ensure that the `cgi-bin` directory and its scripts have the correct permissions to be executed by the web server.
- **Review Configuration Files**: Check your Apache configuration files (`prontus.conf` or similar) to ensure they allow CGI execution.

## Conclusion

To connect to Prontus 11 CMS, access the public site to view content and use the administrative interface to manage and configure the CMS. Ensure your server is properly configured and check for permissions or configuration issues if you face any problems. For detailed configurations, refer to the relevant documentation and configuration files.