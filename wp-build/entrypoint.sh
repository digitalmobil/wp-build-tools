#!/bin/bash --login

DATA_UID=$(stat -c "%u" /data)

if [ $DATA_UID -gt 0 ]; then
    echo "Executing as UID $DATA_UID"
    usermod -u $DATA_UID wp-build >/dev/null 2>&1
    chown -R wp-build /home/wp-build
    sudo -u wp-build "$@"
else
    exec "$@"
fi
