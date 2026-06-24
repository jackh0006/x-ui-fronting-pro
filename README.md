<div align="center">

# 🌐 x-ui Fronting Control Panel PRO

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![3x-ui Compatible](https://img.shields.io/badge/3x--ui-Compatible-blue.svg)](https://github.com/MHSanaei/3x-ui)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**Professional HAProxy + SNI Routing Manager for [3x-ui](https://github.com/MHSanaei/3x-ui)**

[Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Donate](#-support-this-project)

</div>

---

## 🎯 What is This?

**x-ui Fronting PRO** is an advanced management panel that extends [3x-ui](https://github.com/MHSanaei/3x-ui) with **multi-domain SNI routing**, **automated SSL management**, and **safe VPS migration tools**.

### 🔥 Key Differences from Vanilla 3x-ui

| Feature | 3x-ui (Stock) | x-ui Fronting PRO |
|---------|---------------|-------------------|
| **Multi-domain routing** | ❌ Manual setup | ✅ Automatic SNI routing |
| **SSL Certificate Management** | ⚠️ Manual | ✅ Auto Let's Encrypt + renewal |
| **Backup/Restore** | ⚠️ Basic | ✅ Full migration with encryption |
| **HAProxy Integration** | ❌ Not included | ✅ Non-destructive merge |
| **Port Flexibility** | ⚠️ Limited | ✅ Any frontend → any backend |
| **VPS Migration** | ❌ Manual/risky | ✅ One-click with validation |
| **Domain Fronting** | ❌ No | ✅ Built-in SNI passthrough |
| **Config Safety** | ⚠️ Can break | ✅ Auto-rollback + backups |

---

## ✨ Features

### 🛡️ **Advanced Routing**
- **SNI-based domain routing** - Route 100+ domains through one IP
- **Any port → any port** - Not limited to 443
- **Non-destructive config** - Preserves existing HAProxy rules
- **Live reload** - Zero-downtime config changes

### 🔐 **SSL Automation**
- **Let's Encrypt integration** - Auto-issue certificates
- **Auto-renewal hooks** - Never expire
- **Multi-domain support** - Manage unlimited certificates
- **Certificate migration** - Move between VPS safely

### 💾 **Enterprise Backup**
- **Full migration backups** - x-ui + HAProxy + certs + state
- **AES-256 encryption** - Optional password protection
- **Integrity validation** - SHA256 manifest checking
- **Atomic restore** - Safe rollback on failure

### 🚀 **Migration Tools**
- **Transfer helper** - Fixed SCP destination path bugs
- **Pre-restore snapshots** - Auto safety backups
- **Cross-VPS migration** - Validated transfer workflow
- **Cert migration assistant** - Guide for Let's Encrypt moves

### 🎨 **User Experience**
- **Orange cloud AI theme** - Beautiful terminal UI
- **Beginner mode help** - Built-in documentation
- **Health monitoring** - System diagnostics
- **Menu-driven** - No command memorization

---

## 🚀 Quick Start

### Prerequisites
- Ubuntu 20.04+ / Debian 10+
- Root access (`sudo -i`)
- Clean VPS or existing 3x-ui installation
- Domain(s) pointed to your VPS IP

### One-Line Install

```bash
bash <(curl -Ls https://raw.githubusercontent.com/jackh0006/x-ui-fronting-pro/main/scripts/x-ui-fronting-pro.sh)
