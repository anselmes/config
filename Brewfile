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
# TAPS - Third-party Homebrew repositories
# ============================================================================
# These taps provide access to packages not available in the main Homebrew repository

tap "apple/apple", "http://github.com/apple/homebrew-apple"      # Apple's official tools
tap "domt4/autoupdate"                                           # Auto-update tools for Homebrew
tap "fluxcd/tap"                                                 # Flux CD GitOps tools
tap "homebrew/bundle"                                            # Homebrew Bundle support
tap "homebrew/cask"                                              # GUI applications repository
tap "homebrew/core"                                              # Main Homebrew repository
tap "homebrew/services"                                          # Service management for Homebrew
tap "k0sproject/tap"                                             # k0s Kubernetes distribution
tap "knative-sandbox/kn-plugins"                                 # Knative CLI plugins
tap "vmware-tanzu/pinniped"                                      # Pinniped authentication

# ============================================================================
# BREWS - Command-line tools and libraries
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
# brew "gstreamer"                  # Multimedia framework
# brew "squashfs"                   # Compressed filesystem tools
# brew "wimlib"                     # Windows Imaging (WIM) library

# Network/Security Tools
# brew "nmap"                       # Network discovery and security auditing
# brew "transmission-cli"           # BitTorrent client

# Virtualization Tools
# brew "qemu"                       # Machine emulator and virtualizer

# Cloud Native/Infrastructure Tools
# brew "cfssl"                      # CloudFlare's PKI toolkit
# brew "clusterctl"                 # Cluster API management
# brew "flux"                       # GitOps toolkit
# brew "tektoncd-cli"               # Tekton Pipelines CLI
# brew "terraform"                  # Infrastructure as Code

# Security and Cryptography
brew "cosign"                       # Container signing and verification
brew "gnupg"                        # GNU Privacy Guard for encryption
brew "gnutls"                       # Secure communications library
brew "pinentry-mac"                 # Secure PIN/passphrase entry for macOS
brew "pinentry"                     # Secure PIN/passphrase entry
brew "sops"                         # Secrets management tool
brew "trivy"                        # Vulnerability scanner

# Version Control and Development
brew "git"                          # Distributed version control system
brew "git-lfs"                      # Git Large File Storage
brew "git-review"                   # Git integration with code review systems
brew "gh"                           # GitHub CLI

# Cloud and Container Tools
brew "helm"                         # Kubernetes package manager
brew "kind"                         # Kubernetes in Docker
brew "k0sctl"                       # k0s cluster management
brew "kubernetes-cli"               # kubectl - Kubernetes CLI
brew "kustomize"                    # Kubernetes configuration management
brew "krew"                         # kubectl plugin manager
brew "docker"                       # Container runtime (via cask)

# Serverless and Function Tools
brew "func"                         # Function development and deployment
brew "kn"                           # Knative CLI

# Data Processing and Text Tools
brew "jq"                           # JSON processor
brew "yq"                           # YAML processor
brew "shfmt"                        # Shell script formatter
brew "p7zip"                        # File archiver

# System and Hardware Tools
brew "mas"                          # Mac App Store command-line interface
brew "open-ocd"                     # On-chip debugger
brew "sigrok-cli"                   # Signal analysis CLI
brew "socket_vmnet"                 # VM networking support
brew "swtpm"                        # Software TPM emulator
brew "terminal-notifier"            # macOS notifications from command line

# Development Runtimes and Tools
brew "openjdk"                      # Open Java Development Kit
brew "openstackclient"              # OpenStack command-line client

# Cloud Storage and Authentication
brew "pinniped-cli"                 # Pinniped authentication CLI
brew "s3cmd"                        # Amazon S3 command-line tools

# Virtualization and Compatibility
brew "virt-manager"                 # Virtual machine manager
brew "winetricks"                   # Wine helper scripts

# Shell Enhancements
brew "zsh-completions"              # Additional completions for Zsh

# ============================================================================
# CASKS - GUI Applications
# ============================================================================
# Desktop applications and GUI tools for development and productivity

# Commented applications are available but currently disabled
# Uncomment based on specific needs and use cases

# Media and Creative Tools
# cask "anydesk"                    # Remote desktop application
# cask "balenaetcher"               # OS image flasher
# cask "blender"                    # 3D creation suite
# cask "dcp-o-matic-player"         # Digital cinema package player
# cask "ff-works"                   # Video processing tool
# cask "fl-studio"                  # Digital audio workstation
# cask "fontlab"                    # Font editor
# cask "gstreamer-runtime"          # GStreamer multimedia framework
# cask "iina"                       # Modern media player
# cask "ilok-license-manager"       # Software license management
# cask "ios-app-signer"             # iOS app signing tool
# cask "kicad"                      # Electronic design automation
# cask "kodi"                       # Media center application
# cask "transmission"               # BitTorrent client
# cask "unetbootin"                 # Bootable USB creator

