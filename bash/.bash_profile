# macOS login shells (Ghostty, Terminal.app, SSH) read ~/.bash_profile, not ~/.bashrc.
# Omarchy parity: always load ~/.bashrc so the prompt is identical everywhere.
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
