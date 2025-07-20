# NGINX Complete Guide

NGINX is a high-performance web server that serves web content to clients, similar to Apache. It's also commonly used as a reverse proxy, load balancer, and HTTP cache.

## Installation

### Ubuntu/Debian
```bash
sudo apt update
sudo apt install nginx
```

### CentOS/RHEL
```bash
sudo yum install nginx
# or for newer versions
sudo dnf install nginx
```

### Basic Commands
```bash
# Check version
nginx -v

# Start NGINX
sudo systemctl start nginx

# Stop NGINX
sudo systemctl stop nginx

# Restart NGINX
sudo systemctl restart nginx

# Reload configuration (recommended for config changes)
sudo nginx -s reload

# Test configuration syntax
sudo nginx -t

# Check status
sudo systemctl status nginx
```

## Important File Locations

- **Main configuration:** `/etc/nginx/nginx.conf`
- **Site configurations:** `/etc/nginx/sites-available/` and `/etc/nginx/sites-enabled/`
- **Log files:** `/var/log/nginx/`
- **Default web root:** `/var/www/html/`

## Configuration Terminology

NGINX configuration uses a hierarchical structure with specific syntax rules:

### Blocks
Curly braces `{}` encapsulate configuration blocks:
```nginx
events {
    worker_connections 768;
    # multi_accept on;
}
```

### Directives
Semicolon-terminated lines are directives that configure specific behaviors:
```nginx
worker_connections 768;
listen 80;
server_name example.com;
```

### Context Hierarchy
```nginx
# Global context
user www-data;
worker_processes auto;

# Events context
events {
    worker_connections 1024;
}

# HTTP context
http {
    include mime.types;
    
    # Server context
    server {
        listen 80;
        server_name example.com;
        
        # Location context
        location / {
            root /var/www/html;
        }
    }
}
```

## Serving Static Content

### Basic Static Site Configuration
```nginx
user www-data;  # Important: Set appropriate user

events {}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    
    server {
        listen 80;
        server_name your-domain.com;
        root /var/www/html;
        index index.html index.htm;
        
        location / {
            try_files $uri $uri/ =404;
        }
        
        # Optional: Serve static files efficiently
        location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg)$ {
            expires 1y;
            add_header Cache-Control "public, immutable";
        }
    }
}
```

### Testing Your Configuration
```bash
# Always test before reloading
sudo nginx -t

# If test passes, reload
sudo nginx -s reload
```

## MIME Types

MIME types tell browsers how to handle different file types. Without proper MIME types, CSS files might be served as plain text.

### Method 1: Include Default MIME Types (Recommended)
```nginx
http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    
    server {
        # your server config
    }
}
```

### Method 2: Define Custom MIME Types
```nginx
http {
    types {
        text/html           html htm;
        text/css            css;
        application/javascript  js;
        image/png           png;
        image/jpeg          jpg jpeg;
        image/gif           gif;
        application/pdf     pdf;
    }
    
    server {
        # your server config
    }
}
```

## Location Blocks

Location blocks define how NGINX handles requests for different URIs.

### Basic Location Types
```nginx
server {
    root /var/www/html;
    
    # Exact match
    location = /exact-page {
        # Only matches /exact-page
    }
    
    # Prefix match
    location /api {
        # Matches /api, /api/users, /api/data, etc.
    }
    
    # Regular expression (case-sensitive)
    location ~ \.(css|js)$ {
        # Matches files ending in .css or .js
        expires 1y;
    }
    
    # Regular expression (case-insensitive)
    location ~* \.(jpg|jpeg|png|gif)$ {
        # Matches image files (any case)
        expires 30d;
    }
}
```

### Root vs Alias

#### Using Root (appends location to root path)
```nginx
server {
    root /var/www/html;
    
    location /images {
        root /var/www/html;
        # Request for /images/photo.jpg looks in:
        # /var/www/html/images/photo.jpg
    }
}
```

#### Using Alias (replaces location with alias path)
```nginx
server {
    root /var/www/html;
    
    location /images {
        alias /var/www/media/photos;
        # Request for /images/photo.jpg looks in:
        # /var/www/media/photos/photo.jpg
    }
}
```

