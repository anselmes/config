# OpenStack Template Management

Tools and commands for managing OpenStack templates and stacks.

## Prerequisites

- OpenStack CLI installed
- Valid OpenStack credentials configured
- Access to OpenStack environment

## Commands

### Validate Template

```bash
openstack orchestration template validate \
  --template openstack/stack.yaml \
  --environment openstack/stack.vars.yaml
```

### Deploy Stack

```bash
openstack stack create stack-dev \
  --template openstack/stack.yaml \
  --environment openstack/stack.vars.yaml
```

### Monitor Stack

```bash
# Show stack details
openstack stack show stack-dev

# List stack outputs
openstack stack output list stack-dev
```

### Delete Stack

```bash
openstack stack delete stack-dev
```

## Usage Examples

1.

```bash
openstack orchestration template validate --template openstack/stack.yaml --environment openstack/stack.vars.yaml
```

2. Create a new stack:

```bash
openstack stack create stack-dev --template openstack/stack.yaml --environment openstack/stack.vars.yaml
```

3. Monitor deployment:

```bash
watch openstack stack show stack-dev
```

### Troubleshooting

If stack creation fails:

1. Check the stack events: openstack stack event list stack-dev
2. Verify template syntax
3. Confirm environment variables are correct
