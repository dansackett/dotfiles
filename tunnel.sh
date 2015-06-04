#/bin/bash
#
# MySQL SSH Tunnel Scripts
#
# This script will allow someone to use SSH tunneling into a remote MySQL
# instance based on a config file stored in their $HOME/.ssh/tunnel_configs.json
# file. It is not perfect but it's a time saver when you are jumping in and
# out of remote MySQL instances.
#
# Usage:
#
#   tunnel                  Show the available config items you have,
#   tunnel config_name      Establish an SSH tunnel into the relevant config
#   kill_tunnel             Kill existing tunnel on port 3307
#
# It is important that your config file is proper JSON formatted and each
# config includes the following:
#
# {
#   'config_name': {
#     'ssh_config': 'hostname in $HOME/.ssh/config',
#     'username': 'MySQL username',
#     'password': 'MySQL password',
#     'database': 'MySQL database'
#   }
# }
#
# You may include any number of config objects within this JSON object.

TUNNEL_CONFIG="$HOME/.ssh/tunnel_configs.json"
PRINT_OBJECT="import json, sys; obj=json.load(sys.stdin); print"
PORT="3307"

# Print a list of available tunnels
_show_available_configs () {
    AVAILABLE_CONFIGS=$(cat $TUNNEL_CONFIG | python -c "$PRINT_OBJECT '\n'.join(obj.keys())")
    echo "Please select one of the following configs:"
    echo
    echo $AVAILABLE_CONFIGS | sed 's/ /\n/g'
}

# Check if a certain field exists in the config file and return it if so
_get_field () {
    CONFIG=$1
    FIELD=$2
    echo $(cat $TUNNEL_CONFIG | python -c "$PRINT_OBJECT obj['$CONFIG']['$FIELD']")
}

# Do the actual SSH Tunnel
_do_ssh () {
    SSH_CONFIG=$1
    echo "Forwarding 127.0.0.1:3307 to $SSH_CONFIG:3306"
    ssh -2 -f -C -N $SSH_CONFIG -L 3307/127.0.0.1/3306
    echo "...done!"
    echo
}

# Make the MySQL connection
_do_mysql () {
    SSH_CONFIG=$1
    USERNAME=$2
    DATABASE=$3
    PASSWORD=$4

    if [ -z $PASSWORD ]
    then
        echo "Connecting to $SSH_CONFIG MySQL as $USERNAME with no password on $DATABASE."
        mysql -u $USERNAME -h127.0.0.1 -P3307 $DATABASE
    else
        echo "Connecting to $SSH_CONFIG MySQL as $USERNAME on $DATABASE."
        mysql -u $USERNAME -p$PASSWORD -h127.0.0.1 -P3307 $DATABASE
    fi
}

# Kill all SSH Tunnels on $PORT
kill_tunnel () {
    echo "Killing MySQL SSH tunnel on port $PORT"

    SESSION=$(ps -fU root -C ssh | grep "ssh -2" | grep "$PORT" | awk '{print $2}')

    while [ ! -z $SESSION ]; do
        kill $SESSION
        SESSION=$(ps -fU root -C ssh | grep "ssh -2" | grep "$PORT" | awk '{print $2}')
    done

    echo "...done!"
}

# Create the Tunnel and move into MySQL If all is correct
tunnel () {
    # Check that there's a valid SSH config and ssh_config is set in config object
    if [ ! -f "$HOME/.ssh/config" ]
    then
        echo "You don't appear to have an SSH Config file setup at $HOME/.ssh/config"
        exit 1
    fi

    # Check the tunnel config exists
    if [ ! -f "$TUNNEL_CONFIG" ]
    then
        echo "You must create a JSON file $TUNNEL_CONFIG"
        exit 1
    fi

    if [ -z "$1" ]
    then
        _show_available_configs
        exit 1
    elif [ "$1" == "--kill" ]
    then
        kill_tunnel
        exit 1
    else
        CONFIG=$1
        CONFIG_EXISTS=$(cat $TUNNEL_CONFIG | python -c "$PRINT_OBJECT bool(dict(obj).get('$CONFIG', False))")

        if [ $CONFIG_EXISTS == "True" ]
        then
            SSH_CONFIG=$(_get_field $CONFIG ssh_config)
            USERNAME=$(_get_field $CONFIG username)
            PASSWORD=$(_get_field $CONFIG password)
            DATABASE=$(_get_field $CONFIG database)

            kill_tunnel

            _do_ssh $SSH_CONFIG
            _do_mysql $SSH_CONFIG $USERNAME $PASSWORD $DATABASE
        else
            _show_available_configs
            exit 1
        fi
    fi
}

tunnel $1
