# Docker

## Purpose
Minimal cloud-init configuration for installing Docker Community Edition and containerd runtime. This configuration provides a clean, straightforward approach to setting up container runtime environments.

## Configuration Details

### Package Repository Configuration
```yaml
apt:
  sources:
    docker.list:
      source: deb https://download.docker.com/linux/ubuntu noble stable
      keyid: 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
```

**Purpose**:
- Adds the official Docker APT repository for Ubuntu Noble (24.04 LTS)
- Configures GPG key verification for package authenticity
- Ensures access to the latest stable Docker releases

**Security Note**: The GPG key ID `9DC858229FC7DD38854AE2D88D81803C0EBFCD88` is Docker's official signing key for package verification.

### Package Installation
```yaml
packages:
  - containerd.io    # Container runtime (OCI-compliant)
  - docker-ce        # Docker Community Edition engine
  - docker-ce-cli    # Docker command-line interface
```

**Package Descriptions**:

#### containerd.io
- **Purpose**: High-level container runtime that manages the complete container lifecycle
- **Role**: Provides the core container execution environment
- **Standards**: OCI (Open Container Initiative) compliant
- **Usage**: Can be used independently or as Docker's underlying runtime

#### docker-ce
- **Purpose**: Docker Community Edition engine - the core Docker daemon
- **Features**: Container creation, management, networking, and storage
- **API**: Provides REST API for container management
- **Services**: Includes the Docker daemon (`dockerd`)

#### docker-ce-cli
- **Purpose**: Docker command-line interface tools
- **Commands**: Provides `docker` command and related utilities
- **Management**: Enables container, image, network, and volume management
- **Interaction**: Communicates with Docker daemon via API

## Installation Process

### Repository Setup
1. **GPG Key Import**: Verifies package authenticity
2. **Repository Addition**: Adds Docker's official APT source
3. **Package Index Update**: Refreshes available package information

### Package Installation Order
1. **containerd.io**: Installed first as base runtime
2. **docker-ce**: Docker engine installed on top of containerd
3. **docker-ce-cli**: CLI tools installed for user interaction

## Post-Installation Considerations

### Service Management
After installation, the following services will be available:
- `containerd.service`: Container runtime service
- `docker.service`: Docker daemon service

### User Permissions
Consider adding users to the `docker` group for non-root access:
```bash
sudo usermod -aG docker $USER
```

### Service Startup
Docker services are typically enabled and started automatically:
```bash
sudo systemctl enable docker
sudo systemctl start docker
```

## Security Considerations

### Package Verification
- GPG signature verification ensures package integrity
- Official Docker repository reduces supply chain risks
- Specific key ID prevents man-in-the-middle attacks

### Runtime Security
- containerd provides secure container isolation
- Docker daemon should be configured with security best practices
- Consider using rootless mode for enhanced security

### Network Security
- Docker creates bridge networks by default
- Review firewall rules after installation
- Consider network policies for production environments

## Version Compatibility

### Ubuntu Noble (24.04 LTS)
- Specifically configured for Ubuntu 24.04 LTS
- Uses the "noble" codename in repository URL
- Compatible with systemd service management

### Docker CE Versions
- Installs latest stable versions from Docker repository
- Automatic updates through standard APT upgrade process
- Version pinning available if needed for stability

## Integration with Other Configurations

### Combining with Other Cloud-Init Files
This configuration can be combined with:
- `default.yaml`: For base system setup
- `packages.yaml`: For additional system utilities
- `user.yaml`: For user account configuration

### Example Combined Usage
```yaml
#cloud-config
merge_how:
  - name: list
    settings: [append]
  - name: dict
    settings: [no_replace, recurse_list]

# Content from multiple files merged here
```

## Troubleshooting

### Installation Issues
- **Repository Access**: Verify internet connectivity and DNS resolution
- **GPG Key Issues**: Check key import with `apt-key list`
- **Package Conflicts**: Review existing container runtime installations

### Service Issues
- **Docker Daemon**: Check status with `systemctl status docker`
- **containerd Service**: Verify with `systemctl status containerd`
- **Permission Issues**: Ensure user is in docker group

### Common Commands for Verification
```bash
# Verify installation
docker --version
containerd --version

# Test functionality
docker run hello-world

# Check service status
systemctl status docker containerd
```

## Best Practices

### Production Considerations
1. **Version Pinning**: Consider pinning specific versions
2. **Security Updates**: Regularly update Docker packages
3. **Configuration**: Review Docker daemon configuration
4. **Monitoring**: Implement container and service monitoring

### Development Usage
1. **User Groups**: Add developers to docker group
2. **IDE Integration**: Configure development tools for Docker
3. **Local Registry**: Consider local container registry setup
4. **Build Tools**: Install additional build tools as needed

## Dependencies

### System Requirements
- Ubuntu 24.04 LTS (Noble Numbat)
- Internet connectivity for package download
- Sufficient disk space for container images
- systemd for service management

### Network Requirements
- Access to Docker repository (download.docker.com)
- DNS resolution for package verification
- Firewall configuration for Docker networks
