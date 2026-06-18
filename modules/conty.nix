{ pkgs, ... }:

{
  system.activationScripts.installConty.text = ''
    GAMES_DIR="/home/harshaln/Games"
    CONTY_PATH="$GAMES_DIR/conty.sh"

    # If conty already exists, skip everything
    if [ -f "$CONTY_PATH" ]; then
      exit 0
    fi

    # Create Games directory if missing
    mkdir -p "$GAMES_DIR"

    # Get latest conty.sh release URL
    CONTY_URL="$(${pkgs.curl}/bin/curl -s https://api.github.com/repos/kron4ek/conty/releases/latest \
      | ${pkgs.jq}/bin/jq -r '.assets[] | select(.name == "conty.sh") | .browser_download_url')"

    if [ -n "$CONTY_URL" ]; then
      ${pkgs.curl}/bin/curl -L "$CONTY_URL" -o "$CONTY_PATH"
      chmod +x "$CONTY_PATH"
    else
      echo "Failed to fetch latest conty release"
      exit 1
    fi
  '';
}
