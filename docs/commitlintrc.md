# CommitLint Configuration

## Overview
This file (`.commitlintrc`) configures [commitlint](https://commitlint.js.org/) to enforce conventional commit message standards in this repository.

## Purpose
- Ensures consistent commit message formatting across the project
- Follows the [Conventional Commits](https://conventional-commits.org/) specification
- Helps with automated changelog generation and semantic versioning

## Configuration Details

### Extends
- `@commitlint/config-conventional`: Base configuration that enforces conventional commit standards

### Custom Rules

#### body-max-line-length
- **Level**: Warning (1)
- **Value**: 150 characters
- **Purpose**: Limits the maximum line length in commit message bodies to improve readability

#### subject-case
- **Level**: Warning (1)
- **Value**: sentence-case
- **Purpose**: Enforces sentence case for commit subjects (first letter capitalized, rest lowercase)

#### type-enum
- **Level**: Warning (1)
- **Allowed Types**:
  - `build`: Changes that affect the build system or external dependencies
  - `chore`: Other changes that don't modify src or test files
  - `ci`: Changes to CI configuration files and scripts
  - `deployment`: Changes related to deployment processes
  - `devcontainer`: Changes to development container configuration
  - `docs`: Documentation only changes
  - `feature`: New features or functionality
  - `fix`: Bug fixes
  - `issue`: Changes related to issue tracking or bug reports
  - `networking`: Network-related changes
  - `refactor`: Code changes that neither fix bugs nor add features
  - `revert`: Reverts a previous commit
  - `security`: Security-related changes
  - `site`: Website or documentation site changes
  - `test`: Adding missing tests or correcting existing tests
  - `workspace`: Changes to workspace configuration

## Usage
This configuration is automatically used by commitlint when installed as a pre-commit hook or CI/CD pipeline step.

## Example Valid Commit Messages
```
feature: add user authentication system
fix: resolve login button not responding on mobile
docs: update API documentation for v2.0
security: patch XSS vulnerability in user input validation
```
