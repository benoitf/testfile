is_boot2docker() {
  if uname -r | grep -q 'boot2docker'; then
    return 0
  else
    return 1
  fi
}



NETWORK_IF="eth0"
if is_boot2docker; then
  NETWORK_IF="eth1"
fi

ip a show "${NETWORK_IF}" | \
            grep 'inet ' | \
            cut -d/ -f1 | \
            awk '{ print $2}'

