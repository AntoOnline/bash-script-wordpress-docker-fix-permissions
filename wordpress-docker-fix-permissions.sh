#!/bin/bash

echo "Getting the container names of running WordPress instances..."

# Get the container names of running WordPress instances
container_names=$(docker ps -aqf "ancestor=wordpress" --format "{{.Names}}")

echo "Found the following WordPress instances:"
echo "$container_names"

# Loop through each container name and fix the WordPress permissions
for container_name in $container_names; do

    echo "Fixing WordPress permissions inside container: $container_name"

    # Set the WordPress root directory inside the container
    wordpress_root="/var/www/html/"

    # Change directory to the WordPress root directory inside the container
    docker exec -it $container_name bash -c "cd $wordpress_root"

    echo "Setting directory permissions..."
    # Set the correct file permissions for directories
    docker exec -it $container_name bash -c "find $wordpress_root -type d -exec chmod 755 {} \;"

    echo "Setting file permissions..."
    # Set the correct file permissions for files
    docker exec -it $container_name bash -c "find $wordpress_root -type f -exec chmod 644 {} \;"

    echo "Setting ownership..."
    # Set the correct ownership for all files and directories
    docker exec -it $container_name bash -c "chown -R www-data:www-data $wordpress_root"

    echo "Setting group permissions..."
    # Set the correct group permissions for wp-content directory and its subdirectories
    docker exec -it $container_name bash -c "chown -R www-data:www-data ${wordpress_root}wp-content"
    docker exec -it $container_name bash -c "find ${wordpress_root}wp-content -type d -exec chmod 775 {} \;"
    docker exec -it $container_name bash -c "find ${wordpress_root}wp-content -type f -exec chmod 664 {} \;"

    echo "Done fixing WordPress permissions inside container: $container_name"

done

echo "All WordPress instances have been fixed."
