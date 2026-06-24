<div align="center">

<img src="https://img.shields.io/github/stars/jackh0006/x-ui-fronting-pro?style=for-the-badge&logo=github&color=FF8C00">
<img src="https://img.shields.io/github/forks/jackh0006/x-ui-fronting-pro?style=for-the-badge&logo=github&color=FF8C00">
<img src="https://img.shields.io/github/issues/jackh0006/x-ui-fronting-pro?style=for-the-badge&color=FF8C00">
<img src="https://img.shields.io/github/license/jackh0006/x-ui-fronting-pro?style=for-the-badge&color=FF8C00">
<img src="https://img.shields.io/badge/Shell-Bash-orange?style=for-the-badge&logo=gnu-bash">
<img src="https://img.shields.io/badge/Platform-Linux-orange?style=for-the-badge&logo=linux">

<br/><br/>

<pre>
 __  __       _   _ _   _____ ____   ___  _   _ _____ ___ _   _  ____ 
 \ \/ /      | | | | | |  ___|  _ \ / _ \| \ | |_   _|_ _| \ | |/ ___|
  \  /  ___  | | | | | | |_  | |_) | | | |  \| | | |  | ||  \| | |  _ 
  /  \ |___| | |_| | |_|  _| |  _ <| |_| | |\  | | |  | || |\  | |_| |
 /_/\_\       \___/|___|_|   |_| \_\\___/|_| \_| |_| |___|_| \_|\____|
                          P R O
</pre>

# x-ui Fronting Panel PRO

**The most advanced HAProxy SNI fronting control panel for 3x-ui**

*Menu-driven • Non-destructive • Encrypted Backups • Full Migration Support*

<br/>

