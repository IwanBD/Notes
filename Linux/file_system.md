# Linux File System/Structure (Explained)

**FHS: File Hierarchy Standard** → files are different if they have difference between used characters

## Core System Directories

- **bin (binaries)**: Used for essential programs or applications built with the system, like `ls`, `cat` and other basic functions that are needed for system operation

- **sbin (system binaries)**: Also binaries but special for system administrator. Thus regular users won't have access to these system administration tools

- **boot**: Boot files needed for the OS to boot, including the kernel, initrd, and bootloader configuration

- **dev (devices)**: Where device files live. For example, the hard drive is placed there and has the name `sda`. The partitions of the hard drive will be `sda1`, `sda2`, etc. It is also where drivers, camera, keyboard and other hardware components are represented as device files

## Configuration and Libraries

- **etc (et cetera)**: This folder contains system-wide configuration files for both system applications (like apt) and user applications. Historically meant "editable text configuration"

- **lib, lib32 and lib64 (libraries)**: Shared libraries used by programs in `bin` and `sbin`. The 32/64 variants support different architectures on the same system (similar to DLLs on Windows)

## Mount Points and External Storage

- **media**: Mount point for automatically mounted removable devices (USB drives, CDs, DVDs)
- **mnt**: Mount point for manually mounted filesystems and temporary mounts

## Optional and User Software

- **opt (optional)**: Manually installed software from vendors or created by you. Applications like `VirtualBox`, `VPN` clients have their place here

- **usr (Unix System Resources)**: User-accessible programs and data (not "user" as commonly thought). Contains its own hierarchy with subdirectories like `usr/bin`, `usr/lib`, `usr/share`, etc.

## Virtual and Temporary Filesystems

- **proc (process)**: Virtual filesystem where running processes and kernel information are stored. Doesn't actually store files on disk - provides real-time interface to kernel data

- **run**: Temporary filesystem used to keep running programs' runtime data in RAM

- **sys (system)**: Virtual filesystem containing files to interact with the kernel. Also temporary and provides interface to kernel subsystems

- **tmp (temporary)**: Contains temporary files created while running software. May be cleared on reboot

## User and Variable Data

- **root**: Root user's home directory

- **home**: Directory containing user home directories, typically structured as `/home/username`

- **var (variables)**: Contains files that are expected to grow in size and change during normal operation, like logs (`/var/log`), mail spools (`/var/mail`), package databases, printer queues, and temporary files that persist across reboots

## Package Managers and Services

- **snap / flatpak**: Package manager directories for containerized applications

- **srv (services)**: Directory for data served by web servers, FTP servers, or other services

---

**Note**: The FHS provides this standardized structure so that users, administrators, and software developers know where to find and place files across different Linux distributions. This consistency is one of the key strengths of Unix-like systems.