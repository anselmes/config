# SPDX-License-Identifier: GPL-3.0
# Copyright (c) 2025 Schubert Anselme <schubert@anselm.es>

# Homebrew Bundle Configuration
# This Brewfile defines a comprehensive development environment setup for macOS
# using Homebrew, Homebrew Cask, Mac App Store, and VS Code extensions.
#
# Purpose:
# - Automated installation of development tools and applications
# - Consistent development environment across machines
# - Easy backup and restoration of installed packages
#
# Categories:
# - TAPS: Third-party Homebrew repositories
# - BREWS: Command-line tools and libraries
# - CASKS: GUI applications
# - MAS: Mac App Store applications
# - VSCODE: Visual Studio Code extensions
# - GO/KREW/NPM: Tools installed via Go, kubectl krew, and npm
#
# Usage:
#   brew bundle install              # Install all packages
#   brew bundle cleanup --force      # Remove packages not in Brewfile
#   brew bundle dump --force         # Generate Brewfile from current packages
#   brew bundle check                # Check if all packages are installed
#
# Prerequisites:
# - Homebrew installed on macOS
# - Xcode Command Line Tools
# - Mac App Store signed in (for mas commands)
# - VS Code installed (for vscode extensions)

# ============================================================================
# MARK:- TAPS - Third-party Homebrew repositories
# ============================================================================
# These taps provide access to packages not available in the main Homebrew repository

tap "apple/apple", "http://github.com/apple/homebrew-apple"      # Apple's official tools
tap "charmbracelet/tap", trusted: true                           # Charm CLI tools (vhs, gum, glow)
tap "domt4/autoupdate"                                           # Auto-update tools for Homebrew
tap "fluxcd/tap"                                                 # Flux CD GitOps tools
tap "hashicorp/tap"                                              # HashiCorp tools
tap "homebrew/bundle"                                            # Homebrew Bundle support
tap "homebrew/cask"                                              # GUI applications repository
tap "homebrew/core"                                              # Main Homebrew repository
tap "homebrew/services"                                          # Service management for Homebrew
tap "k0sproject/tap"                                             # k0s Kubernetes distribution
tap "knative-sandbox/kn-plugins"                                 # Knative CLI plugins
tap "mirantis/tap"                                               # Mirantis tools
tap "vmware-tanzu/pinniped"                                      # Pinniped authentication

# ============================================================================
# MARK:- BREWS - Command-line tools and libraries
# ============================================================================
# Core development tools, utilities, and runtime environments

# Commented packages are available but currently disabled
# Uncomment as needed for specific projects or workflows

# Hardware/Embedded Development Tools
# brew "binwalk"                    # Firmware analysis tool
# brew "dfu-util"                   # Device Firmware Upgrade utilities
# brew "libftdi"                    # USB-to-serial communication library
# brew "libsigrok"                  # Signal analysis library
# brew "libusb"                     # USB device access library
# brew "lsusb"                      # List USB devices
# brew "minipro"                    # Universal programmer tool
# brew "u-boot-tools"               # U-Boot bootloader utilities

# Media/Graphics Tools
# brew "ffmpeg"                     # Video/audio processing
# brew "gifsicle"                     # GIF image creator and optimizer
# brew "gstreamer"                  # Multimedia framework
# brew "squashfs"                   # Compressed filesystem tools
# brew "vhs"                          # Terminal session recorder (charmbracelet)
# brew "wimlib"                     # Windows Imaging (WIM) library

# Network/Security Tools
# brew "nmap"                       # Network discovery and security auditing
# brew "transmission-cli"           # BitTorrent client

# Virtualization Tools
# brew "libvirt"                    # Virtualization API and toolkit
# brew "qemu"                       # Machine emulator and virtualizer
# brew "virt-manager"               # Virtual machine manager
# brew "winetricks"                 # Wine helper scripts

# Cloud Native/Infrastructure Tools
# brew "ansible"                    # IT automation tool
# brew "cfssl"                      # CloudFlare's PKI toolkit
# brew "clusterctl"                 # Cluster API management
# brew "flux"                       # GitOps toolkit
# brew "tektoncd-cli"               # Tekton Pipelines CLI
# brew "terraform"                  # Infrastructure as Code

