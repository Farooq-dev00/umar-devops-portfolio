# Linux System Administration & Monitoring

A collection of Bash scripts for common Linux system administration, file management, disk monitoring, and website availability checks.

## Project Overview

This project demonstrates practical Linux administration and Bash scripting skills developed through hands-on DevOps training.

## Scripts

| Script | Purpose |
|---|---|
| `backup_etc.sh` | Backs up Linux configuration files under `/etc`. |
| `check_path_type.sh` | Checks a path and identifies its type. |
| `check_website.sh` | Checks whether a host responds to ping (ICMP). |
| `disk_alert.sh` | Monitors disk usage and reports potential capacity issues. |

## Requirements

- Linux environment or WSL2 with Ubuntu
- Bash shell
- Appropriate permissions for the operation being performed
- Network connectivity for website checks

## Usage

Clone the portfolio repository:

    git clone https://github.com/Farooq-dev00/umar-devops-portfolio.git
    cd umar-devops-portfolio/linux-system-admin-monitoring

Make scripts executable:

    chmod +x backup_etc.sh check_path_type.sh check_website.sh disk_alert.sh

Run a script:

    ./check_path_type.sh

Check each script's contents before running it. Some may require arguments, configuration, or elevated permissions.

## Skills Demonstrated

- Bash scripting
- Linux file and directory management
- System administration
- Disk space monitoring
- Website availability checks
- Backup automation

## Learning Context

Developed through practical DevOps learning and hands-on exercises with Mise Academy.

## Disclaimer

Educational project. Review scripts and test them in a safe environment before using them on production systems.
