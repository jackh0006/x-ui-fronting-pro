# Certificate Management Guide

## Getting a Certificate

1. Make sure DNS A record points to your VPS IP
2. Select option 6 — Get certificate for domain
3. Enter domain name and email address
4. Certificate is issued and PEM bundle is created automatically

## Renewal

Select option 5 — Renew certificates.

The panel:
1. Stops HAProxy temporarily
2. Runs certbot renew
3. Rebuilds PEM bundles
4. Restarts HAProxy

Automatic renewal hooks are installed at:
/etc/letsencrypt/renewal-hooks/deploy/haproxy.sh

## Certificate Status

Select option 7 to see all certificates with expiry dates.

## PEM Bundle Location

/etc/haproxy/certs/yourdomain.com.pem

This file contains fullchain and privkey combined as required by HAProxy.

## Migrating Certificates

Use option 18 for a step-by-step migration guide.

Key directories included in every backup:
- /etc/letsencrypt
- /var/lib/letsencrypt
- /etc/haproxy/certs
