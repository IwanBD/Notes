# How to Install Laravel on Linux Mint

This guide will walk you through installing Laravel on Linux Mint. Laravel requires a LAMP stack (Linux, Apache, MySQL, PHP), Composer, and the Laravel installer.

## Prerequisites

- Linux Mint (any recent version)
- Terminal access with sudo privileges
- Internet connection

## Step 1: Update Your System

First, ensure your system is up to date:

```bash
sudo apt update
sudo apt upgrade -y
```

## Step 2: Install LAMP Stack

### Install Apache Web Server

```bash
sudo apt install apache2 -y
```

**Verify Apache installation:**
```bash
sudo systemctl status apache2
```

You can also test by opening `http://localhost` in your browser.

### Install MySQL Database Server

```bash
sudo apt install mysql-server -y
```

**Secure your MySQL installation:**
```bash
sudo mysql_secure_installation
```

Follow the prompts to:
- Set a root password
- Remove anonymous users
- Disallow root login remotely
- Remove test database
- Reload privilege tables

### Install PHP and Required Extensions

```bash
sudo apt install php libapache2-mod-php php-mysql php-xml php-mbstring php-zip php-gd php-curl php-json php-bcmath php-tokenizer -y
```

**Verify PHP installation:**
```bash
php --version
```

**Enable Apache PHP module:**
```bash
sudo a2enmod php8.1  # Adjust version number as needed
sudo systemctl restart apache2
```

## Step 3: Install Composer

Composer is PHP's dependency manager, required for Laravel.

```bash
sudo apt install composer -y
```

**Verify Composer installation:**
```bash
composer --version
```

## Step 4: Install Laravel Installer

Install Laravel installer globally via Composer:

```bash
composer global require laravel/installer
```

### Add Composer's Global Bin to PATH

**For Bash users:**
```bash
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc
```

**For Zsh users:**
```bash
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.zshrc
source ~/.zshrc
```

**Verify Laravel installer:**
```bash
laravel --version
```

## Step 5: Create a New Laravel Project

You have two options to create a Laravel project:

### Option 1: Using Laravel Installer
```bash
laravel new your_project_name
```

### Option 2: Using Composer
```bash
composer create-project --prefer-dist laravel/laravel your_project_name
```

## Step 6: Configure Your Project

### Navigate to Project Directory
```bash
cd your_project_name
```

### Set Proper Permissions
```bash
sudo chown -R $USER:www-data storage
sudo chown -R $USER:www-data bootstrap/cache
chmod -R 775 storage
chmod -R 775 bootstrap/cache
```

### Generate Application Key
```bash
php artisan key:generate
```

## Step 7: Start Development Server

Start Laravel's built-in development server:

```bash
php artisan serve
```

Your Laravel application will be available at: `http://localhost:8000`

## Step 8: Configure Database (Optional)

If you want to use MySQL with your Laravel project:

1. **Create a database:**
```bash
sudo mysql -u root -p
CREATE DATABASE laravel_db;
EXIT;
```

2. **Update `.env` file:**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_db
DB_USERNAME=root
DB_PASSWORD=your_mysql_password
```

3. **Run migrations:**
```bash
php artisan migrate
```

## Troubleshooting

### Common Issues

**1. SQLite Driver Error:**
If you encounter SQLite driver issues, install:
```bash
sudo apt install php-sqlite3
```

**2. Permission Issues:**
Ensure proper ownership and permissions:
```bash
sudo chown -R $USER:www-data /path/to/your/project
chmod -R 755 /path/to/your/project
chmod -R 775 /path/to/your/project/storage
chmod -R 775 /path/to/your/project/bootstrap/cache
```

**3. Apache Virtual Host (For Production):**
Create a virtual host configuration:
```bash
sudo nano /etc/apache2/sites-available/laravel.conf
```

Add:
```apache
<VirtualHost *:80>
    ServerName laravel.local
    DocumentRoot /path/to/your/project/public
    
    <Directory /path/to/your/project/public>
        AllowOverride All
        Require all granted
    </Directory>
    
    ErrorLog ${APACHE_LOG_DIR}/laravel_error.log
    CustomLog ${APACHE_LOG_DIR}/laravel_access.log combined
</VirtualHost>
```

Enable the site:
```bash
sudo a2ensite laravel.conf
sudo a2enmod rewrite
sudo systemctl reload apache2
```

## Next Steps

- Explore Laravel documentation: https://laravel.com/docs
- Learn about Artisan commands: `php artisan list`
- Set up your IDE or text editor with Laravel extensions
- Consider using Laravel Sail for Docker-based development

## Useful Commands

```bash
# View all artisan commands
php artisan list

# Create a controller
php artisan make:controller YourController

# Create a model
php artisan make:model YourModel

# Create a migration
php artisan make:migration create_your_table

# Run migrations
php artisan migrate

# Clear application cache
php artisan cache:clear

# Clear configuration cache
php artisan config:clear
```