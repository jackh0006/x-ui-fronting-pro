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
