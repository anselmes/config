# Default Configuration

## Purpose
Base cloud-init configuration for fundamental system initialization and setup. This configuration provides the minimal required setup for a functional Ubuntu system with basic security and management features.

## Configuration Sections

### System Identity and Network
```yaml
# fqdn: box.dev.local    # Fully Qualified Domain Name (commented out)
# hostname: box          # System hostname (commented out)
manage_etc_hosts: true   # Automatically manage /etc/hosts file
```

**Purpose**:
- Controls system hostname and DNS resolution
- When `manage_etc_hosts` is true, cloud-init will update `/etc/hosts` with the instance's hostname

### Package Management
```yaml
package_update: true     # Update package lists on first boot
package_upgrade: true    # Upgrade all packages to latest versions
```

**Purpose**:
- Ensures the system starts with the latest security patches
- Updates package repositories for accurate package information

### System Localization
```yaml
timezone: America/Toronto  # Set system timezone
```

**Purpose**:
- Configures system clock and timezone settings
- Affects log timestamps and scheduled tasks

### File System Configuration
```yaml
growpart:
  mode: auto                        # Automatically grow partitions
  ignore_growroot_disabled: false   # Respect growroot disable flags
  devices: [/]                      # Grow root partition
```

**Purpose**:
- Automatically expands the root partition to use available disk space
- Essential for cloud instances where disk size may vary

### User Management
```yaml
users:
  - default                # Use cloud provider's default user
ssh_authorized_keys: []    # SSH public keys (empty - to be populated)
```

**Purpose**:
- Configures user accounts for system access
- SSH key array should be populated with actual public keys for secure access

### File System Setup
The configuration creates several important system files:

#### Environment Configuration (`/etc/environment`)
```bash
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
EDITOR="vim"
```
**Purpose**: Sets system-wide environment variables for all users

#### Systemd Service Configuration (`/usr/lib/systemd/system/user@.service.d/delegate.conf`)
```ini
[Service]
Delegate=cpu cpuset io memory pids
```
**Purpose**: Enables cgroup delegation for user services, allowing better resource management

#### System Configuration Script (`/opt/configure.sh`)
A comprehensive setup script that:
- Disables swap (important for Kubernetes environments)
- Sets system locale to UTF-8
- Configures NTP time synchronization
- Sets the specified timezone

### Execution Commands
```yaml
runcmd:
  - /opt/configure.sh     # Execute main configuration script

bootcmd:
  - stat -c %T -f /sys/fs/cgroup  # Check cgroup filesystem type
```

**Purpose**:
- `runcmd`: Executes commands after the system is fully initialized
- `bootcmd`: Executes commands early in the boot process

## Security Considerations

1. **SSH Keys**: The `ssh_authorized_keys` array is empty - populate with actual public keys
2. **Default User**: Uses cloud provider's default user - ensure proper security configuration
3. **Swap Disabled**: Swap is disabled for security and performance (common in container environments)

## Customization Guidelines

1. **Hostname**: Uncomment and set `fqdn` and `hostname` for your environment
2. **SSH Keys**: Add your public SSH keys to the `ssh_authorized_keys` array
3. **Timezone**: Adjust timezone to match your geographic location
4. **Additional Packages**: Consider combining with `packages.yaml` for required software

## Environment Variables

The configuration script supports these environment variables:
- `LOCALE`: System locale (default: "C.UTF-8")
- `TIMEZONE`: System timezone (default: "America/Toronto")

## Dependencies

- Cloud-init package installed on target system
- Internet connectivity for package updates
- Sufficient disk space for package upgrades

## Common Use Cases

- Base configuration for all cloud instances
- Foundation for more specialized configurations
- Development and testing environments
- Production systems requiring minimal setup