### Try Files Directive
```nginx
location / {
    try_files $uri $uri/ @fallback;
}

location @fallback {
    # Named location for fallback handling
    return 404;
}

# Common pattern for SPAs
location / {
    try_files $uri $uri/ /index.html;
}
```

## Redirects and Rewrites

### Redirects
```nginx
server {
    # Permanent redirect (301)
    location /old-page {
        return 301 /new-page;
    }
    
    # Temporary redirect (302)
    location /temp-redirect {
        return 302 /temporary-page;
    }
    
    # Redirect with domain change
    location /external {
        return 301 https://external-site.com$request_uri;
    }
}
```

### Rewrites
```nginx
server {
    # Internal rewrite (invisible to client)
    rewrite ^/old-path/(.*)$ /new-path/$1 last;
    
    # Rewrite with redirect
    rewrite ^/category/(.*)$ /products/$1 redirect;
    
    # Complex rewrite example
    rewrite ^/user/(\w+)$ /profile.php?user=$1 last;
}
```

### Common Redirect Patterns
```nginx
# Force HTTPS
server {
    listen 80;
    server_name example.com;
    return 301 https://$server_name$request_uri;
}

# Redirect www to non-www
server {
    listen 80;
    server_name www.example.com;
    return 301 http://example.com$request_uri;
}
```

## Load Balancing

NGINX can distribute incoming requests across multiple backend servers.

### Basic Load Balancer Setup
```nginx
http {
    # Define upstream server group
    upstream backend_servers {
        server 192.168.1.10:8080;
        server 192.168.1.11:8080;
        server 192.168.1.12:8080;
    }
    
    server {
        listen 80;
        
        location / {
            proxy_pass http://backend_servers;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
}
```

### Load Balancing Methods

#### Round Robin (Default)
Requests are distributed evenly across servers in order:
```nginx
upstream backend {
    server server1.example.com;
    server server2.example.com;
    server server3.example.com;
}
```

#### Least Connections
Routes to server with fewest active connections:
```nginx
upstream backend {
    least_conn;
    server server1.example.com;
    server server2.example.com;
    server server3.example.com;
}
```

#### IP Hash
Routes based on client IP (ensures session persistence):
```nginx
upstream backend {
    ip_hash;
    server server1.example.com;
    server server2.example.com;
    server server3.example.com;
}
```

#### Weighted Distribution
Distribute more traffic to more powerful servers:
```nginx
upstream backend {
    server server1.example.com weight=3;
    server server2.example.com weight=2;
    server server3.example.com weight=1;
}
```

### Health Checks and Failover
```nginx
upstream backend {
    server server1.example.com max_fails=3 fail_timeout=30s;
    server server2.example.com max_fails=3 fail_timeout=30s;
    server server3.example.com backup;  # Only used if others fail
}
```

## Security Best Practices

### Hide NGINX Version
```nginx
http {
    server_tokens off;
}
```

### Rate Limiting
```nginx
http {
    limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;
    
    server {
        location / {
            limit_req zone=one burst=5 nodelay;
        }
    }
}
```

### SSL/TLS Configuration
```nginx
server {
    listen 443 ssl http2;
    server_name example.com;
    
    ssl_certificate /path/to/certificate.crt;
    ssl_certificate_key /path/to/private.key;
    
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    
    add_header Strict-Transport-Security "max-age=31536000" always;
}
```

## Troubleshooting

### Common Issues
- **403 Forbidden**: Check file permissions and user directive
- **502 Bad Gateway**: Backend server is down or unreachable
- **504 Gateway Timeout**: Backend server is responding too slowly

### Useful Commands
```bash
# Check error logs
sudo tail -f /var/log/nginx/error.log

# Check access logs
sudo tail -f /var/log/nginx/access.log

# Test configuration
sudo nginx -t

# Check which user NGINX is running as
ps aux | grep nginx
```

### Debug Configuration
```nginx
# Add to server block for debugging
error_log /var/log/nginx/debug.log debug;
```

## Performance Optimization

### Worker Configuration
```nginx
user www-data;
worker_processes auto;  # or number of CPU cores
worker_connections 1024;
```

### Gzip Compression
```nginx
http {
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
}
```

### Caching
```nginx
location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

This guide covers the essential NGINX concepts and configurations. For production environments, always test configurations thoroughly and consider security implications.