# Installation Guide

## Prerequisites

- VPS running Ubuntu 20.04 or Debian 10 or newer
- Root access
- Domain name with DNS A record pointing to your VPS IP
- Ports 80 and 443 open in your firewall

## DNS Setup

Create an A record in your DNS panel:

Type:  A
Name:  yourdomain.com
Value: YOUR_VPS_IP
TTL:   300

Verify propagation:

```bash
dig +short yourdomain.com

Should return your VPS IP.

Install Command

bash <(curl -Ls https://raw.githubusercontent.com/jackh0006/x-ui-fronting-pro/main/install.sh)

First Run Walkthrough

    1-Select option 1 — Install full
    2-Enter your primary domain
    3-Enter your VPS public IP
    4-Enter your email for Lets Encrypt
    5-Confirm DNS is propagated
    6-Wait for automatic install to complete

After Install

    1-Install 3x-ui via option 12
    2-Set x-ui inbounds to listen on 127.0.0.1 with your chosen backend port
    3-Add your domains via option 9 Port Manager
    4-Verify everything with option 8 Health test

File Locations After Install
File	Purpose
/etc/xui-relay/setup.conf	Panel setup state
/etc/xui-relay/ports.conf	Domain and port routing table
/etc/haproxy/haproxy.cfg	HAProxy configuration
/etc/haproxy/certs/	Certificate PEM bundles
/root/x-ui-backups/	Backup archives
/var/log/xui-fronting-panel.log	Audit log


---

# FILE 16: docs/backup-restore.md

```markdown
# Backup and Restore Guide

## Creating a Backup

1. Select option 13 from the main menu
2. Choose whether to encrypt — strongly recommended for production
3. If encrypting enter and confirm a strong password
4. Note the backup filename shown at the end

## What Gets Backed Up

| Item | Path |
|---|---|
| x-ui database | /etc/x-ui/x-ui.db |
| x-ui config | /etc/x-ui/ |
| x-ui binary | /usr/local/x-ui/ and /usr/bin/x-ui |
| x-ui service | /etc/systemd/system/x-ui.service |
| Panel state | /etc/xui-relay/ |
| HAProxy config | /etc/haproxy/haproxy.cfg |
| Certificates | /etc/haproxy/certs/ |
| Lets Encrypt | /etc/letsencrypt/ and /var/lib/letsencrypt/ |

## Transferring to Another VPS

Use option 16 Transfer Helper. It creates the remote directory transfers the file and verifies receipt automatically.

Manual method:

```bash
ssh root@DEST_IP 'mkdir -p /root/x-ui-backups'
scp /root/x-ui-backups/FILENAME root@DEST_IP:/root/x-ui-backups/FILENAME
ssh root@DEST_IP 'ls -lh /root/x-ui-backups/'


Always specify the full filename at the destination. Never use just the directory path.
Restoring a Backup

    Select option 14
    Choose the backup number from the list
    Enter decryption password if the backup is encrypted
    Confirm the restore
    A pre-restore safety snapshot is created automatically before anything is overwritten
    Services restart automatically after restore completes

Validating a Backup

Use option 17 to test archive integrity and verify the SHA256 manifest of all files inside.
Encryption Details

Algorithm: AES-256-CBC
Key derivation: PBKDF2 with 200000 iterations
Salt: random per encryption
File extension: .tar.gz.enc


---

# FILE 17: docs/port-manager.md

```markdown
# Port Manager Guide

## Overview

The port manager handles all SNI routing entries.
Each entry maps a frontend port and domain to a backend port on localhost.

## Accessing Port Manager

Select option 9 from the main menu.

## Adding an Entry

Select a in the port manager then:

1. Enter the domain name example: sub.yourdomain.com
2. Enter the frontend port — default is 443
3. Enter the backend port — leave blank for auto-assignment

The entry is saved and HAProxy is updated immediately.

## Port Table Example

FRONTEND DOMAIN BACKEND STATE

1 443 h1.example.com 127.0.0.1:10000 enabled
2 443 h2.example.com 127.0.0.1:10001 enabled
3 8443 h3.example.com 127.0.0.1:10002 enabled


## Toggling an Entry

Select t then enter the row number.
Disabled entries are removed from HAProxy config but kept in the table.

## Deleting an Entry

Select d then enter the row number.
The entry is permanently removed and HAProxy is updated immediately.

## Important Rules

- Backend port must differ from frontend port
- Each backend port must be unique
- x-ui inbounds must listen on 127.0.0.1 with matching backend port
- Never expose backend ports publicly
