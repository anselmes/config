#!/bin/bash

# Only run for WireGuard interfaces (wg* or tun*)
if [[ ! "$INTERFACE" =~ ^wg[0-9]+$ && ! "$INTERFACE" =~ ^tun[0-9]+$ ]]; then
	exit 0
fi

SUBNET=$(ip -o -f inet addr show "$INTERFACE" | awk '{print $4}')   # Get the source subnet from the tunnel interface
DEFAULT_IF=$(ip route | awk '/default/ {print $5; exit}')           # Find the interface with the default route

# Get WireGuard port from netplan config for this interface
WG_PORT=$(netplan get tunnels."$INTERFACE".port)
[[ -z "$WG_PORT" ]] && WG_PORT=51820 # Default WireGuard port if not set

# Remove IPv4 rules
iptables -D INPUT -i "$INTERFACE" -j ACCEPT
iptables -D FORWARD -i "$INTERFACE" -j ACCEPT
iptables -D FORWARD -o "$INTERFACE" -j ACCEPT
iptables -t nat -D POSTROUTING -s "$SUBNET" -o "$DEFAULT_IF" -j MASQUERADE
iptables -D INPUT -i "$DEFAULT_IF" -p udp --dport "${WG_PORT}" -j ACCEPT

# Remove IPv6 rules
ip6tables -D INPUT -i "$INTERFACE" -j ACCEPT
ip6tables -D FORWARD -i "$INTERFACE" -j ACCEPT
ip6tables -D FORWARD -o "$INTERFACE" -j ACCEPT
ip6tables -D INPUT -i "$DEFAULT_IF" -p udp --dport "${WG_PORT}" -j ACCEPT
