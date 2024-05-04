FROM debian:bullseye

# Update package lists and install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# #Remove default Nginx configuration
RUN rm -rf /etc/nginx/nginx.conf

# #Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/
COPY ssl /etc/nginx/ssl/

# Expose port 80 and 443
EXPOSE 443

# Command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