# Security and Cryptography
# brew "acme.sh"                      # ACME protocol client for SSL certificates
# brew "cosign"                       # Container signing and verification
brew "gnupg"                        # GNU Privacy Guard for encryption
brew "gnutls"                       # Secure communications library
# brew "openbao"                      # Open-source secrets management (Vault fork)
brew "pinentry-mac"                 # Secure PIN/passphrase entry for macOS
brew "pinentry"                     # Secure PIN/passphrase entry
# brew "pkcs11-tools"                 # PKCS#11 cryptographic token tools
# brew "softhsm"                      # Software hardware security module
# brew "sops"                         # Secrets management tool
# brew "trivy"                        # Vulnerability scanner
brew "yubico-piv-tool"              # YubiKey PIV smart card management tool

# Version Control and Development
# brew "act"                          # Run GitHub Actions locally
# brew "gh"                           # GitHub CLI
# brew "git-lfs"                      # Git Large File Storage
# brew "git-review"                   # Git integration with code review systems
brew "git"                          # Distributed version control system

# Cloud and Container Tools
# brew "buf"                          # Protocol buffer toolchain
# brew "cilium-cli"                   # Cilium networking and security CLI
# brew "cloud-provider-kind"          # Cloud provider implementation for KIND
# brew "coder"                        # Coder remote development environments CLI
brew "container"                    # Native macOS container runtime
brew "docker-buildx"                # Docker extended build capabilities
brew "docker-compose"               # Multi-container Docker applications
brew "docker-credential-helper"     # Docker credential storage helper
brew "docker"                       # Docker CLI
brew "helm"                         # Kubernetes package manager
# brew "k0sctl"                       # k0s cluster management
# brew "kind"                         # Kubernetes in Docker
brew "krew"                         # kubectl plugin manager
# brew "kubebuilder"                  # Kubernetes API/controller scaffolding
brew "kubernetes-cli"               # kubectl - Kubernetes CLI
brew "kustomize"                    # Kubernetes configuration management
# brew "mkectl"                       # MKE cluster management
brew "podman"                       # Daemonless container engine

# Serverless and Function Tools
# brew "func"                         # Function development and deployment
# brew "kn"                           # Knative CLI

# Network and Remote Access Tools
brew "cloudflared"                  # Cloudflare Tunnel client
brew "lldpd"                        # Link Layer Discovery Protocol daemon
brew "socat"                        # Multipurpose relay for bidirectional data transfer

# Data Processing and Text Tools
brew "jq"                           # JSON processor
brew "p7zip"                        # File archiver
brew "shellcheck"                   # Shell script static analysis tool
brew "shfmt"                        # Shell script formatter
brew "xz"                           # Data compression tool
brew "yq"                           # YAML processor
brew "zstd"                         # Fast compression algorithm

# System and Hardware Tools
brew "mas"                          # Mac App Store command-line interface
# brew "open-ocd"                     # On-chip debugger
# brew "sigrok-cli"                   # Signal analysis CLI
# brew "socket_vmnet"                 # VM networking support
# brew "swtpm"                        # Software TPM emulator
brew "terminal-notifier"            # macOS notifications from command line

# Development Runtimes and Tools
# brew "cmake"                        # Cross-platform build system generator
# brew "go"                           # Go programming language
# brew "make"                         # Build automation tool
brew "node"                         # Node.js JavaScript runtime
brew "openjdk", link: true          # Open Java Development Kit
# brew "openstackclient"              # OpenStack command-line client
# brew "rustup"                       # Rust toolchain installer
# brew "swiftly"                      # Swift version manager
brew "uv"                           # Python package and project manager
# brew "vapor"                        # Vapor Swift web framework CLI

# Cloud Storage and Authentication
# brew "awscli"                       # Amazon Web Services command-line interface
# brew "pinniped-cli"                 # Pinniped authentication CLI
# brew "s3cmd"                        # Amazon S3 command-line tools

# Shell Enhancements
brew "hyfetch"                      # Colorful system information tool
brew "tmux"                         # Terminal multiplexer
brew "watch"                        # Execute a program periodically
brew "zsh-completions"              # Additional completions for Zsh

# ============================================================================
# MARK:- CASKS - GUI Applications
# ============================================================================
# Desktop applications and GUI tools for development and productivity

# Commented applications are available but currently disabled
# Uncomment based on specific needs and use cases

