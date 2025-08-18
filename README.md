# Multi-Server EC2 Infrastructure

Terraform configuration for deploying 4 EC2 servers with different environments and security groups.

## Architecture

- **4 EC2 t2.micro** instances (Free Tier eligible)
- **Individual Security Groups** with dynamic port configuration
- **Multiple Environments**: dev, staging, prod, test
- **Default VPC** with public subnets

## Server Configuration

| Server | Environment | Ports |
|--------|-------------|-------|
| master | dev | 22, 80 |
| server1 | staging | 22, 8000 |
| server2 | prod | 22, 3306 |
| server3 | test | 22, 443 |

## Variables

- `server_count`: Number of servers (default: 4)
- `server_names`: Server names array
- `environments`: Environment tags for each server
- `server_ports`: Port configuration per server

## Prerequisites

1. AWS CLI configured:
   ```bash
   aws configure
   ```

2. SSH key pair:
   ```bash
   ssh-keygen -t rsa -b 2048 -f id_rsa
   ```

## Deployment

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

- `server_ips`: All server public IP addresses

## Cleanup

```bash
terraform destroy
```

## Files

- `main.tf` - EC2 instances with count
- `network.tf` - Dynamic security groups and key pair
- `variables.tf` - Input variables
- `outputs.tf` - Server IP outputs
- `terraform.tfvars` - Variable values
- `mydeploy.sh` - Server setup script