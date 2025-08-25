#!/bin/bash

# Log every run for debugging
echo "$(date) IFACE=$IFACE STATE=$STATE" >> /tmp/networkd-dispatcher.log
env >> /tmp/networkd-dispatcher-env.log

# Only run for WireGuard interfaces (wg* or tun*)
if [[ ! "$IFACE" =~ ^wg[0-9]+$ && ! "$IFACE" =~ ^tun[0-9]+$ ]]; then
	echo "Skip: IFACE=$IFACE" >> /tmp/networkd-dispatcher.log
	exit 0
fi

SUBNET=$(ip -o -f inet addr show "$INTERFACE" | awk '{print $4}')   # Get the source subnet from the tunnel interface

# FIXME: flaky
DEFAULT_IF=""
for i in {1..5}; do
  DEFAULT_IF=$(ip route | awk '/default/ {print $5; exit}')
  if [[ -n "$DEFAULT_IF" ]]; then
    break
  fi
  sleep 1
done
# Fallback: get first non-loopback interface if still no default route
if [[ -z "$DEFAULT_IF" ]]; then
  DEFAULT_IF=$(ip -o link show | awk -F': ' '!/lo/ {print $2; exit}')
  echo "Fallback DEFAULT_IF=$DEFAULT_IF" >> /tmp/networkd-dispatcher.log
fi

# Log variable values
echo "SUBNET=$SUBNET DEFAULT_IF=$DEFAULT_IF WG_PORT=$WG_PORT" >> /tmp/networkd-dispatcher.log

# Safety check: skip if missing SUBNET or DEFAULT_IF
if [[ -z "$SUBNET" || -z "$DEFAULT_IF" ]]; then
	echo "Missing SUBNET or DEFAULT_IF, skipping iptables rules." >> /tmp/networkd-dispatcher.log
	exit 0
fi

# Get WireGuard port from netplan config for this interface
WG_PORT=$(netplan get tunnels."$INTERFACE".port)
[[ -z "$WG_PORT" ]] && WG_PORT=51820 # Default WireGuard port if not set

# Remove IPv4 rules
iptables -D INPUT -i "$INTERFACE" -j ACCEPT 2>> /tmp/networkd-dispatcher.log
iptables -D FORWARD -i "$INTERFACE" -j ACCEPT 2>> /tmp/networkd-dispatcher.log
iptables -D FORWARD -o "$INTERFACE" -j ACCEPT 2>> /tmp/networkd-dispatcher.log
iptables -t nat -D POSTROUTING -s "$SUBNET" -o "$DEFAULT_IF" -j MASQUERADE 2>> /tmp/networkd-dispatcher.log
iptables -D INPUT -i "$DEFAULT_IF" -p udp --dport "${WG_PORT}" -j ACCEPT 2>> /tmp/networkd-dispatcher.log

# Remove IPv6 rules
ip6tables -D INPUT -i "$INTERFACE" -j ACCEPT 2>> /tmp/networkd-dispatcher.log
ip6tables -D FORWARD -i "$INTERFACE" -j ACCEPT 2>> /tmp/networkd-dispatcher.log
ip6tables -D FORWARD -o "$INTERFACE" -j ACCEPT 2>> /tmp/networkd-dispatcher.log
ip6tables -D INPUT -i "$DEFAULT_IF" -p udp --dport "${WG_PORT}" -j ACCEPT 2>> /tmp/networkd-dispatcher.log
