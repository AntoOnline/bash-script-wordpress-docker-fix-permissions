# WordPress Permissions Fix Script

This script can be used to fix the file and directory permissions for multiple running WordPress instances running in Docker containers.

## Prerequisites

To use this script, you will need to have the following installed on your system:

- Docker

## Usage

To use this script, follow these steps:

1. Download the `fix-wordpress-permissions.sh` file to your system.
2. Open the terminal and navigate to the directory where the file is downloaded.
3. Run the following command to make the script executable: `chmod +x fix-wordpress-permissions.sh`
4. Run the script using the following command: `./fix-wordpress-permissions.sh`

The script will automatically detect all running WordPress instances in Docker containers and fix the permissions for each instance. The script will also provide information about the status of each instance being fixed during the process.

## Troubleshooting

If the script is not working as expected, try the following troubleshooting steps:

- Make sure that Docker is installed and running.
- Check that the WordPress containers are running and are based on the official `wordpress` image.
- Make sure that you have the necessary permissions to execute the script.

## Disclaimer

This script is provided as-is and is intended for use at your own risk. Always backup your data before making changes to your file and directory permissions. The author is not responsible for any damage or loss caused by the use of this script.

## Want to connect?

Feel free to contact me on [Twitter](https://twitter.com/OnlineAnto), [DEV Community](https://dev.to/antoonline/) or [LinkedIn](https://www.linkedin.com/in/anto-online) if you have any questions or suggestions.

Or just visit my [website](https://anto.online) to see what I do.
