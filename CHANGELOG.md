# Changelog

## 1.0.0 - 2024-01-01

### Added

- 20-option interactive menu with orange UI
- SNI-based TCP passthrough routing on port 443
- Custom frontend port to backend port routing for any port
- Non-destructive HAProxy config merge with marked blocks
- Full backup system covering x-ui HAProxy certs and letsencrypt
- AES-256-CBC encrypted backup option with PBKDF2 key derivation
- SHA256 manifest integrity verification
- Full restore with automatic pre-restore safety snapshot
- SCP transfer helper with remote mkdir and file verification
- Backup validation and manifest check tool
- Cert migration assistant with step-by-step guide
- Emergency HAProxy rollback to last known-good config
- UFW auto-sync with enabled frontend ports
- Lets Encrypt automation with HAProxy renewal hooks
- Health monitoring covering service port and live TLS probe
- Structured audit log at /var/log/xui-fronting-panel.log
- Beginner help center with common error solutions
- Port manager with add toggle and delete operations
- DNS guide with per-domain A record instructions
- One-liner installer
