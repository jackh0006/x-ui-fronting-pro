#!/usr/bin/env bash
set -Eeo pipefail

REPO="jackh0006/x-ui-fronting-pro"
BRANCH="main"
SCRIPT_NAME="xui-fronting-pro.sh"
INSTALL_PATH="/usr/local/bin/xui-fronting-pro"
RAW_BASE="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

C_ORANGE=$'\033[38;5;208m'
C_GREEN=$'\033[38;5;121m'
C_RED=$'\033[38;5;203m'
C_BOLD=$'\033[1m'
Z=$'\033[0m'

banner() {
cat << 'BANNER'

  __  __       _   _ _   _____ ____   ___  _   _ _____ ___ _   _  ____
  \ \/ /      | | | | | |  ___|  _ \ / _ \| \ | |_   _|_ _| \ | |/ ___|
   \  /  ___  | | | | | | |_  | |_) | | | |  \| | | |  | ||  \| | |  _
   /  \ |___| | |_| | |_|  _| |  _ <| |_| | |\  | | |  | || |\  | |_| |
  /_/\_\       \___/|___|_|   |_| \_\\___/|_| \_| |_| |___|_| \_|\____|
                        P R O

BANNER
  printf "\n  ${C_ORANGE}${C_BOLD}x-ui Fronting Panel PRO Installer${Z}\n"
  printf "  https://github.com/%s\n\n" "${REPO}"
}

ok()   { printf "  ${C_GREEN}OK${Z}  %s\n" "$1"; }
fail() { printf "  ${C_RED}FAIL${Z}  %s\n" "$1"; exit 1; }

[[ "${EUID}" -ne 0 ]] && fail "Please run as root: sudo bash <(curl ...)"

banner

for cmd in curl wget bash; do
  command -v "$cmd" >/dev/null 2>&1 || apt-get install -y -qq "$cmd" 2>/dev/null || true
done

printf "  Downloading main script...\n"
curl -fsSL "${RAW_BASE}/${SCRIPT_NAME}" -o "${INSTALL_PATH}" || \
  wget -qO "${INSTALL_PATH}" "${RAW_BASE}/${SCRIPT_NAME}" || \
  fail "Download failed. Check your internet connection."

chmod +x "${INSTALL_PATH}"
ok "Installed to ${INSTALL_PATH}"
ok "Run anytime with: xui-fronting-pro"
printf "\n  ${C_ORANGE}Launching now...${Z}\n\n"
sleep 1
exec "${INSTALL_PATH}"
