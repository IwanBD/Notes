# Files and Directories Permissions

## Check permissions of a file
```bash
ls -l
```

Example output:
```
-rw-r--r-- 1 user group 1024 Jan 15 10:30 file.txt
drwxr-xr-x 2 user group 4096 Jan 15 10:30 directory
```

## Structure

The permission string consists of 10 characters: `drwxrwxrwx`

**Position 1: Object type**
- `d` → Directory
- `-` → Regular file
- `l` → Symbolic link
- `c` → Character device
- `b` → Block device
- `p` → Named pipe (FIFO)
- `s` → Socket

**Positions 2-4: Owner (user) permissions**
- `r` → Read permission
- `w` → Write permission
- `x` → Execute permission (for files) / Navigate permission (for directories)

**Positions 5-7: Group permissions**
- `r` → Read permission
- `w` → Write permission
- `x` → Execute permission (for files) / Navigate permission (for directories)

**Positions 8-10: Others permissions (everyone else)**
- `r` → Read permission
- `w` → Write permission
- `x` → Execute permission (for files) / Navigate permission (for directories)

## Change File Permissions

### Symbolic notation (simple changes)
```bash
chmod [u|g|o|a][+|-|=][r|w|x] file_name
```

**Who:**
- `u` → User (owner)
- `g` → Group
- `o` → Others
- `a` → All (user, group, and others)

**Operation:**
- `+` → Add permission
- `-` → Remove permission
- `=` → Set exact permission

**Examples:**
```bash
chmod u+x file.txt          # Add execute permission for owner
chmod g-w file.txt          # Remove write permission for group
chmod o=r file.txt          # Set others to read-only
chmod a+r file.txt          # Add read permission for all
chmod u+rw,g+r,o-rwx file.txt  # Multiple permissions
```

### Numerical (octal) notation
Each permission has a numerical value:
- `r` → 4
- `w` → 2
- `x` → 1

**Permission calculation:**
- `rwx` = 4 + 2 + 1 = 7
- `rw-` = 4 + 2 + 0 = 6
- `r-x` = 4 + 0 + 1 = 5
- `r--` = 4 + 0 + 0 = 4
- `-wx` = 0 + 2 + 1 = 3
- `-w-` = 0 + 2 + 0 = 2
- `--x` = 0 + 0 + 1 = 1
- `---` = 0 + 0 + 0 = 0

```bash
chmod XuXgXo file_name
```

**Common permission combinations:**
```bash
chmod 755 file.txt    # rwxr-xr-x (owner: rwx, group: r-x, others: r-x)
chmod 644 file.txt    # rw-r--r-- (owner: rw-, group: r--, others: r--)
chmod 600 file.txt    # rw------- (owner: rw-, group: ---, others: ---)
chmod 777 file.txt    # rwxrwxrwx (full permissions for all)
chmod 000 file.txt    # --------- (no permissions for anyone)
```

## Change Object Ownership

```bash
sudo chown [-R] user_name[:group_name] file_or_directory
```

**Options:**
- `-R` → Recursive (apply to all files and subdirectories)

**Examples:**
```bash
sudo chown john file.txt                    # Change owner to john
sudo chown john:developers file.txt         # Change owner to john and group to developers
sudo chown :developers file.txt             # Change only group to developers
sudo chown -R john:developers /home/project # Recursively change ownership
```

## Change Group Ownership Only

```bash
sudo chgrp [-R] group_name file_or_directory
```

**Examples:**
```bash
sudo chgrp developers file.txt        # Change group to developers
sudo chgrp -R developers /home/project # Recursively change group
```

## Special Permissions

### Setuid (4000)
- When set on executable files, the file runs with the owner's permissions instead of the executor's permissions
- Shown as `s` in the owner's execute position

### Setgid (2000)
- When set on executable files, the file runs with the group's permissions
- When set on directories, new files inherit the directory's group
- Shown as `s` in the group's execute position

### Sticky bit (1000)
- When set on directories, only the file owner can delete files within that directory
- Shown as `t` in the others' execute position
- Common on `/tmp` directory

**Examples:**
```bash
chmod 4755 file.txt    # Set setuid bit
chmod 2755 directory   # Set setgid bit
chmod 1755 directory   # Set sticky bit
chmod 6755 file.txt    # Set both setuid and setgid
```

## Quick Reference

| Permission | Octal | Binary | Meaning |
|------------|-------|---------|---------|
| --- | 0 | 000 | No permissions |
| --x | 1 | 001 | Execute only |
| -w- | 2 | 010 | Write only |
| -wx | 3 | 011 | Write and execute |
| r-- | 4 | 100 | Read only |
| r-x | 5 | 101 | Read and execute |
| rw- | 6 | 110 | Read and write |
| rwx | 7 | 111 | Read, write, and execute |