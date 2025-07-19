# Users and Groups in Linux

Linux allows many users to access the same machine at the same time through multi-user capabilities.

## User Management

### Add a new user
This will create a new user, a new primary group (with the same name as the user), create a home directory in `/home/username`, and set up initial configuration files.

```bash
sudo adduser name_of_user
```

**Alternative command (more basic):**
```bash
sudo useradd name_of_user
```

**Note:** `adduser` is more user-friendly and interactive, while `useradd` is more basic and requires additional flags for full setup.

### Switch to another user
You can switch to another user without logging out completely:

```bash
su - name_of_user        # Switch user with full login environment
su name_of_user          # Switch user keeping current environment
sudo -u name_of_user -i  # Switch using sudo with login shell
```

### Sign in as a user
To completely log out and log back in:
```bash
logout                   # Or exit, or Ctrl+D
```
Then log in with the right credentials at the login prompt.

### Delete user
```bash
sudo deluser name_of_user                    # Delete user only
sudo deluser --remove-home name_of_user      # Delete user and home directory
sudo deluser --remove-all-files name_of_user # Delete user and all files
```

**Alternative command:**
```bash
sudo userdel name_of_user              # Delete user only
sudo userdel -r name_of_user          # Delete user and home directory
```

### Change user's password
```bash
sudo passwd name_of_user    # Change another user's password (requires sudo)
passwd                      # Change your own password
```

### View user information
```bash
id name_of_user            # Show user ID, group ID, and groups
whoami                     # Show current user
who                        # Show logged in users
w                          # Show logged in users with activity
```

## Group Management

A group is a set of users having the same permissions. Groups simplify permission management by allowing you to assign permissions to multiple users at once.

**Group types:**
- **Primary group**: Each user has exactly one primary group (usually the same name as the username)
- **Secondary groups**: A user can belong to up to 15 additional secondary groups

### Create a group
```bash
sudo addgroup name_of_group
```

**Alternative command:**
```bash
sudo groupadd name_of_group
```

### Add a user to a group (secondary group)
```bash
sudo usermod -a -G name_of_group name_of_user
```

**Important:** The `-a` flag appends the group to the user's existing groups. Without it, the user would be removed from all other secondary groups.

**Add user to multiple groups:**
```bash
sudo usermod -a -G group1,group2,group3 name_of_user
```

### List groups assigned to a user
```bash
groups name_of_user         # Show groups for specific user
groups                      # Show groups for current user
id name_of_user            # More detailed information including UIDs and GIDs
```

### Remove a user from a group
```bash
sudo gpasswd -d name_of_user name_of_group
```

**Alternative method:**
```bash
sudo deluser name_of_user name_of_group
```

### Change user's primary group
```bash
sudo usermod -g new_primary_group name_of_user
```

### Delete a group
```bash
sudo delgroup name_of_group
```

**Alternative command:**
```bash
sudo groupdel name_of_group
```

**Note:** You cannot delete a group if it's the primary group of any user.

## Important System Files

### `/etc/passwd`
Contains user account information:
```
username:x:UID:GID:full_name:home_directory:shell
```

### `/etc/group`
Contains group information:
```
group_name:x:GID:user_list
```

### `/etc/shadow`
Contains encrypted passwords and password aging information (readable only by root).

## Common Administrative Tasks

### View all users
```bash
cat /etc/passwd | cut -d: -f1    # List all usernames
getent passwd                    # List all users (including from other sources)
```

### View all groups
```bash
cat /etc/group | cut -d: -f1     # List all group names
getent group                     # List all groups
```

### Lock/unlock user accounts
```bash
sudo passwd -l name_of_user      # Lock user account
sudo passwd -u name_of_user      # Unlock user account
```

### Set user account expiration
```bash
sudo chage -E YYYY-MM-DD name_of_user    # Set expiration date
sudo chage -E -1 name_of_user            # Remove expiration
```

### Modify user information
```bash
sudo usermod -c "Full Name" name_of_user       # Change full name
sudo usermod -d /new/home/path name_of_user    # Change home directory
sudo usermod -s /bin/bash name_of_user         # Change shell
```

## Best Practices

1. **Use descriptive group names** that reflect their purpose (e.g., `developers`, `admins`, `sales`)
2. **Regular cleanup** of unused user accounts and groups
3. **Use sudo** for administrative tasks instead of switching to root
4. **Set strong password policies** using `passwd` command options
5. **Monitor user activity** regularly using `last`, `who`, and log files
6. **Use groups effectively** to manage permissions rather than individual user permissions