# Database Tools
# cask "mongodb-compass"            # MongoDB GUI
# cask "mysqlworkbench"             # MySQL database design tool
# cask "pgadmin4"                   # PostgreSQL administration

# System Utilities
# cask "powerpanel"                 # UPS management software

# System Utilities and Productivity
cask "appcleaner"                   # Application uninstaller
cask "brewservicesmenubar"          # Homebrew services menu bar
cask "caffeine"                     # Prevent system sleep
cask "lingon-x"                     # Launch agent and daemon manager

# Network and Security Tools
cask "core-tunnel"                  # SSH tunnel manager
cask "cyberduck"                    # Cloud storage browser
cask "ipvanish-vpn"                 # VPN client
cask "tunnelblick"                  # OpenVPN client
cask "tor-browser"                  # Privacy-focused web browser
cask "wireshark"                    # Network protocol analyzer

# Development Tools
cask "docker"                       # Container platform
cask "gpg-suite"                    # GPG tools for macOS
cask "jetbrains-gateway"            # Remote development gateway
cask "keystore-explorer"            # GUI tool for managing Java keystores
cask "lens"                         # Kubernetes IDE
cask "postman"                      # API development environment
cask "visual-studio-code"           # Code editor
cask "xquartz"                      # X11 windowing system

# Web Browsers
cask "firefox"                      # Mozilla Firefox web browser
cask "microsoft-edge"               # Microsoft Edge web browser

# Communication and Collaboration
cask "microsoft-teams", args: { appdir: "/Applications" }  # Microsoft Teams
cask "webex"                                               # Cisco Webex meetings

# Compatibility and Virtualization
cask "wine-stable"                  # Windows compatibility layer

# ============================================================================
# MAC APP STORE - Applications from the App Store
# ============================================================================
# Applications installed via the Mac App Store using mas-cli

# Commented applications are available but currently disabled
# Professional/Creative Apps
# mas "Classroom", id: 1358883623           # Classroom management
# mas "Compressor", id: 424390742           # Video compression
# mas "Final Cut Pro", id: 424389933        # Professional video editing
# mas "GarageBand", id: 682658836           # Music creation
# mas "iBooks Author", id: 490152466        # E-book authoring
# mas "iMovie", id: 408981434               # Video editing
# mas "Logic Pro", id: 634148309            # Professional audio production

# Creative and Design Tools
# mas "MindNode", id: 1289197285            # Mind mapping
# mas "Night Sky", id: 475772902            # Astronomy app
# mas "Pixelmator Pro", id: 1289583905      # Image editing
# mas "VisualDesigner", id: 1193683552      # Vector graphics

# Productivity and Utilities
# mas "Core Tunnel", id: 1354318707         # SSH tunnel (available as cask)
# mas "Cyberduck", id: 409222199            # Cloud storage (available as cask)
# mas "DaisyDisk", id: 411643860            # Disk usage analyzer
# mas "Display Menu", id: 549083868         # Display configuration
# mas "Evernote", id: 406056744             # Note taking
# mas "Frame.io", id: 992958444             # Video collaboration
# mas "iStudiez Pro", id: 402989379         # Student planner
# mas "SendToX", id: 496926258              # File sending utility
# mas "Serial", id: 877615577               # Serial port monitor
# mas "Shazam", id: 897118787               # Music recognition
# mas "Shot Notes X", id: 853468135         # Screenshot annotation
# mas "Sync-N-Link X", id: 517599985        # File synchronization
# mas "Textual IRC Client", id: 1262957439  # IRC client
# mas "Transporter", id: 1450874784         # File transfer
# mas "X2Pro Audio Convert", id: 501688639  # Audio conversion
# mas "XtoCC", id: 487899517                # Color correction

# Development and System Tools
mas "Apple Configurator", id: 1037126344    # iOS device configuration
mas "Developer", id: 640199958              # Apple Developer app
mas "HextEdit", id: 1557247094              # Hex editor
mas "SSH Config Editor", id: 1109319285     # SSH configuration editor
mas "TestFlight", id: 899247664             # Beta app testing

# Productivity Applications
mas "iA Writer", id: 775737590               # Markdown text editor
mas "Keynote", id: 409183694                 # Presentation software
mas "Numbers", id: 409203825                 # Spreadsheet application
mas "Pages", id: 409201541                   # Word processor

# System Monitoring and Utilities
mas "iStat Menus", id: 1319778037            # System monitoring
mas "Speedtest", id: 1153157709              # Internet speed test
mas "The Unarchiver", id: 425424353          # Archive extraction

