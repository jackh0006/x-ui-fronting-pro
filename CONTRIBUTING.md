# Contributing to x-ui Fronting Panel PRO

Thank you for your interest in contributing.

## Reporting Bugs

1. Check existing issues first
2. Use the Bug Report template
3. Include your OS version error output and steps to reproduce

## Feature Requests

1. Use the Feature Request template
2. Explain the use case clearly

## Pull Requests

1. Fork the repository
2. Create a branch: git checkout -b feature/your-feature
3. Run ShellCheck: shellcheck xui-fronting-pro.sh
4. Test on Ubuntu 22.04
5. Submit PR with a clear description

## Coding Style

- Use set -Eeo pipefail
- All functions use snake_case
- Use provided helpers: ok warn fail title line
- Add comments for complex logic
- Never break existing configs — non-destructive principle always

## Testing Checklist

- shellcheck passes with no errors
- Install flow completes without errors
- HAProxy merge is non-destructive
- Backup and restore round-trip works
- All 20 menu options are functional
