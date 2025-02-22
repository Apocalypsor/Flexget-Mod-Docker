#! /bin/sh
set -e

echo "Syncing plugins to /config/plugins..."
mkdir -p /config/plugins

cp -rf /defaults/plugins/* /config/plugins/

bash /usr/bin/entrypoint.sh
