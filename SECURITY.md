# Security Policy

## Supported Versions

| Version | Supported |
|---|---|
| 1.x latest | YES |

## Reporting a Vulnerability

Do NOT open a public issue for security vulnerabilities.

Report privately via GitHub Security Advisories:
https://github.com/jackh0006/x-ui-fronting-pro/security/advisories/new

You will receive a response within 48 hours.

## Security Practices

- Backup encryption uses AES-256-CBC with PBKDF2 at 200000 iterations
- All state files are chmod 600
- No telemetry or data collection of any kind
- Private keys never leave the server unencrypted unless explicitly requested by the user
