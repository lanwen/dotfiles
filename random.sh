WIDTH=${1:-32}
NUM=${2:-1}
env LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w ${WIDTH} | head -n ${NUM}
