# DevBox

## Purpose
Advanced development environment configuration for networking, VPN, and routing services. This configuration sets up a comprehensive development sandbox with BGP routing (FRR), WireGuard VPN, and DNS services (Bind9).

## Key Features
- **FRR BGP Router**: For Cilium BGP integration and network routing
- **WireGuard VPN**: Secure remote access to the development environment
- **Bind9 DNS**: Local DNS resolution for development services
- **Network Security**: Firewall configuration and IP forwarding

## Configuration Sections

### Welcome Message (`/etc/motd`)
Creates a custom message of the day displaying:
- System hostname and purpose
- Installed services information
- Usage guidelines for developers

### FRR BGP Configuration Template (`/opt/frr.conf.tmpl`)
Template for FRR (Free Range Routing) configuration supporting:
- **BGP AS Configuration**: Customizable Autonomous System number
- **Cilium Integration**: BGP peering with Cilium CNI
- **Multi-path Routing**: Enhanced routing capabilities
- **Debug Options**: Commented debug flags for troubleshooting

#### Key BGP Settings:
```bash
router bgp ${bgp_as}           # BGP Autonomous System
bgp router-id ${server_ip}     # Router identifier
neighbor cilium peer-group     # Cilium neighbor group
neighbor cilium remote-as external  # External BGP peering
```

### WireGuard Server Configuration (`/opt/wg0.conf.tmpl`)
WireGuard VPN server template featuring:
- **Interface Configuration**: Private key, addresses, and listening port
- **NAT and Firewall Rules**: Automatic iptables/ip6tables configuration
- **Peer Management**: Client peer configuration
- **Network Routing**: Traffic forwarding between VPN and local network

#### Security Features:
- Automatic NAT traversal setup
- Firewall rule management (PostUp/PreDown)
- IPv4 and IPv6 support

### WireGuard Client Configuration (`/opt/wg0.client.tmpl`)
Client-side VPN configuration template:
- **DNS Configuration**: Automatic DNS server assignment
- **Allowed IPs**: Configurable traffic routing
- **Endpoint Configuration**: Server connection details

### Bootstrap Script (`/opt/bootstrap.sh`)
Comprehensive setup script that orchestrates:

#### Network Configuration
- **IP Forwarding**: Enables IPv4/IPv6 packet forwarding
- **Firewall Setup**: UFW (Uncomplicated Firewall) configuration
- **Service Ports**: Opens required ports for BGP, DNS, and WireGuard

#### Service Installation and Configuration
1. **Package Installation**:
   - `bind9`: DNS server
   - `frr`: Free Range Routing suite
   - `qrencode`: QR code generation for mobile VPN setup
   - `wireguard`: VPN software

2. **FRR Setup**:
   - Enables BGP daemon
   - Generates configuration from template
   - Starts and enables FRR service

3. **WireGuard Setup**:
   - Generates server and client key pairs
   - Creates server configuration
   - Enables systemd service
   - Generates client configuration and QR code

#### Network Addressing
- **VIP Range**: `172.16.254.0/24` (Virtual IP pool)
- **IPv4 VPN Range**: `10.10.10.0/24` (WireGuard IPv4 network)
- **IPv6 VPN Range**: Dynamically generated using machine ID and timestamp
- **Upstream DNS**: `172.16.0.1`

## Environment Variables

The configuration supports these environment variables:
- `VIP`: Virtual IP range (default: "172.16.254.0/24")
- `IP4_RANGE`: IPv4 VPN network range (default: "10.10.10.0/24")
- `IP6_RANGE`: IPv6 VPN network range (auto-generated)
- `bgp_as`: BGP Autonomous System number
- `hostname`: System hostname for BGP router ID
- `server_ip`: Server's public IP address
- `wg_port`: WireGuard listening port (default: 51820)

## Security Considerations

### Network Security
1. **Firewall Configuration**: UFW manages access to services
2. **Key Management**: WireGuard keys stored with restricted permissions
3. **NAT Configuration**: Proper isolation between VPN and host networks

### Access Control
1. **VPN Access**: Controlled through WireGuard public key authentication
2. **Service Binding**: Services bound to specific interfaces for security
3. **IP Forwarding**: Controlled forwarding between network segments

## Service Integration

### Cilium BGP Integration
- Designed to work with Cilium CNI BGP announcements
- Supports external BGP peering for Kubernetes load balancer services
- Multi-hop BGP configuration for complex network topologies

### DNS Services
- Bind9 configuration for local DNS resolution
- Integration with cert-manager for certificate validation
- Support for external-dns automatic record management

## Deployment Workflow

1. **System Initialization**: Cloud-init processes the configuration
2. **Package Installation**: Required networking software installed
3. **Network Configuration**: IP forwarding and firewall setup
4. **Service Configuration**: FRR, WireGuard, and Bind9 setup
5. **Key Generation**: Cryptographic keys for VPN created
6. **Service Activation**: All services started and enabled
7. **Client Configuration**: VPN client config and QR code generated

## Troubleshooting

### Network Issues
- Check IP forwarding: `sysctl net.ipv4.ip_forward`
- Verify firewall rules: `ufw status`
- Test BGP connectivity: `vtysh -c "show bgp summary"`

### VPN Issues
- Check WireGuard status: `systemctl status wg-quick@wg0`
- Verify key generation: `ls -la /etc/wireguard/`
- Test connectivity: `ping` VPN gateway address

### Service Issues
- FRR status: `systemctl status frr`
- Bind9 status: `systemctl status bind9`
- Check logs: `journalctl -u <service-name>`

## Common Use Cases

1. **Kubernetes Development**: BGP integration with Cilium CNI
2. **Network Testing**: Multi-protocol routing and VPN scenarios
3. **Remote Development**: Secure access to development resources
4. **Service Mesh Testing**: DNS and routing for microservices
5. **Container Networking**: Advanced networking for containerized applications
