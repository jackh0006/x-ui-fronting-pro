# DNS Guide

## What Records to Create

For every domain in the port manager create an A record:

Type:  A
Name:  yourdomain.com
Value: YOUR_VPS_IP
TTL:   300

## Using the Built-in DNS Guide

Select option 10 from the main menu.
It shows the exact records needed for all your configured domains.

## Verifying DNS

```bash
dig +short yourdomain.com
nslookup yourdomain.com

Both should return your VPS IP.
Propagation Time

DNS changes typically propagate in 5 to 30 minutes.
Some providers may take up to 24 hours.
Common DNS Providers
Provider	Where to add records
Cloudflare	DNS then Add record
Namecheap	Advanced DNS then Add new record
GoDaddy	DNS Management then Add
Google Domains	DNS then Manage custom records

Cloudflare Note


---

# FILE 20: docs/troubleshooting.md

```markdown
# Troubleshooting Guide

## scp destination failure

Error: scp: dest open .../x-ui-backups/: Failure

Fix: Create the directory first then transfer with explicit filename:

```bash
ssh root@TARGET 'mkdir -p /root/x-ui-backups'
scp yourfile.tar.gz.enc root@TARGET:/root/x-ui-backups/yourfile.tar.gz.enc

HAProxy not starting

haproxy -c -f /etc/haproxy/haproxy.cfg

Use option 4 to edit and fix the config.
Use option 20 for emergency rollback to last known-good config.

Certificate renewal fails

certbot renew --dry-run

If dry-run fails issue a fresh certificate with option 6.
Domain not routing correctly

    1-Verify DNS: dig +short yourdomain.com should return your VPS IP
    2-Check port table with option 9
    3-Check x-ui is listening: ss -tlnp | grep BACKEND_PORT
    4-Run health check with option 8

x-ui not accessible after restore

systemctl status x-ui
journalctl -u x-ui -n 50
systemctl daemon-reload
systemctl enable x-ui
systemctl start x-ui

UFW blocking connections

ufw allow 443/tcp
ufw allow YOUR_FRONTEND_PORT/tcp
ufw reload

Option 8 also auto-syncs UFW with all enabled frontend ports.

Log Files

Log	Command
Panel audit log	tail -f /var/log/xui-fronting-panel.log
HAProxy logs	journalctl -u haproxy -f
x-ui logs	journalctl -u x-ui -f
certbot logs	cat /var/log/letsencrypt/letsencrypt.log


---

# FILE 21: jackh0006/README.md (Profile README - create repo named jackh0006)

```markdown
### Hi I am jackh0006

Creator of x-ui Fronting Panel PRO

https://github.com/jackh0006/x-ui-fronting-pro

The most advanced HAProxy SNI fronting control panel for 3x-ui.
Multi-domain routing on a single port with encrypted backup and full VPS migration.

- Open source developer
- Privacy and networking tools
- Bash Linux HAProxy Network security

Star my repos to support the work.
Donate with crypto: https://github.com/jackh0006/x-ui-fronting-pro#donate-and-support

Set the record to DNS only with the grey cloud icon.
Do not proxy through Cloudflare. SNI passthrough requires a direct connection.