# Media and Creative Tools
# cask "balenaetcher"                                         # OS image flasher
# cask "blender"                                              # 3D creation suite
# cask "dcp-o-matic-player"                                   # Digital cinema package player (Deprecated brew)
# cask "ff-works"                                             # Video processing tool
# cask "fl-studio"                                            # Digital audio workstation
# cask "fontlab"                                              # Font editor
# cask "godot"                                                # Game engine and editor
# cask "gstreamer-runtime"                                    # GStreamer multimedia framework
# cask "iina"                                                 # Modern media player
# cask "ilok-license-manager"                                 # Software license management
# cask "ios-app-signer"                                       # iOS app signing tool
# cask "kicad"                                                # Electronic design automation
# cask "kodi"                                                 # Media center application
# cask "rustdesk"                                             # Remote desktop software
# cask "transmission"                                         # BitTorrent client
# cask "unetbootin"                                           # Bootable USB creator

# Database Tools
# cask "mongodb-compass"                                      # MongoDB GUI
# cask "mysqlworkbench"                                       # MySQL database design tool
# cask "pgadmin4"                                             # PostgreSQL administration
# cask "redis-insight"                                        # Redis GUI
# cask "sqlitemanager"                                        # SQLite database manager

# System Utilities
# cask "powerpanel"                                           # UPS management software
# cask "wacom-tablet"                                         # Wacom tablet drivers

# System Utilities and Productivity
cask "appcleaner"                                           # Application uninstaller
cask "bartender"                                            # Menu bar icon organizer
cask "caffeine"                                             # Prevent system sleep
cask "daisydisk"                                            # Disk usage analyzer
cask "lingon-x"                                             # Launch agent and daemon manager

# Network and Security Tools
# cask "core-tunnel"                                          # SSH tunnel manager
# cask "cyberduck"                                            # Cloud storage browser
# cask "tailscale-app"                                        # Mesh VPN client
# cask "tor-browser"                                          # Privacy-focused web browser
# cask "tunnelblick"                                          # OpenVPN client
# cask "vnc-viewer"                                           # VNC remote desktop client
# cask "wireshark-app"                                        # Network protocol analyzer

# AI and Developer Assistant Tools
# cask "chatgpt"                                              # ChatGPT desktop client
# cask "claude"                                               # Claude desktop client
# cask "codex"                                                # OpenAI Codex desktop client
# cask "github-copilot-app"                                   # GitHub Copilot desktop app
# cask "github-copilot-for-xcode"                             # GitHub Copilot for Xcode

# Development Tools
# cask "clion"                                                # JetBrains C/C++ IDE
# cask "goland"                                               # JetBrains Go IDE
cask "gpg-suite"                                            # GPG tools for macOS
cask "keystore-explorer"                                    # GUI tool for managing Java keystores
# cask "lens"                                                 # Kubernetes IDE
# cask "podman-desktop"                                       # Podman container GUI
# cask "postman"                                              # API development environment
# cask "pycharm"                                              # JetBrains Python IDE
# cask "rustrover"                                            # JetBrains Rust IDE
# cask "trunk-io"                                             # Code quality and linting GUI
cask "visual-studio-code"                                   # Code editor
cask "xquartz"                                              # X11 windowing system

# Web Browsers
# cask "firefox"                                              # Mozilla Firefox web browser
# cask "microsoft-edge"                                       # Microsoft Edge web browser

# Communication and Collaboration
# cask "microsoft-teams", args: { appdir: "/Applications" }   # Microsoft Teams
# cask "webex"                                                # Cisco Webex meetings
# cask "zoom"                                                 # Zoom video conferencing

# Compatibility and Virtualization
# cask "wine-stable"                                          # Windows compatibility layer

# ============================================================================
# MARK:- MAC APP STORE - Applications from the App Store
# ============================================================================
# Applications installed via the Mac App Store using mas-cli

# Commented applications are available but currently disabled

# Professional/Creative Apps
# mas "Classroom", id: 1358883623                 # Classroom management
# mas "Compressor", id: 6746516157                # Video compression
# mas "Final Cut Pro", id: 1631624924             # Professional video editing
# mas "GarageBand", id: 682658836                 # Music creation
# mas "iBooks Author", id: 490152466              # E-book authoring
# mas "iMovie", id: 408981434                     # Video editing
# mas "Logic Pro", id: 1615087040                 # Professional audio production
# mas "Motion", id: 6746637149                    # Motion graphics and animation

