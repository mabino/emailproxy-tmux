#!/bin/sh
# set_emailproxy_secrets.sh <config_path> <client_id> <client_secret>

CONFIG_FILE="$1"
CLIENT_ID="$2"
CLIENT_SECRET="$3"

# Use sed to replace client_id and client_secret in the config file
sed -i "" "s/^client_id *=.*/client_id = $CLIENT_ID/" "$CONFIG_FILE"
sed -i "" "s/^client_secret *=.*/client_secret = $CLIENT_SECRET/" "$CONFIG_FILE"