[![Install](https://img.shields.io/badge/QUICK_INSTALL-FF8C00?style=for-the-badge)](https://github.com/jackh0006/x-ui-fronting-pro#-quick-install)
[![Docs](https://img.shields.io/badge/DOCUMENTATION-FF8C00?style=for-the-badge)](https://github.com/jackh0006/x-ui-fronting-pro/tree/main/docs)
[![Donate](https://img.shields.io/badge/DONATE_CRYPTO-FF8C00?style=for-the-badge)](https://github.com/jackh0006/x-ui-fronting-pro#-donate--support)

</div>

---

## Table of Contents

- [What is This](#what-is-this)
- [How It Works](#how-it-works)
- [vs 3x-ui Comparison](#vs-3x-ui-comparison)
- [Features](#features)
- [Requirements](#requirements)
- [Quick Install](#quick-install)
- [Menu Overview](#menu-overview)
- [Architecture](#architecture)
- [Use Cases](#use-cases)
- [Documentation](#documentation)
- [FAQ](#faq)
- [Contributing](#contributing)
- [Donate and Support](#donate-and-support)
- [License](#license)

---

## What is This

x-ui Fronting Panel PRO is a powerful menu-driven Bash control panel that sits in front of [3x-ui](https://github.com/MHSanaei/3x-ui) and adds:

- SNI-based TCP routing — multiple domains through a single port 443
- TLS passthrough — traffic is never decrypted at the proxy layer
- Any port to any port custom frontend routing
- Full encrypted backup and restore for complete VPS migration
- Interactive 20-option menu — no command-line expertise needed

Think of it as the smart traffic director that stands in front of your x-ui panel and routes connections based on the domain name inside the TLS handshake without breaking encryption.

---

## How It Works
User connects to yourdomain.com:443
|
v
+-----------------------------+
| HAProxy on Port 443 |
| SNI TCP Passthrough |
| |
| domain1.com --> :10000 |
| domain2.com --> :10001 |
| domain3.com --> :10002 |
+-----------------------------+
|
v
+-----------------------------+
| 127.0.0.1:10000 x-ui #1 |
| 127.0.0.1:10001 x-ui #2 |
| 127.0.0.1:10002 x-ui #3 |
+-----------------------------+

Traffic is NEVER decrypted. Full end-to-end TLS preserved.


1. Client connects to your VPS on port 443
2. HAProxy reads the SNI field in the TLS ClientHello with no decryption needed
3. Traffic is forwarded to the correct backend port on localhost
4. x-ui handles the actual TLS connection
5. Zero performance overhead — pure TCP forwarding

---

## vs 3x-ui Comparison

| Feature | 3x-ui | x-ui Fronting PRO |
|---|---|---|
| Core VPN and proxy panel | YES | NO - complements it |
| Multi-domain on single port | NO | YES |
| HAProxy integration | NO | YES |
| TLS passthrough routing | NO | YES |
| Any port to any port routing | NO | YES |
| Interactive menu UI | NO | YES 20 options |
| Non-destructive config merge | NO | YES |
| Encrypted backup system | NO | YES AES-256 |
| Full VPS migration tool | NO | YES |
| SCP transfer helper | NO | YES |
| Backup manifest validation | NO | YES SHA256 |
| Cert migration assistant | NO | YES |
| Emergency rollback | NO | YES |
| UFW auto-sync | NO | YES |
| Lets Encrypt automation | NO | YES |
| Beginner help center | NO | YES |
| Health monitoring | NO | YES |
| Audit log | NO | YES |
| Open source | YES | YES |

3x-ui is the VPN and proxy engine. x-ui Fronting PRO is the intelligent router in front of it. They work together. This tool makes 3x-ui production-ready with enterprise-grade routing and migration.

---

## Features

**Traffic Routing**
- SNI-based TCP passthrough on port 443
- Custom frontend ports — any port to any port
- Multiple domains to multiple backends
- Non-destructive HAProxy config merge with marked blocks
- Automatic UFW firewall sync

**Backup and Migration**
- Full system backup including x-ui HAProxy certs and letsencrypt
- AES-256-CBC encryption with PBKDF2 key derivation
- SHA256 manifest integrity verification
- One-step restore with automatic pre-restore safety snapshot
- Guided SCP transfer helper with remote mkdir and verification

**Certificate Management**
- Lets Encrypt automation via certbot
- Auto-renewal hooks for HAProxy
- Multi-domain certificate support
- Cert migration assistant
- Combined PEM bundle creation

**Administration**
- 20-option interactive orange menu
- Emergency HAProxy rollback
- Health monitoring covering service port and live TLS probe
- Structured audit log
- Beginner-friendly help center

---

## Requirements

| Component | Minimum | Recommended |
|---|---|---|
| OS | Ubuntu 20.04 or Debian 10 | Ubuntu 22.04 LTS |
| RAM | 512 MB | 1 GB |
| CPU | 1 vCPU | 2 vCPU |
| Disk | 5 GB | 20 GB |
| Root access | Required | Required |
| Domain | 1 with DNS A record | Multiple subdomains |
| Open ports | 80 and 443 | 80 443 and custom ports |

Auto-installed packages: haproxy certbot ufw curl wget openssl rsync sqlite3 nano

---

## Quick Install

```bash
bash <(curl -Ls https://raw.githubusercontent.com/jackh0006/x-ui-fronting-pro/main/install.sh)

Manual install:

git clone https://github.com/jackh0006/x-ui-fronting-pro.git
cd x-ui-fronting-pro
chmod +x xui-fronting-pro.sh
sudo ./xui-fronting-pro.sh

Launch anytime after install:

sudo xui-fronting-pro

Always run as root. The panel requires root to manage HAProxy certificates and firewall.

Menu Overview

+------------------------------------------------------+
|    x-ui Fronting Panel PRO   [status: active]        |
+------------------------------------------------------+
|  1   Install full                                    |
|  2   Uninstall panel blocks                          |
|  3   Re-install                                      |
|  4   Edit HAProxy config                             |
|  5   Renew certificates                              |
|  6   Get certificate for domain                      |
|  7   Cert status                                     |
|  8   Test and health check                           |
|  9   Port manager any frontend port                  |
| 10   DNS guide                                       |
| 11   Status and logs                                 |
| 12   Install x-ui 3x-ui                              |
| 13   Backup x-ui full optional encryption            |
| 14   Restore backup                                  |
| 15   List and delete backups                         |
| 16   Transfer helper scp fix and run                 |
| 17   Validate backup archive and manifest            |
| 18   Cert migration assistant                        |
| 19   Help center beginner mode                       |
| 20   Emergency HAProxy rollback                      |
|  0   Exit                                            |
+------------------------------------------------------+

Option	What it does
1	Installs all packages gets cert seeds port table writes HAProxy config enables UFW
2	Removes only managed config blocks never touches manual sections
3	Uninstall then fresh install
4	Opens editor with auto-validation and auto-revert if config is invalid
5	Stops HAProxy runs certbot renew rebuilds PEM bundles restarts HAProxy
6	Issues a new Lets Encrypt cert for any domain
7	Shows all certbot-managed certificates with expiry dates
8	Checks haproxy service x-ui service ports and makes a live TLS probe
9	Add toggle or delete SNI routing entries with any port combination
10	Shows exactly what DNS A records to create for all domains
11	All service states listening ports last 20 HAProxy log lines
12	Runs the official 3x-ui install command
13	Full system backup archive with optional AES-256 encryption
14	Restores any backup and creates pre-restore safety snapshot first
15	Shows all backups with date and size and allows deletion
16	Generates safe SCP commands and optionally runs the transfer
17	Decrypts if needed tests archive integrity verifies SHA256 manifest
18	Step-by-step guide for moving certificates between VPS servers
19	Beginner-friendly guide with common errors and solutions
20	Instantly reverts HAProxy to the last known-good config

Architecture

+----------------------------------------------------------+
|              HAProxy managed by Fronting PRO             |
|                                                          |
|  frontend xui_in_443 port 443 mode tcp                   |
|  domain1.com  ----------->  backend bk_10000             |
|  domain2.com  ----------->  backend bk_10001             |
|  domain3.com  ----------->  backend bk_10002             |
|                                                          |
|  frontend xui_in_8443 port 8443 mode tcp                 |
|  custom1.com  ----------->  backend bk_10003             |
+----------------------------------------------------------+
                        |
              TCP passthrough no decryption
                        |
                        v
+----------------------------------------------------------+
|               Localhost x-ui Backends                    |
|  127.0.0.1:10000  <--  x-ui inbound 1                   |
|  127.0.0.1:10001  <--  x-ui inbound 2                   |
|  127.0.0.1:10002  <--  x-ui inbound 3                   |
|  127.0.0.1:10003  <--  x-ui inbound 4                   |
+----------------------------------------------------------+

/etc/xui-relay/setup.conf        setup state
/etc/xui-relay/ports.conf        domain and port routing table
/etc/haproxy/haproxy.cfg         HAProxy config
/etc/haproxy/certs/*.pem         cert bundles
/root/x-ui-backups/*.tar.gz      backup archives
/var/log/xui-fronting-panel.log  audit log

Use Cases

Multiple users one server one IP

user1.yourdomain.com:443  -->  127.0.0.1:10001
user2.yourdomain.com:443  -->  127.0.0.1:10002
user3.yourdomain.com:443  -->  127.0.0.1:10003

Each user gets their own domain and x-ui inbound with no port conflicts.

Full VPS migration with zero manual steps

    1-Backup on source VPS — option 13
    2-Transfer to destination — option 16
    3-Restore on destination — option 14
    4-Update DNS A records
    5-Done — everything restored including certs x-ui database and configs

Custom port routing for restricted networks

Port 8443  -->  domain4.com  -->  127.0.0.1:10004
Port 2053  -->  domain5.com  -->  127.0.0.1:10005

Documentation

Document	Description
Installation Guide	Full install walkthrough with DNS setup
Port Manager Guide	Adding editing and routing ports
Backup and Restore	Complete migration and backup guide
Cert Management	Lets Encrypt setup and renewal
DNS Guide	DNS records needed for each domain
Troubleshooting	Common issues and fixes

FAQ

Does this replace 3x-ui?
No. This works alongside 3x-ui. You still install 3x-ui normally. This panel manages HAProxy in front of it.

Does HAProxy decrypt my users traffic?
No. HAProxy runs in TCP mode. It reads only the SNI field from the unencrypted TLS handshake header then forwards the entire encrypted stream untouched.

Will this break my existing HAProxy config?
No. The tool uses clearly marked begin and end comment blocks. Only those regions are ever modified. Everything else in haproxy.cfg is preserved exactly.

What if the config becomes invalid?
Every modification creates a timestamped backup. Option 20 instantly reverts to the last good config. Option 4 also auto-reverts if the edited file fails validation.

Which distributions are supported?
Tested on Ubuntu 20.04, 22.04, Debian 10, Debian 11. Any Debian-based system with systemd should work.
Contributing

Contributions are welcome. Please read CONTRIBUTING.md first.

    Report bugs via Issues
    Suggest features via Issues
    Submit Pull Requests
    Star the repository
    Share with the community

Donate and Support

If this project saves you time please consider supporting its development.
All donations go toward server costs and keeping this project free and open source.

  Bitcoin: bc1q8t0fn2yrsy4lh3m0pz34uj27t8vxjeavkjym83
  DOGE: D6ZdMQ7mHGGmuH9prpZ2zjpnG5Q3WVRDtC
  Ethereum: 0xdad428900a4359be8f76b3062df34211582e09eb
  USDT (ERC20): 0xdad428900a4359be8f76b3062df34211582e09eb
  TRX: TMpb6RNTuGNM1eTakm9kjds1mRTPYYJesf
  USDT (TRC20): TMpb6RNTuGNM1eTakm9kjds1mRTPYYJesf
  BNB: 0xdad428900a4359be8f76b3062df34211582e09eb
  USDT (BEP20): 0xdad428900a4359be8f76b3062df34211582e09eb
  SOL: BDCCrRez1yD1RpkAtiqKKDk3BfxPD8P7nkL26jCYrzgL
  USDT (SPL): BDCCrRez1yD1RpkAtiqKKDk3BfxPD8P7nkL26jCYrzgL
  USDC (SPL): BDCCrRez1yD1RpkAtiqKKDk3BfxPD8P7nkL26jCYrzgL
  XRP: rNUAhaATFLvosdu9m9M95bupRBtZ8eqpj9
  TON: UQCu6-3yGyQ5dzvcCxr2gobuvx5ddbS9EC690qtey92P5_wX
  LTC: ltc1q2gs89cfy3mumr7gu9w0zl9rllf80q67m5rmma8

License

MIT License — see LICENSE for details.
Free to use modify and distribute. No warranty provided.

Acknowledgments

    MHSanaei/3x-ui — the excellent panel this tool fronts
    HAProxy — the world's fastest load balancer
    Lets Encrypt — free TLS certificates for everyone

<div align="center"> Made with Bash and open source spirit. If this project helped you please star it. </div> ```