# Creative and Design Tools
# mas "MindNode", id: 1289197285                  # Mind mapping
# mas "Night Sky", id: 475772902                  # Astronomy app
# mas "Pixelmator Pro", id: 6746662575            # Image editing
# mas "VisualDesigner", id: 1193683552            # Vector graphics

# Productivity and Utilities
# mas "Display Menu", id: 549083868               # Display configuration
# mas "Evernote", id: 406056744                   # Note taking
# mas "Frame.io", id: 992958444                   # Video collaboration
# mas "iStudiez Pro", id: 402989379               # Student planner
# mas "SendToX", id: 496926258                    # File sending utility
# mas "Serial", id: 877615577                     # Serial port monitor
# mas "Shazam", id: 897118787                     # Music recognition
# mas "Shot Notes X", id: 853468135               # Screenshot annotation
# mas "Sync-N-Link X", id: 517599985              # File synchronization
# mas "Textual 7", id: 1262957439                 # IRC client
# mas "Transporter", id: 1450874784               # File transfer
# mas "X2Pro Audio Convert", id: 501688639        # Audio conversion
# mas "XtoCC", id: 487899517                      # Color correction

# Entertainment
# mas "Pool", id: 416970936                       # Billiards game
# mas "Prime Video", id: 545519333                # Video streaming

# Hardware and Embedded Tools
# mas "LogicAnalyzerSwiftUI", id: 981851455       # Logic analyzer for circuit debugging
# mas "Visual Minipro", id: 6747261192            # GUI for XGecu EEPROM programmers

# Development and System Tools
mas "Apple Configurator", id: 1037126344        # iOS device configuration
# mas "CommentHere", id: 1406737173               # Xcode comment-divider extension
# mas "Comments", id: 6636494220               # Comments Extension for Xcode
# mas "Developer", id: 640199958                  # Apple Developer app
# mas "HextEdit", id: 1557247094                  # Hex editor
mas "SSH Config Editor", id: 1109319285         # SSH configuration editor
# mas "TestFlight", id: 899247664                 # Beta app testing
# mas "Xcode", id: 497799835                      # Apple's IDE for iOS/macOS development

# Productivity Applications
mas "Keynote", id: 361285480                    # Presentation software
mas "Numbers", id: 361304891                    # Spreadsheet application
mas "Pages", id: 361309726                      # Word processor

# System Monitoring and Utilities
# mas "iStat Menus", id: 1319778037               # System monitoring
mas "Speedtest", id: 1153157709                 # Internet speed test
mas "The Unarchiver", id: 425424353             # Archive extraction

# Development and Learning
# mas "MermaidEditor", id: 1581312955             # Mermaid diagram editor
# mas "Playgrounds", id: 1496833156               # Swift learning environment
mas "Telescopo", id: 6747908871                 # Markdown/Mermaid/diagram viewer

# Communication and Remote Access
# mas "Fongo", id: 473770452                      # Free VoIP calling (Canada)
# mas "Slack", id: 803453959                      # Team communication
# mas "Windows App", id: 1295203466               # Remote desktop client

# Security and Authentication
mas "WireGuard", id: 1451685025                 # VPN client
mas "Yubico Authenticator", id: 1497506650      # Two-factor authentication

# ============================================================================
# MARK:- VISUAL STUDIO CODE EXTENSIONS
# ============================================================================
# Extensions to enhance VS Code functionality for development workflows

# Documentation and Markdown Support
vscode "aaron-bond.better-comments"                             # Enhanced comment highlighting
vscode "bierner.github-markdown-preview"                        # GitHub-flavored markdown preview
vscode "bierner.markdown-checkbox"                              # Checkbox support in markdown
vscode "bierner.markdown-emoji"                                 # Emoji support in markdown
vscode "bierner.markdown-footnotes"                             # Footnote support in markdown
vscode "bierner.markdown-mermaid"                               # Mermaid diagrams in markdown
vscode "bierner.markdown-preview-github-styles"                 # GitHub styling for markdown
vscode "bierner.markdown-yaml-preamble"                         # YAML frontmatter support
vscode "bpruitt-goddard.mermaid-markdown-syntax-highlighting"   # Mermaid syntax highlighting
vscode "davidanson.vscode-markdownlint"                         # Markdown linting
vscode "hediet.vscode-drawio"                                   # Draw.io diagram editor
vscode "tomoyukim.vscode-mermaid-editor"                        # Mermaid diagram editor

