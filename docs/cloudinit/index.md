# Cloud-Init

## Overview

cloud-init configuration files for automated system provisioning and setup.

Cloud-init is the industry-standard multi-distribution method for cross-platform cloud instance initialization. It supports a wide range of cloud platforms including AWS, Azure, Google Cloud, OpenStack, and bare metal deployments.

## File Structure

  ```
  cloudinit/
  ├── default.yaml     # Base system configuration
  ├── devbox.yaml      # Development environment setup
  ├── docker.yaml      # Docker installation configuration
  ├── packages.yaml    # Essential system packages
  └── user.yaml        # User account configuration
  ```

## Configuration Files

### [default.yaml](./default.md)

Base system configuration that provides fundamental system setup including:
- System timezone and locale settings
- Package updates and upgrades
- File system growth configuration
- SSH key management
- Basic system environment setup
- Hostname and FQDN configuration
- System logging and monitoring setup

**Use Case**: Essential baseline configuration for all cloud instances

### [devbox.yaml](./devbox.md)

Development environment configuration for sandbox/lab environments including:
- FRR (Free Range Routing) for BGP configuration
- WireGuard VPN setup
- Bind9 DNS server configuration
- Network security and firewall rules
- Automated service provisioning
- Development tools and utilities
- Container runtime preparation

**Use Case**: Development, testing, and laboratory environments requiring advanced networking

### [docker.yaml](./docker.md)

Docker container runtime installation configuration:
- Docker CE (Community Edition) installation
- Containerd runtime setup
- Docker CLI tools installation
- Docker Compose integration
- User permission configuration for Docker access
- Docker daemon optimization settings

**Use Case**: Container-based workloads and microservices deployment

### [packages.yaml](./packages.md)

Essential system packages for security and functionality:
- Security tools (AppArmor, fail2ban)
- Network utilities (curl, wget, conntrack)
- Cryptography packages (OpenSSL, GnuPG)
- System utilities and SSH
- Development libraries and tools
- Monitoring and diagnostic utilities

**Use Case**: Standard package baseline for production and development systems

### [user.yaml](./user.md)

User account and access configuration:
- Default user setup with proper shell configuration
- Ubuntu user with sudo privileges
- SSH key management and authorized_keys setup
- Passwordless sudo configuration
- User environment customization
- Security hardening for user accounts

**Use Case**: User provisioning and access control for multi-user environments

## Usage Examples

These configuration files can be used individually or combined depending on your deployment needs:

### Single Configuration

  ```bash
  # Base system setup only
  cloud-init --file cloudinit/default.yaml

  # Docker environment
  cloud-init --file cloudinit/docker.yaml
  ```

### Combined Configurations

  ```bash
  # Complete development environment
  cloud-init --file cloudinit/default.yaml \
            --file cloudinit/packages.yaml \
            --file cloudinit/user.yaml \
            --file cloudinit/devbox.yaml

  # Production container host
  cloud-init --file cloudinit/default.yaml \
            --file cloudinit/packages.yaml \
            --file cloudinit/user.yaml \
            --file cloudinit/docker.yaml
  ```

### Cloud Provider Integration

  ```bash
  # AWS EC2 user-data
  #!/bin/bash
  curl -fsSL https://example.com/cloudinit/default.yaml | cloud-init --stdin

  # Azure Custom Script Extension
  az vm extension set --resource-group myRG --vm-name myVM \
    --name CustomScript --publisher Microsoft.Azure.Extensions \
    --settings '{"fileUris":["https://example.com/cloudinit/default.yaml"]}'
  ```

## Security Considerations

### SSH Key Management
- SSH public keys should be embedded in user.yaml before deployment
- Never include private keys in cloud-init configurations
- Use SSH agent forwarding judiciously in development environments

### Network Security
- Review firewall rules in devbox.yaml for your specific environment
- Ensure proper network isolation for development environments
- Consider VPN requirements for remote access

### Package Security
- Regularly update package configurations for security patches
- Use official package repositories when possible
- Implement automated security updates where appropriate

### Access Control
- Follow principle of least privilege for user permissions
- Regularly audit sudo access and SSH key usage
- Implement proper logging and monitoring

## Dependencies

### System Requirements
- Cloud-init must be installed on the target system (usually pre-installed on cloud images)
- Network connectivity for package downloads and updates
- Sufficient disk space for package installations
- Compatible Linux distribution (Ubuntu, CentOS, RHEL, Debian)

### Network Requirements
- Internet access for package repositories
- DNS resolution for package manager operations
- NTP access for time synchronization
- Cloud provider metadata service access

### Cloud Provider Integration
- Proper cloud provider integration and metadata service
- Instance profile or service principal with appropriate permissions
- Network security groups or firewall rules allowing required traffic

## Validation and Testing

### Syntax Validation
```bash
# Validate YAML syntax
python -c "import yaml; yaml.safe_load(open('default.yaml'))"

# Cloud-init configuration validation
cloud-init devel schema --config-file default.yaml
```

### Testing Workflow
1. Validate configuration syntax locally
2. Test in isolated development environment
3. Verify all services start correctly
4. Check network connectivity and firewall rules
5. Validate user access and permissions
6. Deploy to staging environment
7. Production deployment with monitoring

## Maintenance and Updates

### Regular Maintenance Tasks
- **Monthly**: Review and update package versions
- **Quarterly**: Security audit of configurations
- **Annually**: Major version updates and dependency reviews

### Configuration Management
- Version control all configuration files
- Document changes with clear commit messages
- Implement peer review process for changes
- Maintain rollback procedures

### Monitoring and Alerting
- Monitor cloud-init execution logs
- Set up alerts for failed provisioning
- Track deployment success rates
- Monitor resource utilization post-deployment

## Troubleshooting

### Common Issues
- **Package installation failures**: Check repository availability and network connectivity
- **Service startup failures**: Review service dependencies and configuration
- **SSH access issues**: Verify SSH key configuration and network security groups
- **Permission errors**: Check user account setup and sudo configuration

### Debug Commands
```bash
# Check cloud-init status
cloud-init status --long

# View cloud-init logs
sudo journalctl -u cloud-init

# Re-run cloud-init (development only)
sudo cloud-init clean
sudo cloud-init init
```

## Related Documentation

- [Cloud-Init Official Documentation](https://cloudinit.readthedocs.io/)
- [Ubuntu Cloud-Init Guide](https://ubuntu.com/server/docs/cloud-init)