# Development and Learning
mas "MermaidEditor", id: 1581312955          # Mermaid diagram editor
mas "Playgrounds", id: 1496833156            # Swift learning environment

# Communication and Remote Access
mas "Microsoft Remote Desktop", id: 1295203466  # Remote desktop client
mas "Slack", id: 803453959                   # Team communication

# Security and Authentication
mas "WireGuard", id: 1451685025              # VPN client
mas "Yubico Authenticator", id: 1497506650   # Two-factor authentication

# ============================================================================
# VISUAL STUDIO CODE EXTENSIONS
# ============================================================================
# Extensions to enhance VS Code functionality for development workflows

# Documentation and Markdown Support
vscode "aaron-bond.better-comments"                            # Enhanced comment highlighting
vscode "bierner.github-markdown-preview"                       # GitHub-flavored markdown preview
vscode "bierner.markdown-checkbox"                             # Checkbox support in markdown
vscode "bierner.markdown-emoji"                                # Emoji support in markdown
vscode "bierner.markdown-footnotes"                            # Footnote support in markdown
vscode "bierner.markdown-mermaid"                              # Mermaid diagrams in markdown
vscode "bierner.markdown-preview-github-styles"                # GitHub styling for markdown
vscode "bierner.markdown-yaml-preamble"                        # YAML frontmatter support
vscode "bpruitt-goddard.mermaid-markdown-syntax-highlighting"  # Mermaid syntax highlighting
vscode "tomoyukim.vscode-mermaid-editor"                       # Mermaid diagram editor

# File and Path Management
vscode "christian-kohler.path-intellisense"           # Autocomplete for file paths
vscode "patbenatar.advanced-new-file"                 # Advanced file creation
vscode "techer.open-in-browser"                       # Open files in browser
vscode "vscode-icons-team.vscode-icons"               # File and folder icons

# Version Control and Git Integration
vscode "codezombiech.gitignore"                       # .gitignore file templates
vscode "eamodio.gitlens"                              # Advanced Git integration
vscode "github.copilot-chat"                          # GitHub Copilot chat interface
vscode "github.copilot"                               # AI code completion
vscode "github.remotehub"                             # Remote repository browsing
vscode "github.vscode-github-actions"                 # GitHub Actions support
vscode "github.vscode-pull-request-github"            # GitHub pull request integration

# Remote Development
vscode "coder.coder-remote"                           # Coder remote development
vscode "github.codespaces"                            # GitHub Codespaces
vscode "ms-vscode-remote.remote-containers"           # Development containers
vscode "ms-vscode-remote.remote-ssh-edit"             # SSH remote editing
vscode "ms-vscode-remote.remote-ssh"                  # SSH remote development
vscode "ms-vscode-remote.remote-wsl"                  # Windows Subsystem for Linux
vscode "ms-vscode-remote.vscode-remote-extensionpack" # Remote development pack
vscode "ms-vscode.remote-explorer"                    # Remote connection explorer
vscode "ms-vscode.remote-repositories"                # Remote repository access
vscode "ms-vscode.remote-server"                      # Remote server management

# Cloud and Repository Integration
vscode "ms-vscode.azure-repos"                        # Azure Repos integration

# Data Processing and File Format Support
vscode "dotjoshjohnson.xml"                           # XML language support
vscode "mechatroner.rainbow-csv"                      # CSV file visualization
vscode "redhat.vscode-commons"                        # Common Red Hat functionality
vscode "redhat.vscode-xml"                            # Advanced XML support
vscode "redhat.vscode-yaml"                           # Advanced YAML support
vscode "tamasfe.even-better-toml"                     # TOML file support

# Code Quality and Formatting
vscode "editorconfig.editorconfig"                    # EditorConfig support
vscode "esbenp.prettier-vscode"                       # Code formatter
vscode "minherz.copyright-inserter"                   # Copyright header insertion
vscode "wayou.vscode-todo-highlight"                  # TODO/FIXME highlighting

# Container and Kubernetes Development
vscode "ms-azuretools.vscode-docker"                  # Docker support
vscode "ms-kubernetes-tools.kind-vscode"              # KIND (Kubernetes in Docker)
vscode "ms-kubernetes-tools.vscode-kubernetes-tools"  # Kubernetes support

# Development Tools and Utilities
vscode "jerrygoyal.shortcut-menu-bar"                 # Custom menu bar shortcuts
vscode "ms-vscode.hexeditor"                          # Hex file editor
vscode "ms-vscode.vscode-serial-monitor"              # Serial port monitoring
vscode "tariky.easy-snippet-maker"                    # Code snippet creation
vscode "vadimcn.vscode-lldb"                          # LLDB debugger support

# Testing Framework Support
vscode "hbenl.vscode-test-explorer"                   # Test explorer UI
vscode "ms-vscode.test-adapter-converter"             # Test adapter converter