# File and Path Management
vscode "christian-kohler.path-intellisense"                     # Autocomplete for file paths
vscode "dkundel.vscode-new-file"                                # New file creation shortcuts
vscode "patbenatar.advanced-new-file"                           # Advanced file creation
vscode "techer.open-in-browser"                                 # Open files in browser
vscode "tomoki1207.pdf"                                         # PDF viewer
vscode "vscode-icons-team.vscode-icons"                         # File and folder icons

# Version Control and Git Integration
vscode "codezombiech.gitignore"                                 # .gitignore file templates
vscode "eamodio.gitlens"                                        # Advanced Git integration
vscode "github.remotehub"                                       # Remote repository browsing
vscode "github.vscode-github-actions"                           # GitHub Actions support
vscode "github.vscode-pull-request-github"                      # GitHub pull request integration

# Remote Development
vscode "coder.coder-remote"                                     # Coder remote development
vscode "github.codespaces"                                      # GitHub Codespaces
vscode "ms-vscode-remote.remote-containers"                     # Development containers
vscode "ms-vscode-remote.remote-ssh-edit"                       # SSH remote editing
vscode "ms-vscode-remote.remote-ssh"                            # SSH remote development
vscode "ms-vscode-remote.remote-wsl"                            # Windows Subsystem for Linux
vscode "ms-vscode-remote.vscode-remote-extensionpack"           # Remote development pack
vscode "ms-vscode.remote-explorer"                              # Remote connection explorer
vscode "ms-vscode.remote-repositories"                          # Remote repository access
vscode "ms-vscode.remote-server"                                # Remote server management

# Cloud and Repository Integration
vscode "mindaro-dev.file-downloader"                            # File downloader dependency for Azure tooling
vscode "ms-vscode.azure-repos"                                  # Azure Repos integration

# Infrastructure as Code
vscode "hashicorp.hcl"                                          # HCL language support
vscode "hashicorp.terraform"                                    # Terraform language support
vscode "ms-azuretools.vscode-azureterraform"                    # Azure Terraform support
vscode "redhat.ansible"                                         # Ansible playbook support

# API and Protocol Development
vscode "bufbuild.vscode-buf"                                    # Protocol buffer (buf) tooling
vscode "pbkit.vscode-pbkit"                                     # Protocol buffer language support

# Shell Scripting Support
vscode "mads-hartmann.bash-ide-vscode"                          # Bash language server
vscode "timonwong.shellcheck"                                   # Shell script linting

# Hardware and Embedded Development
vscode "mcu-debug.debug-tracker-vscode"                         # Embedded debug session tracker
vscode "mshr-h.veriloghdl"                                      # Verilog/SystemVerilog HDL support

# Data Processing and File Format Support
vscode "mechatroner.rainbow-csv"                                # CSV file visualization
vscode "redhat.vscode-commons"                                  # Common Red Hat functionality
vscode "redhat.vscode-xml"                                      # Advanced XML support
vscode "redhat.vscode-yaml"                                     # Advanced YAML support
vscode "tamasfe.even-better-toml"                               # TOML file support

# Code Quality and Formatting
vscode "editorconfig.editorconfig"                              # EditorConfig support
vscode "esbenp.prettier-vscode"                                 # Code formatter
vscode "kweihmann.oelint-vscode"                                # OpenEmbedded/Yocto recipe linting
vscode "minherz.copyright-inserter"                             # Copyright header insertion
vscode "trunk.io"                                               # Unified linting and formatting
vscode "wayou.vscode-todo-highlight"                            # TODO/FIXME highlighting

# Container and Kubernetes Development
vscode "docker.docker"                                          # Docker support
vscode "ms-azuretools.vscode-containers"                        # Azure container tools
vscode "ms-azuretools.vscode-docker"                            # Docker support
vscode "ms-kubernetes-tools.kind-vscode"                        # KIND (Kubernetes in Docker)
vscode "ms-kubernetes-tools.vscode-kubernetes-tools"            # Kubernetes support
vscode "redhat.vscode-knative"                                  # Knative support

