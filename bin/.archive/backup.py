#!/bin/python3

import datetime
import os
import pathlib
import sys

RSYNC_CMD = '''
rsync -av --delete \
  "${SOURCE_DIR}/" \
  --link-dest "${LATEST_LINK}" \
  --exclude=".cache" \
  "${BACKUP_PATH}"
'''

def backup(src, dest):
    if not pathlib.Path(src).exists():
        print(f"Source directory {src} does not exist")
        sys.exit(1)
    if not pathlib.Path(dest).exists():
        print(f"Destination directory {dest} does not exist, creating it")
        pathlib.Path(dest).mkdir(parents=True, exist_ok=True)

    # utc local time
    date_str = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    dest_date = f"{dest}/{date_str}"
    latest_link = f"{dest}/latest"
    rsync_cmd = (
        RSYNC_CMD.replace("${SOURCE_DIR}", str(src))
        .replace("${LATEST_LINK}", str(latest_link))
        .replace("${BACKUP_PATH}", str(dest_date))
    )
    os.system(rsync_cmd)

    pathlib.Path(latest_link).unlink(missing_ok=True)
    pathlib.Path(latest_link).symlink_to(dest_date)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: backup.py <source_dir> <dest_dir>")
        sys.exit(1)
    backup(sys.argv[1], sys.argv[2])
