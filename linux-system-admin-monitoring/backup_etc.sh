#!/bin/bash
set -euo pipefail

BACKUP_DIR="/backup"
FILENAME="etc-backup-$(date +%F).tar.gz"
BACKUP_PATH="${BACKUP_DIR}/${FILENAME}"

if ! mkdir -p "$BACKUP_DIR"; then
    echo "ERROR: Cannot create backup directory: $BACKUP_DIR" >&2
    exit 1
fi

if tar -czf "$BACKUP_PATH" /etc; then
    echo "Backup completed successfully: $BACKUP_PATH"
else
    echo "ERROR: Backup failed." >&2
    exit 1
fi
