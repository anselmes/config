# User Configuration

## Purpose
User account and access control configuration for cloud-init. This configuration establishes user accounts with appropriate privileges and SSH access for system administration and development activities.

## Configuration Details

### User Account Setup
```yaml
users:
  - default
  - name: ubuntu
    groups: sudo # sudo,docker
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys: []
```

## User Account Analysis

### Default User
```yaml
- default
```
**Purpose**:
- Preserves the cloud provider's default user account
- Maintains compatibility with cloud-specific configurations
- Ensures cloud-init's standard user management continues to work

**Behavior**:
- Cloud providers typically create a default user (e.g., `ubuntu`, `ec2-user`, `admin`)
- This user often has sudo privileges and SSH key access
- Specific configuration depends on the cloud provider and image

### Ubuntu User Account
```yaml
- name: ubuntu
  groups: sudo # sudo,docker
  sudo: ALL=(ALL) NOPASSWD:ALL
  ssh_authorized_keys: []
```

#### Account Properties

**Username**: `ubuntu`
- Standard username for Ubuntu cloud images
- Consistent across different deployment environments
- Familiar to Ubuntu administrators and developers

**Groups**: `sudo`
- **Primary Group**: `sudo` - provides administrative privileges
- **Commented Option**: `docker` - for Docker container management
- **Note**: Docker group is commented out but can be enabled when needed

**Sudo Configuration**: `ALL=(ALL) NOPASSWD:ALL`
- **Scope**: Full sudo access to all commands
- **Target Users**: Can execute commands as any user (`ALL`)
- **Authentication**: No password required (`NOPASSWD`)
- **Commands**: Access to all commands (`ALL`)

**SSH Keys**: `ssh_authorized_keys: []`
- **Status**: Empty array - requires configuration before deployment
- **Security**: No SSH access until keys are added
- **Deployment**: Must be populated with actual public keys

## Security Considerations

### Privilege Management

#### Passwordless Sudo
**Benefits**:
- Streamlined automation and scripting
- Reduces password management complexity
- Enables seamless CI/CD operations

**Risks**:
- High privilege escalation potential
- No authentication barrier for sudo commands
- Requires strong SSH key security

**Mitigation Strategies**:
1. Restrict SSH access to specific IP ranges
2. Use SSH key passphrases
3. Implement SSH key rotation policies
4. Monitor sudo command execution

#### Group Membership

**Sudo Group**:
- Provides administrative privileges
- Standard Ubuntu administrative group
- Enables system configuration and management

**Docker Group (Optional)**:
- Commented out by default
- Provides Docker daemon access
- Equivalent to root access (security consideration)

### SSH Access Control

#### Key Management
**Current State**:
- Empty SSH key array requires manual configuration
- No SSH access possible until keys are added
- Keys must be added before deployment

**Best Practices**:
1. Use strong SSH key pairs (RSA 4096-bit or Ed25519)
2. Implement key rotation policies
3. Use unique keys per environment
4. Store private keys securely

#### Authentication Security
- Public key authentication only (recommended)
- Disable password authentication
- Consider multi-factor authentication
- Implement connection rate limiting

## Deployment Configuration

### SSH Key Setup
Before deployment, populate the SSH keys array:
```yaml
ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC... user@hostname
  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG... admin@workstation
```

### Docker Integration
To enable Docker access, uncomment the docker group:
```yaml
groups: sudo,docker
```

**Security Note**: Docker group membership provides root-equivalent access.

### Additional Security Configuration
Consider adding additional security measures:
```yaml
- name: ubuntu
  groups: sudo
  sudo: ALL=(ALL) NOPASSWD:ALL
  ssh_authorized_keys: []
  shell: /bin/bash
  lock_passwd: true        # Disable password login
  expire: false           # Account never expires
```

## Integration with Other Configurations

### Combined with Default Configuration
When used with `default.yaml`:
- Complements the default user setup
- Provides additional administrative account
- Maintains cloud provider compatibility

### Combined with Development Configuration
When used with `dev.yaml`:
- Provides access to development services
- Enables management of networking services
- Supports container and virtualization workflows

### Combined with Docker Configuration
When used with `docker.yaml`:
- Enable docker group for container management
- Provides privileged access to Docker daemon
- Supports container development workflows

## Common Deployment Scenarios

### Production Environment
```yaml
users:
  - default
  - name: ubuntu
    groups: sudo
    sudo: ALL=(ALL) PASSWD  # Require password for sudo
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... admin@secure-workstation
    shell: /bin/bash
    lock_passwd: true
```

### Development Environment
```yaml
users:
  - default
  - name: ubuntu
    groups: sudo,docker
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC... dev@laptop
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... ci@build-server
```

### CI/CD Environment
```yaml
users:
  - default
  - name: ubuntu
    groups: sudo,docker
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... ci-server
    shell: /bin/bash
```

## Post-Deployment Tasks

### SSH Configuration Verification
```bash
# Test SSH access
ssh ubuntu@server-ip

# Verify sudo access
sudo whoami

# Check group membership
groups
```

### Security Hardening
```bash
# Disable password authentication
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart ssh

# Verify SSH configuration
sudo sshd -t
```

### Account Management
```bash
# List user accounts
cut -d: -f1 /etc/passwd

# Check sudo privileges
sudo -l

# Verify SSH keys
cat ~/.ssh/authorized_keys
```

## Troubleshooting

### SSH Access Issues
1. **Key Problems**: Verify public key format and permissions
2. **Service Issues**: Check SSH service status and configuration
3. **Network Issues**: Verify firewall rules and network connectivity

### Sudo Issues
1. **Permission Denied**: Check group membership and sudo configuration
2. **Password Prompts**: Verify NOPASSWD configuration
3. **Command Restrictions**: Review sudo rules and policies

### User Account Issues
1. **Account Creation**: Check cloud-init logs for user creation errors
2. **Group Assignment**: Verify group membership
3. **Shell Access**: Confirm shell configuration and availability

## Best Practices

### Security
1. **Minimal Privileges**: Grant only necessary permissions
2. **Key Rotation**: Regularly rotate SSH keys
3. **Access Monitoring**: Monitor user access and sudo usage
4. **Account Auditing**: Regularly review user accounts and permissions

### Operational
1. **Documentation**: Document all user accounts and their purposes
2. **Standardization**: Use consistent user configurations across environments
3. **Automation**: Automate user management tasks
4. **Backup**: Backup SSH keys and user configurations

### Development
1. **Environment Separation**: Different configurations for dev/staging/prod
2. **Team Access**: Manage team member SSH keys appropriately
3. **Service Accounts**: Create dedicated accounts for services
4. **Development Tools**: Configure appropriate development environment access
