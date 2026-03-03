# Prompt: Backup Script for `ubuntu-h7` + Root Restore Plan

## Reference Files To Provide

Give the model these files as context:

1. `/home/kevin/linux-config/scripts/executable_backup-pc`
2. `/home/kevin/linux-config/txt/exclude-dirs-backup.txt.tmpl`
3. `/home/kevin/linux-config/txt/exclude-dirs-backup-full.txt`
4. `/home/kevin/linux-config/README.md` (backup section)
5. `/home/kevin/linux-config/AGENTS.md`

## Prompt To Use

```text
Write a Bash script similar in style to /home/kevin/linux-config/scripts/executable_backup-pc.

Create the new script at:
/home/kevin/linux-config/scripts/executable_backup-ubuntu-h7

Goal:
- Backup root (`/`) as a compressed tar archive to:
  /mnt/linux-files-3/ubuntu-h7/tar
- Backup `/home` with rsync to:
  /mnt/linux-files-3/ubuntu-h7/home
- Include a clear, practical restore procedure for a broken root filesystem.

Requirements:
1) Use `#!/usr/bin/env bash` and `set -euo pipefail`.
2) Support subcommands:
   - `tar-root`   -> create root tarball backup
   - `home`       -> sync `/home` backup
   - `all`        -> run both
   - `restore-help` -> print root restore steps and example commands
3) Use these destinations exactly:
   - ROOT TAR DIR: /mnt/linux-files-3/ubuntu-h7/tar
   - HOME BACKUP DIR: /mnt/linux-files-3/ubuntu-h7/home
4) Use exclude lists from this repo:
   - root tar excludes: /home/kevin/txt/exclude-dirs-backup.txt
   - home/full excludes: /home/kevin/txt/exclude-dirs-backup-full.txt
5) Root tar backup should preserve metadata as much as possible (permissions, owners, ACL/xattrs when available).
6) Validate destination directories exist and fail with a useful error if not mounted.
7) Print the generated tar file path on success.
8) Keep the script small, readable, and close to existing conventions.

Restore requirements (`restore-help` output):
- Assume booting from a live USB.
- Show steps to:
  1. Mount target root partition (and EFI/boot partition if needed).
  2. Extract the tarball to the mounted root.
  3. Bind mount /dev, /proc, /sys, /run.
  4. Chroot into restored system.
  5. Reinstall GRUB and regenerate initramfs and grub config.
  6. Unmount and reboot.
- Include placeholder device names (e.g. /dev/nvme0n1p2) and a note to verify with lsblk.

Output format:
- First: final script content only.
- Then: a short "How to use" block with example commands.
- Then: a short "Restore root if broken" block with exact commands.
```