# Python Development
vscode "ms-python.debugpy"                                      # Python debugger
vscode "ms-python.python"                                       # Python language support
vscode "ms-python.vscode-pylance"                               # Python language server
vscode "ms-python.vscode-python-envs"                           # Python environment management

# Development Tools and Utilities
vscode "formulahendry.code-runner"                              # Run code snippets quickly
vscode "jerrygoyal.shortcut-menu-bar"                           # Custom menu bar shortcuts
vscode "llvm-vs-code-extensions.lldb-dap"                       # LLDB debug adapter protocol
vscode "ms-edgedevtools.vscode-edge-devtools"                   # Edge DevTools integration
vscode "ms-vscode.hexeditor"                                    # Hex file editor
vscode "ms-vscode.makefile-tools"                               # Makefile build support
vscode "ms-vscode.vscode-serial-monitor"                        # Serial port monitoring
vscode "ms-vscode.vscode-typescript-next"                       # TypeScript nightly builds
vscode "tariky.easy-snippet-maker"                              # Code snippet creation
vscode "vadimcn.vscode-lldb"                                    # LLDB debugger support
vscode "vapor.vapor-vscode"                                     # Vapor Swift web framework support
vscode "wdhongtw.gpg-indicator"                                 # GPG status indicator

# Testing Framework Support
vscode "hbenl.vscode-test-explorer"                             # Test explorer UI
vscode "ms-vscode.test-adapter-converter"                       # Test adapter converter

# AI and Chat Integration
vscode "anthropic.claude-code"                                  # Claude Code AI assistant
vscode "openai.chatgpt"                                         # ChatGPT integration

# ============================================================================
# MARK:- GO PACKAGES - Tools installed via `go install`
# ============================================================================

go "golang.org/x/tools/gopls"                                   # Go language server

# ============================================================================
# MARK:- KREW PLUGINS - kubectl plugin manager plugins
# ============================================================================

krew "blame"                                                    # Show who last edited resource fields
krew "ca-cert"                                                  # Print the cluster's CA certificate
krew "cert-manager"                                             # Inspect cert-manager resources
krew "cnpg"                                                     # Manage CloudNativePG PostgreSQL clusters
krew "config-import"                                            # Import contexts into kubeconfig
krew "ctx"                                                      # Switch between kubectl contexts
krew "debug-shell"                                               # Open a debug shell in a node or pod
krew "deprecations"                                             # Check for deprecated API usage
krew "df-pv"                                                    # Show disk usage of PersistentVolumes
krew "directpv"                                                 # Manage DirectPV CSI storage
krew "emit-event"                                               # Emit a Kubernetes event from the CLI
krew "encrypted-kubeconfig"                                     # Authenticate using an encrypted kubeconfig
krew "ktop"                                                     # Top-like view of cluster resource usage
krew "kubetail"                                                 # Tail logs from multiple pods
krew "minio"                                                    # Manage MinIO Operator tenants
krew "node-logs"                                                # Fetch node-level logs
krew "node-shell"                                                # Open a root shell on a node
krew "ns"                                                       # Switch between namespaces
krew "open-svc"                                                 # Open a service in the browser via local proxy
krew "openebs"                                                  # Manage OpenEBS storage resources
krew "pod-logs"                                                 # Enhanced multi-container pod log viewer
krew "pod-shell"                                                # Shell into pods more conveniently
krew "rabbitmq"                                                 # Manage RabbitMQ Cluster Operator resources
krew "rename-pvc"                                               # Rename a PersistentVolumeClaim
krew "rook-ceph"                                                # Manage Rook Ceph storage clusters
krew "tail"                                                     # Tail logs across multiple resources
krew "view-cert"                                                # View TLS certificate details from secrets
krew "view-secret"                                              # Decode and view Secret values
krew "view-serviceaccount-kubeconfig"                           # Generate kubeconfig from a service account
krew "view-utilization"                                         # Show resource usage vs requests/limits
krew "viewnode"                                                 # Display nodes with their pods and containers
krew "virt"                                                     # KubeVirt CLI for managing VMs

# ============================================================================
# MARK:- NPM PACKAGES - Global Node.js packages
# ============================================================================

npm "@modelcontextprotocol/server-everything"                   # MCP reference server
npm "@modelcontextprotocol/server-github"                       # MCP server for GitHub
npm "markdownlint"                                              # Markdown linter
npm "markdownlint-cli2"                                         # Markdown linter CLI
