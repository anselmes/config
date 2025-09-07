#!/bin/bash

echo "$(date) ARGS: $*" >>/tmp/nm-dispatcher.log

# NetworkManager dispatcher script for WireGuard/tunX/wgX DOWN event
# Args: $1 = interface, $2 = event
IFACE="$1"
EVENT="$2"

# Log every run
echo "$(date) IFACE=${IFACE} EVENT=${EVENT}" >>/tmp/nm-dispatcher.log

# Only run for tunX or wgX and 'down' event
if [[ ! ${IFACE} =~ ^(tun[0-9]+|wg[0-9]+)$ || ${EVENT} != "down" ]]; then
  echo "Skip: IFACE=${IFACE} EVENT=${EVENT}" >>/tmp/nm-dispatcher.log
  exit 0
fi

SUBNET=$(ip -o -f inet addr show "${IFACE}" | awk '{print $4}') # Get the source subnet from the tunnel interface
DEFAULT_IF=$(ip route | awk '/default/ {print $5; exit}')       # Find the interface with the default route

# Get WireGuard port from netplan config for this interface (optional, fallback to default)
WG_PORT=51820
if command -v netplan >/dev/null 2>&1; then
  WG_PORT=$(netplan get tunnels."${IFACE}".port)
  [[ -z ${WG_PORT} ]] && WG_PORT=51820
fi

# Remove IPv4 rules
{
  iptables -D INPUT -i "${IFACE}" -j ACCEPT
  iptables -D FORWARD -i "${IFACE}" -j ACCEPT
  iptables -D FORWARD -o "${IFACE}" -j ACCEPT
  iptables -t nat -D POSTROUTING -s "${SUBNET}" -o "${DEFAULT_IF}" -j MASQUERADE
  iptables -D INPUT -i "${DEFAULT_IF}" -p udp --dport "${WG_PORT}" -j ACCEPT
} 2>>/tmp/nm-dispatcher.log

# Remove IPv6 rules
{
  ip6tables -D INPUT -i "${IFACE}" -j ACCEPT
  ip6tables -D FORWARD -i "${IFACE}" -j ACCEPT
  ip6tables -D FORWARD -o "${IFACE}" -j ACCEPT
  ip6tables -D INPUT -i "${DEFAULT_IF}" -p udp --dport "${WG_PORT}" -j ACCEPT
} 2>>/tmp/nm-dispatcher.log
