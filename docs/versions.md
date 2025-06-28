# versions.yaml

## Overview

The `versions.yaml` file is a comprehensive configuration management system for development environments. It defines binary downloads, package installations, and plugin management across different operating systems and architectures.

## File Structure

### Binary Section

The `binary` section manages third-party tool downloads from official sources:

```yaml
binary:
  - name: tool-name
    enabled: true/false    # Toggle installation
    type: archive|executable
    url: download-url
    version: version-string
    path: extraction-path  # For archives only
    pre: pre-command      # Optional pre-installation command
    post: post-command    # Optional post-installation command
    workspace: install-dir # Optional custom installation directory
    archs: [amd64, arm64] # Supported architectures
```

#### Supported Binary Types

- **archive**: Compressed files (tar.gz, zip) that need extraction
- **executable**: Single binary files ready to use

#### Variable Substitution

URLs and paths support variable substitution:
- `${version}`: Tool version
- `${os}`: Operating system (linux, darwin, windows)
- `${arch}`: Architecture (amd64, arm64)

### Package Section

The `package` section manages system packages via package managers:

#### Individual Packages

```yaml
package:
  add:
    - name: package-name
      enabled: true/false
      keyring: gpg-key-url     # Optional GPG key
      repo: repository-url     # Optional custom repository
      type: apt|yum|pacman    # Package manager type

  remove:
    - name: package-name
      enabled: true/false
      type: apt|yum|pacman
```

#### Package Groups

Groups organize related packages for easier management:

```yaml
package:
  group:
    - name: group-name
      enabled: true/false
      type: apt|yum|pacman
      keyring: gpg-key-url    # Optional
      repo: repository-url    # Optional
      add: [package-list]
      remove: [package-list]  # Optional
```

### Plugin Section

The `plugin` section manages extensions for existing tools:

```yaml
plugin:
  - name: base-tool
    enabled: true/false
    installer: plugin-manager
    list: [plugin-names]
```

## Predefined Configurations

### Binary Tools

| Tool | Description | Version |
|------|-------------|---------|
| helm | Kubernetes package manager | 3.17.0 |
| kustomize | Kubernetes configuration management | 5.6.0 |
| krew | kubectl plugin manager | 0.4.4 |
| kubectl | Kubernetes CLI | 1.32.1 |
| k0sctl | k0s cluster management | 0.22.0 |
| cfssl | PKI/TLS toolkit | 1.6.5 |
| cfssljson | CFSSL JSON processor | 1.6.5 |

### Package Groups

#### Default Group
Essential system packages for basic functionality:
- System utilities (bash, cron, mount)
- Network tools (iproute2, conntrack)
- Security tools (openssl, ca-certificates)
- Development basics (git, file, unzip)

#### Docker Group
Complete Docker container runtime setup:
- Docker CE and CLI
- Container runtime (containerd.io)
- Build tools (buildx-plugin)
- Orchestration (compose-plugin)
- Automatic cleanup of conflicting packages

#### Toolchain Group
Comprehensive development environment:
- Compilers (gcc, g++, clang)
- Build systems (cmake, ninja-build)
- Language runtimes (python3, default-jre)
- Development libraries
- Cross platform tools (wine, wine64)

### kubectl Plugins

Pre-configured kubectl plugins via krew:

| Category | Plugins |
|----------|---------|
| **RBAC & Security** | access-matrix, ca-cert, cert-manager, view-cert, view-secret |
| **Networking** | cilium, hns, open-svc |
| **Storage** | df-pv, openebs, rook-ceph, minio |
| **Debugging** | debug-shell, node-shell, pod-shell, nsenter |
| **Context Management** | ctx, ns, config-import |
| **Monitoring** | images, view-utilization, deprecations |
| **Specialized** | virt, rabbitmq, oidc-login, view-webhook |

## Usage Examples

### Enabling Tool Installation

```yaml
# Enable kubectl installation
binary:
  - name: kubectl
    enabled: true  # Change from false to true
    # ... rest of configuration
```

### Adding Custom Repository

```yaml
package:
  group:
    - name: custom-tools
      enabled: true
      type: apt
      keyring: https://example.com/gpg
      repo: https://example.com/ubuntu
      add:
        - custom-package
```

### Architecture Support

All binary tools support both amd64 and arm64 architectures. The configuration automatically selects the appropriate download based on the target system.

## Best Practices

1. **Version Pinning**: Always specify exact versions for reproducible builds
2. **Enable Selectively**: Only enable tools you actually need to reduce installation time
3. **Group Related Packages**: Use package groups to manage related dependencies
4. **Test Configuration**: Validate configurations in development environments first
5. **Document Changes**: Update this documentation when modifying the configuration

## Security Considerations

- All binary downloads use HTTPS URLs from official sources
- Package installations include GPG key verification where applicable
- Conflicting packages are automatically removed to prevent security issues
- Regular version updates help maintain security patches

## Troubleshooting

### Common Issues

1. **Download Failures**: Check version availability and URL correctness
2. **Architecture Mismatches**: Ensure target architecture is supported
3. **Permission Errors**: Some installations may require elevated privileges
4. **Dependency Conflicts**: Review package remove lists for conflicts

### Debugging

Enable verbose logging and check:
- Network connectivity to download URLs
- Disk space availability
- Package manager state
- Architecture compatibility
