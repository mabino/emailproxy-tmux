#!/bin/sh
# set_emailproxy_secrets.sh <config_path> <account> <client_id> <client_secret> <redirect_uri> <redirect_listen_address>

CONFIG_FILE="$1"
ACCOUNT="$2"
CLIENT_ID="$3"
CLIENT_SECRET="$4"
REDIRECT_URI="$5"
REDIRECT_LISTEN_ADDRESS="$6"

# Replace the account section header if needed
if [ -n "$ACCOUNT" ]; then
  # Replace the bracketed account name (e.g., [mabino@gmail.com])
  sed -i "" "s/^\[.*@.*\]$/[$ACCOUNT]/" "$CONFIG_FILE"
fi

# Replace client_id, client_secret, redirect_uri, and redirect_listen_address
[ -n "$CLIENT_ID" ] && sed -i "" "s/^client_id *=.*/client_id = $CLIENT_ID/" "$CONFIG_FILE"
[ -n "$CLIENT_SECRET" ] && sed -i "" "s/^client_secret *=.*/client_secret = $CLIENT_SECRET/" "$CONFIG_FILE"
[ -n "$REDIRECT_URI" ] && sed -i "" "s|^redirect_uri *=.*|redirect_uri = $REDIRECT_URI|" "$CONFIG_FILE"
[ -n "$REDIRECT_LISTEN_ADDRESS" ] && sed -i "" "s|^redirect_listen_address *=.*|redirect_listen_address = $REDIRECT_LISTEN_ADDRESS|" "$CONFIG_FILE"
