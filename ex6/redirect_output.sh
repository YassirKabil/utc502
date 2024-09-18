if [ "$#" -lt 1 ]; then
    echo "Usage: $0 commande [arguments...]"
    exit 1
fi


"$@" > output.log 2> error.log

